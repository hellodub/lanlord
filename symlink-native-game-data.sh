#!/bin/bash

####################################################
####						                    ####
####	creates directories and symlinks 	    ####
####	for natively-installed games to be	    ####
####	shared amongst all users such as	    ####
####	music, game files, configs, etc...      ####
####						                    ####
####################################################

printf '\n\n'
printf '#####################################################################################\n\n'
printf 'Directory-creator and symlinker for natively-installed games to a specified user\n\n'
printf '#####################################################################################\n\n'
read -p "Input target user: " targetUser

# these are paths of natively-installed games that
# require a user's /home directory but can otherwise
# be shared among users to prevent duplication of data 
sourceGameDirs=("/usr/share/games/doom/music-packs" \
"/usr/share/games/local/eduke32/music" \
"/usr/share/games/local/nblood/music" \
"/usr/share/games/local/voidsw/music" \
"/usr/share/games/local/revolt/downloads" \
"/usr/share/games/local/open-ra/Content");

userGameDirs=("/home/$targetUser/.local/share/crispy-doom" \
"/home/$targetUser/.config/eduke32" \
"/home/$targetUser/.config/nblood" \
"/home/$targetUser/.config/voidsw" \
"/home/$targetUser/.local/share/rvmm" \
"/home/$targetUser/.config/openra");

diablo=/usr/share/games/local/devilution
diabloUser=/home/$targetUser/.local/share/diasurgical/devilution
openrct2=/usr/share/games/local/open-rct2
openrct2User=/home/$targetUser/.local/share/OpenRCT2

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

function createGameDirs ()
{
	for dir in "${userGameDirs[@]}"
	do 
		if [[ ! -d $dir ]]
		then	
			sudo mkdir -p $dir
			echo "Created directory at "$dir""
			printf '\n'
		fi
	done
}

function symLinkGameDirs ()
{
	for (( i=0; i<${#sourceGameDirs[@]}; i++ ));
	do
		echo Linking contents of ${sourceGameDirs[$i]} to target ${userGameDirs[$i]}
		ln -s ${sourceGameDirs[$i]} ${userGameDirs[$i]}
		printf '\n'
	done
}

function symLinkGameExceptions ()
{
	echo "Linking Diablo .mpq files to /home/$targetUser/.local/share/diasurgical/devilution"
	ln -s $diablo/*.mpq $diabloUser
	printf '\n'
	echo "Copying RollerCoaster Tycoon config to /home/$targetUser/.local/share/OpenRCT2"
	cp $openrct2/config.ini $openrct2User
}

function changeOwnership ()
{
	printf '\n'
	for dir in "${userGameDirs[@]}"
	do
		echo "Changing ownership of $dir to $targetUser"
		chown -h $targetUser. -R $dir
	done
}

# run all the functions and stuff
checkForRoot
checkUserExist
createGameDirs
symLinkGameDirs

printf '#################################\n'
printf '\tSpecial game exceptions: \n'
printf '#################################\n\n'

symLinkGameExceptions

printf '\n'
printf '#################################\n'
printf '\tChange ownership: \n'
printf '#################################\n'

changeOwnership

printf '\n'
printf '#################################\n'
printf '\t\tdone!\n'
printf '#################################\n'

############################################################
