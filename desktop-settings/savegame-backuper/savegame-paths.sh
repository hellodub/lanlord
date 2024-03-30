#!/bin/bash

######################################################################################
####	Save game paths for backup and restore (for wine games)			######
######################################################################################

targetUser=$USER

# Switchable target directory variable
#targetDir=$userWinePrefixes

#Age of Empires II: The Conquerors

# Paths:
#        Config files:
#            Player settings: /opt/games/wine-games/aoe2/drive_c/Program Files/Microsoft Games/Age of Empires II/player.nfp     # Determines unlocked scenarios
#            Custom campaigns: /opt/games/wine-games/aoe2/drive_c/Program Files/Microsoft Games/Age of Empires II/Campaign/*
#            Custom scenarios: /opt/games/wine-games/aoe2/drive_c/Program Files/Microsoft Games/Age of Empires II/Scenario/*
#            Saved games: /opt/games/wine-games/aoe2/drive_c/Program Files/Microsoft Games/Age of Empires II/SaveGame/*

userAoe2ConfigFile="aoe2/drive_c/Program Files/Microsoft Games/Age of Empires II/player.nfp"
userAoe2Config="aoe2/drive_c/Program Files/Microsoft Games/Age of Empires II/"
userAoe2Campaign="aoe2/drive_c/Program Files/Microsoft Games/Age of Empires II/Campaign/"
userAoe2Scenario="aoe2/drive_c/Program Files/Microsoft Games/Age of Empires II/Scenario/"
userAoe2SaveGame="aoe2/drive_c/Program Files/Microsoft Games/Age of Empires II/SaveGame/"

#systemAoe2Config=$systemWinePrefixes/aoe2/drive_c/Program Files/Microsoft Games/Age of Empires II/player.nfp
#systemAoe2Campaign=$systemWinePrefixes/aoe2/drive_c/Program Files/Microsoft Games/Age of Empires II/Campaign/
#systemAoe2Scenario=$systemWinePrefixes/aoe2/drive_c/Program Files/Microsoft Games/Age of Empires II/Scenario/
#systemAoe2SaveGame=$systemWinePrefixes/aoe2/drive_c/Program Files/Microsoft Games/Age of Empires II/SaveGame/

# Age of Mythology
#
#    Paths:
#        Config file: /opt/games/wine-games/age-of-mythology/drive_c/Program Files (x86)/Microsoft Games/Age of Mythology Gold Edition/startup/*
#        Saved games: /opt/games/wine-games/age-of-mythology/drive_c/Program Files (x86)/Microsoft Games/Age of Mythology Gold Edition/savegame/*
#

userAomConfig="aom/drive_c/Program Files (x86)/Microsoft Games/Age of Mythology Gold Edition/startup/"
userAomSaveGame="aom/drive_c/Program Files (x86)/Microsoft Games/Age of Mythology Gold Edition/savegame/"

#systemAomConfig=$systemWinePrefixes/aom/drive_c/Program Files (x86)/Microsoft Games/Age of Mythology Gold Edition/startup/
#systemAomSaveGame=$systemWinePrefixes/aom/drive_c/Program Files (x86)/Microsoft Games/Age of Mythology Gold Edition/savegame/

#   Aliens versus Predator 2 & Primal Hunt
#
#    Paths:
#        Base game:
#        
#            Config file: /opt/games/wine-games/avp2/drive_c/Program Files (x86)/Aliens vs. Predator 2/autoexec.cfg
#            Saved games: /opt/games/wine-games/avp2/drive_c/Program Files (x86)/Aliens vs. Predator 2/Save/*
#            Key bindings: /opt/games/wine-games/avp2/drive_c/Program Files (x86)/Aliens versus Predator 2/Profiles/(Default.prf, Player_0.txt)
#            
#        Expansion (Primal Hunt):
#        
#            Config file: /opt/games/wine-games/avp2/drive_c/Program Files (x86)/Aliens vs. Predator 2 - Primal Hunt/autoexec.cfg
#            Saved games: /opt/games/wine-games/avp2/drive_c/Program Files (x86)/Aliens vs. Predator 2 - Primal Hunt/Save/* 
#            Key bindings: /opt/games/wine-games/avp2/drive_c/Program Files (x86)/Aliens versus Predator 2 - Primal Hunt/Profiles/(Default.prf, Player_0.txt)
#        
#        # Folder for each player under /Save/ is Player_0,Player_1,2,3 etc...

