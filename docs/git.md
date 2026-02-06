# Git

This repo includes:

- `git/gitconfig.symlink` -> `~/.gitconfig`
- `git/gitignore.symlink` -> `~/.gitignore`
- `git/gitattributes.symlink` -> `~/.gitattributes`

## Local Overrides

`~/.gitconfig` includes `~/.gitconfig.local`.
Use it for per-machine identity, signing keys, and anything you don't want to commit.

## Helper Scripts

Holman-style git helpers are in `bin/` and are available as git subcommands:

- `git amend`, `git undo`
- `git copy-branch-name`, `git edit-new`

These work because `zsh/path.zsh` adds `bin/` to PATH.
