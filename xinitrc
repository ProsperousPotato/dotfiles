xrdb -merge ~/.Xresources &
unclutter &
xclip &
xcompmgr &
hsetroot -solid "#000000" &
slstatus &
urxvtd --quiet --opendisplay --fork &
exec dbus-launch --exit-with-session dwm
