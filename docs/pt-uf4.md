# **Pràctica Tema 4 - Instal·lació i Configuració de Moodle**

## **Objectius generals de la pràctica**
1. **Instal·lar i configurar gestors de continguts**, concretament Moodle.
2. **Aprendre a utilitzar Moodle com a administrador** per gestionar cursos, usuaris, continguts i qualificacions.
3. **Entendre les possibilitats d'un LMS (Learning Management System)** i aplicar-les en un entorn educatiu.

---

## **Desenvolupament de la pràctica**

Aquesta pràctica consisteix en crear un portal Moodle de temàtica lliure, configurant-lo i explorant-ne les funcionalitats com a administrador. A continuació, es detallen els passos que heu de seguir.

**Es obligatori capturar imatges de cada pas per facilitar la documentació i la revisió posterior.**

### **1. Instal·lació de Moodle**
1. **Preparació de l'entorn:**
   - Instal·leu Moodle en un nou escriptori virtual mitjançant **IsardVDI**. Seguiu els passos indicats al manual d'instal·lació d'aplicacions web.
   - Descarregueu la darrera versió de Moodle des de la pàgina oficial: [https://moodle.org](https://moodle.org).

2. **Documentació:**
   - Documenteu tot el procés d'instal·lació i configuració amb captures de pantalla i explicacions detallades.
   - Creeu un repositori a **GitHub** per desar el manual de configuració. Utilitzeu un fitxer `README.md` per incloure totes les captures i explicacions.

---

### **2. Configuració inicial de Moodle**
Inicieu sessió com a administrador i realitzeu les següents tasques:

#### **2.1. Administració del perfil d'usuari**
- Canvieu la vostra direcció de correu electrònic i contrasenya.
- Afegiu un avatar al vostre perfil:
  - Accediu a **Perfil > Editar** o bé a **Preferències**.

#### **2.2. Configuració del lloc**
- Canvieu el nom del lloc (tant llarg com curt) i feu que la pàgina principal no mostri contingut per als usuaris no autenticats:
  - Anar a **Administració del lloc > Primera plana > Paràmetres**.
- Configureu la franja horària correcta:
  - Anar a **Administració del lloc > Ubicació > Paràmetres**.
  - **Nota:** Aquesta configuració és crucial per a les entregues d'exercicis amb hores límit.
- Canvieu l'idioma del lloc:
  - Anar a **Administració del lloc > Idioma > Paràmetres**.
  - Instal·leu paquets d'idioma si cal des de **Administració del lloc > Idioma > Paquets d'idioma**.
- Establiu una política de contrasenyes robusta:
  - Anar a **Administració del lloc > Seguretat > Normatives del lloc**.
  - Configureu una longitud mínima de 8 caràcters, incloent majúscules, minúscules i números.

---

### **3. Creació de cursos**
1. Creeu els següents cursos:
   - Un curs anomenat **A** amb 3 temes.
   - Un curs anomenat **B** amb 5 temes.
   - Accediu a **Administració del lloc > Gestiona cursos i categories** o bé des del quadre de navegació: **Cursos > Afegeix curs**.

2. Exploreu les opcions de personalització dels cursos:
   - Activeu el mode edició (`Botó Activar Edició`).
   - Afegiu material (per exemple, un document PDF) a algun tema.
   - Canvieu el títol d'algun tema.

---

### **4. Creació i gestió d'usuaris**
#### **4.1. Creació manual d'usuaris**
- Creeu manualment un usuari anomenat **Bob** amb autenticació manual:
  - Anar a **Administració del lloc > Usuaris > Comptes > Afegeix un usuari**.

#### **4.2. Creació massiva d'alumnes**
- Genereu 10 alumnes utilitzant un arxiu CSV:
  - Anar a **Administració del lloc > Usuaris > Carrega usuaris**.
  - Consulteu l'exemple de fitxer CSV a la secció **Usuaris**.
- Elimineu dos dels alumnes creats mitjançant **Accions amb usuaris en bloc**.

---

### **5. Matriculació d'usuaris als cursos**
#### **5.1. Configuració de mètodes d'inscripció**
- **Curs A:**
  - Desactiveu qualsevol mètode d'inscripció per fer-lo públic.
  - El curs ha de ser accessible sense iniciar sessió.
- **Curs B:**
  - Activeu el registre manual d'usuaris.
  - Matriculeu l'usuari **Bob** com a professor i els alumnes restants com a estudiants.

#### **5.2. Verificació**
- Comproveu que:
  - El contingut del curs A està disponible públicament.
  - Per accedir al curs B, cal iniciar sessió.

---

### **6. Personalització del lloc**
1. **Canvi d'aspecte:**
   - Descarregueu i activeu un tema nou:
     - Anar a **Administració del lloc > Connectors > Instal·lar complement**.
     - Seleccioneu el tema des de **Administració del lloc > Aparença > Selector de temes**.
   - Modifiqueu la capçalera (header), el peu de pàgina (footer) i la pàgina principal (Front page).

2. **Logotip:**
   - Afegiu un logotip al vostre Moodle.

---

### **7. Creació de continguts i activitats**
#### **7.1. Curs A**
- Assigneu un professor i matriculeu alumnes.
- Afegiu continguts:
  - Diferents tipus d'activitats i recursos.
  - Una tasca amb data d'entrega oberta que demani la càrrega d'un fitxer PDF.

#### **7.2. Curs B**
- Cloneu el contingut del curs A al curs B:
  - Anar a **Administració del curs > Importar**.

---

### **8. Qualificacions i insígnies**
1. **Qualificacions:**
   - Completeu totes les tasques evaluables amb un usuari alumne.
   - Configureu el calificador per obtenir una nota automàtica:
     - Anar a **Administració del curs > Configuració de qualificacions**.

2. **Insígnies:**
   - Creeu una insignia i atorgueu-la a un alumne:
     - Anar a **Administració del lloc > Insígnies**.

---

### **9. Qüestionaris**
1. Creeu un qüestionari amb preguntes del banc de preguntes:
   - Organitzeu preguntes en categories diferents.
2. Respongueu les preguntes amb un usuari estudiant i verifiqueu les qualificacions amb l'usuari professor.

---

### **10. Importació i exportació de cursos**
1. Exporteu una còpia de seguretat del curs:
   - Anar a **Administració > Cursos > Còpies**.
2. Envieu el fitxer a un company i importeu un altre curs del seu Moodle.

---

### **11. Seguretat**
1. Bannegeu una IP específica i apliqueu una política de seguretat.
   - Justifiqueu la vostra decisió.

---

## **Fitxer usuaris.csv**
```csv
username,firstname,lastname,email,password
blobesponja,Blob,Esponja,blobesponja@elpuig.xeill.net,Abc123!
jsongoku,JSON,Goku,jsongoku@elpuig.xeill.net,Abc123!
canceligretel,Cancel,Gretel,canceligretel@elpuig.xeill.net,Abc123!
davidelgnome,David,Gnome,davidelgnome@elpuig.xeill.net,Abc123!
ritahardware,Rita,Hardware,trritahardwarees@elpuig.xeill.net,Abc123!
```

---

## **Més informació**
- **LMS (Learning Management System):** [https://en.wikipedia.org/wiki/Learning_management_system](https://en.wikipedia.org/wiki/Learning_management_system)

---

**Captureu imatges de cada pas per facilitar la documentació i la revisió posterior.**
