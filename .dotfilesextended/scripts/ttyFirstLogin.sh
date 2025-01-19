#!/usr/bin/bash

# if [ -f /run/user/1000/tty1started ] ; then
#     echo "FILE FOUND"
# else
#     echo "NOT FOUND"
# fi
# #!/bin/bash
#
if [ -f /run/user/1000/tty1started ] ; then
    /sbin/agetty -o '-p -- \\u' --noclear - $TERM
else
    touch /run/user/1000/tty1started
    /sbin/agetty --autologin l --noclear - $TERM
fi

