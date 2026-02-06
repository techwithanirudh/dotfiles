#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/index.sh"

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
