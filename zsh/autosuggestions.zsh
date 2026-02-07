#!/usr/bin/env zsh

# Load zsh-autosuggestions if installed manually or via Homebrew.
if [[ -f "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
	source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
elif command -v brew >/dev/null 2>&1; then
	if [[ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
		source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
	fi
fi
