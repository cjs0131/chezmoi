#!/bin/bash

echo "=== Package Installer Script ==="
echo ""

echo "Select your package manager:"
echo "1) apt (Debian/Ubuntu)"
echo "2) dnf (Fedora/RHEL 9+)"
echo "3) pacman (Arch Linux)"
echo "4) zypper (openSUSE)"
echo "5) brew (macOS/WSL)"
read -p "Enter choice [1-5]: " choice

PACKAGES=(
    "fish"
    "fastfetch"
    "btop"
    "htop"
    "ranger"
    "starship"
    "chezmoi"
    "git"
    "curl"
    "wget"
    "vim"
    "neovim"
    "tmux"
)

install_apt() {
    sudo apt update
    sudo apt install -y "${PACKAGES[@]}"
}

install_dnf() {
    sudo dnf install -y "${PACKAGES[@]}"
}

install_pacman() {
    sudo pacman -Sy --noconfirm "${PACKAGES[@]}"
}

install_zypper() {
    sudo zypper install -y "${PACKAGES[@]}"
}

install_brew() {
    brew install "${PACKAGES[@]}"
}

case $choice in
    1) install_apt ;;
    2) install_dnf ;;
    3) install_pacman ;;
    4) install_zypper ;;
    5) install_brew ;;
    *) echo "Invalid choice" && exit 1 ;;
esac

echo ""
echo "Installation complete!"
