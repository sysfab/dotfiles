echo "Please wait..."
sleep 10

echo "Configuring hyprland monitors..."
bash $HOME/dotfiles/install/create_monitors_config.sh

echo "Configuring hyprpaper..."
bash $HOME/dotfiles/install/create_hyprpaper_config.sh

echo "Setting up hyprland start on login..."
sudo systemctl set-default multi-user.target
sudo mv $HOME/dotfiles/install/.bash-profile $HOME/.bash-profile

echo "Applying default config..."
mv $HOME/dotfiles/install/hyprland-final.conf $HOME/.config/hypr/hyprland.conf

echo "Done! Restarting..."
#sudo shutdown -r now