#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/index.sh"

if has_cmd codex; then
	success "codex already installed"
	exit 0
fi

need_cmd --skip "npm not found; skipping codex install" npm

# Ensure npm global installs go to a user-writable prefix so we don't need
# sudo. The dotfiles bootstrap links ~/.npmrc with prefix=~/.local, but if
# that hasn't happened yet, set it for this session.
npm_prefix="$(npm config get prefix 2>/dev/null || echo "")"
if [[ -n "$npm_prefix" && ! -w "$npm_prefix/lib" ]]; then
	info "npm global prefix ($npm_prefix) is not writable; using ~/.local"
	export npm_config_prefix="$HOME/.local"
fi

info "installing codex"
npm i -g @openai/codex
