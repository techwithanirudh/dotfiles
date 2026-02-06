#!/usr/bin/env bash
set -euo pipefail

# Installs fonts into ~/.local/share/fonts. Note:
# - For VS Code/Cursor on your laptop, the font must be installed on your laptop too.
# - This helps for local Linux shells or any environment that actually uses server-side fonts.

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

# Regular JetBrains Mono (not Nerd patched).
install_zip \
	"https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip" \
	"JetBrainsMono" \
	"$fonts_dir/JetBrainsMono"

# Nerd Fonts patched JetBrains Mono (for Starship glyphs).
install_zip \
	"https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" \
	"JetBrainsMono-NerdFont" \
	"$fonts_dir/JetBrainsMono-NerdFont"

# Symbols only Nerd Font (covers lots of prompt glyphs).
install_zip \
	"https://github.com/ryanoasis/nerd-fonts/releases/latest/download/NerdFontsSymbolsOnly.zip" \
	"NerdFontsSymbolsOnly" \
	"$fonts_dir/NerdFontsSymbolsOnly"

if command -v fc-cache >/dev/null 2>&1; then
	echo "[fonts] refreshing font cache"
	fc-cache -f "$fonts_dir" >/dev/null 2>&1 || true
fi

echo "[fonts] done"

