#!/bin/bash

#Check if Jamf is installed
jamf_installed=$(which jamf)
echo $jamf_installed
if [[ $jamf_installed == "" ]]; then
	echo "Jamf is not installed. Exiting" #Exits if Jamf is not installed
	exit
else
	echo "Jamf is installed, continuing"
fi
	options=("Inventory" "Policy Check" "Update Config Profiles" "Quit")
	select opt in "${options[@]}"
  do
    case $opt in
        "Inventory")
            echo "Running Enrollment"
            sudo proflies -renew type enrollment f
            ;;
        "Policy Check-in")
            echo "Running Policy Check-in"
            sudo jamf policy
            ;;
        "Pull Latest Configuration Profiles")
            echo "Pulling Latest Configs"
            sudo jamf manage
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
fi

