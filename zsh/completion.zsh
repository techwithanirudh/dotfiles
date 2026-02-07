#!/usr/bin/env zsh

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# Use menu selection instead of prompting to list many options.
zstyle ':completion:*' menu select
setopt AUTO_MENU
