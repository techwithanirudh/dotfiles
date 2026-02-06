#!/usr/bin/env bash
set -euo pipefail

__dotfiles_use_color() {
	# Respect NO_COLOR (https://no-color.org/) and avoid ANSI when stdout isn't a TTY.
	[[ -t 1 ]] && [[ -z "${NO_COLOR:-}" ]] && [[ "${TERM:-}" != "dumb" ]]
}

if __dotfiles_use_color; then
	__DOTFILES_BLUE="\033[00;34m"
	__DOTFILES_YELLOW="\033[0;33m"
	__DOTFILES_GREEN="\033[00;32m"
	__DOTFILES_RED="\033[0;31m"
	__DOTFILES_RESET="\033[0m"
	__DOTFILES_CLEAR="\033[2K"
else
	__DOTFILES_BLUE=""
	__DOTFILES_YELLOW=""
	__DOTFILES_GREEN=""
	__DOTFILES_RED=""
	__DOTFILES_RESET=""
	__DOTFILES_CLEAR=""
fi

info() {
	printf "\r  [ ${__DOTFILES_BLUE}..${__DOTFILES_RESET} ] %s\n" "$*"
}

warn() {
	printf "\r  [${__DOTFILES_YELLOW}WARN${__DOTFILES_RESET}] %s\n" "$*"
}

user() {
	printf "\r  [ ${__DOTFILES_YELLOW}??${__DOTFILES_RESET} ] %s\n" "$*"
}

success() {
	printf "\r${__DOTFILES_CLEAR}  [ ${__DOTFILES_GREEN}OK${__DOTFILES_RESET} ] %s\n" "$*"
}

fail() {
	printf "\r${__DOTFILES_CLEAR}  [${__DOTFILES_RED}FAIL${__DOTFILES_RESET}] %s\n" "$*"
	echo ""
	exit 1
}
