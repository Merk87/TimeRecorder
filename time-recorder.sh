#!/bin/bash
#Time Recording Script 
#Proudy written fully in Vim by Victor Moreno (AKA Merkury)

if [ -z "$1" ]
then
	echo "Missing paramter"
	exit
fi

echo "In what amazing thing are you working today Victor?"
read ticketNumber

case "$1" in
	-s) ACTION=--Starting--
	    echo "Starting recording for task $ticketNumber"
	;;
	-e) echo "Ending recording for task $ticketNumber"
	    ACTION =--End--
	;;
        *) echo "Action not implemented yet..."
	;;
esac

#Check if we have the directory structure ready for our time log.
if [ ! -d logs/ ]
then
	mkdir logs/ && date "+%d-%m-%y %H:%M:%S" >> logs/hours.log && echo "#################" >> logs/hours.log
else
	date "+%d-%m-%y %H:%M:%S" >> logs/hours.log && echo "################" >> logs/hours.log
fi

echo $ACTION >> logs/hours.log && echo $ticketNumber >> logs/hours.log && echo "################" >> logs/hours.log
echo "Action recorded"
