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

**Obre el port 80 al tallafocs (si està actiu):**
```bash
sudo ufw allow in "Apache Full"
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

**Executa la configuració de seguretat:**
```bash
sudo mysql_secure_installation
```

Durant aquest procés:
1. Et preguntarà si vols activar el **plugin de validació de contrasenya**. Pots dir **Sí** o **No** segons les teves necessitats.
2. **Estableix una contrasenya segura per a l’usuari root de MySQL**.
3. Respon **Sí** a la resta de preguntes per:
   - Eliminar usuaris anònims
   - Deshabilitar l’accés remot com a root
   - Eliminar la base de dades de prova
   - Recarregar les taules de privilegis

> 💡 **Nota important**: A diferència de MariaDB a Ubuntu, **MySQL requereix una contrasenya per a l’usuari root** després d’aquesta configuració. Assegura’t de recordar-la!

**Prova l’accés a MySQL:**
```bash
mysql -u root -p
```
Introdueix la contrasenya que has establert i hauries d’entrar a la consola de MySQL. Escriu `exit;` per sortir.

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
