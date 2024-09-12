# HOW TO INSTALL DOCKER AND DOCKER-COMPOSE IN LUBUNTO

## 1. Install Docker

### 1.1 update packages:

```bash
sudo apt update
sudo apt upgrade
```

### 1.2 Install packages:

```bash
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

### 1.3 Add Docker GPG Key:

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

### 1.4 Add Docker`s oficial repo:

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

### 1.5 Install Docker:

```bash
sudo apt update
sudo apt install docker-ce
```

### 1.6 Verify Docker installation:

```bash
sudo systemctl status docker
```

## 2. Install Docker-Compose

### 2.1 Download latest Docker Compose:

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d '"' -f 4)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

### 2.2 Add execution permission:

```bash
sudo chmod +x /usr/local/bin/docker-compose
```

### 2.3 Verify installation:

```bash
docker-compose --version
```

## 3. (Optional) Enable Docker for your user

if you dont want to use 'sudo' every time you use Docker.

```bash
sudo usermod -aG docker $USER
```

restart Lubuntu.
