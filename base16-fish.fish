#!/usr/bin/fish
# script to set fish prompt colors, assuming env is set

set -g fish_color_autosuggestion    $base03
set -g fish_color_command           magenta
set -g fish_color_comment           $base04
set -g fish_color_cwd               green
set -g fish_color_cwd_root          red
set -g fish_color_end               magenta
set -g fish_color_error             -o red 
set -g fish_color_escape            cyan
set -g fish_color_history_current   cyan
set -g fish_color_match             cyan
set -g fish_color_normal            normal
set -g fish_color_operator          cyan
set -g fish_color_param             cyan
set -g fish_color_quote             green
set -g fish_color_redirection       yellow
set -g fish_color_search_match      --background=$base03
set -g fish_color_selection         --background=purple
set -g fish_color_valid_path        --underline
#set -g fish_pager_color_completion  normal
#set -g fish_pager_color_description '555'  'yellow'
#set -g fish_pager_color_prefix      cyan
#set -g fish_pager_color_progress    cyan

