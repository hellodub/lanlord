#!/bin/bash

targetDir=/home/lanlord/.config/lutris/games
#sourceDir=/home/lanlord/.config/lutris/games

sed 's+/usr/share/games/local+/usr/share/games/local/wine-prefixes+g' $targetDir/*.yml
#sed -i 's+/opt/games/linux-games+/usr/share/games/local+g' $targetDir/*.yml
