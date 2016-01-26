#!/bin/bash
#Time Recording Script 
#Proudy written fully in Vim by Victor Moreno (AKA Merkury)

if [ -z "$1" ]
then
	echo "Missing parameter"
	exit
fi

case "$1" in
	-s) echo "In what amazing thing are you gonna work now Viktor?"
	    read ticketNumber
	;;
	#TODO Add a read on the last line to check if is a closure of a task
	-e) echo "Wow! Another ticket finished?? Tell me the code to account for it!"
	    read ticketNumber
	;;
	*) echo "Action not implemented yet..."
	;;
esac

case "$1" in
	-s) ACTION=--Starting--
	    echo "Starting recording for task $ticketNumber"
	;;
	-e) echo "Ending recording for task $ticketNumber"
	    ACTION=--End--
	;;
        *) echo "Action not implemented yet..."
	;;
esac

#Check if we have the directory structure ready for our time log.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ ! -d $DIR/logs/ ]
then
	mkdir $DIR/logs/ && date "+%d-%m-%y %H:%M:%S" >> $DIR/logs/hours.log
else
	date "+%d-%m-%y %H:%M:%S" >> $DIR/logs/hours.log 
fi

echo $ACTION >> $DIR/logs/hours.log && echo $ticketNumber >> $DIR/logs/hours.log 

if [ $1 == "-e" ]
then
	echo "################" >> $DIR/logs/hours.log
fi

echo "Action recorded"
