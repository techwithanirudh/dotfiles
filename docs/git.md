# Git

This repo includes:

- `git/gitconfig.symlink` -> included from `~/.gitconfig` (a small stub, not a link, so
  `git config --global` writes from tools land in the stub instead of this repo)
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

## GitHub Auth

The credential helper in `gitconfig.symlink` uses `gh auth git-credential` by default.
In Coder workspaces (`$CODER` set), it asks `coder external-auth access-token primary-github`
for a fresh token instead, and `tools/coder/github.zsh` wraps `gh` the same way.
Don't set a static `GH_TOKEN` in Coder templates; it expires and shadows these.
