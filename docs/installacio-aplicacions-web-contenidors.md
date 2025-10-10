# **Instal·lació d’aplicacions web en contenidors LXD (Ubuntu 24.04)**

## 1. Creació del contenidor

```bash
lxc launch ubuntu:24.04 elmeucontenidor
```

> **Consell:** Utilitza un nom descriptiu (ex: `grup-usuari-servei`) per facilitar la identificació.

## 2. Gestió bàsica del contenidor

- **Engegar (si està aturat):**
  ```bash
  lxc start elmeucontenidor
  ```

- **Accedir al contenidor:**
  ```bash
  lxc exec elmeucontenidor -- bash
  ```

- **Veure l’estat i la IP del contenidor:**
  ```bash
  lxc list
  ```

## 3. Instal·lació del *stack* LAMP (Linux, Apache, MySQL, PHP)

Dins del contenidor (`lxc exec elmeucontenidor -- bash`):

```bash
apt update && apt upgrade -y
apt install -y apache2 mysql-server php php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-ldap php-zip php-curl
```

> **Nota:** Ubuntu 24.04 utilitza **PHP 8.3** per defecte.

## 4. Configuració d’Apache per a PHP-FPM

```bash
a2enmod proxy_fcgi
a2enconf php8.3-fpm  # Ajusta la versió si cal (normalment és 8.3 a Ubuntu 24.04)
systemctl restart apache2
```

## 5. Configuració de MySQL

### Accedeix a MySQL com a root:
```bash
mysql -u root
```

### Crea una base de dades i un usuari (ex: per WordPress):
```sql
CREATE DATABASE lamevabasededades;
CREATE USER 'elmeuusuari'@'localhost' IDENTIFIED BY 'elmeupassword';
GRANT ALL PRIVILEGES ON lamevabasededades.* TO 'elmeuusuari'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

> **Nota:** A Ubuntu 24.04, MySQL 8.0 utilitza autenticació `caching_sha2_password` per defecte. Si cal compatibilitat amb aplicacions antigues, pots usar:
> ```sql
> CREATE USER 'elmeuusuari'@'localhost' IDENTIFIED WITH mysql_native_password BY 'elmeupassword';
> ```

## 6. Sincronització de la carpeta web amb l’equip host

### Pas 1: Genera una clau SSH a l’host
```bash
ssh-keygen -f ~/.ssh/elmeucontenidor -N ""
```

### Pas 2: Copia la clau pública al contenidor
Mostra la clau:
```bash
cat ~/.ssh/elmeucontenidor.pub
```

Dins del contenidor, crea el fitxer d’autorització:
```bash
mkdir -p /root/.ssh
echo "LA_TEVA_CLAU_PÚBLICA_AQUÍ" >> /root/.ssh/authorized_keys
chmod 700 /root/.ssh
chmod 600 /root/.ssh/authorized_keys
```

### Pas 3: Munta la carpeta remota amb `sshfs`
A l’host:
```bash
mkdir -p ~/elmeucontenidor
# Substitueix la IP pel valor que et mostri `lxc list`
sshfs root@10.161.122.237:/var/www/html ~/elmeucontenidor
```

> Ara pots treballar amb els fitxers web des de la teva màquina host!


## 7. Desplegament de l’aplicació web (ex: WordPress)

### Des de l’host:
```bash
cp ~/Baixades/wordpress.tar.gz ~/elmeucontenidor/
cd ~/elmeucontenidor
tar -xzf wordpress.tar.gz --strip-components=1
```

### Assegura els permisos dins del contenidor:
```bash
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
```

> **Nota:** És recomanable que el propietari sigui `www-data`, no `root`.

### Accedeix des del navegador:
Obre `http://<IP_DEL_CONTENIDOR>` i segueix l’assistent d’instal·lació de WordPress.

## 8. Exportar i importar un contenidor

### Exportar el contenidor

1. **Atura el contenidor:**
   ```bash
   lxc stop elmeucontenidor
   ```

2. **Publica’l com a imatge:**
   ```bash
   lxc publish elmeucontenidor --alias elmeucontenidor-backup
   ```

3. **Exporta la imatge a fitxers:**
   ```bash
   lxc image export elmeucontenidor-backup .
   ```
   > Això genera dos fitxers:  
   > - `meta-*.tar.xz` (metadades)  
   > - `rootfs-*.tar.xz` (sistema de fitxers)

### Importar el contenidor en un altre host

1. **Importa la imatge:**
   ```bash
   lxc image import meta-*.tar.xz rootfs-*.tar.xz --alias elmeucontenidor-importat
   ```

2. **Crea un nou contenidor a partir de la imatge:**
   ```bash
   lxc launch elmeucontenidor-importat elmeucontenidor
   ```

> **Important:** Assegura’t que LXD estigui instal·lat i inicialitzat (`lxd init`) al sistema de destinació.

## 9. Recomanacions finals

- **Atura els contenidors quan no els facis servir:**
  ```bash
  lxc stop elmeucontenidor
  ```

- **Fes còpies de seguretat periòdiques** mitjançant `lxc publish` + `lxc image export`.

- **Evita executar serveis com a root** dins del contenidor sempre que sigui possible.
