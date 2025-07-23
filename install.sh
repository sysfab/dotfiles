echo "This script is meant to be used on fresh empty arch installation!"
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
mkdir -p ~/.config/hypr
mv $HOME/dotfiles/install/hyprland-install.conf $HOME/.config/hypr/hyprland.conf

echo "Installing fonts..."
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra --noconfirm
sudo pacman -S otf-font-awesome --noconfirm

echo "Installing kitty..."
sudo pacman -S kitty --noconfirm

echo "Launching visual install..."
Hyprland