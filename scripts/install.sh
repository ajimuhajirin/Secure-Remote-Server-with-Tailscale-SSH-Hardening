#!/bin/bash

# ==========================================
# Secure Remote Server Setup Script
# Author: Muhajirin Saad Langsa
# ==========================================

set -e

echo "🚀 Starting server setup..."

# Update system
echo "📦 Updating system..."
sudo apt update && sudo apt upgrade -y

# Install basic tools
echo "🛠 Installing basic packages..."
sudo apt install -y curl wget git ufw fail2ban

# ==========================================
# Install Tailscale
# ==========================================
echo "🔐 Installing Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh

echo "👉 Run this after script:"
echo "sudo tailscale up"

# ==========================================
# Setup Firewall (UFW)
# ==========================================
echo "🔥 Configuring UFW firewall..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable

# ==========================================
# Setup Fail2Ban
# ==========================================
echo "🛡 Installing Fail2Ban..."
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# ==========================================
# Harden SSH (basic)
# ==========================================
echo "🔒 Hardening SSH..."

SSH_CONFIG="/etc/ssh/sshd_config"

sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' $SSH_CONFIG
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' $SSH_CONFIG

sudo systemctl restart ssh

# ==========================================
# Done
# ==========================================
echo "✅ Setup complete!"
echo "⚠️ IMPORTANT:"
echo "- Make sure SSH key is set before disabling password login!"
echo "- Run: sudo tailscale up"
