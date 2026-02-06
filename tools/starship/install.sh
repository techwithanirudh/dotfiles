#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/index.sh"

need_cmd curl

# Install starship into ~/.local/bin (no sudo), if missing.
if has_cmd starship || [[ -x "$HOME/.local/bin/starship" ]]; then
	success "starship already installed"
	exit 0
fi

mkdir -p "$HOME/.local/bin"

info "installing starship"
curl -fsSL https://starship.rs/install.sh | sh -s -- -y -b "$HOME/.local/bin"
