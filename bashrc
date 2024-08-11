#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


set -o vi
shopt -s autocd
HISTSIZE= HISTFILESIZE= #

PS1="[\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

export EDITOR='vim'
export TERMINAL='st'
export BROWSER='librewolf-bin'
export VISUAL='nvim'
export READER='nvim'


# Arch
# alias orphans="pacman -Qqtd"
# alias exterminateorphans="sudo pacman -Rns $(pacman -Qqtd)"


# Gentoo
alias sudo="doas "
alias doas="doas "
alias dispatch-conf="doas dispatch-conf"
alias emerge="time doas emerge "
alias openrc="doas openrc"
alias 23="doas poweroff"
alias 42="doas reboot"


# alias sudo="sudo "
# alias mkgrubcfg="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias :wq="exit"
alias :q="exit"
alias sxiv="nsxiv"
alias nsxiv="nsxiv -t"
alias vim="nvim"
alias powertop="doas powertop"
alias ff="fastfetch -l native -s none | lolcat --truecolor --force | fastfetch --raw - --logo-width 37 --logo-height 19"
alias nf="neofetch"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..="cd .."
alias mv="mv -iv"
alias cp="cp -ivr" 
alias rm="rm -iv"
alias '7zip'="7zz e"
alias mpv="setsid -f mpv -hwdec=auto"
alias nv="nvim"
alias v="vim"

alias .lb="cd ~/.local/bin"
alias .lsh="cd ~/.local/share"
alias .ls="cd ~/.local/src"
alias .c="cd ~/.config"
alias .lsst="cd ~/.local/src/st"
alias .lsdwm="cd ~/.local/src/dwm"
alias .lsdmenu="cd ~/.local/src/dmenu"
alias .lssl="cd ~/.local/src/slstatus"
alias .lshu="cd ~/.local/share/urxvt"


bind '"\C-e":   "\clear & lfcd\n"'
bind -m vi-insert "\C-l":clear-screen
bind '"\C-a":   "\clear & iwctl\n"'
bind '"\C-b":   "btop\n"'
bind '"\C-`":   "vim ~/.bash_history\n"'
bind '"\C-w":   "openrc -s iwd start\n"'
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
