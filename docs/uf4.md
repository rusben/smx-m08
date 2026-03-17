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

Durant la configuració selecciona `MySQL Server & Cluster` y tria la serie `mysql-8.4-lts`. Després selecciona `Ok` y acceptar.

```bash
sudo apt-get update
sudo apt install mysql-server -y
```
Si ja havieu creat l'usuari de la base de dades executeu el següent:

```bash
sudo mysql
```

```bash
ALTER USER 'usuario'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'password';
EXIT;
```

## Canviar el valor de `max_input_vars`
```

```bash
sudo vim /etc/php/8.3/apache2/php.ini 
```

Buscar la variable i canviar el valor a 5000:
```bash
max_input_vars = 5000
```





## Pràctica
* [Enunciat de la pràctica de moodle](pt-uf4.md)
