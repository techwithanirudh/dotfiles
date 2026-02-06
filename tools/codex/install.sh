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
if npm i -g @openai/codex 2>/dev/null; then
	success "codex installed"
else
	info "global install failed (permissions); falling back to ~/.npm-global"
	mkdir -p "$HOME/.npm-global"
	npm config set prefix "$HOME/.npm-global"
	npm i -g @openai/codex
	success "codex installed to ~/.npm-global"
fi