userAvp2ConfigFile="avp2/drive_c/Program Files (x86)/Aliens vs. Predator 2/autoexec.cfg"
userAvp2Config="avp2/drive_c/Program Files (x86)/Aliens vs. Predator 2/"
userAvp2SaveGame="avp2/drive_c/Program Files (x86)/Aliens vs. Predator 2/Save/"
userAvp2KeyBinds="avp2/drive_c/Program Files (x86)/Aliens vs. Predator 2/Profiles/"

#systemAvp2Config=$systemWinePrefixes/avp2/drive_c/Program Files (x86)/Aliens vs. Predator 2/autoexec.cfg
#systemAvp2SaveGame=$systemWinePrefixes/avp2/drive_c/Program Files (x86)/Aliens vs. Predator 2/Save/
#systemAvp2KeyBinds=$systemWinePrefixes/avp2/drive_c/Program Files (x86)/Aliens vs. Predator 2/Profiles/

# Amid Evil

userAmidEvilSaveGame="amid-evil/drive_c/users/$targetUser/AppData/Local/AmidEvil/Saved/"

#systemAmidEvilSaveGame=$systemWinePrefixes/amid-evil/drive_c/users/lanlord/AppData/Local/AmidEvil/Saved/

#   Battlefield 2
#
#    Paths:
#        Config file: /opt/games/wine-games/battlefield-2/drive_c/users/mx/Documents/Battlefield 2/Profiles/*
#           Note: Many files are under Profiles/, with each profile being a four-digit number starting with 0001. Save all of them
#        

userBattlefield2Config="battlefield-2/drive_c/users/$targetUser/Documents/Battlefield 2/Profiles/"

#systemBattlefield2Config=$systemWinePrefixes/battlefield-2/drive_c/users/mx/Documents/Battlefield 2/Profiles/

# Battlefield 1942:
#
#    Paths:
#        Config file: /opt/games/wine-games/bf1942/drive_c/Program Files (x86)/EA Games/Battlefield 1942/Mods/bf1942/Settings/*
#        Config file (user-specific): /opt/games/wine-games/bf1942/drive_c/Program Files (x86)/EA Games/Battlefield 1942/Mods/bf1942/Settings/Profiles/<user-id>
#        Saved games: /opt/games/wine-games/bf1942/drive_c/Program Files (x86)/EA Games/Battlefield 1942/Mods/bf1942/save/<user-id>        

userBf1942Config="bf1942/drive_c/Program Files (x86)/EA Games/Battlefield 1942/Mods/bf1942/Settings/Profiles/"

#systemBf1942Config=$systemWinePrefixes/bf1942/drive_c/Program Files (x86)/EA Games/Battlefield 1942/Mods/bf1942/Settings/Profiles/

# Battlefield Vietnam

userBfvietnamSaveGame="bf-vietnam/drive_c/Program Files/Battlefield: Vietnam/Mods/BfVietnam/settings/Profiles/"

#systemBfvietnamSaveGame=$systemWinePrefixes/bf-vietnam/drive_c/Program%20Files/Battlefield:%20Vietnam/Mods/BfVietnam/settings/Profiles/

