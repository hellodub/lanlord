#!/bin/bash

#########################################################
####						                         ####	
####	Copy lutris configs to a specified user	     ####
####						                         ####
#########################################################

# Didn't know where to put this to make it less
# confusing to read next time, so here it is for now
printf 'Lutris config copier for a specified user\n\n'
read -p "Input target user: " copyUser

superUser=$SUDO_USER
userConfigDir=/home/$copyUser/.config/lutris
userShareDir=/home/$copyUser/.local/share/lutris
lutrisConfigDir=/mnt/games/lanlord-customizations/lutris/.config/lutris/
lutrisShareDir=/mnt/games/lanlord-customizations/lutris/.local/share/lutris/

checkForRoot () 
{        
    if (( $(id -u) != 0 ))
    then
        echo "Please run as root"
        exit
    fi
}

getent passwd $user  > /dev/null

checkUserExist () 
{
    if [ $? -eq 0 ]
    then
        echo "User exists, continuing..."
    else
        echo "User does not exist, aborted"
        exit
    fi
}

checkForDirectory ()
{
	if [ ! -d userConfigDir ] || [ ! -d userShareDir ]
	then
		mkdir -p $userConfigDir
		mkdir -p $userShareDir
	fi
}

copyLutrisFiles () 
{
    if [ -d $lutrisConfigDir ] && [ -d $lutrisShareDir ]
    then
        rsync -aP $lutrisConfigDir/* $userConfigDir
        rsync -aP --exclude={'runners','runtime'} $lutrisShareDir/* $userShareDir
        ln -s $lutrisShareDir/runners $userShareDir
        ln -s $lutrisShareDir/runtime $userShareDir
        chown $copyUser. -R $userConfigDir
        chown -h $copyUser. -R $userShareDir
        chmod 775 -R $userConfigDir
        chmod 775 -R $userShareDir
        echo "Copied Lutris config and data files to: 
                $userConfigDir
                 $userShareDir"
    else
        echo "Error: Lutris directories not found, aborted"
        exit
    fi
}

checkForRoot
checkUserExist
checkForDirectory
copyLutrisFiles
