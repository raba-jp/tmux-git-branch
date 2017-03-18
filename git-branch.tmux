#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

git_branch="#($CURRENT_DIR/scripts/git_branch.sh)"
git_branch_interpolation_string="\#{git_branch}"

source "${CURRENT_DIR}/scripts/helpers.sh"

set_tmux_option() {
	local option="$1"
	local value="$2"
	tmux set-option -gq "$option" "$value"
}

do_interpolation() {
	local string="$1"
	local interpolated="${string/$git_branch_interpolation_string/$git_branch}"
	printf %s "$interpolated"
}

update_tmux_option() {
	local option="$1"
	local option_value="$(get_tmux_option "$option")"
	local new_option_value="$(do_interpolation "$option_value")"
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}
main
