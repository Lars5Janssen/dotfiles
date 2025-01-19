#!/usr/bin/bash

if [ -f /run/user/1000/tty1started ] ; then
    /usr/bin/agetty --noclear tty1 $TERM
else
    touch /run/user/1000/tty1started
    /usr/bin/agetty --autologin l --noclear tty1 $TERM
fi
