#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#siji font
xset +fp /home/aclopax/.local/share/fonts
xset fp rehash

#set resolution
xrandr --output eDP-1 --mode 3840x2160 --output DP2 --mode 1920x1080 --scale 2x2 &
#compositor
picom &
#set wallpaper
nitrogen --restore &
#start xbindkeys
xbindkeys -f "$XDG_CONFIG_HOME"/xbindkeys/config &
#start slstatus
slstatus &
#start window manager
exec dwm
