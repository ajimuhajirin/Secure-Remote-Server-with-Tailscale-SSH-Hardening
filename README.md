![Linux](https://img.shields.io/badge/Linux-Debian-blue)
![Security](https://img.shields.io/badge/Security-Hardening-red)
![VPN](https://img.shields.io/badge/VPN-Tailscale-green)
![License](https://img.shields.io/badge/License-MIT-yellow)

# 🔐 Secure Remote Server with Tailscale & SSH Hardening

> Securely access your Linux server without exposing it to the public internet using a zero-trust VPN approach.

---

## 🚀 Installation Options

### 🟢 Basic Setup

```bash
chmod +x scripts/install_basic.sh
./scripts/install_basic.sh
```

### 💀 Full Setup (Recommended)

```bash
chmod +x scripts/install_full.sh
sudo ./scripts/install_full.sh
```

---

## 🚀 Features

* 🔐 Secure SSH configuration (no password login)
* 🌐 Remote access without port forwarding (Tailscale VPN)
* 🔥 Firewall protection using UFW
* 🛡 Brute-force protection using Fail2Ban
* 🚑 Troubleshooting common server issues

---

## 📂 Project Structure

```
scripts/
  ├── install_basic.sh
  └── install_full.sh

setup/
  ├── install_tailscale.md
  ├── setup_ssh.md
  └── ssh_config_example

security/
  ├── hardening_ssh.md
  ├── firewall_ufw.md
  └── fail2ban_setup.md

troubleshooting/
  ├── common_errors.md
  └── locale_fix.md
```

---

## 🔒 Security Checklist

* [x] Disable root login
* [x] Disable password authentication
* [x] Enable UFW firewall
* [x] Install Fail2Ban
* [x] Use private VPN (Tailscale)

---

## ⚡ Quick Start

```bash
chmod +x scripts/install_full.sh
sudo ./scripts/install_full.sh
```

---

## 🛠️ Tech Stack

* Linux (Debian)
* SSH
* Tailscale VPN
* UFW Firewall
* Fail2Ban

---

## 🎯 Use Case

* Secure home server without exposing ports
* Access VPS privately using Tailscale
* Protect SSH from brute-force attacks
* Build zero-trust remote infrastructure

---

## 🧠 Author

**Muhajirin Saad**

---

## 📜 License

This project is open-source and available under the MIT License.
