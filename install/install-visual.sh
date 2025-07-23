echo "Please wait..."
sleep 1

echo "Installing pulseaudio..."
sudo pacman -S pulseaudio --noconfirm

echo "Installing hyprpaper, waybar, wofi, hyprshot, wlogout..."
sudo pacman -S hyprpaper waybar wofi hyprshot --noconfirm
yay -S wlogout --noconfirm

echo "Installing apps..."
sudo pacman -S nautilus --noconfirm
yay -S nautilus-open-any-terminal --noconfirm
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty
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