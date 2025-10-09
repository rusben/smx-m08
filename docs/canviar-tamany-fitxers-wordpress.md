# Configuració de WordPress
## Com augmentar la mida màxima dels fitxers que es poden pujar a WordPress

Per defecte, el servidor PHP limita la mida dels fitxers que es poden pujar a través de formularis web, com el gestor de mitjans de WordPress. Si necessites pujar fitxers més grans (imatges, vídeos, documents, etc.), cal modificar la configuració de PHP. Aquesta guia explica com fer-ho directament al fitxer de configuració del servidor web.

> ⚠️ **Nota important**: La ruta exacta del fitxer de configuració depèn de la versió de PHP instal·lada i del tipus de servidor web (Apache, Nginx amb PHP-FPM, etc.). Aquesta guia s’adapta a qualsevol versió.

## Passos a seguir

### 1. Localitzar el fitxer de configuració de PHP

Primer, assegura’t de tenir la comanda `locate` disponible:

```bash
sudo apt install mlocate
sudo updatedb
```

A continuació, busca tots els fitxers de configuració de PHP:

```bash
locate php.ini
```

Exemple de sortida:

```
/etc/php/8.2/apache2/php.ini
/etc/php/8.2/cli/php.ini
/etc/php/8.2/fpm/php.ini
/usr/lib/php/8.2/php.ini-development
/usr/lib/php/8.2/php.ini-production
```

> 🔍 **Quin fitxer has d’editar?**  
> - Si utilitzes **Apache**, edita el fitxer dins de `/etc/php/[versió]/apache2/php.ini`.  
> - Si utilitzes **Nginx amb PHP-FPM**, edita el de `/etc/php/[versió]/fpm/php.ini`.  
> - El fitxer `cli/php.ini` només afecta els scripts executats des de la línia d’ordres i **no** el teu lloc web.

Per confirmar quina versió de PHP utilitza el teu lloc web, pots crear temporalment un fitxer anomenat `info.php` a la carpeta arrel del teu lloc:

```php
<?php phpinfo(); ?>
```

Obre’l des del navegador (ex: `http://teusite.com/info.php`) i mira:
- La versió de PHP.
- La ruta del fitxer `php.ini` que està carregant (apareix a la secció "Loaded Configuration File").

Un cop verificat, **esborra** aquest fitxer per motius de seguretat.

### 2. Modificar els paràmetres de pujada

Obre el fitxer `php.ini` corresponent al teu servidor web. Per exemple, si la teva versió de PHP és la 8.2 i utilitzes Apache:

```bash
sudo nano /etc/php/8.2/apache2/php.ini
```

> ⚠️ Substitueix `8.2` per la teva versió real (pot ser `7.4`, `8.0`, `8.1`, etc.).

Cerca i modifica les següents directives:

```ini
upload_max_filesize = 64M
post_max_size = 64M
max_execution_time = 300
```

Explicació dels paràmetres:
- **`upload_max_filesize`**: mida màxima permesa per a un únic fitxer.
- **`post_max_size`**: mida màxima total de dades enviades en una sol·licitud POST. Ha de ser igual o superior a `upload_max_filesize`.
- **`max_execution_time`**: temps màxim (en segons) que un script pot executar-se. Útil per pujades lentes o grans.

> 💡 **Exemple**: Per permetre pujar fitxers fins a 128 MB:
> ```ini
> upload_max_filesize = 128M
> post_max_size = 128M
> max_execution_time = 600
> ```

Guarda els canvis i tanca l’editor.

### 3. Reiniciar el servidor web

Els canvis no tindran efecte fins que reinicis el servidor PHP o el servidor web:

- **Amb Apache**:
  ```bash
  sudo systemctl restart apache2
  ```

- **Amb Nginx + PHP-FPM**:
  ```bash
  sudo systemctl restart php[versió]-fpm
  sudo systemctl restart nginx
  ```

> Exemple per PHP 8.1:  
> ```bash
> sudo systemctl restart php8.1-fpm
> sudo systemctl restart nginx
> ```

### 4. Verificar els canvis

Torna a crear (i després esborrar) el fitxer `info.php` per comprovar que els valors s’han actualitzat correctament des del navegador. També pots provar de pujar un fitxer des del panell d’administració de WordPress.

## Resum de valors recomanats

| Paràmetre               | Valor suggerit       |
|------------------------|----------------------|
| `upload_max_filesize`  | `64M`, `128M` o més |
| `post_max_size`        | Igual o major que `upload_max_filesize` |
| `max_execution_time`   | `300` (5 minuts) o més si cal |
