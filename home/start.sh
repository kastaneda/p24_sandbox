#!/bin/sh
Xvfb :1 -screen 0 1200x600x16 &
su ubuntu -c "DISPLAY=:1.0 x11vnc -forever -loop -noxdamage -repeat -shared" &
su ubuntu -c "DISPLAY=:1.0 openbox" &
