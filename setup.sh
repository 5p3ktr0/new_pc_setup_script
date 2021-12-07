#!/bin/bash


#check if the user is root
#if [ "$EUID" -ne 0 ]
#then	
#	echo -e "\n You need to be root user or run with sudo \n" 
#	exit
#else
#	echo -e "\n You have proper permissions, continue\n"
#fi
#
#echo -e "\n [+] Downloading tmux, vim, python3, pip3, zsh,  and net-tools"
#apt install tmux vim python3 python3-pip net-tools zsh -y

echo -e "\n [+] Changing shell to zsh as default shell for all users"
for i in `getent passwd {1000..6000} | cut -d ":" -f1`
do
	echo $i
	usermod -s /usr/bin/zsh $i
done
chsh -s /usr/bin/zsh









