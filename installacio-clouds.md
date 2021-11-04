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
