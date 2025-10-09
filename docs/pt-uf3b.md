
# **Pràctica – Instal·lació i configuració de botigues virtuals**

## **Objectius generals**

- Instal·lar i configurar almenys dues plataformes de botiga virtual (e-commerce) en un entorn local.
- Comparar les funcionalitats bàsiques i l’usabilitat de diferents sistemes de gestió de botigues online.
- Aplicar criteris d’usabilitat i experiència d’usuari (com la *Three-Click Rule*) en la configuració de les botigues.
- Preparar una demostració funcional per avaluar la comprensió tècnica i la capacitat d’adaptació dels sistemes.

## **Desenvolupament de la pràctica**

### **1. Selecció i instal·lació de plataformes**

Heu d’instal·lar **almenys dues** de les següents plataformes de botiga virtual en un entorn local (ex: XAMPP, WAMP, LAMP, Docker, etc.):

- CubeCart  
- PrestaShop  
- OpenCart  
- WooCommerce (com a plugin de WordPress)  
- osCommerce  
- Zen Cart  

> **Nota**: Assegureu-vos que totes les dependències del sistema (PHP, MySQL, Apache/Nginx, extensions requerides) estiguin correctament configurades abans de començar la instal·lació.

## **2. Configuració bàsica de cada botiga**

Cada botiga instal·lada ha de complir els requisits següents. A continuació, es detalla **què s’ha de fer i per què**:

### **2.1. Personalització de l’aparença (tema/disseny)**
- **Descripció**: L’administrador ha de poder canviar l’aspecte visual de la botiga (colors, tipografia, disposició, etc.) mitjançant temes o eines de personalització.
- **Objectiu**: Demostrar la capacitat de modificar l’experiència visual sense alterar la funcionalitat del codi base.

### **2.2. Creació de categories de productes**
- **Requisit**: Crear **3 categories principals** (ex: “Electrònica”, “Ropa”, “Llibres”).
- **Descripció**: Les categories ajuden a organitzar els productes i milloren la navegació de l’usuari.
- **Objectiu**: Aplicar una estructura lògica que faciliti la cerca i descoberta de productes (relacionat amb la *Three-Click Rule*).

### **2.3. Afegir productes**
- **Requisit**: Afegir **3 productes per categoria** (9 productes en total).
- **Camps obligatoris per producte**:
  - Nom del producte  
  - Descripció detallada (mínim 2–3 frases)  
  - Preu (en una moneda vàlida)  
- **Objectiu**: Assegurar que la botiga contingui contingut realista i funcional per a proves d’usuari.

### **2.4. Configuració de la divisa**
- **Descripció**: Configurar almenys **una divisa** (ex: EUR, USD) i assegurar-se que es mostra correctament als preus dels productes.
- **Objectiu**: Simular una botiga preparada per a mercats internacionals o locals segons el context.

### **2.5. Suport multi-idioma**
- **Descripció**: Activar la funcionalitat de **canvi d’idioma** (ex: català, castellà, anglès) i assegurar que les categories i productes es puguin veure en més d’un idioma (com a mínim el nom i la descripció dels productes).
- **Objectiu**: Demostrar la capacitat d’adaptar la botiga a diferents públics lingüístics, un factor clau en e-commerce global.

### **2.6. Fidelització d’usuaris**
- **Descripció**: Configurar les funcionalitats següents:
  - **Registre d’usuaris**: Els clients han de poder crear un compte.
  - **Subscripció a butlletins**: Opció per rebre correus promocionals o novetats.
- **Objectiu**: Implementar eines bàsiques de màrqueting digital i retenció de clients, essencials en qualsevol botiga online moderna.

## **3. Recomanacions d’usabilitat**

- Assegureu-vos que **qualsevol producte es pugui trobar en 3 clics o menys** des de la pàgina d’inici (aplicació de la *Three-Click Rule*).
- Verifiqueu que el procés de navegació sigui **intuïtiu**, especialment en categories i filtres.
- Optimitzeu el temps de càrrega i la claredat dels missatges d’error o confirmació.

## **4. Tasques extra (opcional però valorat)**

- Instal·lar i configurar **més de dues** botigues virtuals.
- Comparar les diferències entre plataformes en termes de:
  - Facilitat d’instal·lació  
  - Personalització  
  - Escalabilitat  
  - Suport de plugins/extensions  
- Documentar breument aquesta comparació com a annex.

## **5. Entrega**

La pràctica s’ha d’entregar de la manera següent:

### **5.1. Demostració en directe al professor**
- **Imprescindible**: Mostrar el funcionament complet de les botigues instal·lades.
- Explicar **què s’ha implementat**, **on es troba cada funcionalitat** i **com s’ha resolt**.
- Destacar qualsevol **dificultat tècnica** i com s’ha superat.

### **5.2. Documentació obligatòria en GitHub**

Heu de crear un **repositori públic a GitHub** on documentareu tot el treball realitzat durant la pràctica. Aquesta documentació es farà **exclusivament al fitxer `README.md`** del repositori (no s’acceptaran PDFs ni documents externs).

El `README.md` ha de contenir, com a mínim, la següent informació:

- **Llistat de les botigues virtuals instal·lades** (indicant versió i entorn d’execució, ex: PrestaShop 8.1 sobre LAMP).
- **Captures de pantalla clau** que demostren el compliment dels requisits:
  - Canvi d’aparença (tema actiu)
  - Categories i productes (3 categories amb 3 productes cadascuna)
  - Configuració de divisa
  - Suport multi-idioma (pantalla en almenys dos idiomes)
  - Registre d’usuari i subscripció a butlletí
- **Breu reflexió comparativa** (mínim 150 paraules) sobre:
  - Quina plataforma us ha semblat més intuïtiva i per què.
  - Dificultats tècniques trobades i com les heu resolt.
  - Compliment (o no) de la *Three-Click Rule* en les vostres botigues.

> **Important**:  
> - El repositori ha d’estar **públic** i accessible pel professor en el moment de la demostració.  
> - El `README.md` ha d’estar ben format (amb títols, llistes i imatges inserides correctament amb Markdown).  
> - No cal pujar el codi complet de les botigues, només la documentació.  

## **6. Recursos de suport**

- **Three-click rule**: [https://en.wikipedia.org/wiki/Three-click_rule](https://en.wikipedia.org/wiki/Three-click_rule)  
- **Online shopping**: [https://en.wikipedia.org/wiki/Online_shopping](https://en.wikipedia.org/wiki/Online_shopping)  