# Call of Duty
#
#    Paths:
#        Config files: /opt/games/wine-games/call-of-duty/drive_c/Program Files (x86)/Call of Duty/Main/*
##       config.cfg is for singleplayer, config_mp.cfg is for multiplayer
#        Saved games: /opt/games/wine-games/call-of-duty/drive_c/Program Files (x86)/Call of Duty/Main/save/*

userCodConfig="cod/drive_c/Program Files (x86)/Call of Duty/Main/"
userCodSaveGame="cod/drive_c/Program Files (x86)/Call of Duty/Main/save/"

#systemCodConfig=$systemWinePrefixes/cod/drive_c/Program Files (x86)/Call of Duty/Main/
#systemCodSaveGame=$systemWinePrefixes/cod/drive_c/Program Files (x86)/Call of Duty/Main/save/

# Call of Duty 2

userCod2SaveGame="cod2/drive_c/Program Files/Activision/Call of Duty 2/main/players/"

#systemCod2SaveGame=$systemWinePrefixes/cod2/drive_c/Program Files/Activision/Call of Duty 2/main/players/

# Call of Duty 4: Modern Warfare

userCod4SaveGame="cod4/drive_c/Program Files (x86)/Call of Duty 4 Modern Warfare - PC/players/profiles/"

#systemCod4SaveGame=$systemWinePrefixes/cod4/drive_c/Program Files (x86)/Call of Duty 4 Modern Warfare - PC/players/profiles/

# Call of Duty: World at War

userCodWawSaveGame="cod-waw/drive_c/users/$targetUser/AppData/Local/Activision/CoDWaW/players/profiles/"

#systemCodWawSaveGame=$systemWinePrefixes/cod-waw/drive_c/users/$targetUser/

# Command & Conquer: Tiberian Sun
#
#    Paths:
#        Config files: /opt/games/wine-games/cncnet/drive_c/Games/CnCNet/TiberianSun_Online/SUN.INI
#        Saved games: /opt/games/wine-games/cncnet/drive_c/Games/CnCNet/TiberianSun_Online/SAVE****.sav
#           #Note: SAVE****.sav indicates multiple digits of incremental values, the first saved game will be SAVE0001.sav, the second will be SAVE0002.sav, etc...
           
userCncnetConfig="cncnet/drive_c/Games/CnCNet/TiberianSun_Online/SUN.INI"
userCncnetSaveGame="cncnet/drive_c/Games/CnCNet/TiberianSun_Online/"
userCncnetSaveGameFiles="cncnet/drive_c/Games/CnCNet/TiberianSun_Online/*.sav"

#systemCncnetConfig=$systemWinePrefixes/cncnet/drive_c/Games/CnCNet/TiberianSun_Online/SUN.INI
#systemCncnetSaveGame=$systemWinePrefixes/cncnet/drive_c/Games/CnCNet/TiberianSun_Online/

# Command & Conquer 3: Tiberium Wars

userCnc3Config="command-and-conquer-3-tiberium-wars/drive_c/users/$targetUser/AppData/Roaming/Command and Conquer 3 Tiberium Wars/"
userCnc3SaveGame="command-and-conquer-3-tiberium-wars/drive_c/users/$targetUser/Saved Games/"

#systemCnc3Config=$systemWinePrefixes/command-and-conquer-3-tiberium-wars/drive_c/users/$targetUser/AppData/Roaming/Command and Conquer 3 Tiberium Wars/
#systemCnc3SaveGame=$systemWinePrefixes/command-and-conquer-3-tiberium-wars/drive_c/users/$targetUser/Saved Games/

# Command & Conquer: Red Alert 2

userCncRA2Config="ra2/drive_c/Westwood/RA2/"
userCncRA2ConfigFile="ra2/drive_c/Westwood/RA2/ra2.ini"
userCncRA2ConfigMdFile="ra2/drive_c/Westwood/RA2/ra2md.ini"

# Command & Conquer: Red Alert 3

