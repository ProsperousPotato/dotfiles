#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.config/bash-alias

set -o vi
shopt -s autocd
HISTSIZE= HISTFILESIZE= #

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[91m\][\[\e[92m\]\@\[\e[0m\] \[\e[93m\]\u\[\e[92m\]@\[\e[96m\]\H\[\e[0m\] \[\e[95m\]\w\[\e[91m\]] \[\e[36m\]${PS1_CMD1}\n\[\e[0m\] -> \$\# '



export EDITOR='vim'
export TERMINAL='urxvtc'
export BROWSER='librewolf-bin'
export VISUAL='nvim'
export READER='nvim'

# Keybinds for use in bash terminal
bind '"\C-e":   "\clear & lfcd\n"'
bind -m vi-insert "\C-l":clear-screen
bind '"\C-a":   "\clear & iwctl\n"'
bind '"\C-b":   "btop\n"'
bind '"\C-`":   "vim ~/.bash_history\n"'
bind '"\C-p":   "doas ntpdate -u pool.ntp.org\n"'
bind '"\C-n":   "nvim\n"'
bind '"\C-w":   "openrc -s iwd "'
bind '"\C-x":   "vim ~/.bashrc\n"'

lfcd () {
    tmp="$(mktemp)"
    lfub -last-dir-path="$tmp" "$@"
if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
