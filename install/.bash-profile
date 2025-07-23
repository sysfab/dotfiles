# ~/.bash_profile

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    MOZ_ENABLE_WAYLAND=1
    QT_QPA_PLATFORM=wayland
    GDK_BACKEND=wayland

    exec Hyprland
fi