userCncRA3Config="command-and-conquer-red-alert-3/drive_c/users/$targetUser/AppData/Roaming/Red Alert 3/"
userCncRA3SaveGame="command-and-conquer-red-alert-3/drive_c/users/$targetUser/Saved Games/Red Alert 3/"

#systemCncRA3Config=$systemWinePrefixes/command-and-conquer-red-alert-3/drive_c/users/$targetUser/AppData/Roaming/Red Alert 3/
#systemCncRA3SaveGame=$systemWinePrefixes/command-and-conquer-red-alert-3/drive_c/users/$targetUser/Saved Games/Red Alert 3/

# Command & Conquer: Red Alert 3: Uprising

userCncRA3UprisingConfig="command-and-conquer-red-alert-3/drive_c/users/$targetUser/AppData/Roaming/Red Alert 3 Uprising/"
userCncRA3UprisingSaveGame="command-and-conquer-red-alert-3/drive_c/users/$targetUser/Saved Games/Red Alert 3 Uprising/"

#systemCncRA3Config=$systemWinePrefixes/command-and-conquer-3-red-alert-3/drive_c/users/$targetUser/AppData/Roaming/Red Alert 3 Uprising/
#systemCncRA3SaveGame=$systemWinePrefixes/command-and-conquer-red-alert3/drive_c/users/$targetUser/Saved Games/Red Alert 3 Uprising

# Crysis

userCrysisSaveGame="crysis/drive_c/users/$targetUser/Documents/My Games/Crysis/"

#systemCrysisSaveGame=$systemWinePrefixes/crysis/drive_c/users/$targetUser/


# Diablo II & Lord of Destruction
#
#    Paths:
#        Config file: HKEY_CURRENT_USER\SOFTWARE\Blizzard Entertainment\Diablo II\
#            #Note: HKEY_CURRENT_USER indicates the configuration is stored as a Windows Registry key, use the Wine Registry tool to browse and modify
#        
#        Saved games: /opt/games/wine-games/diablo-2/drive_c/users/mx/Saved Games/Diablo II/*
#        saved games are characters created in the game, typically represented as four different files:  <character-name>.d2s, <character-name>.key, <character-name>.ma0, <character-name>.map. You need #all four to use the character and reload the save
#        
#   #Note: From PCGamingWiki: Battle.net Realm characters are stored in the cloud and are tied to your Battle.net account; however,
            # they are only accessible on the realm (server) on which they were #created (US-East, US-West, etc.). 
            # They are not playable in single-player, LAN, Open Battle.net, or direct-IP-connection online play. 
            # Realm characters expire after 90 days of inactivity; to reset the #inactivity timer, you will need to perform basic activity, 
            # such as buying or selling an item or killing a monster. In addition, newly created Realm characters expire after 10 days unless
            # they are played for #at least 2 hours during those 10 days. Open (non-Realm) characters are used for single-player, LAN, Open Battle.net, 
            # and direct-IP-connection online play; they are not playable on the Battle.net Realms. 
            # They are stored locally in the save folder in your DII installation folder. Note that there is no hack protection for Open characters ##

#$userDiablo2Config=/diablo-2/drive_c/users/mx/Saved Games/Diablo II/            
userDiablo2SaveGame="d2/drive_c/users/$targetUser/Saved Games/Diablo II/"

#systemDiablo2SaveGame=$systemWinePrefixes/d2/drive_c/users/mx/Saved Games/Diablo II/

# Deus Ex

userDeusExSaveGame="deus-ex/drive_c/GOG Games/Deus Ex GOTY/Save/"

#systemDeusExSaveGame=$systemWinePrefixes/deus-ex/drive_c/GOG Games/Deus Ex GOTY/Save/

# Dungeon Keeper (KeeperFX)
#
#    Paths:
#        Config file: /opt/games/wine-games/dungeon-keeper/drive_c/KeeperFX/keeperfx.cfg
#        Saved games: /opt/games/wine-games/dungeon-keeper/drive_c/KeeperFX/save/*

