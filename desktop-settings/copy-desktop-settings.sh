#!/bin/bash

userHome=/home/$USER
userAutoStartDir=/home/$USER/.config/autostart
systemSettingsDir=/usr/share/games/local/desktop-settings

dconf load / < $systemSettingsDir/dconf.txt
cp $systemSettingsDir/XScreenSaver.desktop $userAutoStartDir/XScreenSaver
cp $systemSettingsDir/.xscreensaver $userHome/.xscreensaver
cp $systemSettingsDir/savegame-backuper/{backup-save-games.sh,restore-save-games.sh} $userHome/Desktop
