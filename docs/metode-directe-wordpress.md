# Configuració de WordPress
### **Activar el mètode directe a WordPress per evitar l’ús de FTP**

Per defecte, WordPress pot sol·licitar credencials FTP quan intentes instal·lar o actualitzar plugins, temes o el nucli del lloc. Això sol passar quan el servidor no té els permisos adequats per escriure directament als fitxers.

Per **evitar aquesta sol·licitud** i permetre que WordPress gestioni les actualitzacions i instal·lacions de forma **directa**, pots configurar el mètode de fitxers (`FS_METHOD`) al fitxer de configuració de WordPress.

#### **Passos per activar el mètode directe**

1. Accedeix al directori arrel de la teva instal·lació de WordPress (normalment via FTP, cPanel o l’explorador de fitxers del teu proveïdor d’allotjament).
2. Localitza i obre el fitxer **`wp-config.php`**.
3. Just abans de la línia que diu `/* That's all, stop editing! Happy publishing. */`, afegeix la següent línia:

```php
define('FS_METHOD', 'direct');
```

4. Guarda els canvis i puja el fitxer (si l’has editat localment).

#### **Nota important**
Assegura’t que els **permisos dels fitxers i directoris** del teu lloc web siguin correctes perquè WordPress pugui escriure-hi sense problemes. Si no, l’ús del mètode `direct` podria causar errors.
