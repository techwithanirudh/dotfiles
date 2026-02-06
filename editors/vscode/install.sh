#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "$0")/../.." && pwd -P)"

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
			echo "[OK] already linked $dst"
			return
		fi
	fi

	if [[ -e "$dst" || -L "$dst" ]]; then
		if [[ "${DOTFILES_FORCE:-}" == "1" ]]; then
			rm -rf "$dst"
			echo "[OK] removed $dst"
		else
			local backup
			backup="$(backup_path "$dst")"
			mkdir -p "$(dirname "$backup")"
			mv "$dst" "$backup"
			echo "[OK] moved $dst to $backup"
		fi
	fi

	mkdir -p "$(dirname "$dst")"
	ln -s "$src" "$dst"
	echo "[OK] linked $dst"
}

src="$DOTFILES_ROOT/editors/vscode/settings.json"
if [[ ! -f "$src" ]]; then
	echo "[WARN] $src missing; skipping"
	exit 0
fi

link_targets=()
link_targets+=("$HOME/.local/share/code-server/User/settings.json")
link_targets+=("$HOME/.config/Code/User/settings.json")

if [[ "$(uname -s)" == "Darwin" ]]; then
	link_targets+=("$HOME/Library/Application Support/Code/User/settings.json")
fi

for dst in "${link_targets[@]}"; do
	link_file "$src" "$dst"
done
