# 🔐 Setup SSH

## Step 1: Connect ke server

```bash
ssh user@IP_SERVER
```

## Step 2: Generate SSH Key (di lokal)

```bash
ssh-keygen
```

## Step 3: Copy key ke server

```bash
ssh-copy-id user@IP_SERVER
```

## Step 4: Test login

```bash
ssh user@IP_SERVER
```
