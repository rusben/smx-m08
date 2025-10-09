# Instal·lació i configuració d’una aplicació web en un entorn LAMP amb VirtualHost

> **Nota:** Aquesta guia assumeix que ja tens configurat un virtual host d’Apache apuntant al directori `/var/www/domini.local`. Per tant, **tota la instal·lació de l’aplicació es farà dins d’aquest directori**, i l’accés es farà mitjançant `http://domini.local`.

## 1. Actualització del sistema

Abans de començar, actualitza el sistema:

```bash
sudo apt update && sudo apt upgrade -y
```

## 2. Instal·lació de la pila LAMP

### Servidor web (Apache)
```bash
sudo apt install -y apache2
```

### Base de dades (MySQL)
```bash
sudo apt install -y mysql-server
```

### PHP i extensions necessàries
```bash
sudo apt install -y php libapache2-mod-php php-fpm php-common php-mbstring \
php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-ldap \
php-zip php-curl
```

### Reinicia Apache per aplicar els canvis
```bash
sudo systemctl restart apache2
```

## 3. Configuració de MySQL

### Accés a la consola de MySQL
```bash
sudo mysql
```

### Creació de la base de dades
```sql
CREATE DATABASE bbdd;
```

### Creació de l’usuari local
```sql
CREATE USER 'usuario'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT ALL PRIVILEGES ON bbdd.* TO 'usuario'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

> **Nota:** Aquest usuari només pot connectar-se des del servidor local (`localhost`), cosa que és suficient si l’aplicació web i la base de dades estan al mateix servidor.

## 4. Desplegament de l’aplicació web

> **Important:** El nom del fitxer comprimit (per exemple, `app-web.zip`) **varia segons l’aplicació que hagis descarregat**. Has de substituir `app-web.zip` i el nom de la carpeta descomprimida (`app-web`) pels que corresponguin al teu cas concret (ex: `wordpress.zip`, `moodle.zip`, `myapp.tar.gz`, etc.).

### Pas 1: Copia del fitxer de l’aplicació al directori del virtual host

Suposant que el fitxer de l’aplicació es troba a la carpeta de baixades de l’usuari:

```bash
# Exemple genèric – adapta "nom-del-fitxer.zip" al teu fitxer real
sudo cp ~/Baixades/nom-del-fitxer.zip /var/www/domini.local/
```

### Pas 2: Descomprimir i preparar els fitxers

```bash
cd /var/www/domini.local

# Descomprimeix (adapta l’extensió si és .tar.gz, .tar.bz2, etc.)
sudo unzip nom-del-fitxer.zip
# o, si és un arxiu tar:
# sudo tar -xzf nom-del-fitxer.tar.gz

# Si la descompressió crea una subcarpeta (ex: "nom-del-fitxer"), copia el seu contingut a l’arrel
sudo cp -R nom-del-fitxer/. ./

# Elimina la carpeta temporal i l’arxiu comprimit
sudo rm -rf nom-del-fitxer/ nom-del-fitxer.zip
```

> **Consell:** Si no estàs segur del nom de la carpeta generada, fes `ls` després de descomprimir per veure l’estructura.

### Pas 3: Elimina contingut per defecte (si cal)

Si hi ha un fitxer `index.html` o similar creat per Apache:

```bash
sudo rm -f index.html
```

## 5. Configuració de permisos

Per garantir que Apache pugui llegir i, si cal, escriure fitxers:

```bash
cd /var/www/domini.local
sudo chown -R www-data:www-data .
sudo chmod -R 755 .

# Si l’aplicació requereix escriptura en carpetes concretes (ex: uploads, cache, logs):
# sudo chmod -R 775 uploads
# sudo chmod -R 775 wp-content  # (exemple per a WordPress)
```

> **Recomanació:** Evita `chmod 777`. Utilitza permisos mínims necessaris per a cada carpeta.

## 6. Verificació de la instal·lació

Obre un navegador i accedeix a:

```
http://domini.local
```

Hauries de veure l’instal·lador de l’aplicació web.

### Dades de connexió a la base de dades (valors per defecte segons aquesta guia):

- **Servidor de base de dades:** `localhost`
- **Nom de la base de dades:** `bbdd`
- **Usuari:** `usuario`
- **Contrasenya:** `password`

Completa la configuració segons les instruccions de l’instal·lador.

## (Opcional) Accés remot a MySQL

> **Només si és estrictament necessari.** Per defecte, MySQL només escolta a `127.0.0.1` per raons de seguretat.

### 1. Modifica el fitxer de configuració de MySQL:
```bash
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
```

Cerca la línia:
```ini
bind-address = 127.0.0.1
```

I canvia-la per:
```ini
bind-address = 0.0.0.0
```

### 2. Reinicia MySQL:
```bash
sudo systemctl restart mysql
```

### 3. Crea un usuari per a l’IP remota (ex: `192.168.22.100`):
```sql
CREATE USER 'usuario'@'192.168.22.100' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT ALL PRIVILEGES ON bbdd.* TO 'usuario'@'192.168.22.100';
FLUSH PRIVILEGES;
EXIT;
```

> **Advertència:** Habilitar l’accés remot incrementa els riscos de seguretat. Assegura’t de tenir un tallafocs actiu i d’utilitzar contrasenyes robustes.

## Resum final

- L’aplicació es desplega a `/var/www/domini.local`.
- El virtual host ja està configurat (no es toca Apache més enllà del reinici inicial).
- MySQL i PHP estan preparats per a funcionar amb l’aplicació.
- Els permisos s’han ajustat per a un funcionament segur.
- L’accés es fa via `http://domini.local`.
