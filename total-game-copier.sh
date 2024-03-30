#!/bin/bash
#!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
#!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
#					Total Game Copier
#
# goes through copy-lutris-config.sh,symlink-native-game-data.sh, and symlink-wine-prefixes.sh
#
#!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!


# Begin copy-lutris-config.sh
#########################################################
						    	
#	Copy lutris configs to a specified user	    
						     
#########################################################

# Didn't know where to put this to make it less
# confusing to read next time, so here it is for now
printf 'Lutris config copier for a specified user\n\n'
read -p "Input target user: " targetUser

#variables from copy-lutris-config.sh
superUser=$SUDO_USER
userConfigDir=/home/$targetUser/.config/lutris
userShareDir=/home/$targetUser/.local/share/lutris
userDesktopDir=/home/$targetUser/Desktop
userShortcutsDir=/home/$targetUser/.local/share/applications
systemDesktopDir=/mnt/games/lanlord-customizations/games-shortcuts
systemShortcutsDir=/mnt/games/lanlord-customizations/lutris/application-shortcuts
lutrisConfigDir=/mnt/games/lanlord-customizations/lutris/.config/lutris/
lutrisShareDir=/mnt/games/lanlord-customizations/lutris/.local/share/lutris/

#variables from update-lutris-game-paths.sh
#userPrefixesDir=/home/$targetUser/Games/wine-prefixes
#systemPrefixesDir=/mnt/games/lanlord-customizations/wine-prefixes
userTargetDir=/home/$targetUser/.config/lutris/games
lutrisSourceDir=/mnt/games/lanlord-customizations/lutris/.config/lutris/games

# variables from symlink-native-game-data.sh
diablo=/mnt/games/lanlord-customizations/devilution
diabloUser=/home/$targetUser/.local/share/diasurgical/devilution
openrct2=/mnt/games/lanlord-customizations/open-rct2/OpenRCT2
openrct2User=/home/$targetUser/.local/share/OpenRCT2
warzone2100=/usr/share/games/warzone2100
warzone2100User=/home/$targetUser/.local/share/warzone2100

sourceGameDirs=("/usr/share/games/doom/music-packs" \
"/mnt/games/lanlord-customizations/eduke32/music" \
"/mnt/games/lanlord-customizations/nblood/music" \
"/mnt/games/lanlord-customizations/voidsw/music" \
"/mnt/games/lanlord-customizations/revolt/downloads" \
"/mnt/games/lanlord-customizations/open-ra/Content");

userGameDirs=("/home/$targetUser/.local/share/crispy-doom" \
"/home/$targetUser/.config/eduke32" \
"/home/$targetUser/.config/nblood" \
"/home/$targetUser/.config/voidsw" \
"/home/$targetUser/.local/share/rvmm" \
"/home/$targetUser/.config/openra");

# variables from symlink-wine-prefixes.sh
sourcePrefixDir=/mnt/games/wine-prefixes
userPrefixDir=/home/$targetUser/Games/wine-prefixes

# function definitions
checkForRoot () 
{        
    if (( $(id -u) != 0 ))
    then
        echo "Please run as root"
        exit
    fi
}
###########################################
# functions from copy-lutris-config.sh
###########################################
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

checkForDirectory ()
{
	if [ ! -d userConfigDir ] || [ ! -d userShareDir ]
	then
		mkdir -p $userConfigDir
		mkdir -p $userShareDir/runners
        mkdir -p $userShareDir/runtime
	fi
}