userDungeonKeeperConfig="dungeon-keeper/drive_c/KeeperFX/"
userDungeonKeeperConfigFile="dungeon-keeper/drive_c/KeeperFX/keeperfx.cfg"
userDungeonKeeperSaveGame="dungeon-keeper/drive_c/KeeperFX/save/"
userDungeonKeeperSaveGameFiles="dungeon-keeper/drive_c/KeeperFX/save/"

#systemDungeonKeeperConfig=$systemWinePrefixes/dungeon-keeper/drive_c/KeeperFX/keeperfx.cfg
#systemDungeonKeeperSaveGame=$systemWinePrefixes/dungeon-keeper/drive_c/KeeperFX/save/*

# Empire Earth

userEmpireEarthSaveGame="ee/drive_c/GOG Games/Empire Earth Gold Edition/Neo Empire Earth/Empire Earth - The Art of Conquest/Data/Saved Games/"

#systemEmpireEarthSaveGame=$systemWinePrefixes/ee/drive_c/GOG Games/Empire Earth Gold Edition/Neo Empire Earth/Empire Earth - The Art of Conquest/Data/Saved Games/

# Fallout 2

userFallout2SaveGame="fallout-2/drive_c/GOG Games/Fallout 2/data/SAVEGAME/"

#systemFallout2SaveGame=$sytemWinePrefixes/fallout-2/drive_c/GOG Games/Fallout 2/data/SAVEGAME/

# Fallout 3

userFallout3SaveGame="fallout-3/drive_c/users/$targetUser/Documents/My Games/Fallout3/"

#systemFallout3SaveGame=$systemWinePrefixes/fallout-3/drive_c/users/$targetUser/Documents/My Games/Fallout3/

# Fallout: New Vegas

userFalloutNVSaveGame="fallout-nv/drive_c/users/$targetUser/Documents/My Games/FalloutNV/"

#systemFalloutNVSaveGame=$systemWinePrefixes/fallout-nv/drive_c/users/$targetUser/Documents/My Games/FalloutNV/

# F.E.A.R.
#
#    Paths:
#        Config file: /opt/games/wine-games/fear/drive_c/users/Public/Documents/Monolith Productions/FEAR/settings.cfg
#        Saved games: /opt/games/wine-games/fear/drive_c/users/Public/Documents/Monolith Productions/FEAR/Save/Profile***/
#           #Note: Profile***/ are the folders that represent each profile created in the game, with each profile containg up to 10 save slots (represented by Save****.ini). 
                # Starting from 000, Profile #1 is #Profile000, Profile #2 is Profile001, etc...

#  ## From PCGamingWiki: F.E.A.R. has 10 save slots, plus 1 quicksave slot and 1 autosave slot. 
        #Additional save slots can be made by creating a new player profile. There is no ability to replay #completed levels other than loading a manual save. 
#       
#        
#

userFearConfig="fear/drive_c/users/$targetUser/Documents/Monolith Productions/FEAR/"
userFearConfigFile="fear/drive_c/users/$targetUser/Documents/Monolith Productions/FEAR/settings.cfg"
userFearSaveGame="fear/drive_c/users/$targetUser/Documents/Monolith Productions/FEAR/Save/"

#systemFearConfig=$systemWinePrefixes/fear/drive_c/users/Public/Documents/Monolith Productions/FEAR/settings.cfg
#systemFearSaveGame=$systemWinePrefixes/fear/drive_c/users/Public/Documents/Monolith Productions/FEAR/Save/

# FlatOut 2

userFlatout2SaveGame="flatout-2/drive_c/GOG Games/FlatOut 2/Savegame"

#systemFlatout2SaveGame=$systemWinePrefixes//flatout-2/drive_c/GOG Games/FlatOut 2/Savegame/

# Gears of War

userGoWSaveGame="drive_c/users/$targetUser/Documents/My Games/Gears of War for Windows/WarGame/"

