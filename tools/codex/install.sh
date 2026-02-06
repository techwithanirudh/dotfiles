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

info "installing codex"
global_root="$(npm root -g 2>/dev/null || true)"
if [[ -n "${global_root:-}" && -d "$global_root" && -w "$global_root" ]]; then
	npm i -g @openai/codex
	success "codex installed"
	exit 0
fi

warn "npm global root is not user-writable (${global_root:-unknown}); falling back to ~/.npm-global"
user_prefix="$HOME/.npm-global"
mkdir -p "$user_prefix"
npm install --prefix "$user_prefix" @openai/codex
success "codex installed to $user_prefix (add $user_prefix/bin to PATH)"
