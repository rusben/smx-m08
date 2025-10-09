# Guia completa per exportar una instal·lació local de WordPress a un hosting virtual

Aquesta guia detalla tots els passos necessaris per migrar correctament una instal·lació local de WordPress a un entorn d'hosting compartit o virtual, assegurant que tot funcioni correctament després de la migració.



## 1. Preparació prèvia

### 1.1. Verifica requisits del hosting
- Versió de PHP compatible (recomanat PHP 8.0+)
- Versió de MySQL/MariaDB compatible (5.7+ o MariaDB 10.3+)
- Espai de disc suficient
- Permisos d'escriptura als directoris necessaris

### 1.2. Crea una còpia de seguretat
Abans de començar, fes una còpia de seguretat completa de:
- Tots els fitxers de WordPress
- La base de dades local


## 2. Exportar la base de dades del servidor local

### 2.1. Exportació amb mysqldump
```bash
mysqldump --no-tablespaces -u [usuari] -p [nom_base_dades] > wordpress_export.sql
```

**Paràmetres explicats:**
- `--no-tablespaces`: Evita errors amb permisos de tablespace en alguns hostings
- `-u [usuari]`: El teu usuari de MySQL
- `-p`: Demanarà la contrasenya de forma segura
- `[nom_base_dades]`: Nom de la teva base de dades local
- `> wordpress_export.sql`: Fitxer de sortida

### 2.2. Alternativa: Exportació des de phpMyAdmin
Si no tens accés a la línia de comandes:
1. Accedeix a phpMyAdmin
2. Selecciona la base de dades de WordPress
3. Clica a "Exportar" → "Ràpid" → Format SQL
4. Descarrega el fitxer



## 3. Actualitzar les URLs a la base de dades

### 3.1. Mètode manual (recomanat per migracions simples)
Obre el fitxer `wordpress_export.sql` amb un editor de text i reemplaça:

- **Cerca:** `http://localhost/[ruta]` o `http://127.0.0.1/[ruta]`
- **Reemplaça per:** `https://[teu-domini.com]`

**Exemple:**
```sql
-- Abans
UPDATE `wp_options` SET `option_value` = 'http://localhost/miweb' WHERE `option_name` = 'siteurl';
UPDATE `wp_options` SET `option_value` = 'http://localhost/miweb' WHERE `option_name` = 'home';

-- Després
UPDATE `wp_options` SET `option_value` = 'https://www.exemple.com' WHERE `option_name` = 'siteurl';
UPDATE `wp_options` SET `option_value` = 'https://www.exemple.com' WHERE `option_name` = 'home';
```

### 3.2. Mètode avançat: Utilitzar WP-CLI (recomanat per instal·lacions complexes)
Si tens accés a WP-CLI al servidor de destinació:
```bash
wp search-replace 'http://localhost/miweb' 'https://www.exemple.com' --all-tables
```

### 3.3. Consideracions importants
- Reemplaça **totes** les instàncies de la URL local, no només les de `wp_options`
- Tingues en compte subdirectoris: `http://localhost/miweb` vs `http://localhost`
- Si utilitzes HTTPS al hosting, assegura't que totes les URLs siguin `https://`



## 4. Exportar els fitxers de WordPress

### 4.1. Comprimir tots els fitxers
```bash
# Des de la carpeta arrel de WordPress
zip -r wordpress_export.zip .
```

O bé, si prefereixes tar.gz:
```bash
tar -czf wordpress_export.tar.gz .
```

### 4.2. Elements a incloure
- Tots els fitxers i carpetes de WordPress
- El directori `wp-content` (plugins, temes, pujades)
- El fitxer `.htaccess` (si existeix)
- El fitxer `wp-config.php` **(però no el carreguis directament al hosting)**


## 5. Configuració al hosting

