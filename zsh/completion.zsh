# Zsh completion system.
# This is loaded last by zsh/zshrc.symlink.

autoload -Uz compinit

# Matches case insensitive for lowercase.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Pasting with tabs doesn't perform completion.
zstyle ':completion:*' insert-tab pending

# Regenerate the completion dump once a day; use cached version otherwise.
zcompdump="$HOME/.zcompdump"
if [[ -f "$zcompdump" && -n "$zcompdump"(#qN.mh+24) ]]; then
	compinit -d "$zcompdump"
else
	compinit -C -d "$zcompdump"
fi
unset zcompdump
