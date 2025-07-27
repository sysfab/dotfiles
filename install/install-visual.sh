echo "Please wait..."
sleep 1

echo "Installing pipewire..."
sudo pacman -S pipewire pipewire-pulse pipewire-alsa wireplumber --noconfirm
systemctl --user enable pipewire.socket pipewire-pulse.socket wireplumber.service

echo "Installing pavucontrol..."
sudo pacman -S pavucontrol --noconfirm

echo "Installing hyprpaper, waybar, wofi, hyprshot, wlogout, swaync..."
sudo pacman -S hyprpaper waybar wofi hyprshot swaync --noconfirm
yay -S wlogout --noconfirm

echo "Installing appimagelauncher..."
yay -S appimagelauncher --noconfirm

echo "Installing xdg-desktop-portal, xdg-desktop-portal-hyprland..."
sudo pacman -S xdg-desktop-portal --noconfirm
sudo pacman -S xdg-desktop-portal-hyprland --noconfirm

echo "Installing apps..."
sudo pacman -S nautilus --noconfirm
yay -S nautilus-open-any-terminal --noconfirm
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty
xdg-mime default org.gnome.Nautilus.desktop inode/directory application/x-gnome-saved-search
yay -S google-chrome --noconfirm

echo "Installing scrcpy..."
sudo pacman -S scrcpy --noconfirm

echo "Configuring hyprland monitors..."
bash $HOME/dotfiles/install/create_monitors_config.sh

echo "Configuring hyprpaper..."
bash $HOME/dotfiles/install/create_hyprpaper_config.sh

echo "Setting up hyprland start on login..."
sudo systemctl set-default multi-user.target
sudo mv $HOME/dotfiles/install/.bash_profile $HOME/.bash_profile

echo "Applying default config..."
mv $HOME/dotfiles/install/hyprland-final.conf $HOME/.config/hypr/hyprland.conf

echo "Done! Restarting..."
sudo shutdown -r now
