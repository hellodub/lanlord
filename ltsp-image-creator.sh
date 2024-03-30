#!/bin/bash

ltsp image /home/lanlord/Linux-Mint-21.1-LAN-Edition,,/home,subdir=home,,/usr/share/games,subdir=/usr/share/games
ltsp ipxe
ltsp dnsmasq
#sudo ltsp nfs
ltsp initrd
