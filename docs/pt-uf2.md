# **Pràctica 2: Gestors d'Arxius Web**

## **Objectius generals de la pràctica**

1. **Comprendre els conceptes bàsics de l’emmagatzematge en línia**:  
   - Familiaritzar-se amb els principis del *Cloud Computing*.  
   - Entendre les característiques i avantatges dels gestors d’arxius web com a eines per a la gestió col·laborativa de dades.

2. **Instal·lar i configurar gestors d’arxius web**:  
   - Adquirir habilitats tècniques per instal·lar i configurar un gestor d’arxius web (Nextcloud, amb referència inicial a ownCloud).  
   - Configurar entorns virtuals per a la implementació del sistema.

3. **Utilitzar llenguatges de marques lleugers existents**:  
   - Documentar el procés mitjançant fitxers Markdown (`.md`), seguint bones pràctiques d’escriptura tècnica.

4. **Treballar en un entorn col·laboratiu**:  
   - Configurar l’accés compartit entre múltiples usuaris i dispositius.  
   - Experimentar amb la gestió de permisos i rols.


## **Desenvolupament de la pràctica**

La pràctica es realitza **de forma individual**, però inclou una part opcional d’interacció amb els companys per configurar accés compartit.

### **Tasques a realitzar**

Les tasques es divideixen en tres fitxers de documentació diferents:

- **`INSTALLATION.md`**: Ha de contenir **exclusivament** les tasques 1, 2 i 3.  
- **`CONFIGURATION.md`**: Ha de contenir **exclusivament** les tasques 4 a 8.
- **`README.md`**: fitxer principal que només inclou dos enllaços als fitxers anteriors.

#### **A documentar a `INSTALLATION.md`**  
*(No calen captures de pantalla)*

1. **Configuració del sistema de virtualització (IsardVDI)**:  
   - Explicar el procés de configuració d'IsardVDI (creació de la màquina virtual).  
   - Configurar una màquina virtual per allotjar Nextcloud.  

2. **Instal·lació del gestor d’arxius Nextcloud**:  
   - Descarregar i instal·lar Nextcloud en la màquina virtual.  
   - Configurar el servidor web (Apache) i la base de dades (MySQL/MariaDB).  
   - Verificar que Nextcloud sigui accessible des del navegador.  

3. **Manual d’instal·lació**:  
   - Presentar una guia pas a pas del procés complet d’instal·lació.

#### **A documentar a `CONFIGURATION.md`**  
*(Totes les tasques d’aquest apartat requereixen captures de pantalla)*

4. **Demostració del funcionament**:  
   - **Pujar arxius**: Mostrar com afegir documents o imatges al núvol i verificar que es desen correctament.  
   - **Crear carpetes**: Il·lustrar la creació d’una estructura bàsica de directoris dins del compte d’usuari.  
   - **Compartir continguts**: Documentar com generar enllaços compartits o compartir fitxers directament amb altres usuaris.

5. **Creació d’usuaris**:  
   - **Crear tres usuaris**: Un amb rol d’administrador, un d’editor (pot modificar continguts) i un de visualitzador (només pot veure).  
   - **Documentar el procés**: Explicar com s’accedeix a la interfície d’administració i com s’afegeixen nous usuaris amb les seves credencials.

6. **Assignació de rols i permisos**:  
   - **Configurar permisos per rol**: Detallar quins permisos es donen a cada tipus d’usuari (per exemple, qui pot eliminar, editar o només veure).  
   - **Demostrar l’efecte dels permisos**: Mostrar com un usuari visualitzador no pot modificar continguts, mentre que un editor sí.

7. **Administració d’arxius**:  
   - **Organització de carpetes i fitxers**: Crear una jerarquia lògica (per exemple: documents personals, treballs compartits, recursos).  
   - **Polítiques de seguretat**: Activar opcions com la caducitat dels enllaços compartits o l’obligació de contrasenya per accedir-hi.

8. **Accés des d’una màquina qualsevol de la xarxa**:  
   - **Configuració d’accés remot**: Explicar com es permet l’accés a Nextcloud des d’un dispositiu diferent a la màquina virtual (per exemple, des d’un portàtil connectat a la mateixa xarxa).  
   - **(Extra) Accés a clouds de companys**: Documentar el procés d’afegir comptes externs de Nextcloud (els de dos companys) i navegar-hi des del propi client web o d’escriptori.

## **Entrega**

L'entrega es realitza mitjançant un repositori a GitHub, que ha de seguir estrictament el format següent:

- **Nom del repositori**: `NOM-COGNOM-PT2`  
  - Exemple: `RUBEN-ARROYO-PT2`

- **Contingut del repositori**:  
  1. **`INSTALLATION.md`**:  
     - Manual d’instal·lació de Nextcloud amb virtualització mitjançant IsardVDI.  
  2. **`CONFIGURATION.md`**:  
     - Manual de configuració de Nextcloud: usuaris, rols, permisos, gestió d’arxius i accés remot.  
     - Totes les seccions han d’anar acompanyades de captures de pantalla.  
  3. **`README.md`**:  
     - Breu descripció del projecte.  
     - Enllaços als altres fitxers `.md`.  
     - Observacions o problemes trobats durant la pràctica.

## **Aspectes addicionals**

### **Requisits tècnics**
- Sistema operatiu: Linux (Ubuntu).  
- Eina de virtualització: IsardVDI.  
- Servidor web: Apache.  
- Base de dades: MySQL.

### **Recursos recomanats**
1. **Web Based File Manager**:  
   - [File Manager - Wikipedia](https://en.wikipedia.org/wiki/File_manager#Web-based_file_managers)  
2. **Cloud Computing**:  
   - [Cloud Computing - Wikipedia](https://en.wikipedia.org/wiki/Cloud_computing)  
3. **Documentació oficial de Nextcloud**:  
   - [Nextcloud Documentation](https://docs.nextcloud.com/server/latest/user_manual/es/)

### **Criteris d’avaluació**
1. **Correctesa tècnica**:  
   - Instal·lació i configuració sense errors i **amb captures de pantalla** on s’indica.  
2. **Qualitat de la documentació**:  
   - Claritat, organització i completesa dels manuals.  
   - Qualitat i rellevància de les **captures de pantalla**.  
3. **Funcionalitat**:  
   - Verificació del funcionament de les funcions bàsiques i avançades.  
4. **Participació extra**:  
   - Configuració de l’accés a les clouds dels companys (opcional).
