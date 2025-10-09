# Configuració de WordPress

## Configuració de `mod_rewrite` per a WordPress dins del virtual host **domini.local**

Perquè WordPress funcioni correctament amb **URLs amigables** (permalinks), cal configurar el mòdul `mod_rewrite` d’Apache dins del teu virtual host específic: **`domini.local`**.

### Passos a seguir

### 1. **Activa el mòdul `rewrite` (si encara no ho has fet)**

```bash
sudo a2enmod rewrite
```

> Aquest pas només cal fer-lo un cop. Si ja l’has activat abans, pots continuar.

### 2. **Edita el fitxer del teu virtual host**

El fitxer de configuració del teu lloc probablement es diu:

```
/etc/apache2/sites-available/domini.local.conf
```

Edita’l amb:

```bash
sudo nano /etc/apache2/sites-available/domini.local.conf
```

### 3. **Configura correctament la directiva `<Directory>`**

Assegura’t que el bloc `<VirtualHost>` contingui una secció `<Directory>` que apunti al directori on tens instal·lat WordPress (per exemple, `/var/www/domini.local`) i que inclogui **`AllowOverride All`**.

Exemple complet:

```apache
<VirtualHost *:80>
    ServerName domini.local
    ServerAlias www.domini.local
    DocumentRoot /var/www/domini.local

    <Directory /var/www/domini.local>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/domini.local_error.log
    CustomLog ${APACHE_LOG_DIR}/domini.local_access.log combined
</VirtualHost>
```

> **Important**:  
> - El camí dins de `<Directory>` **ha de coincidir exactament** amb el `DocumentRoot`.  
> - `AllowOverride All` és essencial perquè Apache llegeixi el fitxer `.htaccess` de WordPress.

### 4. **Habilita el virtual host (si encara no ho està)**

```bash
sudo a2ensite domini.local.conf
```

> Això crea un enllaç simbòlic a `/etc/apache2/sites-enabled/`.

### 5. **Recarrega Apache**

```bash
sudo systemctl reload apache2
```

> Si tens cap dubte o has fet canvis importants, pots fer:
>
> ```bash
> sudo systemctl restart apache2
> ```

### 6. **Configura els permalinks a WordPress**

1. Assegura’t que el fitxer `.htaccess` existeixi a:
   ```
   /var/www/domini.local/.htaccess
   ```
2. WordPress ha de tenir permisos per escriure-hi (almenys temporalment).
3. Ves al **Tauler de WordPress → Configuració → Enllaços permanents** i prem **"Desa canvis"**.
4. Comprova que el `.htaccess` contingui les regles típiques de WordPress:

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

### Solució ràpida de problemes

- **Les URLs amigables no funcionen?**  
  Verifica:
  ```bash
  apache2ctl -M | grep rewrite
  ```
  Hauries de veure `rewrite_module (shared)`.

- **Error 500?**  
  Comprova els logs:
  ```bash
  sudo tail -f /var/log/apache2/domini.local_error.log
  ```

- **No es genera `.htaccess`?**  
  Assegura’t que la carpeta tingui els permisos correctes:
  ```bash
  sudo chown -R www-data:www-data /var/www/domini.local
  sudo chmod 644 /var/www/domini.local/.htaccess
  ```
