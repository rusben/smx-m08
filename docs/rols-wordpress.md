# Configuració de WordPress
## Rols
### **Introducció**

Una de les grans virtuts de WordPress és la seva flexibilitat per adaptar-se a diferents tipus d’ús. Quan una sola persona gestiona un bloc, els rols d’usuari poden semblar poc rellevants. No obstant això, quan el lloc web serveix a una organització —per exemple, com a web corporativa amb múltiples col·laboradors— els rols es converteixen en una eina fonamental per gestionar eficientment qui pot fer què.

WordPress permet assignar diferents **graus de permís** a cada usuari mitjançant un sistema de **rols i capacitats**. Això facilita una col·laboració ordenada, segura i eficaç.

### **Com afegir usuaris i assignar rols**

Des del menú **Usuaris → Afegeix nou**, pots crear comptes per a altres persones. Només cal:

- Assignar un **nom d’usuari únic**.
- Establir una **contrasenya**.
- Introduir una **adreça de correu electrònic**.

Un cop creat el compte, l’usuari rebrà per correu les seves credencials i podrà accedir al tauler d’administració amb el **rol assignat**.

### **Rols estàndard a WordPress**

WordPress inclou **cinc rols predefinits**, cadascun amb un conjunt específic de **capacitats** (permisos per realitzar accions concretes). Aquests rols són:

| Rol | Capacitats principals |
|-----|------------------------|
| **Administrador** | Accés total a totes les funcions del lloc: gestió de continguts, usuaris, plugins, temes, opcions, etc. Pot canviar contrasenyes i fins i tot eliminar el lloc. |
| **Editor** | Pot crear, editar, publicar i eliminar **entrades i pàgines pròpies i d’altres usuaris**. No pot gestionar usuaris ni canviar la configuració del lloc. |
| **Autor** | Pot crear, editar i publicar **només les seves pròpies entrades**. No pot gestionar pàgines ni contingut d’altres. |
| **Col·laborador** | Pot escriure i editar **les seves entrades**, però **no les pot publicar**. Cal que un editor o administrador les publiqui. |
| **Subscriptor** | Només pot **editar el seu perfil** i rebre notificacions per correu de noves publicacions. No pot crear ni gestionar contingut. |

> 💡 **Nota**: Els noms dels rols en anglès (Administrator, Editor, Author, Contributor, Subscriber) són útils per consultar la documentació oficial o desenvolupar plugins.

### **Capacitats (Capabilities)**

Cada rol està format per un conjunt de **capacitats**, que són permisos individuals com ara:

- `publish_posts`
- `edit_pages`
- `moderate_comments`
- `manage_options`
- `edit_users`

Hi ha **més de 30 capacitats** definides per defecte. L’administrador té totes; els altres rols tenen un subconjunt decreixent segons el seu nivell de responsabilitat.

Aquest sistema substitueix els antics **nivells d’usuari** de WordPress 1.5, agrupant permisos similars en rols més intuïtius. Per exemple:
- El **subscriptor** correspon al nivell 0.
- L’**editor** engloba els antics nivells 5 i 6.

### **Aplicació en entorns corporatius**

En una web corporativa on col·laboren diferents departaments (marketing, suport, redacció, etc.), els rols permeten:

- Assegurar que només el personal autoritzat pugui publicar contingut.
- Delegar tasques sense comprometre la seguretat del lloc.
- Mantenir una estructura clara de responsabilitats.

Així, el bloc esdevé més **dinàmic, segur i escalable**.

### **Cas d’ús avançat: Dues instàncies de WordPress en un mateix servidor**

Un escenari comú en entorns professionals és tenir **dos llocs WordPress** en un sol servidor:
- Un al **directori arrel** (`/`)
- Un altre en un **subdirectori** (`/blog`, `/noticies`, etc.)

Amb una configuració avançada, és possible:
- Fer servir la **mateixa base de dades**.
- Utilitzar **prefijos de taula diferents** per a cada instància (ex: `wp_` i `wp2_`).
- **Compartir la taula d’usuaris** (`wp_users` i `wp_usermeta`).
- **Assignar rols i capacitats diferents** segons el lloc.

Això requereix una comprensió profunda del sistema de rols i de com WordPress gestiona les metadades dels usuaris. És especialment útil per a empreses que volen mantenir una identitat d’usuari única però amb permisos contextuals.

> ⚠️ **Atenció**: Aquesta configuració no és trivial i pot requerir modificacions personalitzades o plugins especialitzats.

### **Resum visual: Permisos per rol**

| Tasca | Administrador | Editor | Autor | Col·laborador |
|------|----------------|--------|-------|----------------|
| Crear entrades | ✅ | ✅ | ✅ | ✅ |
| Publicar entrades | ✅ | ✅ | ✅ | ❌ |
| Editar/eliminar entrades pròpies | ✅ | ✅ | ✅ | ✅ |
| Editar/eliminar entrades d’altres | ✅ | ✅ | ❌ | ❌ |
| Crear pàgines | ✅ | ✅ | ❌ | ❌ |
| Gestionar categories | ✅ | ✅ | ❌ | ❌ |
| Gestionar enllaços (Blogroll) | ✅ | ✅ | ❌ | ❌ |
| Canviar temes/widgets | ✅ | ❌ | ❌ | ❌ |
| Gestionar usuaris | ✅ | ❌ | ❌ | ❌ |
| Canviar opcions generals | ✅ | ❌ | ❌ | ❌ |

## Configurar permalinks (enllaços permanents)
Per a que funcionen els enllaços permanents heu de:

Assegureu-vos que teniu el fitxer `.htaccess` en el directori principal de la vostra web.
~~~
 # Fitxer .htaccess (al directori principal de la vostra web)
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
~~~
