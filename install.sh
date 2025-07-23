echo "This script is meant to be used of fresh empty arch installation!"
echo "Instaling in 3 seconds..."
sleep 3

echo "Updating packages..."
sudo pacman -Syu --noconfirm

echo "Instaling yay..."
sudo pacman -S --needed base-devel git --noconfirm
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/dotfiles

echo "Installing hyprland..."
sudo pacman -S hyprland --noconfirm

echo "Applying config..."
mv ~/dotfiles/install/hyprland.conf ~/.config/hypr/hyprland.conf

echo "Installing hyprpaper, waybar, wofi, wlogout..."
sudo pacman -S hyprpaper waybar wofi --noconfirm
yay -S wlogout --noconfirm

echo "Installing pulseaudio..."
sudo pacman -S pulseaudio --noconfirm