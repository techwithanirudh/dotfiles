# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST
setopt CORRECT_ALWAYS
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# Don't expand aliases before completion has finished.
setopt complete_aliases

export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# Add custom function path if present.
if [[ -n "${ZSH:-}" && -d "$ZSH/functions" ]]; then
	fpath=($ZSH/functions $fpath)
	autoload -U $ZSH/functions/*(:t)
fi

# Keybinds
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' backward-word
bindkey '^[[5C' forward-word
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char
