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

backup_path() {
	local dst="$1"
	local ts
	ts="$(date +%Y%m%d%H%M%S)"
	printf '%s.backup.%s' "$dst" "$ts"
}

link_file() {
	local src="$1" dst="$2"

	if [[ -L "$dst" ]]; then
		local current
		current="$(readlink "$dst" || true)"
		if [[ "$current" == "$src" ]]; then
			success "already linked $dst"
			return
		fi
	fi

	if [[ -e "$dst" || -L "$dst" ]]; then
		if [[ "${DOTFILES_FORCE:-}" == "1" ]]; then
			rm -rf "$dst"
			success "removed $dst"
		else
			local backup
			backup="$(backup_path "$dst")"
			mkdir -p "$(dirname "$backup")"
			mv "$dst" "$backup"
			success "moved $dst to $backup"
		fi
	fi

	mkdir -p "$(dirname "$dst")"
	ln -s "$src" "$dst"
	success "linked $dst"
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
