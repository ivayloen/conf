#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#launches dbus session
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#set layouts
setxkbmap -layout "us, bg" -variant ",phonetic" -option "grp:alt_shift_toggle"

#set gnome keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export GPG_AGENT_INFO SSH_AUTH_SOCK

# exec gnome-session
# exec startkde
#exec dbus-launch startxfce4
#exec dbus-launch --exit-with-session i3 -V >> ~/.i3/i3log 2>&1
exec i3 -V >> ~/.i3/i3log 2>&1

# ...or the Window Manager of your choice
