#!/bin/bash

echo "🔐 Install Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh

echo "🚀 Start Tailscale..."
sudo tailscale up

echo "🔥 Install Firewall..."
sudo apt update
sudo apt install ufw -y
sudo ufw allow OpenSSH
sudo ufw enable

echo "🛡 Install Fail2Ban..."
sudo apt install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

echo "✅ Setup selesai!"
