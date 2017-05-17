#!/bin/bash
echo "Welcome to the pwnpi installation script coded by github user RAZERZ!"
echo "---------------------------------------------------------------------"
echo "################################################################"
echo "#               ## #                                           #"
echo "#               ## ##                                          #"
echo "# #######  ##   ## ###  ## #######  ###   #######      ####### #"
echo "#       ## ## # ## #### ##       ## ###        ##      ##   ## #"
echo "#  ######  ####### #######  ######  ###     #####      ##   ## #"
echo "#  ###     ### ### ### ###  ###     ###        ##   ## ##   ## #"
echo "#  ###     ##   ## ###  ##  ###     ###   #######   ## ####### #"
echo "#                        #                                     #"
echo "################################################################"
echo "---------------------------------------------------------------------"
echo "Starting by changing time and date, some commands won't function"
echo "without the correct time and date and the default time and date"
echo "is far from the current one"
echo "Make sure you are connected to the internet! I recommend using"
echo "an ethernet cable because good luck getting wifi to work right now"
echo "---------------------------------------------------------------------"
echo "Checking to see if user has an active internet connection..."

((count = 100))
while [[ $count -ne 0 ]] ; do
    ping -c 1 8.8.8.8
    rc=$?
    if [[ $rc -eq 0 ]] ; then
        ((count = 1))
    fi
    ((count = count - 1))
done

if [[ $rc -eq 0 ]] ; then
echo "---------------------------------------------------------------------"
echo "Success! Will now continue..."
else
    echo "Failed! Try with an ethernet cable. Will now exit"
exit
fi

echo "---------------------------------------------------------------------"
echo "Will now update time and date"
sudo date -s "$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z"
echo "Time recieved!"
echo "---------------------------------------------------------------------"
echo "Will now get the updater script to get the keyboard and mouse working"
echo "as well as updating some other files"
wget --no-check-certificate https://raw.github.com/Hexxeh/rpi-update/master/rpi-update
echo "---------------------------------------------------------------------"
echo "File recieved! Will now ship it off to /usr/bin"
mv rpi-update /usr/bin
echo "---------------------------------------------------------------------"
echo "Moved! Will now make it executable..."
chmod +x /usr/bin/rpi-update
echo "---------------------------------------------------------------------"
echo "Will now update the software..."
sudo apt-get update
echo "---------------------------------------------------------------------"
echo "Installing certificates..."
sudo apt-get install ca-certificates
echo "---------------------------------------------------------------------"
echo "Installing git-core..."
sudo apt-get install git-core
echo "---------------------------------------------------------------------"
echo "Running the rpi-update script, all of our work will now be complete!"
sudo rpi-update
echo "---------------------------------------------------------------------"
clear
echo "---------------------------------------------------------------------"
echo "Thanks for trying out my tool! Good luck with your newly flashed pwnpi"
echo "Sidenote, don't do anything using pwnpi that you would not want to happen"
echo "to you, hacking others for fun is ilegall and just unethical."
echo "---------------------------------------------------------------------"
echo "Will now reboot..."
reboot


