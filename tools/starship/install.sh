#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/log.sh"

# Install starship into ~/.local/bin (no sudo), if missing.
if command -v starship >/dev/null 2>&1 || [[ -x "$HOME/.local/bin/starship" ]]; then
	success "starship already installed"
	exit 0
fi

if ! command -v curl >/dev/null 2>&1; then
	fail "curl not found. Run system/install.sh first."
fi

mkdir -p "$HOME/.local/bin"

# Fallback to official installer.
info "installing starship"
curl -fsSL https://starship.rs/install.sh | sh -s -- -y -b "$HOME/.local/bin"
