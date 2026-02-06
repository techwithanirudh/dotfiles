#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != "Linux" ]]; then
	echo "[system] Linux-only (Coder runtime). Refusing to run on: $(uname -s)" >&2
	exit 1
fi

if ! command -v apt-get >/dev/null 2>&1; then
	echo "[system] apt-get not found; this installer expects Debian/Ubuntu." >&2
	exit 1
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
	echo "need root to run: $*" >&2
	return 1
}

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
