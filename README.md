# Base16 Env
A set of scripts to set $base[0-F] environment variables

## Use Cases
* You want a unified way to deal with colors across programs

## Installation

    git clone https://github.com/SolitaryCipher/base16-env.git ~/.config/base16-env

Link your desired colorscheme from `$HOME/.config/base16-env/*sh/` to `$HOME/.config/base16-env/base16-shell.[fi]sh`

## Shells

### Bash/ZSH
In `~/.bashrc` or `~/.zshrc` place the following line:
    
    source $HOME/.config/base16-env/base16-env.sh


### Fish
In `config.fish` place the following lines:

    source $HOME/.config/base16-env/base16-env.fish

## Other Scripts
Included is a base16-shell script to set the terminal color scheme from the 
environment variables. Put the following lines after you source the color scheme:

`~/.bashrc` or `~/.zshrc`:

    eval $HOME/.config/base16-env/base16-shell.sh

`config.fish`:

    eval sh $HOME/.config/base16-env/base16-shell.sh
  

