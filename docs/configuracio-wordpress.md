# Configuració de WordPress

## Rols
* ***`Administrador`***: Aquest rol d'usuari no té cap restricció o limitació en WordPress. És l'únic rol d'usuari que té totes les capacitats, des de crear o eliminar perfils d'usuari, actualitzar el core o plugins i plantilles de la teva aplicació, editar temes, modificar o personalitzar l'escriptori de WordPress, administrar les publicacions i la categorització el contingut , pujar arxius, crear noves pàgines o eliminar les que ja estan publicades ... Tots els canvis que et puguis imaginar poden ser executats pel rol de l'administrador.

* ***`Editor`***: El paper d'editor té menys capacitats que el d'administrador. No té control sobre el core, plugins o plantilles que s'utilitzen a la teva web, però sí que té el control sobre els comentaris, categories, etiquetes o la publicació d'el contingut. Té la capacitat de crear, modificar o esborrar entrades i pàgines que hagin estat creades per ell mateix o per qualsevol altre rol d'usuari.

* ***`Autor`***: Un usuari amb el rol d'autor pot pujar arxius i crear, editar, publicar o eliminar les seves pròpies entrades. Encara que sigui un paper amb moltes menys capacitats que els dos anteriors, és recomanable que només concedeixis aquest permís a una persona de confiança. El fet de poder publicar el seu propi contingut, fa que la seva activitat en WordPress estigui completament exposada a les teves visites.

* ***`Col·laborador`***: Té moltes més limitacions que el paper d'autor, però és molt més segur si treballes amb persones alienes la teva empresa o organització. Tan sols poden pujar el seu propi contingut, però la publicació de la mateixa tan sols pot realitzar-la el rol d'administrador o editor.

* ***`Subscriptor`***: És un paper que no té molta utilitat en WordPress. Té únicament la capacitat de llegir entrades de l'bloc o pàgines ja publicades (és a dir, el mateix que qualsevol altre usuari que no estigui registrat). L'únic avantatge d'aquest rol d'usuari és que pot respondre o deixar comentaris a qualsevol post del teu bloc sense necessitat de crear un nou registre

## Configurar permalinks (enllaços permanents)
Per a que funcionen els enllaços permanents heu de:

Assegureu-vos que teniu el fitxer `.htaccess` en el directori principal de la vostra web.
~~~
 # Fitxer .htaccess (al directori principal de la vostra web)
 # BEGIN WordPress
 <IfModule mod_rewrite.c>
 RewriteEngine On
 RewriteBase /
 RewriteRule ^index\.php$ - [L]
 RewriteCond %{REQUEST_FILENAME} !-f
 RewriteCond %{REQUEST_FILENAME} !-d
 RewriteRule . /index.php [L]
 </IfModule>
 # END WordPress
~~~

## Activar el mòdul rewrite de l'apache

Activeu el mòdul `rewrite` de l'`apache2`.
~~~
sudo a2enmod rewrite
~~~

Canvieu la configuració al fitxer `/etc/apache2/apache2.conf` per permetre la reescritura de URLs.

~~~
 <Directory /var/www/>
    Options Indexes FollowSymLinks
    AllowOverride <b>All</b>
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
