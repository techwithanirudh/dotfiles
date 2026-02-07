#!/usr/bin/env zsh

# Use the local gitconfig for "global" updates to avoid writing to symlinked ~/.gitconfig.
export GIT_CONFIG_GLOBAL="$HOME/.gitconfig.local"
