#!/bin/bash

# This adds the supernas.budnet to apt and installs the packages available in /all
#
# These games will be installed (mostly) under /usr/share/games (a notable exception is morrowind, it's up one directory in /usr/share/morrowind)

echo \
  "deb [trusted=yes] http://supernas.budnet/archive/Debian/all /" \
   | sudo tee /etc/apt/sources.list.d/budnet.list > /dev/null

# Install games

sudo apt install -y crispy-doom \
    doom-wad \
    doom2-wad \ 
    dhewm3 \
    dhewm3-d3xp \
    doom3-data \
    doom3-resurrection-data \
    doom-sigil-wad \
    doom-sigil-music \ 
    quake \
    quake-registered \
    quake-music \
    quake-armagon \ 
    quake-armagon-music \
    quake-dissolution \
    quake-dissolution-music \
    quake2 \
    quake2-full-data \
    quake2-music \
    quake3 \
    quake3-data \
    quake4-data \
    etqw \
    etqw-data \
    rtcw \
    rtcw-en-data \
    enemy-territory-data \
    arx-fatalis-en-data \
    curse-of-monkey-island-en-data \
    descent1-data \
    descent2-data \
    dayofthetentacle-en-data \
    dayofthetentacle-floppy-en-data \
    freespace2-data \
    freespace2-launcher-wxlauncher \
    freespace2-orig-video \
    full-throttle-data \
    grimfandango-en-data \ 
    i-have-no-mouth-and-i-must-scream-en-data \
    jazz-jackrabbit-hh95-data \
    jedi-academy-data \
    jedi-outcast-data \
    marathon1-data \
    marathon2-data \
    marathon3-data \
    monkey-island2-en-data \
    morrowind-complete-en-data \
    morrowind-complete-en-plugins \ 
    morrowind-complete-gog-extras \
    myst-masterpiece-data \
    myst3-en-data \
    planescape-torment-en-data \
    plutonia-wad \
    riven-dvd-data \ 
    rott \
    rott-registered-data \
    secret-of-monkey-island-en-data \
    spear-of-destiny-data \
    spear-of-destiny-mission1-data \
    spear-of-destiny-mission2-data \
    spear-of-destiny-mission3-data \
    system-shock-data \
    the-neverhood-data \
    theme-hospital-data \
    tnt-wad \
    tyrian-data \
    wolf3d-v14-id-data \
    xcom-ufo-defense-data

# Install system packages

sudo apt install -y xscreensaver \
    xscreensaver-gl \
    xscreensaver-gl-extra \
    steam
