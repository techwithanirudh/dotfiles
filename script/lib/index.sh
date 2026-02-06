#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P)"
export DOTFILES_ROOT

# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/log.sh"

# shellcheck source=/dev/null
source "$DOTFILES_ROOT/script/lib/utils.sh"

