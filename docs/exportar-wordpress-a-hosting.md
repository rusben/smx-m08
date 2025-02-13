# Exportar una instal·lació de WordPress

## Exportar la base de datos del servidor local
```bash
mysqldump --no-tablespaces -u usuario -p bbdd > salida.sql
```

## Actualitzar las URLs de la base de datos

Abrimos el fichero `salida.sql` y reemplazamos de la siguiente forma:

Reemplazamos `http://localhost` por `https://hosting`

Sustituid https://hosting por la URL donde habéis instalado WordPress.

