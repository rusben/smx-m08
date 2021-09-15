# UF1 - Ofimàtica i eines web

## Introducció
Una aplicació web és una aplicació a la qual accedim mitjançant protocol HTTP utilitzant un navegador web. Hem vist el protocol HTTP, però no com utilitzar-lo per implementar una aplicació.

### Aplicacions en el costat del servidor

A la banda de servidor, hem d'aconseguir que el nostre servidor HTTP sigui capaç d'executar programes d'aplicació que recullin els paràmetres de peticions de client, els processin i tornin a el servidor un document que aquest passarà al seu torn a client.

Així, per al client el servidor no haurà fet res diferent al que estipula el protocol HTTP, però el servidor es pot valer d'eines externes per processar i servir la petició sol·licitada, podent així no limitar-se a servir pàgines estàtiques, sinó utilitzar altres aplicacions (servlets, JSP, PHP, etc.) per servir documents amb contingut dinàmic.

Els programes d'aplicació són típicament programes que realitzen consultes a bases de dades, processen la informació resultant i tornen la sortida a servidor, entre altres tasques.

### Aplicacions en el costat del client

Es tenen moltes tecnologies relacionades amb extensions de la banda de el client (entenent client com un navegador que interpreta codi HTML). El codi HTML és un codi estàtic que només permet formatar l'aparença d'una pàgina i definir enllaços a altres pàgines o URL. Això no és suficient si volem que el navegador realitzi funcions més complicades: validar entrades de formularis, mostrar l'evolució de l'preu d'unes accions, etc.

Per ampliar les funcionalitats de el navegador (respectant el protocol HTTP), s'utilitzen tecnologies com JavaScript, Applets etc. Aquestes es basen en fer que el navegador executi codi que li passa al servidor, bé embegut en documents HTML (com és el cas de JavaScript), o bé mitjançant fitxers compilats multiplataforma (com és el cas dels Applets Java).


## HTML i CSS

Originalment, les pàgines HTML només incloïen informació sobre els seus continguts de text i imatges. Amb el desenvolupament de l'estàndard HTML, van començar a incloure també informació sobre l'aspecte dels seus continguts: tipus de lletra, colors i marges.

La posterior aparició de tecnologies com JavaScript, van provocar que les pàgines HTML també incloguessin el codi de les aplicacions (scripts) que s'utilitzen per crear pàgines web dinàmiques.
Incloure en una mateixa pàgina HTML els continguts, el disseny i la programació complica en excés el seu manteniment. Normalment, els continguts i el disseny de la pàgina web són responsabilitat de diferents persones, pel que és adequat separar-los. CSS és el mecanisme que permet separar els continguts definits mitjançant XHTML i l'aspecte que han de presentar aquests continguts:


Un altre avantatge de la separació dels continguts i la seva presentació és que els documents XHTML creats són més flexibles, ja que s'adapten millor a les diferents plataformes: pantalles d'ordinador, pantalles de dispositius mòbils, impressores i dispositius utilitzats per persones discapacitades.

D'aquesta manera, utilitzant exclusivament XHTML es creen pàgines web "lletges" però correctes. Aplicant CSS, es poden crear pàgines "boniques" a partir de les pàgines XHTML correctes.

## World Wide Web

El científic anglés Tim Berners-Lee va inventar la World Wide Web (WWW), Xarxa d'Abast Mundial, en 1989, mentre treballava al CERN.

Coneguda comunament com la Web, és un sistema d'informació on documents i altres recursos són identificats amb URLs (Uniform Resource Locators), com, per exemple, http://wikipedia.org, que poden ser enllaçats amb hypertext, i són accessibles a través d'Internet.

Els recrsos de la Web són transferits pels Servidors Web via l' Hypertext Transfer Protocol (HTTP) i es pot accedir a ells utilitzant el Navegador Web.

## URL

Com hem dit, les URLs són identificadors de recursos. Els recursos poden ser molt diversos: pàgines, imatges, videos, fitxers, etcètera. Per exemple:

* La url http://info.cern.ch/ identifica la pàgina principal del CERN
* La url https://upload.wikimedia.org/wikipedia/commons/f/f8/Tim_Berners-Lee.jpg identifica una imatge (de Tim, és clar)
* La url https://upload.wikimedia.org/wikipedia/commons/a/a3/Tim_Berners_Lee_changed_the_world_25_years_ago_-_Tim_Berners_Lee.webm identifica un vídeo.

Una URL es compon de 7 components:

1. **Scheme:** defineix el protocol d'accés al document (http, https, ftp, mailto, file, data)
2. **User:** la identifiació de l'usuari que accedeix al recurs
3. **Host:** l'adreça IP o el nom DNS del servidor
4. **Port:** El port del servidor al qual es connecta
5. **Path:** Identifica el recurs al qual es vol accedir
6. **Query:** Dades addicionals sobre el recurs
7. **Fragment:** Localització a dintre del propi recurs

Anem a veure amb més detall aquests components.

![URL syntax](img/url_syntax.png)

## Scheme

El protocol d'accés al recurs indica la forma concreta en que s'han de comunicar el que fa la petició i el que la respon.

Per exemple, el protocol `http` serveix per a comunicar amb un servidor web. La especificacio del protocol és molt extensa, però podem veure un exemple senzill.

En la seva forma més utilitzada, HTTP serveix per a obtenir recursos.

Suposem que volem obtenir la pàgina principal del CERN. Aleshores, hem de realitzar un petició HTTP al seu servidor (info.cern.ch). Les dades que enviarem al servidor han de seguir exactament el protocol.

