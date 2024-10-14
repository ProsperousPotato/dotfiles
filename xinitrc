xrdb -load ~/.Xresources &
urxvtd --quiet --opendisplay &
xcompmgr &
unclutter --timeout 3 &
./.fehbg
slstatus &
while true; do
    pipewire &
    pipewire-pulse &
    wireplumber &
    dbus-launch --exit-with-session dwm &> ~/.local/share/dwm/dwm.log
done
