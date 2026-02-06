# shell/path.zsh

# Add user-level and dotfiles binaries to PATH.
if [[ -d "$HOME/.local/bin" ]]; then
	path=("$HOME/.local/bin" $path)
fi

if [[ -n "${DOTFILES:-}" && -d "$DOTFILES/bin" ]]; then
	path=("$DOTFILES/bin" $path)
fi
