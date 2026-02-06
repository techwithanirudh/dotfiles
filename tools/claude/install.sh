#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/index.sh"

need_cmd curl

if has_cmd claude; then
	success "claude already installed"
	exit 0
fi

info "installing claude"
curl -fsSL https://claude.ai/install.sh | bash
