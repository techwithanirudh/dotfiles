# dotfiles

## Install

```bash
./install.sh
```

Environment knobs:

- `DOTFILES_SKIP_INSTALL=1`: only link files (skip installers).

## Layout

- `*/**/*.symlink`: symlinked into `$HOME` as dotfiles by `script/bootstrap`.
- `zsh/zshrc.symlink`: the main entrypoint, symlinked to `~/.zshrc`.
- `*/**/*.zsh`: sourced automatically by `~/.zshrc` (topic configs).
- `config/*`: symlinked into `~/.config/*` by `script/bootstrap`.
- `*/install.sh`: executed by `script/install` (tool installs, editor config linking, etc.).

## Topics

- `zsh/`: PATH, exports, prompt, completion, terminal title hooks
- `git/`: git + hub aliases
- `ai/`: CLI aliases
- `tools/`: CLI installs (starship, claude, codex, opencode)
- `system/`: apt packages
- `editors/vscode/`: VS Code and code-server settings linking
- `fonts/`: font install (JetBrainsMono Nerd Font)

## Inspiration
- https://github.com/holman/dotfiles
- https://github.com/jessfraz/dotfiles
- https://github.com/jarrodwatts/claude-code-config
