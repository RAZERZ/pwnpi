# pwnpi
PwnPI, skip all the errors while installing PwnPI on your RPI3, just follow the README.
-----------------------------------------------------------------------------------------------------------------------------------
The `root_partition` is the small partition found on your sd card after flashing your pwnpi image. If you are unsure where to get this image, check the official website which you can check out @ http://pwnpi.sourceforge.net/.
-----------------------------------------------------------------------------------------------------------------------------------
FULL CREDITS TO THE PEOPLE @ PWNPI, I AM JUST MAKING IT EASIER FOR PEOPLE TO GET STARTED USING THEIR SOFTWARE AND LEARN!
-----------------------------------------------------------------------------------------------------------------------------------
The `home_partition` is the partition on your sdcard that contains the user files and is the largest one available. You don't need to edit anything there but I decided to keep the files here in case you need them ;).
-----------------------------------------------------------------------------------------------------------------------------------
I am working on an `install_script.sh` that will get you set up and working, all you have to do is flash the image, download the script, move it to your home partition and either `chmod +x install_script.sh && ./install_script.sh` or just directly `./install_script.sh`. Feedback on that is appreciated :).
-----------------------------------------------------------------------------------------------------------------------------------
How does this work?
If your pi won't boot (or even show activity light) after flashing the image, you haven't done anything wrong don't worry, it is because some system files either don't exist or are deprecated and won't be used therefore not allowing the system to even boot. One big thing here is that the installation does NOT include the raspberry pi bootloader, which if you know anything about computers is essential and is usually the first thing that runs when you start the pi (some devices have the radio framework that runs before, but usually it is the bootloader).
-----------------------------------------------------------------------------------------------------------------------------------
How do I fix that it won't boot or show acitvity light?
Step number 1, plug your sdcard into your desired computer running whatever operating system you like (I used Ubuntu 16.04 LTS, but any OS that can recognize an sdcard will work). If you are running windows, you will only see the fat16 partition or as I labeled it here, the root_partition. This is good because the files we need to copy need to arrive on this partition and not on the home_partition which isn't even recognized by windows (I don't really know about that, but when I tried with Windows 7 it only showed the fat16 partition and not the ext4 partition). If you're on linux you might get 2 file manager popups, don't worry, just close the home_partition (containing things like the directory `bin` or `boot`) and continue on.
Download the root_partition folder from this github #add how to

Step number 2, copy everything inside what you just downloaded to the root_partition. 

Step number 3, plug the sdcard back into the pi and start it.
-----------------------------------------------------------------------------------------------------------------------------------
If you get an error with fsck, using an external keyboard, type `fsck -r`, that should solve it, though, I am not sure if you need to be connected to the internet while you're doing this, I was connected using an ethernet cable but you can always try :)
