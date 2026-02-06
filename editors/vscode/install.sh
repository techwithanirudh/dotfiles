#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "$0")/../.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/log.sh"

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

src="$DOTFILES_ROOT/editors/vscode/settings.json"
if [[ ! -f "$src" ]]; then
	info "$src missing; skipping"
	exit 0
fi

link_targets=()
link_targets+=("$HOME/.local/share/code-server/User/settings.json")
link_targets+=("$HOME/.config/Code/User/settings.json")

for dst in "${link_targets[@]}"; do
	link_file "$src" "$dst"
done
