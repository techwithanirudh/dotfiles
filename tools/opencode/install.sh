#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P)"
# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/index.sh"

need_cmd curl

if has_cmd opencode || [[ -x "$HOME/.local/bin/opencode" ]]; then
	success "opencode already installed"
	exit 0
fi

info "installing opencode"
tmp="$(mktemp "${TMPDIR:-/tmp}/dotfiles-opencode.XXXXXXXX")"
cleanup() { rm -f "$tmp"; }
trap cleanup EXIT

info "downloading opencode installer"
curl -fsSL https://opencode.ai/install -o "$tmp"

if [[ -n "${OPENCODE_INSTALL_SHA256:-}" ]]; then
	need_cmd sha256sum
	got="$(sha256sum "$tmp" | awk '{print $1}')"
	if [[ "$got" != "$OPENCODE_INSTALL_SHA256" ]]; then
		fail "opencode installer sha256 mismatch: got $got"
	fi
	info "opencode installer checksum verified"
else
	warn "OPENCODE_INSTALL_SHA256 not set; running installer without checksum verification"
fi

bash "$tmp"
success "opencode installed"
