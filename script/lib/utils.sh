#!/usr/bin/env bash
set -euo pipefail

# Shared utilities for dotfiles scripts.
# Assumes script/lib/log.sh has already been sourced (info/success/fail).

require_cmd() {
	local cmd
	for cmd in "$@"; do
		if ! command -v "$cmd" >/dev/null 2>&1; then
			fail "missing required command: $cmd"
		fi
	done
}

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
}

download() {
	local url="$1" out="$2"
	require_cmd curl
	curl -fsSL "$url" -o "$out"
}

unzip_to() {
	local zip_path="$1" dest="$2"
	require_cmd unzip
	rm -rf "$dest"
	mkdir -p "$dest"
	unzip -o -q "$zip_path" -d "$dest"
}
