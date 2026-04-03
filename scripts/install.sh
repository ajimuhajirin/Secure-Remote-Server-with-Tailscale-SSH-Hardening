#!/bin/bash

# ==================================================
# 🔥 Secure Remote Server - GOD LEVEL SETUP
# Author: Muhajirin Saad
# ==================================================

set -e

echo "🚀 Starting GOD LEVEL server setup..."

# ===============================
# UPDATE SYSTEM
# ===============================
echo "📦 Updating system..."
sudo apt update && sudo apt upgrade -y

# ===============================
# INSTALL CORE PACKAGES
# ===============================
echo "🛠 Installing core packages..."
sudo apt install -y \
  curl wget git ufw fail2ban nginx \
  htop net-tools ca-certificates gnupg lsb-release

# ===============================
# INSTALL TAILSCALE (PRIVATE VPN)
# ===============================
echo "🔐 Installing Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh

echo "👉 After install run:"
echo "sudo tailscale up"

# ===============================
# FIREWALL SETUP (UFW)
# ===============================
echo "🔥 Configuring firewall..."

sudo ufw default deny incoming
sudo ufw default allow outgoing

sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

sudo ufw --force enable

# ===============================
# FAIL2BAN (ANTI BRUTE FORCE)
# ===============================
echo "🛡 Setting up Fail2Ban..."

sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# ===============================
# SSH HARDENING
# ===============================
echo "🔒 Hardening SSH..."

SSH_CONFIG="/etc/ssh/sshd_config"

sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' $SSH_CONFIG
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' $SSH_CONFIG

sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' $SSH_CONFIG
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' $SSH_CONFIG

sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' $SSH_CONFIG

sudo systemctl restart ssh

# ===============================
# NGINX SETUP
# ===============================
echo "🌐 Setting up Nginx..."

sudo systemctl enable nginx
sudo systemctl start nginx

# Basic web page
echo "<h1>🔥 Server Secure by Muhajirin Saad</h1>" | sudo tee /var/www/html/index.html

# ===============================
# INSTALL DOCKER
# ===============================
echo "🐳 Installing Docker..."

curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER

# ===============================
# INSTALL DOCKER COMPOSE
# ===============================
echo "📦 Installing Docker Compose..."

sudo apt install -y docker-compose

# ===============================
# ENABLE AUTO SECURITY UPDATES
# ===============================
echo "🔄 Enabling auto security updates..."

sudo apt install -y unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades

# ===============================
# SYSTEM INFO
# ===============================
echo "📊 System info:"
hostname -I
uname -a

# ===============================
# DONE
# ===============================
echo ""
echo "✅ GOD LEVEL SETUP COMPLETE!"
echo ""
echo "📌 NEXT STEPS:"
echo "1. Run: sudo tailscale up"
echo "2. Re-login to activate Docker group"
echo "3. Deploy your app 🚀"
echo ""
echo "💼 Portfolio Ready!"
