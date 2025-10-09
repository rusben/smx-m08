# Introducció als contenidors amb LXD/LXC

**LXD** és un gestor de contenidors de sistemes Linux de nova generació, desenvolupat per Canonical. Proporciona una experiència d’usuari similar a les màquines virtuals (amb comandaments simples i gestió de xarxa, emmagatzematge i recursos), però basada en **contenidors del nucli Linux** (LXC). Això permet un ús més eficient dels recursos del sistema, ja que no hi ha virtualització de maquinari ni múltiples nuclis en execució.

Els contenidors LXD són ideals per a allotjar **aplicacions web**, ja que permeten aïllar entorns complets (amb el seu propi sistema de fitxers, xarxa i serveis) sense la sobrecàrrega de les VMs tradicionals.

## 1. Instal·lació i configuració inicial (Ubuntu 24.04)

En Ubuntu 24.04, LXD es pot instal·lar des dels repositoris oficials:

```bash
sudo snap install lxd
```

> **Nota:** Canonical recomana usar la versió de LXD distribuïda via **Snap** per a tenir sempre l’última versió estable i actualitzacions automàtiques.

Un cop instal·lat, inicialitza LXD:

```bash
sudo lxd init
```

Segueix les instruccions (pots acceptar les opcions per defecte per a ús bàsic). Aquest pas configura:

- El *storage backend* (ZFS, dir, etc.)
- La xarxa (`lxdbr0` per defecte)
- Permisos d’usuari

Afegeix el teu usuari al grup `lxd` (si cal):

```bash
sudo usermod -aG lxd $USER
newgrp lxd
```

## 2. Gestió bàsica de contenidors

### Crear un contenidor amb Ubuntu 24.04

```bash
lxc launch ubuntu:24.04 elmeucontenidor
```

### Llistar contenidors

```bash
lxc list
```

Exemple de sortida:

```
+-----------------+---------+----------------------+-----------------------------------------------+-----------+-----------+
|      NAME       |  STATE  |         IPV4         |                     IPV6                      |   TYPE    | SNAPSHOTS |
+-----------------+---------+----------------------+-----------------------------------------------+-----------+-----------+
| elmeucontenidor | RUNNING | 10.160.100.98 (eth0) | fd42:5550:ddc5:fbe2:216:3eff:fe81:713d (eth0) | CONTAINER | 0         |
+-----------------+---------+----------------------+-----------------------------------------------+-----------+-----------+
```

### Accedir al contenidor

```bash
lxc exec elmeucontenidor -- /bin/bash
```

### Aturar i iniciar un contenidor

```bash
lxc stop elmeucontenidor
lxc start elmeucontenidor
```

### Eliminar un contenidor

```bash
lxc delete elmeucontenidor
```

## 3. Instal·lació d’una aplicació web dins d’un contenidor

### Pas 1: Accedeix al contenidor

```bash
lxc exec elmeucontenidor -- /bin/bash
```

### Pas 2: Instal·la el servidor web (Apache)

```bash
apt update && apt install -y apache2
systemctl enable apache2
```

### Pas 3: Porta el codi de l’aplicació web al contenidor

Hi ha diverses maneres. Una opció senzilla és descarregar directament dins del contenidor:

```bash
cd /var/www/html
wget https://exemple.com/aplicacio-web.tar.gz
tar -xzf aplicacio-web.tar.gz --strip-components=1
rm aplicacio-web.tar.gz
```

> **Alternativa**: copiar fitxers des de l’amfitrió amb `lxc file push`:
>
> ```bash
> lxc file push -r ./aplicacio-web elmeucontenidor/var/www/html/
> ```

### Pas 4: Aplica els permisos correctes

```bash
chown -R root:www-data /var/www/html
chmod -R 775 /var/www/html
```

> Aquests permisos permeten que Apache (grup `www-data`) pugui llegir i, si cal, escriure fitxers (per exemple, en aplicacions com WordPress).

### Pas 5: Verifica que funciona

Des de l’amfitrió, obre un navegador o usa `curl`:

```bash
curl http://<IP_DEL_CONTENIDOR>
```

Troba la IP amb `lxc list`.

## 4. Exportar i importar contenidors

Per fer còpies de seguretat o migrar contenidors entre màquines:

### Exportar

```bash
lxc stop elmeucontenidor
lxc publish elmeucontenidor --alias meva-app-web
lxc image export meva-app-web meva-app-web
```

Això genera fitxers `.tar.gz` que pots moure a un altre host.

### Importar

```bash
lxc image import meva-app-web.tar.gz --alias meva-app-web
lxc launch meva-app-web nou-contenidor
```

Més detalls: [Copy LXD containers between hosts](https://serverfault.com/questions/759170/copy-lxd-containers-between-hosts)

## 5. Recomanacions addicionals

- **Limita recursos** si executes múltiples contenidors:
  ```bash
  lxc config set elmeucontenidor limits.memory 512MB
  lxc config set elmeucontenidor limits.cpu 2
  ```

- **Crea perfils personalitzats** per a aplicacions web (amb ports, discos addicionals, etc.).

- **Utilitza snapshots** per fer còpies ràpides abans d’actualitzacions:
  ```bash
  lxc snapshot elmeucontenidor pre-actualitzacio
  ```

## Més informació

- [Contenidors amb LXD/LXC – El Puig](https://elpuig.xeill.net/Members/vcarceler/articulos/contenedores-con-lxd-lxc/index_html)
- [Documentació oficial de LXD](https://documentation.ubuntu.com/lxd/)
