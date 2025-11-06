# Instal·lació de LAMP stack a Ubuntu 24.04
Per instal·lar una pila LAMP (Linux, Apache, MySQL, PHP) a Ubuntu 24.04, segueix aquests passos detallats. Aquesta guia assumeix que comences amb un sistema net d’Ubuntu 24.04 i tens privilegis `sudo`.

### 1. **Actualitza el sistema**
```bash
sudo apt update && sudo apt upgrade -y
```

### 2. **Instal·la Apache**

```bash
sudo apt install apache2 -y
```

**Activa i inicia el servei:**
```bash
sudo systemctl enable apache2
sudo systemctl start apache2
```

**Verifica l’estat:**
```bash
sudo systemctl status apache2
```

Visita `http://localhost` per veure la pàgina per defecte d’Apache.

### 3. **Instal·la MySQL**

Ubuntu 24.04 ja inclou el paquet `mysql-server` als repositoris oficials (versió 8.0 o superior):

```bash
sudo apt install mysql-server mysql-client -y
```

**Inicia i habilita el servei:**
```bash
sudo systemctl enable mysql
sudo systemctl start mysql
```
**Configura de MySQL:**

#### Accés a la consola de MySQL
```bash
sudo mysql
```

#### Creació de la base de dades
```sql
CREATE DATABASE bbdd;
```

#### Creació de l’usuari local
```sql
CREATE USER 'usuario'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT ALL PRIVILEGES ON bbdd.* TO 'usuario'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

> **Nota:** Aquest usuari només pot connectar-se des del servidor local (`localhost`), cosa que és suficient si l’aplicació web i la base de dades estan al mateix servidor.

### 4. **Instal·la PHP i extensions comunes**

Ubuntu 24.04 inclou PHP 8.3 als repositoris estàndard:

```bash
sudo apt install php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-zip php-json php-cli -y
```

**Reinicia Apache per carregar PHP:**
```bash
sudo systemctl restart apache2
```

**Verifica la versió de PHP:**
```bash
php -v
```

**Crea un fitxer de prova:**
```bash
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
```

Visita `http://localhost/info.php` per veure la informació de PHP.

> 🔒 **Mesura de seguretat:** Un cop hagis verificat que funciona, elimina el fitxer:
> ```bash
> sudo rm /var/www/html/info.php
> ```

### Verificació final

La pila LAMP ara hauria d’estar operativa amb:
- **Apache** servint pàgines web.
- **MySQL** preparat per emmagatzemar dades.
- **PHP** processant scripts.
