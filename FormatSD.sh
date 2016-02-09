#!/bin/bash

# SD Card formatter for HERL
# Created by Ben Guise
# This will format 2GB SD cards for use in the Vibration Data Logger
# For use on Mac OS X systems

clear

echo "SD Card formatting script"
echo "Created by Ben Guise 9 Oct 2013 for HERL,"
echo "Human Engineering Research Laboratories"

echo "I will now list connected drives."
echo 
diskutil list	#Lists the connected drives
echo

echo "Please enter the device number (i.e. /dev/diskN) that you would like to format:  " 
read DEVICENUM	# DEVICENUM stores the number of the device that we want to format

echo

echo "You want to format /dev/disk$DEVICENUM"  #Variable to store the path for the device we want to format

while true; do
	read -p "Last chance!  Format the card? ALL DATA WILL BE LOST!:  " yn
	case $yn in
		[Yy]* ) echo "Now formatting the card"; diskutil partitionDisk /dev/disk$DEVICENUM 1 MBRFormat "MS-DOS FAT16" "VDLCARD" 1.93G; exit;;
		[Nn]* ) echo "Okay, bye!"; exit;;
		* ) echo "Please answer yes or no.";;
	esac
done

