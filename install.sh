#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$repo_root/script/bootstrap"

if [[ "${DOTFILES_SKIP_INSTALL:-}" != "1" ]]; then
	"$repo_root/script/install"
fi
