# Bootstrap

`script/bootstrap` is responsible for linking dotfiles into place.

## Behavior

- For each `*.symlink` file (max depth 2), create a symlink in `$HOME`.
- For each file under `config/`, create a symlink under `~/.config/`.
- If a destination already exists, it is moved aside to a backup first.

## Backups

If `~/.zshrc` already exists, bootstrap moves it to a backup name and then links the repo version.

Backup naming:

- first backup: `~/.zshrc.backup`
- if that exists: `~/.zshrc.backup.<timestamp>`

This is intentionally non-interactive: it always preserves the old file before linking.