copyLutrisFiles () 
{
    if [ -d $lutrisConfigDir ] && [ -d $lutrisShareDir ]
    then
        rsync -aP $lutrisConfigDir/* $userConfigDir
        rsync -aP --exclude={'runners','runtime'} $lutrisShareDir/* $userShareDir
        rsync -aP $systemShortcutsDir/* $userShortcutsDir
        rsync -aP $systemDesktopDir $userDesktopDir
        ln -s $lutrisShareDir/runners/* $userShareDir/runners/
        ln -s $lutrisShareDir/runtime/* $userShareDir/runtime/
        chown $targetUser. -R $userConfigDir
        chown $targetUser. -R $userShareDir
        chown $targetUser. -R $userShortcutsDir
        chown $targetUser. -R $userDesktopDir/Games
        chmod 775 -R $userConfigDir
        chmod 775 -R $userShareDir
        chmod 775 -R $userShortcutsDir
        chmod 775 -R $userDesktopDir/Games
        echo "Copied Lutris config and data files to: 
                $userConfigDir
                 $userShareDir
                  $userShortcutsDir
                   $userDesktopDir"
    else
        echo "Error: Lutris directories not found, aborted!"
        exit
    fi
}

function changeLutrisGamePaths
{
    rsync -aP $lutrisSourceDir/* $userTargetDir
    sed -i 's+'$sourcePrefixDir'+'$userPrefixDir'+g' $userTargetDir/*.yml
}
##############################################
# variables from symlink-native-game-data.sh
##############################################
function createGameDirs ()
{
	printf '\n\n'
	printf '#####################################################################################\n\n'
	printf 'Directory-creator and symlinker for natively-installed games to a specified user\n\n'
	printf '#####################################################################################\n\n'
	for dir in "${userGameDirs[@]}"
	do 
		if [[ ! -d $dir ]]
		then	
			mkdir -p $dir
			echo "Created directory at "$dir""
			printf '\n'
		fi
	done
	mkdir -p $diabloUser
	mkdir -p $openrct2User
    mkdir -p $warzone2100User
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
	printf '#################################\n'
	printf '\tSpecial game exceptions: \n'
	printf '#################################\n\n'
	echo "Linking Diablo .mpq files to $diabloUser"
	ln -s $diablo/*.mpq $diabloUser
	printf '\n'
	echo "Copying RollerCoaster Tycoon config to $openrct2User"
	cp $openrct2/config.ini $openrct2User
    echo "Linking Warzone 2100 videos to $warzone2100User"
    ln -s $warzone2100/sequences.wz $warzone2100User/sequences.wz
}

function changeNativeOwnership ()
{
	printf '\n'
	printf '#################################\n'
	printf '\tChange ownership: \n'
	printf '#################################\n'
	printf '\n'
	for dir in "${userGameDirs[@]}"
	do
		echo "Changing ownership of $dir to $targetUser"
		chown $targetUser. -R $dir
	done
	chown -h $targetUser. -R /home/$targetUser/.local/share/diasurgical
	chown $targetUser. -R $openrct2User
    chown -h $targetUser. -R $warzone2100User
	printf '\n'
	printf '#################################\n'
	printf '\t\tdone!\n'
	printf '#################################\n'
}
###########################################
# functions from symlink-wine-prefixes.sh
###########################################
function createPrefixDirs ()
{
	for dir in `ls $sourcePrefixDir`
	do 
		mkdir -p $userPrefixDir/$dir
	done
}

function symLinkPrefixes ()
{
	printf 'Lutris config copier for a specified user\n\n'
	for dir in `ls $sourcePrefixDir`
	do 
		echo "Linking contents of $sourcePrefixDir/$dir/ to target $userPrefixDir/$dir"
		ln -s $sourcePrefixDir/$dir/* $userPrefixDir/$dir/
	done
}

function changePrefixOwnership ()
{
     chown -h $targetUser. -R /home/$targetUser/Games
}

###########################################################
#######		copy backup/restore shortcuts to user	#######
###########################################################

userHome=/home/$targetUser
desktopSettingsDir=/mnt/games/lanlord-customizations/desktop-settings

function copyDesktopLaunchers
{
	rsync -aP $desktopSettingsDir/apply-lanlord-desktop-settings.desktop $userHome/.local/share/applications
	rsync -aP $desktopSettingsDir/savegame-backuper/{backup-save-games.desktop,restore-save-games.desktop} $userHome/.local/share/applications
	rsync -aP $desktopSettingsDir/savegame-backuper/{backup-save-games.desktop,restore-save-games.desktop} $userHome/Desktop
	chown $targetUser. $userHome/.local/share/applications/apply-lanlord-desktop-settings.desktop
	chown $targetUser. $userHome/.local/share/applications/{backup-save-games.desktop,restore-save-games.desktop}
	chown $targetUser. $userHome/Desktop/{backup-save-games.desktop,restore-save-games.desktop}
}

# function calls from copy-lutris-config.sh
#
#   checkForRoot
#   checkUserExist
#   checkForDirectory
#   copyLutrisFiles
#   changeLutrisGamePaths

#function calls from symlink-native-game-data.sh
#
#   createGameDirs
#   symLinkGameDirs
#   symLinkGameExceptions
#   changeNativeOwnership

# functions from symlink-wine-prefixes.sh
#
#   createPrefixDirs
#   symLinkPrefixes
#   changePrefixOwnership

# desktop launchers
#
#   copyDesktopLaunchers

# Run functions
checkForRoot
checkUserExist
checkForDirectory
createGameDirs
symLinkGameDirs
symLinkGameExceptions
changeNativeOwnership
createPrefixDirs
symLinkPrefixes
changePrefixOwnership
copyLutrisFiles
changeLutrisGamePaths
copyDesktopLaunchers

############################################################


