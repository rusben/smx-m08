# Configuració de `VirtualHost` amb apache2

Un servidor web està dissenyat per poder allotjar sites de forma independent. Llavors podem tenir més d'un site dintre d'un mateix servidor web. Per aconseguir que cada site funcioni de forma independent es configuren el que s'anomenen `VirtualHost`. Cada `VirtualHost` que definim en la nostra configuració representarà un site independet. En el nostre cas, una instal·lació independent de Wordpress.

Amb el `VirtualHost` creat podrem accedir a la nostra instal·lació des d'un navegador introduint el nom que hagim seleccionat.

## Creació de l'estructura de directoris

Hem de crear l'estructura de directoris on s'allotjarà la nostra instal·lació, en aquest cas la nostra web s'anomenarà:​ `wordpress.local` i la instal·larem al directori per defecte on apache espera que guardem els nostres sites a `/var/www/`. De fet, el podriem allotjar a qualsevol lloc, però el farem servir per tenir les nostres webs endreçades.

​Creem el directori de la següent manera:

```console
sudo mkdir /var/www/wordpress.local
```

## Donem els permisos necessaris

Ara tenim els directoris creats, però si fem la comanda ls -la podem veure que el propietari de la carpeta es root i volem que sigui el propi usuari de la sessió.

`ls -la`

L'usuari que executa `apache2` és, per defecte, `www-data` i voldrem que qualsevol instal·lació que fem al nostre servidor no tingui problemes de permisos. Per canviar el propietari a l'usuari loginat en la sessió utilitzarem la següent comanda:

`sudo chown -R $USER:www-data /var/www/wordpress.local`

Després d'això els arxius i subdirectoris (el paràmetre `-­R` aplica recursivament l'acció a tots els arxius i subdirectoris) estàn ara sota el propietari de la sessió actual.

La variable `$USER` conté el valor de l'usuari loginat. Llavors en el moment que premeu `ENTER` es substituirà pel seu valor.

En el meu cas, el meu usuari és `rusben`, llavors és equivalen a fer el següent:

```console
sudo chown -R rusben:www-data /var/www/wordpress.local
```

​ Encara hem de canviar alguns permisos... Habilitem l'accés de lectura de tot el directori web i els seus subdirectoris.

```
sudo chmod -R 775  /var/www/wordpress.local
```