#systemGoWSaveGame=$systemWinePrefixes/drive_c/users/$targetUser/Documents/My Games/Gears of War for Windows/WarGame/

# Grim Dawn

userGrimDawnSaveGame="drive_c/users/$targetUser/Documents/My Games/Grim Dawn/save/"

#systemGrimDawnSaveGame=$systemWinePrefixes/drive_c/users/$targetUser/Documents/My Games/Grim Dawn/save/

# Grand Theft Auto 2

userGta2SaveGame="gta2/drive_c/Program Files/Rockstar Games/GTA2/player/"

#systemGta2SaveGame=$systemWinePrefixes/gta2/drive_c/Program Files/Rockstar Games/GTA2/player/

# Halo: Combat Evolved (Trial)

userHaloSaveGame="halo/drive_c/users/$targetUser/Documents/My Games/Halo Trial/"

#systemHaloSaveGame=$systemWinePrefixes/halo/drive_c/users/$targetUser/Documents/My Games/Halo Trial/

# Halo 2

userHalo2SaveGame="halo-2/drive_c/users/$targetUser/AppData/Local/Microsoft/Halo 2/"

#systemHalo2SaveGame=$systemWinePrefixes/halo-2/drive_c/users/$targetUser/AppData/Local/Microsoft/Halo 2/

# Homeworld

userH1ClassicSaveGame="homeworld/drive_c/GOG Games/Homeworld Remastered/Homeworld1Classic/Data/SavedGames/"
userH2ClassicSaveGame="homeworld/drive_c/GOG Games/Homeworld Remastered/Homeworld2Classic/Bin/Profiles/"
userH1RMSaveGame="homeworld/drive_c/GOG Games/Homeworld Remastered/HomeworldRM/Bin/Profiles/"

#systemH1ClassicSaveGame=$systemWinePrefixes/homeworld/drive_c/GOG Games/Homeworld Remastered/Homeworld1Classic/Data/SavedGames/
#systemH2ClassicSaveGame=$systemWinePrefixes/homeworld/drive_c/GOG Games/Homeworld Remastered/Homeworld2Classic/Bin/Profiles/
#systemH1RMSaveGame=$systemWinePrefixes/homeworld/drive_c/GOG Games/Homeworld Remastered/HomeworldRM/Bin/Profiles/

# Icewind Dale

userIwdConfig="icewind-dale/drive_c/GOG Games/Icewind Dale Complete/"
userIwdConfigFile="icewind-dale/drive_c/GOG Games/Icewind Dale Complete/icewind.ini/"
userIwdKeymap="icewind-dale/drive_c/GOG Games/Icewind Dale Complete/Keymap.ini/"
userIwdSaveGame="icewind-dale/drive_c/GOG Games/Icewind Dale Complete/mpsave/"

#systemIwdConfig=$systemWinePrefixes/icewind-dale/drive_c/GOG Games/Icewind Dale Complete/icewind.ini/
#systemIwdKeymap=$systemWinePrefixes/icewind-dale/drive_c/GOG Games/Icewind Dale Complete/Keymap.ini/
#systemIwdSaveGame=$systemWinePrefixes/icewind-dale/drive_c/GOG Games/Icewind Dale Complete/mpsave/

#Icewind Dale 2

userIwd2Config="icewind-dale-2/drive_c/GOG Games/Icewind Dale 2/"
userIwd2ConfigFile="icewind-dale-2/drive_c/GOG Games/Icewind Dale 2/icewind2.ini/"
userIwd2Keymap="icewind-dale-2/drive_c/GOG Games/Icewind Dale 2/Keymap.ini/"
userIwd2SaveGame="icewind-dale-2/drive_c/GOG Games/Icewind Dale 2/mpsave/"

