urxvtd --quiet --opendisplay &
pipewire &
xcompmgr &
unclutter &
xrdb -load ~/.Xresources &
hsetroot -solid "#000000" &
exec dwm &> ~/.local/share/dwm/dwm.log
