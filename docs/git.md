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

The credential helper in `gitconfig.symlink` (and the `gh` wrapper in `tools/coder/github.zsh`, Coder only):

1. Uses gh's stored login when there is one, ignoring `GH_TOKEN`/`GITHUB_TOKEN`.
   It covers every org you belong to and doesn't expire.
2. Otherwise, in Coder workspaces (`$CODER` set), asks
   `coder external-auth access-token primary-github` for a fresh token. That token comes
   from the Coder GitHub App, so it only reaches accounts/orgs where the app is installed.
3. Otherwise, plain `gh auth git-credential`.

Don't set a static `GH_TOKEN` in Coder templates; it goes stale.
