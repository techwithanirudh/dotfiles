# Dotfiles Agent Notes

This repo is a Holman-style, zsh-first dotfiles layout.

## Entry Points

- `install.sh`: runs `script/bootstrap`, then `script/install` unless `DOTFILES_SKIP_INSTALL=1`.
- `script/bootstrap`: symlinks `*.symlink` into `$HOME` and `config/*` into `~/.config/*`.
- `script/install`: runs `system/install.sh` first, then any `*/install.sh` it finds.

## Zsh Loading Model

- `~/.zshrc` is symlinked to `zsh/zshrc.symlink`.
- `zsh/zshrc.symlink` loads all `*.zsh` files under the dotfiles root (Holman-style):
- `path.zsh` first
- everything else next
- `completion.zsh` last

## Conventions

- Put XDG app configs in `config/<app>/...`.
  - Example: `config/opencode/opencode.jsonc` -> `~/.config/opencode/opencode.jsonc`.
- Put tool installers in `tools/<tool>/install.sh`.
- Keep machine-specific settings out of git:
  - Git identity/signing: `~/.gitconfig.local` (included from `git/gitconfig.symlink`).

## Devcontainer

`.devcontainer/devcontainer.json` enables zsh via the `common-utils` feature.

## Environment Knobs

- `DOTFILES_SKIP_INSTALL=1`: only link files (skip running installers).
