# Add user-level and dotfiles binaries to PATH.
if [[ -d "$HOME/.local/bin" ]]; then
	path=("$HOME/.local/bin" $path)
fi

if [[ -d "$HOME/.npm-global/bin" ]]; then
	path=("$HOME/.npm-global/bin" $path)
fi

if [[ -n "${DOTFILES:-}" && -d "$DOTFILES/bin" ]]; then
	path=("$DOTFILES/bin" $path)
fi

if [[ -d "/usr/games" ]]; then
	path=("/usr/games" $path)
fi
