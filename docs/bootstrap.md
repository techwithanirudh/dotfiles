# Bootstrap

`script/bootstrap` is responsible for linking dotfiles into place.

## Behavior

- For each `*.symlink` file (max depth 2), create a symlink in `$HOME`.
- For each file under `config/`, create a symlink under `~/.config/`.
- If a destination already exists, it is moved aside to a backup first.

## Backups

If a destination already exists, bootstrap moves it to a backup name and then links the repo version.

Two exceptions are written as small stubs instead of links, so installers and tools that edit them don't dirty this repo:

- `~/.zshrc` sources `zsh/zshrc.symlink`; installers (bun, nvm, ...) append below it. Lines previously appended to the repo copy through the old symlink are moved into the stub.
- `~/.gitconfig` includes `git/gitconfig.symlink`; `git config --global` writes land in the stub.

Backup naming:

- first backup: `<destination>.backup`
- if that exists: `<destination>.backup.<timestamp>`

This is intentionally non-interactive: it always preserves the old file before linking.
