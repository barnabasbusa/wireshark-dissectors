#!/bin/sh
set -e

DISPLAY=:1
export DISPLAY

Xvfb $DISPLAY -screen 0 1920x1080x24 &
sleep 1

openbox &
wireshark &

x11vnc -display $DISPLAY -forever -nopw -shared -rfbport 5900 &
sleep 1

websockify --web /usr/share/novnc 3000 localhost:5900
