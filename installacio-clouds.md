# Instal·lació i configuració de clouds

## Instal·lar apache2, mysql i algunes llibreries al contenidor

```console
apt update
apt upgrade
apt install -y apache2
apt install -y mysql-server
apt install php libapache2-mod-php
apt install php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-ldap php-zip php-curl
```

## Reiniciem el servidor apache2
```console
systemctl restart apache2
```

# Configuració de MySQL

### Creació de la base de dades:
```console
CREATE DATABASE bbdd;
```

### Creació d'un usuari
Tingueu en compte que s'haurà d'identificar la IP des de la qual s'accedirà a la base de dades, en aquest cas, `localhost`.

```console
CREATE USER 'usuario'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```

Per accedir des d'una altra màquina, hauriem de crear un usuari nou:

```console
CREATE USER 'usuario'@'192.168.22.100' IDENTIFIED WITH mysql_native_password BY 'password';
```

### Donem privilegis a l'usuari:
```console
GRANT ALL ON bbdd.* to 'usuario'@'localhost';
```

Per accedir des de fora, hauriem de donar-li també privilegis a l'usuari a l'altra màquina:

```console
GRANT ALL ON bbdd.* to 'usuario'@'192.168.22.100';
```

### Sortim de la base de dades
```console
exit
```

### Connexió a la base de dades

```console
mysql -u usuario -p
```

## Permetre la connexió externa

Permetem l'accés des de qualsevol equip a la nostra base de dades.

```console
cat /etc/mysql/mysql.conf.d/mysqld.cnf | grep bind-address
bind-address        = 127.0.0.1
```

Hem de canviar bind-address per 0.0.0.0
```console
bind-address        = 0.0.0.0
```

### Reiniciem el servidor:
```console
systemctl restart mysql
```

## Enllaços a les diferents clouds
* OwnCloud: http://www.owncloud.org
* NextCloud: http://www.nextcloud.com

#### Un cop descomprimits els fitxers de la cloud, apliquem els següents permisos al directori `/var/www/html`
```console
chmod -R 775 .
chown -R root:www-data .
```
