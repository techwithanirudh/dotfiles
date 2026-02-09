#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/index.sh"

if ! has_cmd apt-get; then
	fail "apt-get not found; this installer expects Debian/Ubuntu."
fi

info "system: installing base packages"
as_root env DEBIAN_FRONTEND=noninteractive apt-get update -y
as_root env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	ca-certificates \
	curl \
	file \
	git \
	fontconfig \
	procps \
	rsync \
	unzip \
	zip \
	zsh

ZSH_PATH="$(command -v zsh)"
current_shell="$(getent passwd "$(id -un)" 2>/dev/null | cut -d: -f7 || true)"
if [[ "$current_shell" != "$ZSH_PATH" ]]; then
	info "changing default shell to zsh"
	grep -qx "$ZSH_PATH" /etc/shells 2>/dev/null || as_root bash -c "echo '$ZSH_PATH' >> /etc/shells"
	as_root chsh -s "$ZSH_PATH" "$(id -un)"
	success "default shell changed to zsh"
else
	success "default shell is already zsh"
fi
