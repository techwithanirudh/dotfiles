# shell/ghostty.zsh

autoload -Uz add-zsh-hook

__ghostty_title_shell="${SHELL:-/bin/zsh}"
__ghostty_title_shell=${__ghostty_title_shell##*/}

__ghostty_set_tab_title() {
	builtin printf '\033]0; %s\007' "$1"
}

__ghostty_title_precmd() {
	__ghostty_set_tab_title "${PWD}"
}

__ghostty_title_preexec() {
	local command_string="$1"
	command_string="${command_string#"${command_string%%[![:space:]]*}"}"
	local process_name=${command_string%%[[:space:]]*}
	if [[ -z "$process_name" ]]; then
		__ghostty_set_tab_title "${PWD}"
	else
		local process_basename=${process_name##*/}
		case "$process_basename" in
			"$__ghostty_title_shell"|"-$__ghostty_title_shell"|zsh|sh)
				__ghostty_set_tab_title "${PWD}"
				;;
			*)
				__ghostty_set_tab_title "${PWD}: ${process_basename}"
				;;
		esac
	fi
}

add-zsh-hook precmd __ghostty_title_precmd
add-zsh-hook preexec __ghostty_title_preexec
