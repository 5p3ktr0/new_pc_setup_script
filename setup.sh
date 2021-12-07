#!/bin/bash

#check if the user is root
if [ "$EUID" -ne 0 ]
then	
	echo -e "\n You need to be root user or run with sudo \n" 
	exit
else
	echo -e "\n You have proper permissions, continue\n"
fi
echo -e "\n [+] Downloading tmux, vim, python3, pip3, and net-tools"
apt install tmux vim python3 python3-pip net-tools -y





