# Local, untracked overrides. Put secrets, tokens, and machine-specific env here.
# Example file (tracked): $ZSH/zsh/localrc.symlink.example -> ~/.localrc

if [[ -f "$HOME/.localrc" ]]; then
	source "$HOME/.localrc"
fi
