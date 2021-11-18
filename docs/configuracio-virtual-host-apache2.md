# Configuració de `VirtualHost` amb apache2

Un servidor web està dissenyat per poder allotjar sites de forma independent. Llavors podem tenir més d'un site dintre d'un mateix servidor web. Per aconseguir que cada site funcioni de forma independent es configuren el que s'anomenen `VirtualHost`. Cada `VirtualHost` que definim en la nostra configuració representarà una web independent instal·lada al nostre servidor.

Amb el `VirtualHost` creat podrem accedir a la nostra instal·lació des d'un navegador introduint el nom que hagim seleccionat.

## Creació de l'estructura de directoris

Hem de crear l'estructura de directoris on s'allotjarà la nostra instal·lació, en aquest cas la nostra web s'anomenarà:​ `domini.local` i la instal·larem al directori per defecte on apache espera que guardem els nostres sites a `/var/www/`. De fet, el podriem allotjar a qualsevol lloc, però el farem servir per tenir les nostres webs endreçades.

​Creem el directori de la següent manera:

```console
sudo mkdir /var/www/domini.local
```

## Donem els permisos necessaris

L'usuari que executa `apache2` és, per defecte, `www-data` i voldrem que qualsevol instal·lació que fem al nostre servidor no tingui problemes de permisos. Per canviar el propietari a l'usuari loginat en la sessió utilitzarem la següent comanda:

`sudo chown -R $USER:www-data /var/www/domini.local`

Després d'això els arxius i subdirectoris (el paràmetre `-­R` aplica recursivament l'acció a tots els arxius i subdirectoris) estàn ara sota el propietari de la sessió actual.

La variable `$USER` conté el valor de l'usuari loginat. Llavors en el moment que premeu `ENTER` es substituirà pel seu valor.

En el meu cas, el meu usuari és `rusben`, llavors és equivalen a fer el següent:

```console
sudo chown -R rusben:www-data /var/www/domini.local
```

Si l'executem com a usuari `root` seria equivalent a fer:

```console
sudo chown -R root:www-data /var/www/domini.local
```

​Encara hem de canviar alguns permisos. Habilitem l'accés de lectura de tot el directori web i els seus subdirectoris.

```
sudo chmod -R 775  /var/www/domini.local
```

## Definició del `VirtualHost`

Ara hem de definir els arxius de configuració de l'`apache2` que representen  `VirtualHost` on instal·larem la nostra aplicació web. L'arxiu `domini.local.conf` guardarà la configuració del nostre `VirtualHost`

`sudo vim /etc/apache2/sites-available/domini.local.conf`

Guardem l'arxiu i ja tenim el fitxer de configuració del `VirtualHost`.

```console
# domini.local.conf
<VirtualHost *:80>
    ServerAdmin admin@domini.local
    ServerName www.domini.local
    ServerAlias domini.local
    DocumentRoot /var/www/domini.local
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

Guardem l'arxiu i ja els tenim definit el `VirtualHost`.

## Habilitem el `VirtualHost`

Un cop definits el `VirtualHost` els hem d'habilitar. Ho farem mitjançant la següent directiva: ​

`a2ensite`

​Aquesta comanda es pot llegir com `apache2 enable site`)​

Aquesta comanda espera que estiguem al directori:

`/etc/apache2/sites-available`

En cas de no estar en aquest directori ens posicionem:

`cd /etc/apache2/sites-available`

## Habilitem el `VirtualHost`:

`sudo a2ensite domini.local.conf`

## Reiniciem l'apache
Després de fer canvis de configuració és necesessari reiniciar l'`apache2`

`sudo service apache2 restart`

El `VirtualHost` ja està definit i preparat per a executar­-se.

## Incloure els nostres sites al fitxer de hosts

Per a poder accedir als nostres hosts mitjançant el nom hem d'indicar-lo al fitxer de hosts coneguts de la nostra màquina.

Hem d'incloure'ls apuntant a la IP del localhost, per a que quan el navegador busqui el nom de la nostra web busqui directament en la nostra màquina, Edita el fitxer /etc/hosts, és necesessari tenir permisos d'administració per a poder modificar el fitxer. ​ Afegeix les dues últimes línies que defineixen les teves noves webs:

```console
sudo vi /etc/hosts
```

```console
/etc/hosts
127.0.0.1   www.domini.local
```

Guarda i tanca l'arxiu. Sembla que ja gairebé estem.

### Informació extra

Enlloc d'utilitzar la IP de localhost podeu utilitzar la IP de la vostra màquina.

Com a curiositat, ja que teniu instal·lat un servidor web i esteu en una xarxa interna, potser heu pensat com accedir als dominis dels vostres companys i companyes. Ho podeu fer substituint la IP de localhost per la IP del vostre company o companya.

## Comprova que tot funciona

Si proves d'accedir al domini que hem preparat per al nostre domini veuràs que està buit.

http://www.domini.local
