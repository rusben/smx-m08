# Introducció a HTML i CSS

## 1. Què és HTML?

**HTML** (*HyperText Markup Language*) és el llenguatge estàndard per a la creació i estructuració de pàgines web. No és un llenguatge de programació, sinó un **llenguatge de marques** que defineix quins són els elements d’una pàgina i quina funció tenen (títol, paràgraf, imatge, enllaç, etc.).

### Com funciona?
HTML utilitza **etiquetes** (o *tags*) que envolten el contingut. Aquestes etiquetes van entre símbols `<` i `>`, i normalment funcionen per parelles: una d’obertura i una de tancament.

**Exemple bàsic:**
```html
<h1>Títol principal</h1>
<p>Aquest és un paràgraf de text.</p>
<a href="https://exemple.cat">Enllaç a una altra pàgina</a>
```

### Funcions principals de HTML:
- **Organitzar el contingut** mitjançant encapçalaments (`<h1>` a `<h6>`), paràgrafs (`<p>`), llistes (`<ul>`, `<ol>`, `<li>`), taules (`<table>`, `<tr>`, `<td>`) i blocs semàntics (`<header>`, `<nav>`, `<main>`, `<section>`, `<article>`, `<footer>`).
- **Inserir recursos multimèdia**: imatges (`<img>`), vídeos (`<video>`), àudio (`<audio>`).
- **Crear formularis interactius** (`<form>`, `<input>`, `<textarea>`, `<button>`) per recollir dades de l’usuari.
- **Establir enllaços** (`<a>`) per navegar dins del lloc web o cap a recursos externs.

> **Observació important**: HTML defineix **què és** cada element, no **com es veu**. Per exemple, un `<h1>` indica que és un títol principal, però no especifica la mida, el color o la font. Això ho gestiona CSS.

### Una nota sobre XHTML
A principis dels anys 2000, es va desenvolupar una versió més estricta d’HTML anomenada **XHTML**, basada en les regles de XML. Tot i que oferia una sintaxi més rigorosa, **avui gairebé no s’utilitza**, ja que **HTML5** (la versió moderna d’HTML) combina la **flexibilitat**, la **facilitat d’ús** i un **suport universal** en tots els navegadors, a més de permetre una millor integració amb tecnologies web actuals com ara CSS3, JavaScript i APIs web.

## 2. Què és CSS?

**CSS** (*Cascading Style Sheets*) és el llenguatge que permet **controlar l’aspecte visual** dels documents HTML. Mentre HTML defineix l’estructura i el significat del contingut, CSS defineix **colors, tipografies, espais, posicions i comportaments visuals**.

### Com s’aplica CSS?
Hi ha tres formes d’aplicar estils:

1. **CSS en línia** (dins d’una etiqueta HTML):
   ```html
   <p style="color: red; font-size: 16px;">Text amb estil en línia.</p>
   ```
   → Útil per a canvis puntuals, però **no recomanat** per a projectes grans.

2. **CSS intern** (dins de l’etiqueta `<style>` a la capçalera del document):
   ```html
   <head>
     <style>
       p { color: blue; }
     </style>
   </head>
   ```
   → Adequat per a pàgines úniques o proves ràpides.

3. **CSS extern** (en un fitxer separat, normalment amb extensió `.css`):
   ```html
   <head>
     <link rel="stylesheet" href="estils.css">
   </head>
   ```
   → **Millor pràctica**: permet reutilitzar estils en múltiples pàgines i facilita el manteniment.

### Propietats CSS comunes:
- `color`: color del text.  
- `background-color`: color de fons.  
- `font-family`: tipus de lletra.  
- `font-size`: mida de la lletra.  
- `margin` i `padding`: espais exteriors i interiors.  
- `display`, `position`, `flex`, `grid`: controlen la disposició dels elements.

### Avantatges clau de CSS:
- **Separació clara entre contingut (HTML) i presentació (CSS)**: això millora l’accessibilitat, la mantenibilitat i la col·laboració en equips.
- **Consistència visual**: un únic fitxer CSS pot aplicar-se a centenars de pàgines.
- **Disseny adaptable**: mitjançant *media queries*, CSS permet crear interfícies que s’ajusten automàticament a mòbils, tauletes, ordinadors o impressores.
- **Millora del rendiment**: el navegador pot emmagatzemar en memòria cau (*cache*) els fitxers CSS, accelerant la càrrega de pàgines posteriors.

## 3. Relació entre HTML i CSS

HTML i CSS són **complementaris** i treballen conjuntament:

- **HTML** respon a la pregunta: *“Què és aquest element?”*  
  → Exemple: “Aquest és un títol”, “Aquest és un botó”, “Aquest és un paràgraf”.

- **CSS** respon a la pregunta: *“Com ha de veure’s aquest element?”*  
  → Exemple: “El títol ha de ser verd, en negreta i centrar-se”.

Aquesta separació permet que:
- Els continguts siguin **accessibles** (per exemple, per a lectors de pantalla).
- El disseny es pugui **canviar completament** sense tocar l’estructura del contingut.
- El codi sigui **més fàcil de llegir, depurar i actualitzar**.

## 4. Resum comparatiu

| Aspecte               | HTML                              | CSS                                |
|-----------------------|-----------------------------------|------------------------------------|
| **Propòsit**          | Estructurar el contingut          | Definir l’aparença visual          |
| **Tipus de llenguatge** | Llenguatge de marques           | Llenguatge de fulls d’estil        |
| **Flexibilitat**      | Alta (especialment en HTML5)      | Molt alta (múltiples tècniques)    |
| **Ús actual**         | Estàndard universal               | Imprescindible en tot projecte web |

## 5. Recomanacions per a l’aprenentatge

1. **Comença amb HTML5 bàsic**: aprèn les etiquetes més comunes (`<html>`, `<head>`, `<body>`, `<h1>`, `<p>`, `<a>`, `<img>`, `<ul>`, `<form>`) i les **etiquetes semàntiques** (`<header>`, `<nav>`, `<main>`, `<section>`, `<footer>`).
2. **Practica la semàntica**: utilitza etiquetes que reflecteixin el significat del contingut, no només per estil.
3. **Introdueix CSS progressivament**: primer colors i tipus de lletra, després marges i espais, i finalment disposició amb *Flexbox* o *Grid*.
4. **Utilitza fitxers CSS externs** des del principi per adoptar bones pràctiques.
5. **Valida el teu codi**: utilitza el validador del W3C (https://validator.w3.org/) per assegurar-te que el teu HTML i CSS segueixen els estàndards.
6. **Explora exemples reals**: observa el codi font de webs senzilles per veure com s’estructuren i estilitzen.
