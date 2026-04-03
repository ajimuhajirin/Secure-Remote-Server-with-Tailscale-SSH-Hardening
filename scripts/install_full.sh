#!/usr/bin/env bash

# ==================================================
# 🔥 Secure Remote Server - GOD LEVEL SETUP
# Author: Muhajirin Saad
# ==================================================

set -euo pipefail

# ===============================
# CHECK ROOT
# ===============================
if [[ $EUID -ne 0 ]]; then
  echo "❌ Please run as root: sudo ./install_full.sh"
  exit 1
fi

echo "🚀 Starting GOD LEVEL server setup..."

# ===============================
# UPDATE SYSTEM
# ===============================
echo "📦 Updating system..."
apt update && apt upgrade -y

# ===============================
# INSTALL CORE PACKAGES
# ===============================
echo "🛠 Installing core packages..."
apt install -y \
  curl wget git ufw fail2ban nginx \
  htop net-tools ca-certificates gnupg lsb-release

# ===============================
# INSTALL TAILSCALE
# ===============================
echo "🔐 Installing Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh

# ===============================
# FIREWALL SETUP (UFW)
# ===============================
echo "🔥 Configuring firewall..."

ufw default deny incoming
ufw default allow outgoing

ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp

ufw --force enable

# ===============================
# FAIL2BAN
# ===============================
echo "🛡 Setting up Fail2Ban..."

systemctl enable fail2ban
systemctl start fail2ban

# ===============================
# SSH HARDENING
# ===============================
echo "🔒 Hardening SSH..."

SSH_CONFIG="/etc/ssh/sshd_config"

cp "$SSH_CONFIG" "${SSH_CONFIG}.bak"

sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' "$SSH_CONFIG"
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' "$SSH_CONFIG"
sed -i 's/^#\?PubkeyAuthentication.*/PubkeyAuthentication yes/' "$SSH_CONFIG"

systemctl restart ssh

# ===============================
# NGINX SETUP
# ===============================
echo "🌐 Setting up Nginx..."

systemctl enable nginx
systemctl start nginx

echo "<h1>🔥 Server Secured by Muhajirin Saad</h1>" > /var/www/html/index.html

# ===============================
# INSTALL DOCKER
# ===============================
echo "🐳 Installing Docker..."

curl -fsSL https://get.docker.com | sh

# add current user to docker group (if exists)
if [[ -n "${SUDO_USER:-}" ]]; then
  usermod -aG docker "$SUDO_USER"
fi

# ===============================
# INSTALL DOCKER COMPOSE
# ===============================
echo "📦 Installing Docker Compose..."
apt install -y docker-compose

# ===============================
# AUTO SECURITY UPDATES
# ===============================
echo "🔄 Enabling auto security updates..."

apt install -y unattended-upgrades
dpkg-reconfigure -plow unattended-upgrades

# ===============================
# SYSTEM INFO
# ===============================
echo "📊 System info:"
hostname -I || true
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
