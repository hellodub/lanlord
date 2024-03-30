#!/bin/bash

#sleep 4

#############################################################################
### Get network connection device, hostname and local domain of machine
#############################################################################
ipAddress=$(hostname -I)
hostname=$(hostname)
networkDevice=$(nmcli connection show | awk 'NR==2 {print  $6}') # use nmcli to print list of network devices
localDomain=$(nmcli dev show $networkDevice | grep IP4.DOMAIN | awk '{print $2}') # use nmcli to print domain name of machine 

FILE=/usr/share/games/local/desktop-settings/game-info-popup/gamelist.txt

#Use zenity to display a GUI with button options
rc=1 # Ok button return code =0, all other =1
while [ $rc -eq 1 ]; do
    ans=$(zenity --info --title="Fantastic Games and Where to Find Them" --text="To find and play games, click the folder on the desktop labeled \"Games\" \nor start Lutris to browse and launch games.\n\n You can also click the LM menu and begin typing a game name or \nmouse over to the \"Games\" submenu to see the entire list of available games.\n\n <b>Have fun!</b> \n\n <i>Hostname</i>: <b>$hostname.$localDomain</b> \t\t <i>Local IP Address</i>: <b>$ipAddress</b>" --width 500 --extra-button GameList --ok-label Quit)

    rc=$?					# weird ass code found on stackoverflow, kind of understand what it does?
    echo "${rc}-${ans}"				# (it's for control of the button on the zenity dialog box)
    echo $ans
    if [[ $ans = "GameList" ]]
    then
        zenity  --text-info \
                --title="GameList" \
                --filename=$FILE \
                --ok-label Back \
                ;
    fi
done
        
