#!/bin/bash
SERV="/etc/startup/serviceinit.sh daemon"
LIST="$(ps aux)"
COUNT=$(grep -o "$SERV" <<< "$LIST" | wc -l)
if [ "$COUNT" -eq "0" ]
then
	${SERV} &
	echo "Starting services"
	/etc/startup/servicelist.sh
elif [ "$1" == "daemon" ]
then
	sleep infinity
fi
