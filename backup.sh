#!/bin/bash

THEDATE=`date +%Y%m%d-%H%M`

# minecraft sits in /var/minecraft

cd /var
tar cf minecraft-backups/minecraft.$THEDATE.game.tar minecraft --exclude=world
tar cf minecraft-backups/minecraft.$THEDATE.world.tar minecraft/world --exclude=*.png

# remove old backups, anything over a day old
find minecraft-backups -type f -mtime +1 -exec rm -f '{}' \;

