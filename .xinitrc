setxkbmap -option caps:escape &
unclutter &
xclip &
slstatus &
while type dwm >/dev/null ; do dwm && continue || break ;done
exec dwm
