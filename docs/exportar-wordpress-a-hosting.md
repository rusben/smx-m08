# Guia completa per exportar una instal·lació local de WordPress (amb domini personalitzat) a un hosting virtual

Aquesta guia detalla tots els passos per migrar correctament una instal·lació local de WordPress que s’executa sota un domini com `http://domini.local` cap a un entorn de hosting en producció (per exemple, `https://www.exemple.com`).

## 1. Preparació prèvia

### 1.1. Identifica la URL exacta de la teva instal·lació local
Normalment serà alguna d’aquestes:
- `http://domini.local`
- `http://domini.test`
- `http://miweb.local`
- `https://domini.local` (si tens HTTPS local)

> **Important**: Assegura’t de conèixer **l’URL exacta** que apareix a `Configuració → Adreça del WordPress (WordPress Address)` i `Adreça del lloc (Site Address)` dins del panell d’administració.

### 1.2. Verifica requisits del hosting
- PHP 7.4 o superior (recomanat: 8.0+)
- MySQL 5.7+ o MariaDB 10.3+
- Suport per a `mod_rewrite` (per enllaços amigables)
- Espai de disc i memòria suficients

### 1.3. Còpia de seguretat
Fes una còpia de:
- Tots els fitxers del projecte
- La base de dades local

## 2. Exportar la base de dades del servidor local

### 2.1. Amb `mysqldump` (recomanat)
```bash
mysqldump --no-tablespaces -u [usuari] -p [nom_base_dades] > wordpress_export.sql
```

> Substitueix `[usuari]` i `[nom_base_dades]` pels valors reals del teu entorn local.

### 2.2. Alternativa: phpMyAdmin
1. Accedeix a phpMyAdmin
2. Selecciona la base de dades de WordPress
3. Clica "Exportar" → "Ràpid" → Format SQL
4. Guarda el fitxer

## 3. Actualitzar les URLs a la base de dades

Com que la teva URL local és `http://domini.local`, **has de reemplaçar aquesta cadena exacta** per la nova URL del teu lloc en producció.

### 3.1. Reemplaçament manual (per fitxers petits o mitjans)

Obre el fitxer `wordpress_export.sql` amb un editor de text compatible (com VS Code, Sublime Text o Notepad++) i fes aquestes substitucions:

| Cerca (exacte)        | Reemplaça per             |
|-----------------------|---------------------------|
| `http://domini.local` | `https://www.exemple.com` |

> **Assegura’t de fer el reemplaçament en tot el fitxer**, ja que les URLs poden aparèixer en:
> - `wp_options` (camp `option_value`)
> - `wp_posts` (contingut dels articles, metaboxes, etc.)
> - `wp_postmeta` (imatges destacades, metaboxes personalitzades)
> - `wp_comments`, `wp_commentmeta`, etc.

> **Consell**: Si el teu domini local utilitza HTTPS (`https://domini.local`), reemplaça també aquesta versió.

### 3.2. Reemplaçament amb línia de comandes (Linux/macOS)

Pots fer el reemplaçament directament des del terminal:

```bash
sed -i 's|http://domini\.local|https://www.exemple.com|g' wordpress_export.sql
```

### 3.3. Mètode segur: WP-CLI al servidor de destinació (recomanat per llocs grans)

Si pots instal·lar WP-CLI al hosting o ja hi tens accés:

1. Pujar la base de dades **sense modificar** (amb `http://domini.local`)
2. Importar-la
3. Executar:
   ```bash
   wp search-replace 'http://domini.local' 'https://www.exemple.com' --all-tables --precise
   ```

Aquest mètode evita corrupció de dades serialitzades (com en metaboxes o opcions de temes/plugins).

## 4. Exportar els fitxers de WordPress

### 4.1. Comprimir tots els fitxers
Des de la carpeta arrel del teu projecte:

```bash
zip -r wordpress_fitxers.zip .
```

O bé:

```bash
tar -czf wordpress_fitxers.tar.gz .
```

> Inclou:
> - `wp-content/` (temes, plugins, pujades)
> - `.htaccess` (si existeix)
> - `wp-config.php` (però **no el pugis directament** al hosting sense editar-lo)

> No cal incloure:
> - Fitxers de configuració d’entorn local (`.env`, `docker-compose.yml`, etc.)
> - Carpetes de desenvolupament (`node_modules`, etc.)

## 5. Configuració al hosting

### 5.1. Crea la base de dades al hosting
1. Al panell de control (cPanel, Plesk...), crea una base de dades MySQL
2. Crea un usuari i assigna-li permisos totals
3. Anota: nom de BD, usuari i contrasenya

### 5.2. Importa la base de dades actualitzada
Via phpMyAdmin o línia de comandes:

```bash
mysql -u [usuari_hosting] -p [nom_bd_hosting] < wordpress_export.sql
```

### 5.3. Pujar fitxers al servidor
- Utilitza FTP/SFTP o el gestor d’arxius del hosting
- Pujar tots els fitxers a la carpeta arrel del domini (ex: `public_html/`)
- Assegura’t dels permisos:
  - Carpetes: `755`
  - Fitxers: `644`
  - `wp-config.php`: `600` (per seguretat)

### 5.4. Actualitza `wp-config.php`
Edita el fitxer amb les credencials del hosting:

```php
define('DB_NAME',     'nom_bd_hosting');
define('DB_USER',     'usuari_bd_hosting');
define('DB_PASSWORD', 'contrasenya_bd_hosting');
define('DB_HOST',     'localhost');
```

Opcionalment, força les URLs (útil si hi ha problemes):

```php
define('WP_HOME',    'https://www.exemple.com');
define('WP_SITEURL', 'https://www.exemple.com');
```

> 🔒 Desactiva el mode de depuració en producció:
> ```php
> define('WP_DEBUG', false);
> ```

## 6. Verificació final

1. **Accedeix al lloc**: `https://www.exemple.com`
2. **Prova l’administració**: `https://www.exemple.com/wp-admin`
3. **Comprova continguts**:
   - Imatges carregades
   - Enllaços interns
   - Formularis
   - Funcionalitats de plugins
4. **Regenera enllaços permanents**:
   - Ves a `Configuració → Enllaços permanents`
   - Clica "Desa canvis" (això regenera el `.htaccess`)

## 7. Consells addicionals

- **Si utilitzes un CDN o cache**, purga-la després de la migració.
- **Configura redireccions HTTPS** si el hosting no ho fa automàticament.
- **Actualitza DNS** si estàs apuntant un domini nou.
- **Verifica Google Search Console i Analytics** per assegurar-te que segueixen funcionant.

## Resum de substitucions clau

| Entorn local         | Entorn producció       |
|----------------------|------------------------|
| `http://domini.local`| `https://www.exemple.com` |
| Base de dades local  | Base de dades del hosting |
| Fitxers locals       | Fitxers al `public_html` |

---

Amb aquesta guia adaptada al teu entorn (`domini.local`), la migració hauria de ser fluida i sense sorpreses. Recorda: **sempre fes còpies de seguretat abans de començar!**
