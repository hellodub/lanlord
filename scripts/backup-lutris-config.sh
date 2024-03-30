#!/bin/bash

superUser=$SUDO_USER
userConfigDir=/home/$superUser/.config/lutris
userShareDir=/home/$superUser/.local/share/lutris
userShortcutsDir=/home/$superUser/.local/share/applications
systemShortcutsDir=/usr/share/games/local/lutris/application-shortcuts
lutrisConfigDir=/usr/share/games/local/lutris/.config/lutris/
lutrisShareDir=/usr/share/games/local/lutris/.local/share/lutris/

function checkForRoot () 
{        
    if (( $(id -u) != 0 ))
    then
        echo "Please run as root"
        exit 1
    fi
}

function checkForDirs ()
{
    if [ -d $lutrisConfigDir ] && [ -d $lutrisShareDir ]
    then
        echo "Lutris directories exist, continuing..."
    else
        echo "Directories do not exist, creating..."
        mkdir -p $lutrisConfigDir
        mkdir -p $lutrisShareDir
    fi
}

function copyLutrisFiles () 
{  
        rsync -aP $userConfigDir/* $lutrisConfigDir
        rsync -aP $userShareDir/* $lutrisShareDir
        rsync -aP --include '*/' --include='net.lutris.*' --exclude='*' $userShortcutsDir/* $systemShortcutsDir
        chown $superUser:shared-data -R $lutrisConfigDir
        chown $superUser:shared-data -R $lutrisShareDir
        chown $superUser:shared-data -R $systemShortcutsDir
        chmod 775 -R $lutrisConfigDir
        chmod 775 -R $lutrisShareDir
        chmod 775 -R $systemShortcutsDir
        echo "Backed-up Lutris shortcuts, config and data files to: 
                $lutrisConfigDir
                 $lutrisShareDir
                  $systemShortcutsDir"
}

checkForRoot
checkForDirs
copyLutrisFiles