### 5.1. Crear la base de dades al hosting
1. Accedeix al panell de control del hosting (cPanel, Plesk, etc.)
2. Crea una nova base de dades MySQL
3. Crea un usuari de base de dades i assigna-li tots els permisos
4. Anota les credencials: nom de base de dades, usuari i contrasenya

### 5.2. Importar la base de dades
**Via phpMyAdmin:**
1. Selecciona la nova base de dades
2. Clica "Importar"
3. Selecciona el fitxer `wordpress_export.sql` actualitzat
4. Clica "Executar"

**Via línia de comandes (si tens accés SSH):**
```bash
mysql -u [usuari_hosting] -p [nom_base_dades_hosting] < wordpress_export.sql
```

### 5.3. Pujar els fitxers al hosting
1. Utilitza un client FTP (FileZilla, Cyberduck) o el gestor d'arxius del panell de control
2. Pujar tots els fitxers al directori arrel del teu domini (normalment `public_html` o `htdocs`)
3. Assegura't que els permisos siguin correctes:
   - Carpetes: 755
   - Fitxers: 644
   - `wp-config.php`: 600 (per seguretat)

### 5.4. Configurar wp-config.php
Edita el fitxer `wp-config.php` amb les noves credencials de la base de dades:

```php
// ** Configuració de la Base de Dades ** //
define('DB_NAME', 'nom_base_dades_hosting');
define('DB_USER', 'usuari_base_dades_hosting');
define('DB_PASSWORD', 'contrasenya_base_dades_hosting');
define('DB_HOST', 'localhost'); // Normalment 'localhost' en hosting compartit
```

**Afegir constants útils per a la migració:**
```php
// Forçar URLs (opcional, útil si hi ha problemes)
define('WP_HOME', 'https://www.exemple.com');
define('WP_SITEURL', 'https://www.exemple.com');

// Desactivar errors en producció
define('WP_DEBUG', false);
```



## 6. Verificació i resolució de problemes

### 6.1. Verificacions bàsiques
- Accedeix al teu lloc web: `https://www.exemple.com`
- Comprova que el panell d'administració funcioni: `https://www.exemple.com/wp-admin`
- Verifica que totes les imatges i fitxers es carreguin correctament
- Prova formularis de contacte i funcionalitats especials

### 6.2. Problemes comuns i solucions

**Problema: Pàgina en blanc o errors 500**
- Comprova els permisos dels fitxers
- Activa temporalment `WP_DEBUG` per veure errors
- Verifica la compatibilitat de PHP

**Problema: Imatges no es carreguen**
- Assegura't que has actualitzat totes les URLs a la base de dades
- Comprova que la carpeta `wp-content/uploads` s'ha pujat correctament

**Problema: Enllaços no funcionen (404)**
- Vés a `Configuració → Enllaços permanents` i desa la configuració (això regenera el `.htaccess`)
- Assegura't que el mod_rewrite estigui activat al servidor

**Problema: Errors de connexió a la base de dades**
- Verifica les credencials al `wp-config.php`
- Comprova que la base de dades existeix i l'usuari té permisos



## 7. Passos addicionals recomanats

### 7.1. Seguretat post-migració
- Canvia les contrasenyes d'administrador
- Instal·la un plugin de seguretat (Wordfence, Sucuri)
- Configura còpies de seguretat automàtiques

### 7.2. Optimització
- Configura la caché (WP Super Cache, W3 Total Cache)
- Optimitza la base de dades
- Comprimeix imatges

### 7.3. Verificació SEO
- Configura redireccions 301 si cal
- Verifica el sitemap
- Actualitza Google Search Console



## 8. Alternatives: Plugins de migració

Si prefereixes una solució automatitzada, considera aquests plugins:

- **All-in-One WP Migration**: Exporta/importa tot en un sol fitxer
- **Duplicator**: Crea paquets de migració amb assistent
- **WP Migrate**: Sincronitza bases de dades entre entorns

**Nota:** Aquests plugins poden tenir limitacions en versions gratuïtes i poden no ser adequats per a llocs molt grans.
