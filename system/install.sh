#!/usr/bin/env bash
set -euo pipefail

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
	curl \
	file \
	git \
	procps \
	unzip \
	zip

# Homebrew on Linux needs build tools.
as_root apt-get install -y build-essential
