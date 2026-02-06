#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/log.sh"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/utils.sh"

require_cmd curl

if command -v claude >/dev/null 2>&1; then
	success "claude already installed"
	exit 0
fi

info "installing claude"
curl -fsSL https://claude.ai/install.sh | bash