Utilitzarem el programa nc per a comunicar amb el servidor del CERN.

Obre un terminal i executa la següent comanda:

```console
user@school:~$ nc info.cern.ch 80
```

Amb aquesta comanda hem connectat al `port 80` del servidor del CERN. Ara el servidor està esperant que li enviem dades.

Si enviem qualsevol dada al servidor, aquest no serà capaç de comprendre la petició. Li hem de enviar les dades adequades, seguint el protocol HTTP.

Prova a escriure alguna cosa, i polsa `Intro` per a enviar les dades al servidor.

El servidor respondrà amb un error `400 (Bad request)`. La petició no ha estat correcta.

```console
user@school:~$ nc info.cern.ch 80
jlaksdfklaksdf
HTTP/1.1 400 Bad Request
Date: Wed, 15 Sep 2021 08:07:08 GMT
Server: Apache
Content-Length: 226
Connection: close
Content-Type: text/html; charset=iso-8859-1

<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>400 Bad Request</title>
</head><body>
<h1>Bad Request</h1>
<p>Your browser sent a request that this server could not understand.<br />
</p>
</body></html>
```

Per a fer la petició correcta hem fer el següent:

1. Connectem amb el servidor:
```console
    nc info.cern.ch 80
```
2. Escrivim la comanda GET
  - després el recurs que volem /index.html
  - després la versió del protocol HTTP/1.0
  - després un "retorn de carro" `Ctrl + V` `Ctrl + M`
  - i per últim un "retorn de línia" Intro

```console
GET /index.html HTTP/1.0
```


3. Especifiquem el Host al qual estem connectant
  - introduint Host: info.cern.ch
  - "retorn de carro" `Ctrl + V` `Ctrl + M`
  - i "retorn de línia" `Intro`

```console
  Host: info.cern.ch
```
  `Ctrl + V` `Ctrl + M` `Intro`

4. Indiquem al servidor que ha finalitzat la petició amb:
  - "retorn de carro" `Ctrl + V` `Ctrl + M`
  - i "retorn de línia" `Intro`

Aquest cop sí, el servidor ens respon amb `200 (OK)`, i ens retorna el recurs solicitat.

```console
user@school:~$ nc info.cern.ch 80
GET /index.html HTTP/1.0^M
Host: info.cern.ch^M
^M
HTTP/1.1 200 OK
Date: Wed, 15 Sep 2021 08:20:44 GMT
Server: Apache
Last-Modified: Wed, 05 Feb 2014 16:00:31 GMT
ETag: "286-4f1aadb3105c0"
Accept-Ranges: bytes
Content-Length: 646
Connection: close
Content-Type: text/html

<html><head></head><body><header>
<title>http://info.cern.ch</title>
</header>

<h1>http://info.cern.ch - home of the first website</h1>
<p>From here you can:</p>
<ul>
<li><a href="http://info.cern.ch/hypertext/WWW/TheProject.html">Browse the first website</a></li>
<li><a href="http://line-mode.cern.ch/www/hypertext/WWW/TheProject.html">Browse the first website using the line-mode browser simulator</a></li>
<li><a href="http://home.web.cern.ch/topics/birth-web">Learn about the birth of the web</a></li>
<li><a href="http://home.web.cern.ch/about">Learn about CERN, the physics laboratory where the web was born</a></li>
</ul>
</body></html>
```

Aquesta petició que hem realitzat a mà és exactament el que fa el navegador web quan introduim la URL http://info.cern.ch a la barra d'adreçes.

Pots comprovar-ho de la següent forma:

1. Obre una pestanya nova del Firefox

2. Polsa F12 per a obrir les Eines de desenvolupador

3. Ves a la pestanya

4. Introdueix http://info.cern.ch/index.html a la barra d'adreçes i navega a la pàgina

5. Firefox et mostrarà tots els recursos que està descarregant del servidor

6. Selecciona el recurs index.html

7. A la pestanya lateral , baixa fins a i activa l'opció

Allà pots veure tota la petició HTTP que s'ha realitzat:

![URL syntax](img/firefox_request.png)

Ho farem ara al servidor que tenim instal·lat al nostre contenidor.

## User

Alguns servidors requereixen d'autenticació amb usuari:contrasenya per a accedir a certs recursos

Configurarem el nostre servidor per a requerir usuari:contrasenya en l'accés.

Obrim el fitxer de configuració del servidor Apache:

```console
user@school:~$ nano /etc/apache2/sites-enabled/000-default
```

Afegim les següents línies per a activar l'accés amb usuari/password:

```console
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    <Directory /var/www/html>
        AllowOverride all
    </Directory>
</VirtualHost>
```

Creem l'usuari joan:

```console
user@school:~$ htpasswd -c /var/www/contrasenyes joan
```
Comprovem que s'ha creat l'usuari:

```console
user@school:~$ cat /var/www/contrasenyes
```

Restringirem l'accés a la carepta /var/www/html a només aquells usuaris que estiguin en l'arxiu /var/www/contrasenyes. Per fer-ho hem de crear un fitxer anomenat .htaccess dintre de la carpeta que volem registringir:

```console
user@school:~$ nano /var/www/html/.htaccess
```

El contingut de l'arxiu .htaccess ha de ser aquest:

```console
AuthType Basic
AuthName "Introdueix el teu usuari i contrasenya"
AuthBasicProvider file
AuthUserFile "/var/www/contrasenyes"
Require valid-user
```

Per últim reiniciem el servidor Apache:

```console
user@school:~$ /etc/init.d/apache2 restart
```
