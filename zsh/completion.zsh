# shell/completion.zsh

# Zsh completion system.
# This is loaded last by zsh/zshrc.symlink.

autoload -Uz compinit

# Matches case insensitive for lowercase.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Pasting with tabs doesn't perform completion.
zstyle ':completion:*' insert-tab pending

# Use a per-user dump file and enable caching.
zcompdump="$HOME/.zcompdump"

# -C: skip insecure directory checks (faster); safe for devcontainers.
# If you want strict checks on a personal machine, remove -C.
compinit -C -d "$zcompdump"
unset zcompdump
