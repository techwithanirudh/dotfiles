# shell/path.zsh

# Add user-level and dotfiles binaries to PATH.
if [[ -d "$HOME/.local/bin" ]]; then
	path=("$HOME/.local/bin" $path)
fi

if [[ -n "${DOTFILES:-}" && -d "$DOTFILES/bin" ]]; then
	path=("$DOTFILES/bin" $path)
fi

# Homebrew (macOS and Linuxbrew)
if [[ -d "/opt/homebrew/bin" ]]; then
	path=("/opt/homebrew/bin" $path)
elif [[ -d "/home/linuxbrew/.linuxbrew/bin" ]]; then
	path=("/home/linuxbrew/.linuxbrew/bin" $path)
fi
