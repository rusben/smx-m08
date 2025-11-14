# **Pràctica 2: Gestors d'Arxius Web**

## **Objectius generals de la pràctica**

1. **Comprendre els conceptes bàsics de l’emmagatzematge en línia**:
   - Familiaritzar-se amb els principis del *Cloud Computing*.
   - Entendre les característiques i avantatges dels gestors d’arxius web com a eines per a la gestió col·laborativa de dades.

2. **Instal·lar i configurar gestors d’arxius web**:
   - Adquirir habilitats tècniques per instal·lar i configurar un gestor d’arxius web (ownCloud).
   - Configurar entorns virtuals per a la implementació del sistema.

3. **Utilitzar llenguatges de marques lleugers existents**:
   - Documentar el procés mitjançant fitxers Markdown (`.md`), seguint bones pràctiques d’escriptura tècnica.

4. **Treballar en un entorn col·laboratiu**:
   - Configurar l’accés compartit entre múltiples usuaris i dispositius.
   - Experimentar amb la gestió de permisos i rols.

---

## **Desenvolupament de la pràctica**

La pràctica es realitza **de forma individual**, però inclou una part opcional d’interacció amb els companys per configurar accés compartit.

### **Tasques a realitzar**

Les següents tasques han de ser documentades en dos fitxers `.md` separats (vegeu l'apartat "Entrega" per més detalls):

1. **Configuració del sistema de virtualització (IsardVDI)**:
   - Explicar el procés de configuració d'IsardVDI (creació de la màquina virtual).
   - Configurar una màquina virtual per allotjar Nextcloud, en aquest punt no calen ceptures de pantalla.

2. **Instal·lació del gestor d’arxius Nextcloud**:
   - Descarregar i instal·lar Nextcloud en la màquina virtual.
   - Configurar el servidor web (Apache o Nginx) i la base de dades (MySQL/MariaDB).
   - Verificar que Nextcloud estigui accessible des del navegador.

3. **Manual d’instal·lació**:
   - Seguir la guia pas a pas del procés d’instal·lació.
  
**A PARTIR D'AQUEST PUNT ES OBLIGATORI QUE TINGUEU CAPTURES DE PANTALLA**

4. **Demostració del funcionament**:
   - Realitzar proves bàsiques per verificar el correcte funcionament de Nextcloud:
     - Pujar arxius.
     - Crear carpetes.
     - Compartir continguts.

5. **Creació d’usuaris**:
   - Crear almenys tres usuaris amb diferents rols (administrador, editor, visualitzador).
   - Documentar el procés de creació d’usuaris.

6. **Assignació de rols i permisos**:
   - Configurar permisos específics per a cada rol.
   - Demostrar com els permisos afecten l’accés als arxius.

7. **Administració d’arxius**:
   - Organitzar arxius i carpetes.
   - Configurar polítiques de seguretat (com ara la caducitat dels enllaços compartits).

8. **Accés des d’una màquina qualsevol de la xarxa**:
   - Configurar l’accés remot a ownCloud des d’un altre dispositiu.
   - **(Extra)** Configurar l’accés a les clouds dels teus dos companys i documentar-ho.

---

## **Entrega**

L'entrega es realitza mitjançant un repositori a GitHub, que ha de seguir estrictament el format següent:

- **Nom del repositori**: `NOM-COGNOM-PT2`
  - Exemple: `RUBEN-ARROYO-PT2`

- **Contingut del repositori**:
  1. **Manual d'instal·lació d’ownCloud amb virtualització mitjançant IsardVDI** (`INSTALLATION.md`):
     - Explica tots els passos d’instal·lació i configuració.
     - **Imprescindible per a aprovar: Inclou captures de pantalla**.
  2. **Manual de configuració d’ownCloud** (`CONFIGURATION.md`):
     - Detalla la configuració d’usuaris, rols, permisos i administració d’arxius.
  3. **Fitxer README.md**:
     - Breu descripció del projecte.
     - Enllaços als altres fitxers `.md`.
     - Observacions o problemes trobats durant la pràctica.

---

## **Aspectes addicionals**

### **Requisits tècnics**
- Sistema operatiu: Linux (preferible Ubuntu/Debian).
- Eina de virtualització: IsardVDI.
- Servidors web compatibles: Apache.
- Base de dades: MySQL.

### **Recursos recomanats**
1. **Web Based File Manager**:
   - [File Manager - Wikipedia](https://en.wikipedia.org/wiki/File_manager#Web-based_file_managers)
2. **Cloud Computing**:
   - [Cloud Computing - Wikipedia](https://en.wikipedia.org/wiki/Cloud_computing)
3. **Documentació oficial d’ownCloud**:
   - [OwnCloud Documentation](https://doc.owncloud.com/)

### **Criteris d’avaluació**
1. **Correctesa tècnica**:
   - Instal·lació i configuració sense errors i **amb captures de pantalla**.
2. **Qualitat de la documentació**:
   - Claritat, organització i completesa dels manuals.
   - Qualitat de les **captures de pantalla**.
3. **Funcionalitat**:
   - Verificació del funcionament de les funcions bàsiques i avançades.
4. **Participació extra**:
   - Configuració de l’accés a les clouds dels companys (opcional).
