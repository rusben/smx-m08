# Introducció als contenidors lxc/lxd

LXD és un gestor de contenidors de sistemes de nova generació. Ofereix una experiència d'usuari similar a les màquines virtuals, però utilitza contenidors Linux.

## Creació d'un contenidor
```console
 lxc launch ubuntu:20.04 elmeucontenidor
```

## Obrir un contenidor previament creat i que està parat
```console
 lxc start elmeucontenidor
```

## Llistar els contenidors del sistema
```console
lxc list

 +-----------------+---------+----------------------+-----------------------------------------------+-----------+-----------+
 |     NAME        |  STATE  |         IPV4         |                     IPV6                      |   TYPE    | SNAPSHOTS |
 +-----------------+---------+----------------------+-----------------------------------------------+-----------+-----------+
 | elmeucontenidor | RUNNING | 10.160.100.98 (eth0) | fd42:5550:ddc5:fbe2:216:3eff:fe81:713d (eth0) | CONTAINER | 0         |
 +-----------------+---------+----------------------+-----------------------------------------------+-----------+-----------+
```

## Executa un contenidor

```console
lxc exec elmeucontenidor -- /bin/bash
```

## Atura un contenidor

```console
lxc stop elmeucontenidor
```

```console
lxc list

 +-----------------+---------+------+------+-----------+-----------+
 |     NAME        |  STATE  | IPV4 | IPV6 |   TYPE    | SNAPSHOTS |
 +-----------------+---------+------+------+-----------+-----------+
 | elmeucontenidor | STOPPED |      |      | CONTAINER | 0         |
 +-----------------+---------+------+------+-----------+-----------+
```

## Elimina un contenidor

```console
lxc delete elmeucontenidor
```

## Exportar i importar un contenidor
Com exportar i importar un contenidor

https://serverfault.com/questions/759170/copy-lxd-containers-between-hosts


## Instal·lació d'aplicacions web en contenidors

Per instal·lar una aplicació web hem de portar el contingut al nostre servidor web (`apache2`), un cop instal·lat al contenidor tindrem que descomprimir el contingut al directori `/var/www/html`.

Una forma senzilla de portar els arxius al contenidor, es anar directament a la carpeta `/var/www/html` del contenidor i fer un `wget` de l'enllaç directe a l'arxiu de la cloud, amb això tindrem l'arxiu de la cloud dins del contenidor.

## Aplicar els permisos corresponents
Un cop descomprimits els fitxers de l'aplicació web al directori `/var/www/html`, apliquem els següents permisos al directori `/var/www/html`
```console
chmod -R 775 .
chown -R root:www-data .
```

## Més informació
https://elpuig.xeill.net/Members/vcarceler/articulos/contenedores-con-lxd-lxc/index_html
