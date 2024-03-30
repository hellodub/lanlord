#!/bin/bash

printf 'Lutris config copier for a specified user\n\n'
read -p "Input target user: " targetUser

superUser=$SUDO_USER
userPrefixesDir=/home/$targetUser/Games/wine-prefixes
systemPrefixesDir=/usr/share/games/local/wine-prefixes
userTargetDir=/home/$targetUser/.config/lutris/games
lutrisSourceDir=/usr/share/games/local/lutris/.config/lutris/games

function checkForRoot () 
{        
    if (( $(id -u) != 0 ))
    then
        echo "Please run as root"
        exit
    fi
}

function checkUserExist () 
{
	printf '\n\n'
	echo "Checking if user exists..."
	if id -u "$targetUser" > /dev/null 2>&1 
	then
		echo "User exists! Continuing..."
		printf '\n'
	else
		echo "User does not exist, aborted!"
		exit
	fi
}

function changeLutrisGamePaths
{
    rsync -aP $lutrisSourceDir/* $userTargetDir
    sed -i 's+'$systemPrefixesDir'+'$userPrefixesDir'+g' $userTargetDir/*.yml
}

checkForRoot
checkUserExist
changeLutrisGamePaths
