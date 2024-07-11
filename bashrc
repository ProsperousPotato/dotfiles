#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


set -o vi
shopt -s autocd
HISTSIZE= HISTFILESIZE= #
PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"


export EDITOR='vim'
export TERMINAL='st'
export BROWSER='qutebrowser'
export VISUAL='nvim'
export READER='zathura'


# Arch
# alias orphans="pacman -Qqtd"
# alias exterminateorphans="doas pacman -Rns $(pacman -Qqtd)"


# Gentoo
alias doas="doas "
alias sudo="doas "
alias dispatch-conf="doas dispatch-conf"
alias emerge="time sudo emerge "
alias openrc="doas openrc"
alias justupdateplease="emerge --ask --verbose -uDU --keep-going --with-bdeps=y "


# alias sudo="sudo "
# alias mkgrubcfg="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias sxiv="nsxiv -t *"
alias vim="nvim"
alias 23="doas poweroff"
alias 42="doas reboot"
alias powertop="doas powertop"
alias ff="fastfetch -l native -s none | lolcat --force | fastfetch --raw - --logo-width 37 --logo-height 19"
alias nf="neofetch"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..="cd .."
alias mv="mv -iv"
alias cp="cp -iv" 
alias rm="rm -iv"
alias '7zip'="7zz e"
alias mpv="mpv -hwdec=auto"


bind '"\C-e":   "\clear & lfcd\n"'
bind -m vi-insert "\C-l":clear-screen
bind '"\C-f":   "fzf\n"'
bind '"\C-w":   "\clear & iwctl\n"'
bind '"\C-b":   "btop\n"'


lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
