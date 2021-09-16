# Introducció

## Registre a github

## Creació d'un repositori a github

## Clonar el repositori a la nostra màquina

Exemple de clonació.
```console
user@school:~$ git clone https://github.com/rusben/my-first-webpage.git
```

## Comprovar l'estat del nostre repositori

```console
user@school:~$ git status
 En la branca master
 La vostra branca està al dia amb 'origin/master'.
 Fitxers no seguits:
  (useu "git add <fitxer>..." per a incloure-ho en què es cometrà)
     mypage.html
     style.css

 no hi ha res afegit a cometre però fitxers no seguits estan presents (useu "git add" per a seguir-los)
```

## Afegir fitxers al nostre repositori
Per incloure tots els fitxers que tenim en color vermell (no seguits o modificats) farem:

```console
user@school:~$ git add .
```

Si volem afegir un únic fitxer fariem, git add i el nom del fitxer:

```console
user@school:~$ git add mypage.css
```


## Guardar un registre dels canvis
Un cop hem afegit els fitxers mitjançant al comanda '''git add''' tindrem els fitxers preparats per a enregistrar el canvi.

Els canvis els farem permanents a la nostra còpia local mitjançant la comanda '''git commit'''

```console
user@school:~$ git commit -m "Missatge amb la descripció dels canvis realitzats"
```

Un cop fet el commit, haurem guardat un registre amb els canvis realitzats, podem veure la llista de commits mitjançant la comanda '''git log'''.

```console
user@school:~$ git log
 commit 5e83b039daaf4536f4467f19e9639b50f5cc853c
 Author: Rubén <rarroyo2@elpuig.xeill.net>
 Date:   Thu Nov 23 15:35:37 2017 +0100

    Added mypage + style

 commit 015122609aafc31eac9e02608ffcf10b3888a803
 Author: Rubén <rarroyo2@elpuig.xeill.net>
 Date:   Thu Nov 23 15:25:18 2017 +0100

    Initial commit
```

## Publicar els canvis a GitHub (al repositori remot)

Si volem que la nostra llista de commits es publiqui al nostre repositori remot (el que hem creat a github.com) simplement haurem de fer un '''git push''' dels nostres canvis.

```console
user@school:~$ git push
```

Ens demanarà usuari i contrassenya. Heu de tenir en compte que només podreu modificar repositoris en els que tingueu permisos, o bé perquè els heu creat vosaltres o perquè ús han donat permisos de modificació.

## Crear una branca al repositori

Això ens crearà una branca i canviarà la branca actual a la nova branca creada.

```console
user@school:~$ git checkout -b nom_branca
```

Per veure les branques existents:

```console
user@school:~$ git branch
```

Per canviar de branca:

```console
user@school:~$ git checkout nom_branca
```
