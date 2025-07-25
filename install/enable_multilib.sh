#!/bin/bash

PACMAN_CONF="/etc/pacman.conf"

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root."
   exit 1
fi

echo "Checking for Multilib repository in $PACMAN_CONF..."

if grep -q "^\s*#\s*\[multilib\]" "$PACMAN_CONF"; then
    echo "Multilib repository found but commented out. Uncommenting..."
    sed -i 's/^#\[multilib\]/\[multilib\]/' "$PACMAN_CONF"
    sed -i '/^\[multilib\]/{n;s/^#//}' "$PACMAN_CONF"
    echo "Multilib repository uncommented."
elif grep -q "^\s*\[multilib\]" "$PACMAN_CONF"; then
    echo "Multilib repository is already enabled."
else
    echo "Multilib repository section not found. Adding it to $PACMAN_CONF..."
    echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> "$PACMAN_CONF"
    echo "Multilib repository section added."
fi

echo "Updating Pacman repositories..."
pacman -Sy

echo "Multilib has been enabled (or was already enabled) and Pacman repositories updated."
