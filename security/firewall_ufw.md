# 🔥 Setup Firewall (UFW)

## Install

```bash
sudo apt update
sudo apt install ufw -y
```

## Allow SSH

```bash
sudo ufw allow OpenSSH
```

## Enable firewall

```bash
sudo ufw enable
```

## Status

```bash
sudo ufw status
```
