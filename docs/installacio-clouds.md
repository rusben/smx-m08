# Instal·lació i configuració de clouds

Per instal·lar una cloud hem de descarregar el seu codi i seguir el manual genèric d'instal·lació d'aplicacions.

En resum:

* Descarregar el codi font.
* Portar el codi de la cloud al directori arrel del servidor web.
* Descomprimir el contingut directament al directori arrel, en el nostre cas `/var/www/html`.
* Entrar a la web `http://localhost` amb el navegador i seguir les instruccions.

[Manual d'instal·lació d'aplicacions web](installacio-aplicacions-web.md)

## Enllaços a les diferents clouds
* ***OwnCloud***: http://www.owncloud.org
* ***Nextcloud***: http://www.nextcloud.com

## Heu de baixar el .zip de Nextcloud Server
https://download.nextcloud.com/server/releases/latest.zip

## Heu de baixar el .zip de ownCloud Server
https://download.owncloud.com/server/stable/owncloud-complete-20240724.zip

### Instal·lar la versió 7.4 de PHP a Ubuntu 24.04

Per a poder instal·lar ownCloud necessitarem la versió 7.4 de PHP, per a instal·lar-la al nostre sistema haurem de fer les següents comandes:

Actualitza les llistes de paquets i actualitza tots els paquets existents al vostre sistema. 

Instal·leu els requisits previs de PPA:
```bash
sudo apt install software-properties-common -y
```

Instal·la les eines necessàries per treballar amb els arxius de paquets personals (PPA).
```bash
LC_ALL=C.UTF-8 sudo add-apt-repository ppa:ondrej/php -y
```

Actualitza ara els repositoris:
```bash
sudo apt update
```

Instal·la les llibreries de PHP de la versió 7.4
```bash
sudo apt install php7.4 -y
```
```bash
sudo apt install -y php libapache2-mod-php7.4
```

```bash
sudo apt install -y php7.4-fpm php7.4-common php7.4-mbstring php7.4-xmlrpc php7.4-soap php7.4-gd php7.4-xml php7.4-intl php7.4-mysql php7.4-cli php7.4-ldap php7.4-zip php7.4-curl
```

Seleccioneu la versió de PHP que voleu:
```bash
sudo update-alternatives --config php
```

Activa els mòduls d'apache2 necessaris:
```bash
sudo a2enmod proxy_fcgi setenvif
```

```bash
sudo a2enconf php7.4-fpm
```

Reinicieu l'apache2:
```bash
sudo service apache2 restart
```