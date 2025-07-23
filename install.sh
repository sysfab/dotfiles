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
cd $HOME/dotfiles

echo "Installing hyprland..."
sudo pacman -S hyprland --noconfirm

echo "Applying config..."
mv $HOME/dotfiles/install/hyprland-install.conf $HOME/.config/hypr/hyprland.conf

echo "Installing hyprpaper, waybar, wofi, hyprshot, wlogout..."
sudo pacman -S hyprpaper waybar wofi hyprshot --noconfirm
yay -S wlogout --noconfirm

echo "Installing fonts..."
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra --noconfirm
sudo pacman -S otf-font-awesome --noconfirm

echo "Installing pulseaudio..."
sudo pacman -S pulseaudio --noconfirm

echo "Installing apps..."
sudo pacman -S kitty nautilus --noconfirm
yay -S google-chrome --noconfirm

echo "Installing scrcpy..."
sudo pacman -S scrcpy --noconfirm

echo "Installing coppwr..."
# yay -S coppwr --noconfirm

echo "Launching visual install..."
Hyprland