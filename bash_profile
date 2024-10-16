# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[ -f ~/.bashrc ] && . ~/.bashrc

[ "$(tty)" == "/dev/tty1"  ] && ! pgrep dwm || startx &> ~/.local/share/xorg/xorg-runtime.log
