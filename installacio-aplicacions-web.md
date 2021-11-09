# Instal·lació i configuració d'aplicacions web

Per instal·lar una aplicació web hem de baixar el seu codi font i portar-lo al directori arrel del nostre servidor d'aplicacions, en el nostre cas, `apache2`. Quan instal·lem `apache2` es crea una carpeta a `/var/www/html` on, per defecte, el servidor web utilitza com a directori arrel.

Llavors, si portem la nostra aplicació al directori `/var/www/html` tindrem accés a la nostra aplicació mitjaçant l'adreça `http://localhost`.

## Instal·lació d'apache2, mysql i algunes llibreries al contenidor

Actualització de la màquina.
```console
apt update
apt upgrade
```

Instal·lació del servidor web `apache2`.
```console
apt install -y apache2
```

Instal·lació del servidor de bases de dades `mysql-server`.
```console
apt install -y mysql-server
```

Instal·lació d'algunes llibreries de `php`, el llenguatge principal que utilitzen les aplicacions.
```console
apt install php libapache2-mod-php
apt install php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-ldap php-zip php-curl
```

Reiniciem el servidor apache2
```console
systemctl restart apache2
```

## Configuració de MySQL
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

### Probem la connexió a la base de dades
```console
mysql -u usuario -p
```

### Permetre la connexió externa
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

## Aplicació de permisos a les nostres aplicacions web

Un cop descomprimits els fitxers de l'aplicació web al directori `/var/www/html`, apliquem els següents permisos al directori `/var/www/html`

```console
cd /var/www/html
chmod -R 775 .
chown -R root:www-data .
```
