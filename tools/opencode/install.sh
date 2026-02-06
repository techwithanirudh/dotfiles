#!/usr/bin/env bash
set -euo pipefail

if command -v opencode >/dev/null 2>&1 || [[ -x "$HOME/.local/bin/opencode" ]]; then
	echo "opencode already installed"
	exit 0
fi

if ! command -v curl >/dev/null 2>&1; then
	echo "curl not found. Run system/install.sh first." >&2
	exit 1
fi

echo "installing opencode"
curl -fsSL https://opencode.ai/install | bash
