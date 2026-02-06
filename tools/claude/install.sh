#!/usr/bin/env bash
set -euo pipefail

if command -v claude >/dev/null 2>&1; then
	echo "claude already installed"
	exit 0
fi

if ! command -v curl >/dev/null 2>&1; then
	echo "curl not found. Run system/install.sh first." >&2
	exit 1
fi

echo "installing claude"
curl -fsSL https://claude.ai/install.sh | bash
