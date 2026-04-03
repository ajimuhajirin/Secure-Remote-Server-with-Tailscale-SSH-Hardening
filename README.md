![Linux](https://img.shields.io/badge/Linux-Debian-blue)
![Security](https://img.shields.io/badge/Security-Hardening-red)
![VPN](https://img.shields.io/badge/VPN-Tailscale-green)
![License](https://img.shields.io/badge/License-MIT-yellow)


# 🔐 Secure-Remote-Server-with-Tailscale-SSH-Hardening
This project demonstrates how to securely access a remote Linux server without exposing it to the public internet using a modern zero-trust VPN.

<img width="183" height="224" alt="Screenshot 2026-04-03 at 16 33 18" src="https://github.com/user-attachments/assets/b69c7758-2cc4-4d88-a206-94f108c12d57" />

## 🚀 Features
- Secure SSH configuration
- Remote access without port forwarding (Tailscale VPN)
- Firewall protection using UFW
- Brute force protection using Fail2Ban
- Troubleshooting common server issues

## 📂 Project Structure
<img width="215" height="289" alt="Screenshot 2026-04-03 at 16 37 19" src="https://github.com/user-attachments/assets/f2d2eac0-fa33-401b-87e7-19206dfcc55f" />

# 🔒 Security Checklist

- [x] Disable root login
- [x] Disable password authentication
- [x] Enable UFW firewall
- [x] Install Fail2Ban
- [x] Use private VPN (Tailscale)

## ⚡ Quick Start

```bash
bash scripts/install.sh

🛠️ Tech Stack
Linux (Debian/Ubuntu)
SSH
Tailscale VPN
UFW Firewall
Fail2Ban

🧠 Author
Muhajirin Saad

## 🎯 Use Case

- Secure home server without exposing ports
- Access VPS privately using Tailscale
- Protect SSH from brute-force attacks
- Build zero-trust remote infrastructure
