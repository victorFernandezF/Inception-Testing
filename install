# Instrucciones para Instalar Docker y Docker Compose en Lubuntu

## 1. Instala Docker (si no lo tienes ya instalado)

Primero, debes asegurarte de tener Docker instalado en tu sistema. Si no lo tienes, sigue estos pasos:

### 1.1 Actualiza los paquetes existentes:

```bash
sudo apt update
sudo apt upgrade
```

### 1.2 Instala los paquetes necesarios:

```bash
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

### 1.3 Añade la clave GPG de Docker:

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

### 1.4 Añade el repositorio oficial de Docker:

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

### 1.5 Instala Docker:

```bash
sudo apt update
sudo apt install docker-ce
```

### 1.6 Verifica que Docker está instalado correctamente:

```bash
sudo systemctl status docker
```

## 2. Instala Docker Compose

### 2.1 Descarga la versión más reciente de Docker Compose:

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d '"' -f 4)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

### 2.2 Aplica los permisos de ejecución:

```bash
sudo chmod +x /usr/local/bin/docker-compose
```

### 2.3 Verifica la instalación y la versión instalada:

```bash
docker-compose --version
```

## 3. (Opcional) Habilitar Docker para tu usuario

Si no quieres usar `sudo` cada vez que uses Docker, puedes agregar tu usuario al grupo de Docker:

```bash
sudo usermod -aG docker $USER
```

Después, cierra la sesión o reinicia el sistema para que los cambios surtan efecto.
