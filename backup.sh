#!/bin/bash

THEDATE=`date +%Y%m%d-%H%M`

# minecraft sits in /var/minecraft

cd /var
tar czpf minecraft-backups/minecraft.$THEDATE.game.tgz minecraft --exclude=world
tar czpf minecraft-backups/minecraft.$THEDATE.world.tgz minecraft/world

# remove old backups, anything over a day old
find minecraft-backups -type f -mtime +1 -exec rm -f '{}' \;

