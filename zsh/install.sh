#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/index.sh"

ZSH_PATH="$(command -v zsh 2>/dev/null || true)"
if [[ -z "$ZSH_PATH" ]]; then
	info "zsh not found; skipping default-shell change"
	exit 0
fi

current_shell="$(getent passwd "$(id -un)" 2>/dev/null | cut -d: -f7 || true)"
if [[ "$current_shell" == "$ZSH_PATH" ]]; then
	success "default shell is already zsh"
	exit 0
fi

info "changing default shell to $ZSH_PATH"

# Ensure zsh is listed in /etc/shells
if ! grep -qx "$ZSH_PATH" /etc/shells 2>/dev/null; then
	as_root bash -c "echo '$ZSH_PATH' >> /etc/shells"
fi

as_root chsh -s "$ZSH_PATH" "$(id -un)"
success "default shell changed to zsh"
