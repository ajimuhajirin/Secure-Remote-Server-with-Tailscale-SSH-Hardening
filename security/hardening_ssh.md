# 🔐 SSH Hardening

## Edit config

```bash
sudo nano /etc/ssh/sshd_config
```

## Ubah konfigurasi:

```bash
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
```

## Restart SSH

```bash
sudo systemctl restart ssh
```
