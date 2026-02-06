#!/usr/bin/env bash
set -euo pipefail

# Install starship into ~/.local/bin (no sudo), if missing.
if command -v starship >/dev/null 2>&1; then
	echo "starship already installed"
	exit 0
fi

if ! command -v curl >/dev/null 2>&1; then
	echo "curl not found; skipping starship install"
	exit 0
fi

mkdir -p "$HOME/.local/bin"

# Fallback to official installer.
echo "installing starship via upstream installer"
curl -fsSL https://starship.rs/install.sh | sh -s -- -y -b "$HOME/.local/bin"
