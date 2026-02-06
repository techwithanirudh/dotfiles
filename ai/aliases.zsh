# Safe defaults.
alias cld='IS_SANDBOX=1 claude'
alias cdx='codex'

# Explicitly unsafe shortcuts (opt-in).
alias cld-danger='IS_SANDBOX=1 claude --dangerously-skip-permissions'
alias cdx-danger='codex --dangerously-bypass-approvals-and-sandbox'
