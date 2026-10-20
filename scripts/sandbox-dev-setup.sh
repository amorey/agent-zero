#!/usr/bin/env bash
# Keep an sbx sandbox's Linux build output apart from the host's.
#
# In sbx's direct mode the repo is the host's working tree, bind-mounted, so
# every build output path is shared with the host. Outputs that tooling can
# relocate are moved with env vars. Fixed ones get a sandbox-only bind mount
# from $BUILD_ROOT, which the host never sees: it keeps its own copy underneath.
# $BUILD_ROOT is inside the repo, on the host's disk, so it survives sandbox
# restarts and isn't capped by the overlay's size limit.
#
# Idempotent. Runs on every session start: bind mounts do not survive a
# sandbox restart, the env vars (in /etc/sandbox-persistent.sh) do.

set -euo pipefail

# Build output folders, relative to the repo root, that tooling can't relocate.
# node_modules is added automatically when package.json exists.
EXTRA_BIND_DIRS=()

# The host's own agents fire this same hook, and clone mode has a private copy
# of the repo. Neither shares build output with anything.
if [ -z "${SANDBOX_NAME:-${SANDBOX_VM_ID:-}}" ] || [ "$(uname -s)" != "Linux" ] \
  || [ -d /run/sandbox/source ]; then
  exit 0
fi

REPO="$(cd "$(dirname "$0")/.." && pwd)"
BUILD_ROOT="${SANDBOX_BUILD_ROOT:-$REPO/.sandbox-linux}"
CARGO_ROOT="${SANDBOX_CARGO_ROOT:-$HOME/.cache/sandbox-build/$(basename "$REPO")}"
PERSIST="/etc/sandbox-persistent.sh"
MARKER="# SANDBOX_DEV_SETUP"

bind_dirs=("${EXTRA_BIND_DIRS[@]}")
env_lines=()

if [ -f "$REPO/package.json" ]; then
  bind_dirs+=(node_modules)
fi
if [ -f "$REPO/pnpm-lock.yaml" ]; then
  env_lines+=("export PNPM_CONFIG_STORE_DIR=\"$BUILD_ROOT/pnpm-store\"")
fi
# Not under $BUILD_ROOT: on the host mount Cargo gets EEXIST from mkdir for
# directories it just created and reads its fingerprints back as missing, so a
# build never converges.
if [ -f "$REPO/Cargo.toml" ]; then
  env_lines+=("export CARGO_TARGET_DIR=\"$CARGO_ROOT/target\"")
fi
if [ -f "$REPO/pyproject.toml" ]; then
  env_lines+=("export UV_PROJECT_ENVIRONMENT=\"$BUILD_ROOT/venv\"")
fi

for dir in "${bind_dirs[@]}"; do
  target="$REPO/$dir"
  mkdir -p "$target" "$BUILD_ROOT/$dir"
  if mountpoint -q "$target"; then
    echo "✓ $dir already bind-mounted"
  else
    sudo mount --bind "$BUILD_ROOT/$dir" "$target"
    echo "✓ $dir bind-mounted from $BUILD_ROOT/$dir"
  fi
done

# Every line this script owns carries $MARKER, so a re-run replaces them.
sudo touch "$PERSIST"
sudo sed -i "/$MARKER\$/d" "$PERSIST"
for line in "${env_lines[@]}"; do
  echo "$line $MARKER" | sudo tee -a "$PERSIST" >/dev/null
  echo "✓ ${line#export }"
done
