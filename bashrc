#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.config/bash-alias

set -o vi
shopt -s autocd
HISTSIZE= HISTFILESIZE= #


export PATH="~/.local/bin:/usr/local/bin:/usr/bin:/bin:~/.local/games/"
export PERL5LIB="/etc/perl:/usr/local/lib64/perl5/5.40/x86_64-linux:/usr/local/lib64/perl5/5.40:/usr/lib64/perl5/vendor_perl/5.40/x86_64-linux:/usr/lib64/perl5/vendor_perl/5.40:/usr/lib64/perl5/5.40/x86_64-linux:/usr/lib64/perl5/5.40:/usr/lib64/urxvt/perl"
export EDITOR='vim'
export TERMINAL='rxvt-unicode'
export BROWSER='librewolf-bin'
export VISUAL='nvim'
export READER='nvim'

astatus && PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[91m\][\[\e[92m\]\@\[\e[0m\] \[\e[93m\]\u\[\e[92m\]@\[\e[96m\]\H\[\e[0m\] \[\e[95m\]\w\[\e[91m\]] \[\e[36m\]${PS1_CMD1}\n\[\e[0m\] -> \$\# '

# Keybinds for use in bash terminal
bind '"\C-e":   "\clear & lfcd\n"'
bind -m vi-insert "\C-l":clear-screen
bind '"\C-h":   "htop\n"'
bind '"\C-`":   "nvim ~/.bash_history\n"'
bind '"\C-p":   "doas ntpdate -u pool.ntp.org\n"'
bind '"\C-n":   "nvim\n"'
bind '"\C-x":   "nvim ~/.bashrc\n"'

lfcd () {
    tmp="$(mktemp)"
    lfub -last-dir-path="$tmp" "$@"
if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

function extract() {
	if [ -f "$1" ] ; then
		local filename=$(basename "$1")
		local foldername="${filename%%.*}"
		local fullpath=`perl -e 'use Cwd "abs_path";print abs_path(shift)' "$1"`
		local didfolderexist=false
		if [ -d "$foldername" ]; then
			didfolderexist=true
			read -p "$foldername already exists, do you want to overwrite it? (y/n) " -n 1
			echo
			if [[ $REPLY =~ ^[Nn]$ ]]; then
				return
			fi
		fi
		mkdir -p "$foldername" && cd "$foldername"
		case $1 in
			*.tar.bz2) tar xjf "$fullpath" ;;
			*.tar.gz) tar xzf "$fullpath" ;;
			*.tar.xz) tar Jxvf "$fullpath" ;;
			*.tar.Z) tar xzf "$fullpath" ;;
            *.tbz2) tar xjf "$fullpath" ;;
			*.tar) tar xf "$fullpath" ;;
			*.taz) tar xzf "$fullpath" ;;
			*.tb2) tar xjf "$fullpath" ;;
			*.tbz) tar xjf "$fullpath" ;;
			*.tgz) tar xzf "$fullpath" ;;
			*.txz) tar Jxvf "$fullpath" ;;
            *.rar) unrar e "$fullpath" ;;
			*.zip) unzip "$fullpath" ;;
            *.7z) 7zz e "$fullpath" ;;
            *.gz) gzip -d "$fullpath" ;;
            *.Z) uncompress "$fullpath" ;;
			*) echo "'$1' cannot be extracted via extract()" && cd .. && ! $didfolderexist && rm -r "$foldername" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

run() {
    number=$1
    shift
    for ((i=1; i<=number; i++)); do
        "$@" echo x$i
    done
}
status=$(astatus)
