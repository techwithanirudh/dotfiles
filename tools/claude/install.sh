#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/log.sh"

if command -v claude >/dev/null 2>&1; then
	success "claude already installed"
	exit 0
fi

if ! command -v curl >/dev/null 2>&1; then
	fail "curl not found. Run system/install.sh first."
fi

info "installing claude"
curl -fsSL https://claude.ai/install.sh | bash
