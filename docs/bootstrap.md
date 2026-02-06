# Bootstrap

`script/bootstrap` is responsible for linking dotfiles into place.

## Behavior

- For each `*.symlink` file (max depth 2), create a symlink in `$HOME`.
- For each file under `config/`, create a symlink under `~/.config/`.
- If a destination already exists, it is moved aside to a backup first.

## Backups

If a destination already exists (e.g., `~/.zshrc`), bootstrap moves it to a backup name and then links the repo version. This applies to every symlink target, not just `~/.zshrc`.

Backup naming:

- first backup: `<destination>.backup`
- if that exists: `<destination>.backup.<timestamp>`

This is intentionally non-interactive: it always preserves the old file before linking.
