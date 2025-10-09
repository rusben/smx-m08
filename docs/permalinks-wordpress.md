# Configuració de WordPress
## **Configurar permalinks (enllaços permanents) a WordPress**

### **Què són els permalinks?**

Els **permalinks** (o *enllaços permanents*) són les **URLs amigables** que WordPress genera per a cada entrada, pàgina, categoria o altra secció del teu lloc web. En lloc d’una URL tècnica com `?p=123`, pots tenir una URL llegible com `/blog/com-fer-una-web-amb-wordpress/`.

A més de millorar l’**experiència de l’usuari**, els permalinks ben estructurats són essencials per al **posicionament web (SEO)**.

### **Passos per configurar els permalinks**

#### 1. **Accedeix a la configuració de permalinks**
Dins del tauler d’administració de WordPress:

> **Configuració → Permalinks**

Aquí podràs triar entre diverses estructures predefinides o definir-ne una personalitzada.

#### 2. **Tria l’estructura dels permalinks**
Les opcions més habituals són:

- **Plana** (per defecte): `?p=123` → **No recomanada** (no és amigable ni per a usuaris ni per a motors de cerca).
- **Nom de l’entrada**: `/nom-de-l-entrada/` → **La més recomanada** per SEO i usabilitat.
- **Data i nom**: `/2025/04/05/nom-de-l-entrada/`
- **Numèrica**: `/archives/123`
- **Personalitzada**: pots afegir estructures com `/blog/%postname%/` o `/categoria/%postname%/`.

> ✅ **Recomanació**: Utilitza **Nom de l’entrada** o una variant personalitzada amb `%postname%`.

#### 3. **Guarda els canvis**
Fes clic a **"Guarda els canvis"**. WordPress intentarà actualitzar automàticament el fitxer `.htaccess`.

### **El fitxer `.htaccess`: clau per als permalinks**

Perquè els permalinks funcionin correctament en servidors Apache (els més habituals), cal que el **fitxer `.htaccess`** existeixi i tingui els permisos adequats al directori arrel del teu lloc web (on hi ha `wp-config.php`, `wp-admin`, etc.).

#### 🔧 Contingut mínim necessari del `.htaccess`

```apache
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]
</IfModule>
# END WordPress
```

#### 📌 Notes importants:

- El fitxer `.htaccess` és **ocult** per defecte (perquè comença amb un punt). Assegura’t que el teu client FTP o gestor d’arxius el mostri.
- Si WordPress **no pot escriure** en aquest fitxer (per manca de permisos), et mostrarà el codi anterior a la pàgina de permalinks perquè el copiïs manualment.
- Assegura’t que el mòdul **`mod_rewrite`** estigui activat al servidor Apache. La majoria d’allotjaments compartits el tenen activat per defecte.

### **Problemes habituals i solucions**

| Problema | Causa possible | Solució |
|--------|----------------|--------|
| **Error 404 en totes les pàgines (excepte la d’inici)** | El `.htaccess` no existeix o no té el codi correcte | Crea o actualitza el fitxer amb el codi anterior |
| **WordPress no pot escriure al `.htaccess`** | Permís d’escriptura insuficient | Canvia els permisos del fitxer a **644** o **666** temporalment, o afegeix el codi manualment |
| **Els permalinks no funcionen en localhost (XAMPP/MAMP)** | `mod_rewrite` desactivat | Activa el mòdul al fitxer `httpd.conf` del teu servidor local |
| **Canvis no surten efecte** | Caché del navegador o del plugin | Esborra la caché del navegador i, si fas servir un plugin de caché, esborra-la també |

### **Consells addicionals**

- **Evita canviar l’estructura dels permalinks** un cop el lloc està publicat, ja que pots trencar enllaços existents (i perdre trànsit). Si ho has de fer, configura **redireccions 301**.
- Si utilitzes **Nginx** en lloc d’Apache, **no cal `.htaccess`**. En aquest cas, has de configurar les regles de reescriptura al fitxer de configuració del servidor.
- Alguns plugins de seguretat o caché poden interferir amb els permalinks. Si tens problemes, prova de desactivar-los temporalment.

### **Conclusió**

Configurar correctament els permalinks és un pas **senzill però essencial** per a qualsevol lloc WordPress professional. Amb una estructura clara i el fitxer `.htaccess` ben configurat, assegures que el teu lloc sigui **accessible, amigable i ben posicionat**.

> 🛠️ **Recorda**: després de canviar els permalinks, **prova sempre** que totes les pàgines i entrades es carreguin correctament.
