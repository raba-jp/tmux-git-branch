#!/usr/bin/env bash

get_branch_name() {
	local path="$(tmux display-message -p -F '#{pane_current_path}')"
	local branch_name="$(cd ${path} && git rev-parse --abbrev-ref HEAD)"
	[[ -n ${branch_name} ]] && echo "${branch_name}"
}

get_branch_name
