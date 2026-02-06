#!/usr/bin/env bash
set -euo pipefail

# Shared utilities for dotfiles scripts.
# Assumes script/lib/log.sh has already been sourced (info/success/fail).

has_cmd() { command -v "$1" >/dev/null 2>&1; }

need_cmd() {
	local mode="required"
	local msg=""

	while [[ $# -gt 0 ]]; do
		case "$1" in
			--skip)
				mode="skip"
				msg="${2:-}"
				shift 2
				;;
			--required)
				mode="required"
				shift
				;;
			*)
				break
				;;
		esac
	done

	local cmd="$1"
	if [[ -z "${cmd:-}" ]]; then
		fail "need_cmd: missing command name"
	fi

	if has_cmd "$cmd"; then
		return 0
	fi

	if [[ "$mode" == "skip" ]]; then
		info "${msg:-$cmd not found; skipping}"
		exit 0
	fi

	fail "missing required command: $cmd"
}

need_cmds() {
	local mode="required"
	local msg=""

	while [[ $# -gt 0 ]]; do
		case "$1" in
			--skip)
				mode="skip"
				msg="${2:-}"
				shift 2
				;;
			--required)
				mode="required"
				shift
				;;
			*)
				break
				;;
		esac
	done

	local cmd
	for cmd in "$@"; do
		if [[ "$mode" == "skip" ]]; then
			need_cmd --skip "$msg" "$cmd"
		else
			need_cmd "$cmd"
		fi
	done
}

as_root() {
	if [[ "$(id -u)" == "0" ]]; then
		"$@"
		return
	fi
	if has_cmd sudo; then
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
	need_cmd curl
	curl -fsSL "$url" -o "$out"
}

unzip_to() {
	local zip_path="$1" dest="$2"
	need_cmd unzip
	rm -rf "$dest"
	mkdir -p "$dest"
	unzip -o -q "$zip_path" -d "$dest"
}
