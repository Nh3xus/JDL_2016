#!/bin/bash

MOZ_DIR=$(ls -d /home/$USER/.mozilla/firefox/*/ | grep -i default)

if pidof firefox > /dev/null; # Test if Firefox is already running
then
printf "Firefox is running !\nPlease close Firefox and run the script again !\n";
exit 0;
else 
	if [ -z ${MOZ_DIR+x} ]; # Test if the environment variable is set. Computer will EXPLODE otherwise :D
	then 
	printf "Firefox profile not found !\nProgram is halted !\nSystem destruction stopped !\n"; 
	exit 0;
	else 
	echo "Installing nfs-common package";
	sleep 1;
	sudo apt-get update;
	sudo apt-get -y install nfs-common;
	sudo ldconfig;
	sleep 1;
	echo "Firefox profile found at : '$MOZ_DIR'";
	sleep 1;
	echo "Deleting stock profile.";
	sleep 1;
	rm -rf $MOZ_DIR*;
	echo "Stock profile deleted successfully.";
	sleep 1;
	echo "Mounting NFS Share";
	sleep 1;
	mkdir $HOME/NFS_TEMP;
	sudo mount -t nfs 192.168.20.254:/pxe $HOME/NFS_TEMP;
	echo "Transferring custom Firefox profile...";
	sleep 1;
	cp -R  $HOME/NFS_TEMP/JDL/Firefox/* $MOZ_DIR;
	chown -R $USER:$USER $MOZ_DIR*;
	printf "Done.\n";
	sleep 1;
	echo "Transferring LibreOffice templates...";
	sleep 1;
	cp -R  $HOME/NFS_TEMP/JDL/LibreOffice/* "$HOME/Modèles";
	chown -R $USER:$USER "$HOME/Modèles";
	printf "Done.\nUnmounting NFS Share.\n";
	sleep 1;
	sudo umount $HOME/NFS_TEMP;
	rmdir $HOME/NFS_TEMP;
	printf "Profile migration complete.\nRun Firefox to test the new profile.\n";
	sleep 1;
	echo "Merging host file.";
	sleep 1;
	su - -c 'cp /etc/hosts /etc/hosts.bak';
	wget https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts -O /tmp/liste.txt;
	sed -i".bak" '1,43d' /tmp/liste.txt;
	su - -c 'cat /tmp/liste.txt >> /etc/hosts && rm /tmp/liste.*';
	echo "Host file merged.";
	fi
fi
exit 0
