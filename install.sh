#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$repo_root/script/lib/index.sh"

if [[ "$(uname -s)" != "Linux" ]]; then
	fail "Linux-only (Coder runtime). Refusing to run on: $(uname -s)"
fi

"$repo_root/script/bootstrap"

if [[ "${DOTFILES_SKIP_INSTALL:-}" != "1" ]]; then
	"$repo_root/script/install"
fi
