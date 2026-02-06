#!/usr/bin/env bash
set -euo pipefail

if ! command -v starship >/dev/null 2>&1; then
	echo "starship not found on PATH. Install it, then re-run this script."
	exit 1
fi

mkdir -p "$HOME/.config"
cp -f "$(dirname "$0")/zsh/starship.toml" "$HOME/.config/starship.toml"

if ! grep -q "starship init zsh" "$HOME/.zshrc"; then
	printf '\n%s\n' 'eval "$(starship init zsh)"' >> "$HOME/.zshrc"
fi
