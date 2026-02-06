#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/index.sh"

if [[ -n "${SSH_CLIENT:-}" || -n "${SSH_TTY:-}" || -n "${SSH_CONNECTION:-}" ]]; then
	info "fonts: SSH session detected; skipping font install"
	exit 0
fi

need_cmd fc-cache

fonts_dir="$HOME/.local/share/fonts"
font_family="JetBrainsMono Nerd Font"
font_dest="$fonts_dir/JetBrainsMono-NerdFont"

need_cmds fc-match grep
matched_family="$(fc-match -f '%{family}\n' "$font_family" 2>/dev/null || true)"
if printf '%s' "$matched_family" | grep -qi -- "$font_family"; then
	success "fonts: already installed; skipping"
	exit 0
fi

cleanup() {
	rm -rf "${tmp_dir:-}"
}
tmp_dir="$(mktemp -d "${TMPDIR:-/tmp}/dotfiles-fonts.XXXXXXXX")"
trap cleanup EXIT

mkdir -p "$fonts_dir"

info "fonts: downloading JetBrainsMono Nerd Font"
zip_path="$tmp_dir/JetBrainsMono.zip"
download "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" "$zip_path"

info "fonts: installing JetBrainsMono Nerd Font"
unzip_to "$zip_path" "$font_dest"

info "fonts: refreshing font cache"
fc-cache -f "$fonts_dir" >/dev/null 2>&1 || true

success "fonts: done"
