#!/bin/bash

### Create symbolic links into a given directory

### Example: 
###	1.     ~/Documents/symlink-dirs.sh /usr/share/games/doom/music-packs/ ~/.local/share/crispy-doom/music-packs/
###        		 This made symbolic links to all the .flac music files inside of the former directory, to the latter directory
###
###	2.	For copying to wine-prefixes to users: /usr/share/games/local/wine-prefixes /home/$targetUser/Games/wine-prefixes
###
###  

sourceDirectory=$1
targetDirectory=$2
targetUser=$3

checkSyntax ()
{
	if [ -d "$sourceDirectory" ] && [ -d "$targetDirectory" ]
	then
		echo "Linking "$sourceDirectory" to "$targetDirectory"..."
	else
		echo "One or more directories do not exist, aborted"
		exit 1;
	fi
}

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

userExists()
{ 
    id "$1" &>/dev/null;     # silent, it just sets the exit code

    if user_exists "$1"; code=$?; 
    then  # use the function, save the code
        echo 'User specified'
    else
        echo 'user not found' >&2  # error messages should go to stderr
    fi
    exit $code  # set the exit code, ultimately the same set by `id`
}

ifUserSpecified ()
{
    userExists
    checkForRoot
}


checkForRoot () 
{        
    if (( $(id -u) != 0 ))
    then
        echo "Please run as root"
        exit
    fi
}

symLinkDirs ()
{
	for object in `ls $sourceDirectory`;
	do ln -s -T $sourceDirectory/$object $targetDirectory/$object;
	done
}

changeOwnership ()
{
     chown $targetUser. -R $targetDirectory
}

#getent passwd $user  > /dev/null

checkSyntax
symLinkDirs
changeOwnership
