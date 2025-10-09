# Configuració de WordPress


1. [Gestió de rols](rols-wordpress.md)
2. [Configuració de permalinks](permalinks-wordpress.md)
3. [Configuració del mòdul Rewrite](rewrite-apache-wordpress.md)
4. [Mètode directe a WordPress per evitar l'ús de FTP](metode-directe-wordpress.md)
5. [Canviar el tamany màxim dels fitxers que es poden pujar](canviar-tamany-fitxers-wordpress.md)


## Activar el mòdul rewrite de l'apache

Activeu el mòdul `rewrite` de l'`apache2`.
~~~
sudo a2enmod rewrite
~~~

Canvieu la configuració al fitxer `/etc/apache2/apache2.conf` per permetre la reescritura de URLs.

~~~
 <Directory /var/www/>
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
 </Directory>
~~~

Reinicieu l'`apache2`.
~~~
sudo service apache2 reload
~~~

## Configurar el mètode directe per a no fer servir FTP
Per instal·lar plugins sense servidor `FTP`: afegiu a `wp-config.php` la següent línia:
~~~
define('FS_METHOD', 'direct');
~~~

## Canviar el tamany màxim dels fitxers que es poden pujar
Canviar el tamany màxim dels fitxers que podem pujar a `WordPress`:

http://www.wpbeginner.com/wp-tutorials/how-to-increase-the-maximum-file-upload-size-in-wordpress/

Hi ha diferents mètodes, hem fet servir el mètode 2 de l'enllaç anterior:

~~~
sudo apt install locate
sudo updatedb
~~~

1. Busquem el fitxer `php.ini`

~~~
 usuari@elpuig:~$ locate php.ini
 /etc/php/7.4/apache2/php.ini
 /etc/php/7.4/cli/php.ini
 /etc/php/7.4/fpm/php.ini
 /usr/lib/php/7.4/php.ini-development
 /usr/lib/php/7.4/php.ini-production
 /usr/lib/php/7.4/php.ini-production.cli
~~~

Apareixen diferents fitxers `php.ini`, però ens interessa el `php.ini` del servidor `apache2`.

2. Busquem i modifiquem els següents valors:

Obrim el fitxer:
~~~
sudo vim /etc/php/7.4/apache2/php.ini
~~~

Modifiquem els valors de les variables de configuració:
~~~
 upload_max_filesize = 64M
 post_max_size = 64M
 max_execution_time = 300
~~~

## Plugins multi-lingual
Més plugins de traducció per a `WordPress`: http://wplang.org/translation-plugins-languages/