#systemIwd2Config=$systemWinePrefixes/icewind-dale-2/drive_c/GOG Games/Icewind Dale 2/icewind2.ini/
#systemIwd2Keymap=$systemWinePrefixes/icewind-dale-2/drive_c/GOG Games/Icewind Dale 2/Keymap.ini/
#systemIwd2SaveGame=$systemWinePrefixes/icewind-dale-2/drive_c/GOG Games/Icewind Dale 2/mpsave/

# IL-2 Sturmovik: 1946

userIl2ConfigFile="il-2-sturmovik-1946/drive_c/GOG Games/IL-2 Sturmovik 1946/conf.ini"
userIl2Config="il-2-sturmovik-1946/drive_c/GOG Games/IL-2 Sturmovik 1946/"
userIl2SaveGame="il-2-sturmovik-1946/drive_c/GOG Games/IL-2 Sturmovik 1946/Users/"

#systemIl2Config=$systemWinePrefixes/il-2-sturmovik-1946/drive_c/GOG Games/IL-2 Sturmovik 1946/conf.ini
#systemIl2SaveGame=$systemWinePrefixes/il-2-sturmovik-1946/drive_c/GOG Games/IL-2 Sturmovik 1946/Users/

# Midtown Madness

userMmSaveGame="mm/drive_c/Program Files(x86)/Midtown Madness/players/"

#systemMmSaveGame=$systemWinePrefixes/mm/drive_c/Program Files(x86)/Midtown Madness/players/

# Midtown Madness 2

userMm2SaveGame="mm2/drive_c/Program Files(x86)/Midtown Madness 2/players/"

#systemMm2SaveGame=$systemWinePrefixes/mm2/drive_c/Program Files(x86)/Midtown Madness 2/players/

# Medal of Honor: Allied Assault

userMohaaConfig="mohaa/drive_c/Games/MOHAA/main/"
userMohaaSaveGame="mohaa/drive_c/Games/MOHAA/main/save/"

#systemMohaaConfig=$systemWinePrefixes/mohaa/drive_c/Games/MOHAA/main/
#systemMohaaSaveGame=$systemWinePrefixes/mohaa/drive_c/Games/MOHAA/main/save/

# Neverwinter Nights

userNwnConfigFile="neverwinter-nights/drive_c/GOG Games/NWN Diamond/nwn.ini"
userNwnConfig="neverwinter-nights/drive_c/GOG Games/NWN Diamond/"
userNwnSaveGame="neverwinter-nights/drive_c/GOG Games/NWN Diamond/saves/"

#systemNwnConfig=$systemWinePrefixes/neverwinter-nights/drive_c/GOG Games/NWN Diamond/nwn.ini
#systemNwnSaveGame=$systemWinePrefixes/neverwinter-nights/drive_c/GOG Games/NWN Diamond/saves/

# The Elder Scrolls IV: Oblivion

userOblivionSaveGame="oblivion/drive_c/users/$targetUser/Documents/My Games/Oblivion/"

#systemOblivionSaveGame=/oblivion/drive_c/users/$targetUser/Documents/My Games/Oblivion/

# The Elder Scrolls V: Skyrim

userSkyrimSaveGame="skyrim/drive_c/users/$targetUser/Documents/My Games/Skyrim/"

# Rayman Origins

userRaymanOriginsSaveGame="rayman-origins/drive_c/users/$targetUser/Documents/My Games/Rayman Origins/Savegame/"

# Rise of Nations

userRonConfig="rise-of-nations/drive_c/users/$targetUser/AppData/Roaming/Microsoft Games/Rise of Nations/"
userRonSaveGame="rise-of-nations/drive_c/users/$targetUser/Documents/My Games/Rise of Nations/"

# SimCity 3000

userSC3000Configcfg="sc3000/drive_c/GOG Games/SimCity 3000 Unlimited/Apps/SC3.cfg"
userSC3000Configini="sc3000/drive_c/GOG Games/SimCity 3000 Unlimited/Apps/sc3.ini"
userSC3000SaveGame="sc3000/drive_c/GOG Games/SimCity 3000 Unlimited/Cities/"

