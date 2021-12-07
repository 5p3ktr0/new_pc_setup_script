#!/bin/bash


#check if the user is root
if [ "$EUID" -ne 0 ]
then	
	echo -e "\n You need to be root user or run with sudo \n" 
	exit
else
	echo -e "\n You have proper permissions, continue\n"
fi

echo -e "\n [+] Downloading tmux, vim, python3, pip3, zsh,  and net-tools"
apt install tmux xsel vim python3 python3-pip net-tools zsh -y

echo -e "\n [+] Changing shell to zsh as default shell for all users"
for i in `getent passwd {1000..6000} | cut -d ":" -f1`
do
	echo $i
	usermod -s /usr/bin/zsh $i
	cp ./zshrc /home/$i/.zshrc
done
chsh -s /usr/bin/zsh
mv ./zshrc ~/.zshrc
echo -e "\n [+] Downloading Tmux Plugin Manager and tmux.conf file."
git clone https://github.com/tmux-plugins/tpm /etc/tmux/plugins/tpm
mv ./tmux.conf /etc/
echo -e "\n [*] Tmux configuration completed. Bind key is now <C-a>. Install plugins using bind+I"

echo -e "\n [+] Setting up vimrc file"
mv ./vimrc /etc/vim/vimrc.local

echo -e "\n Finished setting up configuration. For all changes to apply you must reset the pc. Do you want to proceed? (y/n)"
read answer_reboot

if [ $answer_reboot == "y" ]
then
	reboot
else
	echo -e "\n [+]Finished configuration. User will reboot manually."
	exit
fi








