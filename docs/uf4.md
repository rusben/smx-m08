# Tema 4 - Portals web d'aprenentatge

1. [Manual d'instal·lació d'aplicacions web](installacio-aplicacions-web.md)
2. [Configuració de VirtualHost amb apache2](configuracio-virtual-host-apache2.md)

## Descarregar Moodle
https://download.moodle.org/download.php/stable501/moodle-latest-501.zip

## Mysql a la versió 8.4
```bash
wget https://repo.mysql.com//mysql-apt-config_0.8.36-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.36-1_all.deb 
```

Durante la configuración selecciona MySQL Server & Cluster y asegúrate de elegir la serie mysql-8.4-lts. Después selecciona Ok y aceptar.

```bash
sudo apt-get update
sudo apt install mysql-server -y
```

## Pràctica
* [Enunciat de la pràctica de moodle](pt-uf4.md)
