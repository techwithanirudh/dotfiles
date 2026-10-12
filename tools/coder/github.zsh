# In Coder workspaces, prefer gh's stored login (ignoring a possibly stale
# GH_TOKEN); without one, use a fresh token from Coder's GitHub external auth.
if [[ -n "${CODER:-}" ]] && (( $+commands[coder] )); then
	gh() {
		if env -u GH_TOKEN -u GITHUB_TOKEN gh auth token >/dev/null 2>&1; then
			env -u GH_TOKEN -u GITHUB_TOKEN gh "$@"
		else
			GH_TOKEN="$(coder external-auth access-token primary-github)" command gh "$@"
		fi
	}
fi
