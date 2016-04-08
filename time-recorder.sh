#!/bin/bash
#Time Recording Script 
#Proudy written fully in Vim by Victor Moreno (AKA Merkury)

if [ -z "$1" ]
then
	echo "Missing parameter"
	exit
fi

#TODO Add this awesome command!
#tail ./logs/hours.log -n $(grep $(date +"%d-%m") -n ./logs/hours.log | head -1 | egrep -o '^[0-9]+')
#Check if we have the directory structure ready for our time log.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

case "$1" in
	-s) echo "In what amazing thing are you gonna work now Viktor?"
	    read ticketNumber
	;;
	#TODO Add a read on the last line to check if is a closure of a task
	-e) echo "Wow! Another ticket finished?? Tell me the code to account for it!"
	    read ticketNumber
	;;
	-n) echo "Good morning Master, it is a new (probably rainy)  day in the Netherlands, enjoy it :)" && echo -e >> $DIR/logs/hours.log && echo -e >> $DIR/logs/hours.log
	    exit
	;;
        -log) echo -e "Here are the last hours :)" && tail -50 $DIR/logs/hours.log 
	    exit
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
