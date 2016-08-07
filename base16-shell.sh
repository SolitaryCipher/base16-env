#!/bin/sh
# Similar to the scripts in base16-shell
# Reads base16 colors from env, and sets the terminal colors.

# This script doesn't support linux console (use 'vconsole' template instead)
if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

if [ -z $base00 ] || [ -z $base01 ] || [ -z $base02 ] || [ -z $base03 ] || 
   [ -z $base04 ] || [ -z $base05 ] || [ -z $base06 ] || [ -z $base07 ] || 
   [ -z $base08 ] || [ -z $base09 ] || [ -z $base0A ] || [ -z $base0B ] ||
   [ -z $base0C ] || [ -z $base0D ] || [ -z $base0E ] || [ -z $base0F ]
then
  echo "Environment not set properly"; exit 1;
fi

to_printf_str () {
  echo $1 | sed 's/\(..\)/\1\//g' | sed 's/\/$//'
}

color00=$(to_printf_str $base00) # base 00 - black
color01=$(to_printf_str $base08) # base 08 - red
color02=$(to_printf_str $base0B) # base 0b - green
color03=$(to_printf_str $base0A) # base 0a - yellow
color04=$(to_printf_str $base0D) # base 0d - blue
color05=$(to_printf_str $base0E) # base 0e - magenta
color06=$(to_printf_str $base0C) # base 0c - cyan
color07=$(to_printf_str $base05) # base 05 - white
color08=$(to_printf_str $base03) # base 03 - bright black
color09=$(to_printf_str $base08) # base 08 - bright red
color10=$(to_printf_str $base0B) # base 0b - bright green
color11=$(to_printf_str $base0A) # base 0a - bright yellow
color12=$(to_printf_str $base0D) # base 0d - bright blue
color13=$(to_printf_str $base0E) # base 0e - bright magenta
color14=$(to_printf_str $base0C) # base 0c - bright cyan
color15=$(to_printf_str $base07) # base 07 - bright white
color16=$(to_printf_str $base09) # base 09
color17=$(to_printf_str $base0F) # base 0f
color18=$(to_printf_str $base01) # base 01
color19=$(to_printf_str $base02) # base 02
color20=$(to_printf_str $base04) # base 04
color21=$(to_printf_str $base06) # base 06
color_foreground=$(to_printf_str $base05) # base 05
color_background=$(to_printf_str $base00) # base 00
color_cursor=$(to_printf_str $base05) # base 05

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  printf_template='\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\'
  printf_template_var='\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\'
  printf_template_custom='\033Ptmux;\033\033]%s%s\033\033\\\033\\'
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template='\033P\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033P\033]%d;rgb:%s\033\\'
  printf_template_custom='\033P\033]%s%s\033\\'
else
  printf_template='\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033]%d;rgb:%s\033\\'
  printf_template_custom='\033]%s%s\033\\'
fi

# 16 color space
printf $printf_template 0  $color00
printf $printf_template 1  $color01
printf $printf_template 2  $color02
printf $printf_template 3  $color03
printf $printf_template 4  $color04
printf $printf_template 5  $color05
printf $printf_template 6  $color06
printf $printf_template 7  $color07
printf $printf_template 8  $color08
printf $printf_template 9  $color09
printf $printf_template 10 $color10
printf $printf_template 11 $color11
printf $printf_template 12 $color12
printf $printf_template 13 $color13
printf $printf_template 14 $color14
printf $printf_template 15 $color15

# 256 color space
printf $printf_template 16 $color16
printf $printf_template 17 $color17
printf $printf_template 18 $color18
printf $printf_template 19 $color19
printf $printf_template 20 $color20
printf $printf_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  printf $printf_template_custom Pg a5a2a2 # forground
  printf $printf_template_custom Ph 090300 # background
  printf $printf_template_custom Pi a5a2a2 # bold color
  printf $printf_template_custom Pj 4a4543 # selection color
  printf $printf_template_custom Pk a5a2a2 # selected text color
  printf $printf_template_custom Pl a5a2a2 # cursor
  printf $printf_template_custom Pm 090300 # cursor text
else
  printf $printf_template_var 10 $color_foreground
  printf $printf_template_var 11 $color_background
  printf $printf_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset printf_template
unset printf_template_var
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background
unset color_cursor
