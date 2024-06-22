#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi

export EDITOR='vim'
export TERMINAL='st'
export BROWSER='floorp'
export VISUAL='nvim'
export READER='zathura'

alias powertop="sudo powertop"
# alias wallet="cd Downloads/monero-gui-v0.18.3.3/ && ./monero-wallet-gui"
alias watts="$HOME/.scripts/./w.sh"
alias orphans="pacman -Qqtd"
alias exterminateorphans="sudo pacman -Rns $(pacman -Qqtd)"

alias sxiv="sxiv * "
alias sudo="sudo "
alias vim="nvim"
alias 23="systemctl poweroff"
alias 42="reboot"
alias neofetch="fastfetch"
alias ff="fastfetch -l arch -s none | lolcat --force | fastfetch --raw - --logo-width 37 --logo-height 18"
alias ls='ls -A --color=auto'
alias grep='grep --color=auto'
alias ..="cd .."
alias mkgrubcfg="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias mv="mv -iv"
alias cp="cp -iv" 
alias rm="rm -iv"

PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

shopt -s autocd

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

bind '"\C-e":      "\clear & lfcd\n"'
bind -m vi-insert "\C-l":clear-screen

HISTSIZE= HISTFILESIZE= #
