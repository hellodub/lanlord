#!/bin/bash

userAutoStartDir=/home/$USER/.config/autostart
systemSettingsDir=/usr/share/games/local/desktop-settings

dconf load / < $systemSettingsDir/dconf.txt
cp $systemSettingsDir/XScreenSaver.desktop $userAutoStartDir/XScreenSaver
cp $systemSettingsDir/.xscreensaver /home/$USER/.xscreensaver
