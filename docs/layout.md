# Layout

This repo is organized in a Holman-style layout: topic folders + a small bootstrap script.

## Why `*.symlink`

Files that should live in `$HOME` are tracked in the repo with a `.symlink` suffix.
`script/bootstrap` symlinks them into `$HOME` without the suffix.

Example:

- `zsh/zshrc.symlink` -> `~/.zshrc`

This avoids hidden files in the repo while keeping the home directory clean.

## Why `config/`

Application configs that live under `~/.config` are stored under `config/` and symlinked
into `~/.config/*` by `script/bootstrap`.

Example:

- `config/opencode/opencode.jsonc` -> `~/.config/opencode/opencode.jsonc`

## Zsh Loading

`~/.zshrc` points to `zsh/zshrc.symlink`, which loads all `*.zsh` files under the repo.

Load order:

- `path.zsh` files first
- all other `*.zsh` files
- `completion.zsh` files last

This keeps PATH setup predictable and ensures completion is initialized after functions and options.
