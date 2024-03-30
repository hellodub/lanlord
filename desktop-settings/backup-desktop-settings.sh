#!/bin/bash

userHome=/home/$USER
userAutoStartDir=/home/$USER/.config/autostart
systemSettingsDir=/usr/share/games/local/desktop-settings

dconf dump / > $systemSettingsDir/dconf.txt
cp $userAutoStartDir/XScreenSaver.desktop $systemSettingsDir/XScreenSaver.desktop
cp $userHome/.xscreensaver $systemSettingsDir/.xscreensaver
