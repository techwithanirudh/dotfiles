#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/log.sh"

if command -v opencode >/dev/null 2>&1 || [[ -x "$HOME/.local/bin/opencode" ]]; then
	success "opencode already installed"
	exit 0
fi

if ! command -v curl >/dev/null 2>&1; then
	fail "curl not found. Run system/install.sh first."
fi

info "installing opencode"
curl -fsSL https://opencode.ai/install | bash
