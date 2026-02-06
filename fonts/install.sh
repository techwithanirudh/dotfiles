#!/usr/bin/env bash
set -euo pipefail

need_cmd() {
	if ! command -v "$1" >/dev/null 2>&1; then
		echo "missing required command: $1" >&2
		exit 1
	fi
}

need_cmd curl
need_cmd unzip

fonts_dir="$HOME/.local/share/fonts"
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

	echo "[fonts] downloading $label"
	local zip_path="$tmp_dir/$label.zip"
	curl -fsSL "$url" -o "$zip_path"

	echo "[fonts] installing $label -> $dest"
	mkdir -p "$dest"
	unzip -o -q "$zip_path" -d "$dest"
}

install_zip \
	"https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" \
	"JetBrainsMono-NerdFont" \
	"$fonts_dir/JetBrainsMono-NerdFont"

if command -v fc-cache >/dev/null 2>&1; then
	echo "[fonts] refreshing font cache"
	fc-cache -f "$fonts_dir" >/dev/null 2>&1 || true
fi

echo "[fonts] done"
