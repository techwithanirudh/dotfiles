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
npm i -g @openai/codex
