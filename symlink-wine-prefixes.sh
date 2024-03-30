#!/bin/bash

############################################################################
###	symlink master wine-prefixes to /home/$USER/Games/wine-prefixes	 ###
############################################################################

# Didn't know where to put this to make it less
# confusing to read next time, so here it is for now
printf 'Lutris config copier for a specified user\n\n'
read -p "Input target user: " targetUser

prefixDir=/usr/share/games/local/wine-prefixes
targetDir=/home/$targetUser/Games/wine-prefixes

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
    if [ $? -eq 0 ]
    then
        echo "User exists, continuing..."
    else
        echo "User does not exist, aborted"
        exit
    fi
}

function createWineDirs ()
{
	if [ ! -d $targerDir ]
	then
		for dir in `ls $prefixDir`
		do 
			sudo mkdir -p "/home/$targetUser/Games/wine-prefixes/$dir"
		done
	fi
}

function symLinkPrefixes ()
{
	for dir in `ls $prefixDir`
	do 
		echo "Linking contents of $prefixDir/$dir/ to target $targetDir/$dir"
		ln -s $prefixDir/$dir/* $targetDir/$dir/
	done
}

function changeOwnership ()
{
     chown $targetUser. -R $targetDir
}

checkForRoot
checkUserExist
symLinkPrefixes
changeOwnership
