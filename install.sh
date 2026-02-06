#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" != "Linux" ]]; then
	echo "This dotfiles repo is Linux-only (Coder runtime). Refusing to run on: $(uname -s)" >&2
	exit 1
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$repo_root/script/bootstrap"

if [[ "${DOTFILES_SKIP_INSTALL:-}" != "1" ]]; then
	"$repo_root/script/install"
fi
