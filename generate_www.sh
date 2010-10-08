#!/bin/bash

cd /var/minecraft-scripts/

echo `grep -c "] logged in" /var/minecraft/server.log`-`grep -c " lost connection:" /var/minecraft/server.log` > usercount.txt

ONLINE=`cat usercount.txt | bc`
SERVER_NAME=`grep "server-name" /var/minecraft/server.properties | sed 's/^.*=//'`
LOAD=`uptime | sed "s/^.*: //"`

sed 's/%ONLINE%/'"$ONLINE"'/;s/%LOAD%/'"$LOAD"'/;s/%SERVER_NAME%/'"$SERVER_NAME"'/' index.html.template > /var/www/mumorpuger.com/index.html

rm -f usercount.txt

