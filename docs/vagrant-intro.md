# Introducció a Vagrant amb Ubuntu 24.04 LTS

## Instal·lació de Vagrant a Ubuntu 24.04 LTS

Abans de començar a treballar amb Vagrant, cal instal·lar-lo al sistema. A Ubuntu 24.04 LTS, la manera més senzilla i recomanada d’obtenir una versió recent i ben mantinguda de Vagrant és mitjançant **Snap**:

```bash
sudo snap install vagrant --classic
```

> L’opció `--classic` és necessària perquè Vagrant requereix accés complet al sistema (per interactuar amb VirtualBox, libvirt, fitxers, etc.).

Un cop instal·lat, pots verificar la versió amb:

```bash
vagrant --version
```

### Requisits addicionals

Vagrant necessita un **proveïdor de virtualització**. Els més comuns són:

- **VirtualBox** (ideal per a entorns d’escriptori):
  ```bash
  sudo apt update
  sudo apt install virtualbox
  ```

- **libvirt/KVM** (recomanat per a servidors o entorns Linux avançats):
  ```bash
  sudo apt install libvirt-daemon-system libvirt-clients qemu-kvm
  sudo usermod -aG libvirt $USER
  # Cal tancar i tornar a obrir la sessió perquè el canvi de grup tingui efecte
  ```

> **Nota**: Si utilitzes VirtualBox, assegura’t que la versió de les **Guest Additions** sigui compatible amb la versió instal·lada. En cas de problemes amb carpetes compartides, pots instal·lar el plugin `vagrant-vbguest`:
> ```bash
> vagrant plugin install vagrant-vbguest
> ```

## Què és Vagrant?

**Vagrant** és una eina de codi obert que permet definir, crear i gestionar entorns de desenvolupament reproduïbles i portables. Aquests entorns es basen en plataformes de virtualització com **VirtualBox**, **libvirt (KVM)** o **Docker**, i es configuren mitjançant un únic fitxer: el **`Vagrantfile`**.

Amb Vagrant, pots automatitzar tot el cicle de vida d’una màquina virtual (MV): des de la seva creació fins a la seva destrucció, passant per la instal·lació de programari, configuració de xarxa, compartició de fitxers i accés SSH.

### Funcionalitats principals

A partir d’un `Vagrantfile`, Vagrant pot:

- Descarregar automàticament la imatge base (*box*) des de [Vagrant Cloud](https://app.vagrantup.com).
- Crear i configurar MVs segons les especificacions definides.
- Executar tasques de provisionament (instal·lació de paquets, creació d’usuaris, etc.).
- Gestionar l’estat de les MVs: iniciar (`up`), aturar (`halt`), suspèndre (`suspend`), reprendre (`resume`) o eliminar (`destroy`).
- Compartir automàticament el directori del projecte amb la MV (muntat a `/vagrant`).
- Facilitar l’accés SSH sense necessitat de contrasenyes.

Això permet **desplegar infraestructura complexa amb una sola comanda** i, quan ja no calgui, eliminar-la completament simplement esborrant el directori del projecte.

## Configuració d’un projecte amb Ubuntu 24.04 LTS

### 1. Creació del directori del projecte

Cada projecte Vagrant es gestiona dins d’un directori. Per exemple:

```bash
mkdir ubuntu-2404-example
cd ubuntu-2404-example
```

### 2. Inicialització del `Vagrantfile`

Les imatges oficials d’Ubuntu es mantenen a [Vagrant Cloud](https://app.vagrantup.com/ubuntu). Per Ubuntu 24.04 LTS (Noble Numbat), la box oficial és `ubuntu/noble64`.

```bash
vagrant init ubuntu/noble64
```

Aquesta comanda genera un fitxer `Vagrantfile` amb una configuració bàsica i comentaris explicatius.

### 3. Inici de la màquina virtual

Per iniciar la MV (forçant l’ús de VirtualBox si cal):

```bash
vagrant up --provider=virtualbox
```

Vagrant:
- Descarrega la box (si no està localment, a `~/.vagrant.d/boxes/`).
- Crea la MV a VirtualBox.
- Configura la xarxa, les claus SSH i els directoris compartits.
- Inicia la màquina i aplica els ajustos de seguretat (com la substitució de la clau SSH insegura).

### 4. Accés a la màquina

Un cop iniciada, pots connectar-te amb:

```bash
vagrant ssh
```

Dins de la MV, veuràs un sistema Ubuntu 24.04 LTS net, amb l’usuari `vagrant` i accés complet via `sudo`.

```text
Welcome to Ubuntu 24.04 LTS (GNU/Linux 6.8.0-xx-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
```

El directori del projecte (`~/ubuntu-2404-example`) està muntat automàticament a `/vagrant` dins de la MV.

```bash
vagrant@ubuntu-noble:~$ ls /vagrant
Vagrantfile  .vagrant/
```

### 5. Gestió de l’estat

- **Veure l’estat**: `vagrant status`
- **Aturar**: `vagrant halt`
- **Suspèndre**: `vagrant suspend`
- **Reprendre**: `vagrant resume`
- **Eliminar completament**: `vagrant destroy`

## Personalització del `Vagrantfile`

El fitxer `Vagrantfile` és un script en Ruby que defineix la configuració de l’entorn. A continuació, algunes opcions útils:

### Assignació de memòria

Per defecte, la MV disposa de 1 GB de RAM. Pots augmentar-la editant:

```ruby
config.vm.provider "virtualbox" do |vb|
  vb.memory = "2048"  # 2 GB
  # vb.cpus = "2"     # Opcional: assignar 2 CPUs
end
```

### Provisionament amb shell

Per instal·lar programari automàticament (per exemple, Apache):

```ruby
config.vm.provision "shell", inline: <<-SHELL
  apt-get update
  apt-get install -y apache2
SHELL
```

> El provisionament només s’executa la primera vegada o si s’usa `vagrant provision`.

### Redirecció de ports

Per accedir al servidor web des de l’equip host:

```ruby
config.vm.network "forwarded_port", guest: 80, host: 8080
```

Ara pots obrir `http://localhost:8080` al navegador de la màquina física.

### Xarxa privada (host-only)

Per assignar una IP fixa a la MV en una xarxa privada:

```ruby
config.vm.network "private_network", ip: "192.168.33.10"
```

Això crea una interfície addicional (`enp0s8` o similar) a la MV i una xarxa virtual a l’host (`vboxnet0`). Ubuntu 24.04 gestiona aquesta configuració automàticament mitjançant **Netplan**.

També pots usar DHCP:

```ruby
config.vm.network "private_network", type: "dhcp"
```

## Recomanacions per a Ubuntu 24.04

- **Actualitzacions de seguretat**: Ubuntu 24.04 LTS rep suport estàndard fins al 2029. Amb **Ubuntu Pro** (gratuït per a ús personal en fins a 5 màquines), pots ampliar la cobertura de seguretat a **10 anys** per a més de **25.000 paquets**, incloent-hi Apache, Python, Node.js, Docker, OpenSSL, etc. ([ubuntu.com/advantage](https://ubuntu.com/advantage)).
- **Boxes actualitzades**: Assegura’t d’usar sempre la darrera versió de la box `ubuntu/noble64`, ja que Canonical publica actualitzacions periòdiques amb els últims CVE corregits.

## Plantilla completa de `Vagrantfile` per a Ubuntu 24.04

A continuació, una plantilla funcional que configura una MV amb:
- Ubuntu 24.04 LTS
- 2 GB de RAM
- Apache instal·lat
- Port 80 redirigit al 8080 de l’host
- Xarxa privada amb IP fixa (`192.168.33.10`)

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Box oficial d'Ubuntu 24.04 LTS (Noble Numbat)
  config.vm.box = "ubuntu/noble64"

  # Redirecció de ports: accés a Apache des de http://localhost:8080
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Xarxa privada amb IP fixa
  config.vm.network "private_network", ip: "192.168.33.10"

  # Configuració específica per a VirtualBox
  config.vm.provider "virtualbox" do |vb|
    vb.name = "ubuntu-2404-apache"
    vb.memory = "2048"
    vb.cpus = "2"
    # vb.gui = true  # Descomenta si vols veure la interfície gràfica
  end

  # Provisionament: instal·lació d'Apache
  config.vm.provision "shell", inline: <<-SHELL
    echo "Actualitzant el sistema..."
    apt-get update

    echo "Instal·lant Apache..."
    apt-get install -y apache2

    echo "Habilitant Apache al inici..."
    systemctl enable apache2

    echo "Configuració completada. Apache està actiu a http://192.168.33.10 o http://localhost:8080"
  SHELL
end
```

### Ús de la plantilla

1. Guarda el codi anterior com a `Vagrantfile` en un directori nou.
2. Executa:
   ```bash
   vagrant up --provider=virtualbox
   ```
3. Obre el navegador i visita:
   - `http://localhost:8080` (des de la màquina física)
   - `http://192.168.33.10` (si vols accedir per la xarxa privada)

## Conclusió

Vagrant, combinat amb les imatges oficials d’Ubuntu 24.04 LTS, ofereix una manera ràpida, segura i reproduïble de treballar amb entorns de desenvolupament. La seva integració amb VirtualBox, libvirt o Docker, juntament amb el suport a provisionament (shell, Ansible, etc.), el converteix en una eina essencial per a desenvolupadors, DevOps i equips d’infraestructura.

> **Documentació oficial**: [https://www.vagrantup.com/docs](https://www.vagrantup.com/docs)  
> **Boxes d’Ubuntu**: [https://app.vagrantup.com/ubuntu](https://app.vagrantup.com/ubuntu)  
> **Ubuntu Pro (gratuït per a ús personal)**: [https://ubuntu.com/advantage](https://ubuntu.com/advantage)
