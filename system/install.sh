#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/log.sh"

if ! command -v apt-get >/dev/null 2>&1; then
	fail "apt-get not found; this installer expects Debian/Ubuntu."
fi

# Base packages these dotfiles assume exist.
as_root() {
	if [[ "$(id -u)" == "0" ]]; then
		"$@"
		return
	fi
	if command -v sudo >/dev/null 2>&1; then
		sudo "$@"
		return
	fi
	fail "need root to run: $*"
	return 1
}

info "system: installing base packages"
as_root apt-get update -y
as_root apt-get install -y \
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
