#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/index.sh"

if [[ "$(uname -s)" != "Linux" ]]; then
	fail "Linux-only (Coder runtime). Refusing to run on: $(uname -s)"
fi

"$DOTFILES_ROOT/script/bootstrap"

if [[ "${DOTFILES_SKIP_INSTALL:-}" != "1" ]]; then
	"$DOTFILES_ROOT/script/install"
fi
