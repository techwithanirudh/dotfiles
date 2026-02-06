# Dotfiles Agent Notes

This repo is a Holman-style, zsh-first dotfiles layout.

## Entry Points

- `install.sh`: runs `script/bootstrap`, then `script/install` unless `DOTFILES_SKIP_INSTALL=1`.
- `script/bootstrap`: symlinks `*.symlink` into `$HOME` and `config/*` into `~/.config/*`.
- `script/install`: runs `system/install.sh` first, then any `*/install.sh` it finds.

## Zsh Loading Model

- `~/.zshrc` is symlinked to `zsh/zshrc.symlink`.
- `zsh/zshrc.symlink` loads topic files from `$DOTFILES/*`:
  - `path.zsh` first (PATH setup)
  - `*.zsh` next (topic configuration)
  - `completion.zsh` last (completion init)

## Conventions

- Put XDG app configs in `config/<app>/...`.
  - Example: `config/opencode/opencode.jsonc` -> `~/.config/opencode/opencode.jsonc`.
- Put tool installers in `tools/<tool>/install.sh`.
- Keep machine-specific settings out of git:
  - Git identity/signing: `~/.gitconfig.local` (included from `git/gitconfig.symlink`).

## Devcontainer

`.devcontainer/devcontainer.json` enables zsh via the `common-utils` feature.

## Environment Knobs

- `DOTFILES_FORCE=1`: overwrite existing targets (otherwise backups are created).
- `DOTFILES_SKIP_INSTALL=1`: only link files (skip running installers).
