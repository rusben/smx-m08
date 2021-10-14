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

## Més informació
https://elpuig.xeill.net/Members/vcarceler/articulos/contenedores-con-lxd-lxc/index_html
