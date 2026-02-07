#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/index.sh"

install_dir="$HOME/.zsh/zsh-autosuggestions"

if [[ -d "$install_dir/.git" ]]; then
	success "zsh-autosuggestions already installed"
	exit 0
fi

info "installing zsh-autosuggestions to $install_dir"
mkdir -p "$(dirname "$install_dir")"
git clone https://github.com/zsh-users/zsh-autosuggestions "$install_dir"
success "zsh-autosuggestions installed"
