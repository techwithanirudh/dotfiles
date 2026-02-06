# dotfiles

Holman-style topic dotfiles.

## Install

```bash
./install.sh
```

Environment knobs:

- `DOTFILES_FORCE=1`: overwrite existing targets instead of backing up.
- `DOTFILES_SKIP_INSTALL=1`: only link files (skip installers).

## Layout

- `*/**/*.symlink`: symlinked into `$HOME` as dotfiles by `script/bootstrap`.
- `zsh/zshrc.symlink`: the main entrypoint, symlinked to `~/.zshrc`.
- `*/**/*.zsh`: sourced automatically by `~/.zshrc` (topic configs).
- `config/*`: symlinked into `~/.config/*` by `script/bootstrap`.
- `*/install.sh`: executed by `script/install` (tool installs, editor config linking, etc.).

## Topics

- `shell/`: PATH, exports, prompt, terminal title hooks
- `git/`: git + hub aliases
- `ai/`: CLI aliases
- `starship/`: prompt install
- `claude/`: claude install
- `codex/`: codex install
- `opencode/`: opencode install
- `editors/vscode/`: VS Code and code-server settings linking
