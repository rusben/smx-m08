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

1. **Instal·lació i configuració del sistema de virtualització (IsardVDI)**:
   - Explicar el procés d’instal·lació d’IsardVDI.
   - Configurar una màquina virtual per allotjar ownCloud.
   - Documentar els passos seguits amb **captures de pantalla**.

2. **Instal·lació del gestor d’arxius ownCloud**:
   - Descarregar i instal·lar ownCloud en la màquina virtual.
   - Configurar el servidor web (Apache o Nginx) i la base de dades (MySQL/MariaDB).
   - Verificar que ownCloud estigui accessible des del navegador.

3. **Manual d’instal·lació**:
   - Proporcionar una guia pas a pas del procés d’instal·lació.
   - Incloure captures de pantalla significatives per il·lustrar cada pas.

4. **Demostració del funcionament**:
   - Realitzar proves bàsiques per verificar el correcte funcionament d’ownCloud:
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

La carpeta d’entrega ha de seguir estrictament el format següent:

- **Nom de la carpeta**: `NOM-COGNOM-PT2`
  - Exemple: `RUBEN-ARROYO-PT2`

- **Contingut de la carpeta**:
  1. **Manual d'instal·lació d’ownCloud amb virtualització mitjançant IsardVDI** (`INSTALLATION.md`):
     - Explica tots els passos d’instal·lació i configuració.
     - Inclou captures de pantalla.
  2. **Manual de configuració d’ownCloud** (`CONFIGURATION.md`):
     - Detalla la configuració d’usuaris, rols, permisos i administració d’arxius.
  3. **Fitxer README.md**:
     - Breu descripció del projecte.
     - Enllaços als altres fitxers `.md`.
     - Observacions o problemes trobats durant la pràctica.

- **Format de lliurament**:
  - La carpeta s’ha de comprimir en un fitxer ZIP amb el nom: `NOM-COGNOM-PT2.zip`.

---

## **Aspectes addicionals**

### **Requisits tècnics**
- Sistema operatiu: Linux (preferible Ubuntu/Debian).
- Herramienta de virtualització: IsardVDI.
- Servidors web compatibles: Apache o Nginx.
- Base de dades: MySQL o MariaDB.

### **Recursos recomanats**
1. **Web Based File Manager**:
   - [File Manager - Wikipedia](https://en.wikipedia.org/wiki/File_manager#Web-based_file_managers)
2. **Cloud Computing**:
   - [Cloud Computing - Wikipedia](https://en.wikipedia.org/wiki/Cloud_computing)
3. **Documentació oficial d’ownCloud**:
   - [OwnCloud Documentation](https://doc.owncloud.com/)

### **Criteris d’avaluació**
1. **Correctesa tècnica**:
   - Instal·lació i configuració sense errors i amb captures de pantalla.
2. **Qualitat de la documentació**:
   - Claritat, organització i completesa dels manuals.
   - Qualitat de les captures de pantalla.
3. **Funcionalitat**:
   - Verificació del funcionament de les funcions bàsiques i avançades.
4. **Participació extra**:
   - Configuració de l’accés a les clouds dels companys (opcional).
