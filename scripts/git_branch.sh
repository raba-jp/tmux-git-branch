#!/usr/bin/env bash

branch_name="$(cd `tmux display-message -p -F '#{pane_current_path}'` \
  && git rev-parse --abbrev-ref HEAD)"
if [ ! -z ${branch_name} ]; then
  printf %s "[${branch_name}]"
fi
unset branch_name
