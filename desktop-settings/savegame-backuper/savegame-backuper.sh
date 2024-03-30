#!/bin/bash

############################################################################
#######		backup save games to user backup directory		 #######
############################################################################

source /usr/share/games/local/desktop-settings/savegame-backuper/savegame-paths.sh

targetUser=$USER

sourcePrefixDir="/usr/share/games/local/wine-prefixes"

# Define paths for specified user versus system wine-prefixes
userWinePrefixes="/home/$targetUser/Games/wine-prefixes"
#systemWinePrefixes="/usr/share/games/local/wine-prefixes" # not needed anymore, but keeping in-case it suddenly is

# Define path of user backup directory
userBackupDir="/home/$targetUser/Games/game-saves"

# Game directory array
userGameDirs=("$userAoe2Config" \
"$userAoe2Campaign" \
"$userAoe2Scenario" \
"$userAoe2SaveGame" \
"$userAomConfig" \
"$userAomSaveGame" \
"$userAvp2Config" \
"$userAvp2SaveGame" \
"$userAvp2KeyBinds" \
"$userAmidEvilSaveGame" \
"$userBattlefield2Config" \
"$userBf1942Config" \
"$userBfvietnamSaveGame" \
"$userCodConfig" \
"$userCod2SaveGame" \
"$userCod4SaveGame" \
"$userCodWawSaveGame" \
"$userCncnetConfig" \
"$userCncnetSaveGame" \
"$userCnc3Config" \
"$userCnc3SaveGame" \
"$userCncRA2Config" \
"$userCncRA3Config" \
"$userCncRA3SaveGame" \
"$userCncRA3UprisingConfig" \
"$userCncRA3UprisingSaveGame" \
"$userCrysisSaveGame" \
"$userDiablo2SaveGame" \
"$userDeusExSaveGame" \
"$userDungeonKeeperConfig" \
"$userDungeonKeeperSaveGame" \
"$userEmpireEarthSaveGame" \
"$userFallout2SaveGame" \
"$userFallout3SaveGame" \
"$userFalloutNVSaveGame" \
"$userFearConfig" \
"$userFearSaveGame" \
"$userFlatout2SaveGame" \
"$userGoWSaveGame" \
"$userGrimDawnSaveGame" \
"$userGta2SaveGame" \
"$userHaloSaveGame" \
"$userHalo2SaveGame" \
"$userH1ClassicSaveGame" \
"$userH2ClassicSaveGame" \
"$userH1RMSaveGame" \
"$userIwdConfig" \
"$userIwdKeymap" \
"$userIwdSaveGame" \
"$userIwd2Config" \
"$userIwd2Keymap" \
"$userIwd2SaveGame" \
"$userIl2Config" \
"$userIl2SaveGame" \
"$userMmSaveGame" \
"$userMm2SaveGame" \
"$userMohaaConfig" \
"$userMohaaSaveGame" \
"$userNwnConfig" \
"$userNwnSaveGame" \
"$userOblivionSaveGame" \
"$userSkyrimSaveGame" \
"$userRaymanOriginsSaveGame" \
"$userRonConfig" \
"$userRonSaveGame" \
"$userSC3000Configcfg" \
"$userSC3000Configini" \
"$userSC3000SaveGame" \
"$userSC4SaveGame" \
"$userStarcraftConfig" \
"$userStarcraftSaveGame" \
"$userSupComSaveGame" \
"$userBattlefrontSaveGame" \
"$userBattlefront2SaveGame" \
"$userGalacticBattlegroundsSaveGame" \
"$userSWKotorSaveGame" \
"$userSimsSaveGame" \
"$userThiefSaveGame" \
"$userTHUG2SaveGame" \
"$userTHUG2ProSaveGame" \
"$userWarcraft2SaveGame" \
"$userWocSaveGame");
# end array

# Game-specific files that can't be glob copied
userGameExceptions=("$userAoe2ConfigFile" \
"$userAvp2ConfigFile" \
"$userCncnetSaveGameFiles" \
"$userCncRA2ConfigFile" \
"$userCncRA2ConfigMdFile" \
"$userDungeonKeeperConfigFile" \
"$userFearConfigFile" \
"$userIwdConfigFile" \
"$userIwdKeymap" \
"$userIwd2ConfigFile" \
"$userIwd2Keymap" \
"$userIl2ConfigFile" \
"$userNwnConfigFile" \
"$userStarcraftConfigFile" \
"$userGalacticBattlegroundsConfignfx" \
"$userGalacticBattlegroundsConfignfl" \
"$userSWKotorConfigini" \
"$userSWKotorConfigini2" \
"$userSS2Config" \
"$userSS2SaveGame" \
"$userThiefConfig" \
"$userThiefKeymap" \
"$userSC3000Configcfg" \
"$userSC3000Configini");
# end array

function createBackupDirs ()
{
	for (( i=0; i<${#userGameDirs[@]}; i++ ));
	do
		if [ ! -d "$userBackupDir"/"${userGameDirs[$i]}" ]
		then 
			mkdir -p "$userBackupDir"/"${userGameDirs[$i]}"
			echo Created backup directory at "$userBackupDir"/"${userGameDirs[$i]}"
			printf '\n'
		fi		
	done
}

function createPrefixDirs ()
{
	for dir in `ls $sourcePrefixDir`
	do 
		mkdir -p $userWinePrefixes/$dir
	done
}

function backupGameSaves ()
{
	for (( i=0; i<${#userGameDirs[@]}; i++ ));
	do
		rsync -aP --dry-run "$userWinePrefixes"/"${userGameDirs[$i]}" "$userBackupDir"/"${userGameDirs[$i]}"
		printf '\n'
	done
}

function backupGameExceptions
{
	for (( i=0; i<${#userGameExceptions[@]}; i++ ));
	do
		rsync -aP --dry-run "$userWinePrefixes"/"${userGameExceptions[$i]}" "$userBackupDir"/"${userGameExceptions[$i]}"
		printf '\n'
	done
}

createBackupDirs
createPrefixDirs
backupGameSaves
backupGameExceptions


