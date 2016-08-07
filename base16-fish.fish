#!/usr/bin/fish
# Sets fish sane colors for the fish shell.

set -g fish_color_normal          normal
set -g fish_color_autosuggestion  $base03              # dark gray
set -g fish_color_command         magenta # $base0E    # magenta
set -g fish_color_comment         $base04              # lighter gray
set -g fish_color_error           -o red  # $base08    # bold red
set -g fish_color_escape          yellow  # $base0A    # yellow
set -g fish_color_history_current cyan    # $base0D    # cyan (dirh current dir)
set -g fish_color_match           cyan    # $base0D    # cyan (matching parens)
set -g fish_color_operator        blue    # $base0C    # blue
set -g fish_color_param           cyan    # $base0D    # cyan
set -g fish_color_quote           green   # $base0B    # green (yellow?)
set -g fish_color_redirection     cyan    # $base0D    # cyan
set -g fish_color_search_match    --background=$base02 # grayish
set -g fish_color_valid_path      -u                   # underline

# for the default prompt (ignored)
set -g fish_color_host            '-o'  'blue'
set -g fish_color_status          red
set -g fish_color_user            '-o'  'green'
set -g fish_color_cwd             green
set -g fish_color_cwd_root        red
