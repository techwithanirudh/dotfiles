#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/index.sh"

setup_gitconfig() {
	local target="$HOME/.gitconfig.local"
	if [[ -f "$target" ]]; then
		success "gitconfig local already exists"
		return
	fi

	if [[ ! -t 0 ]]; then
		info "gitconfig local not created (non-interactive shell)"
		return
	fi

	info "setup gitconfig"

	local git_credential="cache"

	user " - What is your github author name?"
	read -e git_authorname
	user " - What is your github author email?"
	read -e git_authoremail

	sed -e "s/AUTHORNAME/$git_authorname/g" \
		-e "s/AUTHOREMAIL/$git_authoremail/g" \
		-e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" \
		"$DOTFILES_ROOT/git/gitconfig.local.symlink.example" > "$target"

	success "gitconfig local created at $target"
}

setup_gitconfig