# SimCity 4

userSC4SaveGame="sc4/drive_c/users/$targetUser/Documents/SimCity 4/"

# StarCraft

userStarcraftConfig="starcraft/drive_c/users/$targetUser/Documents/Starcraft/CSettings.json"
userStarcraftConfigFile="starcraft/drive_c/users/$targetUser/Documents/Starcraft/"
userStarcraftSaveGame="starcraft/drive_c/users/$targetUser/Documents/Starcraft/Characters/"

# Supreme Commander

userSupComSaveGame="supreme-commander/drive_c/users/$targetUser/AppData/Local/Gas Powered Games/SupremeCommander/"

# Star Wars: Battlefront

userBattlefrontSaveGame="sw-battlefront/drive_c/GOG Games/Star Wars - Battlefront/GameData/SaveGames/"

# Star Wars: Battlefront 2

userBattlefront2SaveGame="sw-battlefront-2/drive_c/GOG Games/Star Wars - Battlefront 2/GameData/SaveGames/"

# Star Wars: Galactic Battlegrounds

userGalacticBattlegroundsConfignfx="sw-gb/drive_c/GOG Games/Star Wars - Galactic Battlegrounds/Game/player.nfx"
userGalacticBattlegroundsConfignfl="sw-gb/drive_c/GOG Games/Star Wars - Galactic Battlegrounds/Game/player.nfl"
userGalacticBattlegroundsSaveGame="sw-gb/drive_c/GOG Games/Star Wars - Galactic Battlegrounds/Game/SaveGame"

# Star Wars: Knights of the Old Republic

userSWKotorConfigini="sw-kotor/drive_c/GOG Games/Star Wars - KotOR/swkotor.ini"
userSWKotorConfigini2="sw-kotor/drive_c/GOG Games/Star Wars - KotOR/swconfig.ini"
userSWKotorSaveGame="sw-kotor/drive_c/GOG Games/Star Wars - KotOR/saves/"

# System Shock 2
#         	<path-to-game>\*.cfg
userSS2Config="system-shock-2/drive_c/GOG Games/System Shock 2/cam.cfg"
#         	<path-to-game>\save_*
userSS2SaveGame="system-shock-2/drive_c/GOG Games/System Shock 2/save_*"

# 
#
# The Sims: Complete Edition
#    
#    Paths: 
#        /opt/games/wine-games/the-sims-complete/drive_c/Program Files/Maxis/The Sims/UserData*          
#    
#    # Saved games are in the form of neighborhoods, with each neighborhood being in the form of a folder named UserData, so UserData is neighborhood 1, UserData2 is neighborhood 2 etc...

userSimsSaveGame="the-sims-complete/drive_c/Program Files/Maxis/The Sims/"

#systemSimsSaveGame=$systemWinePrefixes/the-sims-complete/drive_c/Program Files/Maxis/The Sims/

# Thief: Gold

userThiefConfig="thief/drive_c/GOG Games/Thief Gold/cam.cfg"
userThiefKeymap="thief/drive_c/GOG Games/Thief Gold/user.bnd"
userThiefSaveGame="thief/drive_c/GOG Games/Thief Gold/SAVES/"

# Tony Hawk's Underground 2

userTHUG2SaveGame="thug2/drive_c/Program Files/Activision/Tony Hawk's Underground 2/Game/Save/"

# THUG2 Pro

userTHUG2ProSaveGame="thug2/drive_c/Program Files/Activision/THUG Pro/Save/"

# Warcraft II: Battle.net Edition

userWarcraft2SaveGame="warcraft2/drive_c/GOG Games/Warcraft II BNE/Save/"

# World in Conflict

userWocSaveGame="world-in-conflict/drive_c/users/$targetUser/Documents/World in Conflict/"