# Tools / Installers

Installers are small, per-tool scripts.

## Philosophy

- `script/bootstrap` only links files.
- `script/install` installs software.
- Per-tool installers live under `tools/<tool>/install.sh`.

This keeps linking and installing separate. It also makes it easy to skip installs in restricted environments.

## Skipping Installs

Set `DOTFILES_SKIP_INSTALL=1` when running `install.sh` to only link files.

## System Packages

`system/install.sh` installs baseline packages via `apt-get` (Linux devcontainer assumption).
This is run first by `script/install`.
