#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

sh ~/script/4xmonad/.fehbg

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

#.Xresources for URxvt
xrdb ~/.Xresources
#Add background image with feh
sh ~/home/user/script/4xmonad/.fehbg
#Add cursor support for Xmonad
xsetroot -cursor_name left_ptr
#Trayer  Xmonad
#trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 2 --transparent true --alpha 0 --tint 0x000000 --height 16 &

#enable xcompgr (transparent windows)
#stuff related: ~/.Xdefaults ; /etc/X11/xorg.confd (created new xorg.conf)
#xcompmgr -c &

#exec
exec xmonad
