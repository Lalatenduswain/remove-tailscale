#!/bin/bash

# Check if script is running with sudo privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo privileges"
    exit 1
fi

echo "This script will completely remove Tailscale from your Ubuntu system"
read -p "Are you sure you want to proceed? (y/N) " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborting removal process"
    exit 0
fi

# Stop Tailscale service
echo "Stopping Tailscale service..."
systemctl stop tailscaled 2>/dev/null || true

# Disable Tailscale service
echo "Disabling Tailscale service..."
systemctl disable tailscaled 2>/dev/null || true

# Remove Tailscale package
echo "Removing Tailscale package..."
apt-get remove -y tailscale 2>/dev/null || true
apt-get purge -y tailscale 2>/dev/null || true

# Remove Tailscale repository
echo "Removing Tailscale repository..."
rm -f /etc/apt/sources.list.d/tailscale.list
rm -f /usr/share/keyrings/tailscale-archive-keyring.gpg

# Remove Tailscale configuration and data
echo "Removing Tailscale configuration and data..."
rm -rf /var/lib/tailscale
rm -rf /etc/tailscale

# Update package lists
echo "Updating package lists..."
apt-get update

echo "Tailscale has been completely removed from your system"

# Ask about reinstallation
while true; do
    read -p "Would you like to reinstall Tailscale? (y/N) " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Reinstalling Tailscale..."
        # Install prerequisites
        apt-get update
        apt-get install -y curl
        
        # Add Tailscale's official installation method
        echo "Adding Tailscale repository..."
        curl -fsSL https://tailscale.com/install.sh | sh
        
        # Verify installation
        if command -v tailscale >/dev/null 2>&1; then
            echo "Tailscale has been successfully reinstalled"
            echo "To start using it, run: sudo tailscale up"
        else
            echo "Installation failed. Please try manual installation from https://tailscale.com/download"
        fi
        break
    elif [[ $REPLY =~ ^[Nn]$ || -z $REPLY ]]; then
        echo "Tailscale will remain uninstalled"
        break
    else
        echo "Please enter 'y' for yes or 'n' for no"
    fi
done

echo "Script completed"
exit 0
