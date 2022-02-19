cd $HOME

echo "This script will install and configure i3-gaps with custom configuration files ~ Working in ArchLinux\n"
echo "[*] ~ Installing i3-gaps"

pacman -Sy
pacman -S i3-gaps i3status

echo "[+] ~ Done \n"
echo "[*] ~ Installing extra software"

pacman -S ttf-fira-code alacritty lightdm lightdm-gtk-greeter vim

echo "[*] ~ Installing YAY"

mkdir aur
cd aur
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sri
cd $HOME

echo "[*] ~ Installing extra AUR software"

yay -Sy
yay -S polybar

echo "[*] ~ Configuring lightdm.service at boot"

systemctl enable lightdm.service
systemctl start lightdm.service

echo "[+] ~ Done \n"
echo "[*] ~ Cloning custom config files"

git clone https://github.com/lae-laps/dotfiles
cd dotfiles

echo "[+] ~ Done \n"
echo "[*] ~ Configuring i3"

mv i3/config $HOME/.config/i3/

echo "[+] ~ Done \n"
echo "[*] ~ Configuring alacritty"

mv alacritty.yml $HOME/.config/alacritty/

echo "[+] ~ Done \n"
echo "[*] ~ Configuring polybar"

chmod +x polybar/launch.sh
mv polybar/ $HOME/.config/polybar

echo "[*] ~ Configuring vim"

mv $HOME/.vimrc $HOME/.vimrc.bak
mv vimrc $HOME/.vimrc

echo "[+] ~ Done \n"
echo "[*] ~ Configuring bash"

mv $HOME/.bashrc $HOME/.bashrc.bak
mv bashrc $HOME/.bashrc

echo "[+] ~ Done \n"
echo "[#] ~ Finished all with no errors -> rebooting"

sleep 1
reboot
