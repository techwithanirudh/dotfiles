#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/log.sh"

need_cmd() {
	if ! command -v "$1" >/dev/null 2>&1; then
		fail "missing required command: $1"
	fi
}

need_cmd curl
need_cmd unzip

fonts_dir="$HOME/.local/share/fonts"
font_dest="$fonts_dir/JetBrainsMono-NerdFont"

if ! command -v fc-match >/dev/null 2>&1; then
	fail "fc-match not found (fontconfig). Install it via system/install.sh."
fi

if fc-match -s "JetBrainsMono Nerd Font" >/dev/null 2>&1; then
	success "fonts: already installed; skipping"
	exit 0
fi

tmp_dir="${TMPDIR:-/tmp}/dotfiles-fonts.$$"

mkdir -p "$fonts_dir"
mkdir -p "$tmp_dir"

cleanup() {
	rm -rf "$tmp_dir"
}
trap cleanup EXIT

install_zip() {
	local url="$1"
	local label="$2"
	local dest="$3"

	info "fonts: downloading $label"
	local zip_path="$tmp_dir/$label.zip"
	curl -fsSL "$url" -o "$zip_path"

	info "fonts: installing $label"
	mkdir -p "$dest"
	unzip -o -q "$zip_path" -d "$dest"
}

install_zip \
	"https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" \
	"JetBrainsMono-NerdFont" \
	"$font_dest"

if command -v fc-cache >/dev/null 2>&1; then
	info "fonts: refreshing font cache"
	fc-cache -f "$fonts_dir" >/dev/null 2>&1 || true
fi

success "fonts: done"
