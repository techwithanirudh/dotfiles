# shell/prompt.zsh

export STARSHIP_CONFIG="${HOME}/.config/starship.toml"

if (( $+commands[starship] )); then
	eval "$(starship init zsh)"
fi
