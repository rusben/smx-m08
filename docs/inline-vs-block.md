# Elements en línia i elements de bloc en HTML

## Introducció

En el desenvolupament web, especialment en el disseny de pàgines amb HTML i CSS, és fonamental comprendre com es comporten els diferents tipus d’elements a la pàgina. A grans trets, podem classificar els elements HTML en dues categories principals segons el seu comportament per defecte en el flux del document: **elements en línia** (*inline*) i **elements de bloc** (*block*).

Aquesta distinció afecta directament la manera com s’organitzen visualment els continguts, com ocupen l’espai disponible i com interactuen amb altres elements.

### Elements de bloc (*block elements*)

- **Ocupen tot l’ample disponible** del seu contenidor per defecte (és a dir, un 100% de l’ample del pare).
- **Comencen en una nova línia** i **finalitzen amb un salt de línia**, per la qual cosa s’apilen verticalment uns sobre els altres.
- Admeten la definició de **totes les propietats de caixa CSS**: `width`, `height`, `margin`, `padding`, etc.
- Poden contenir **altres elements de bloc i en línia** (amb algunes excepcions segons l’element concret).

Exemples d’elements de bloc:  
`<div>`, `<p>`, `<h1>` a `<h6>`, `<section>`, `<article>`, `<header>`, `<footer>`, `<ul>`, `<li>`, `<form>`, `<table>`.

### Elements en línia (*inline elements*)

- **Només ocupen l’espai necessari** per al seu contingut (no prenen tot l’ample del contenidor).
- **No generen salts de línia**; es posicionen **horitzontalment** un al costat de l’altre, dins del mateix bloc de text o contenidor.
- **No admeten** la definició d’**ample** (`width`) ni **alçada** (`height`) de forma efectiva (aquests valors s’ignoren en la majoria dels casos).
- Les propietats de marge (`margin`) i farciment (`padding`) **només afecten horitzontalment** (esquerra i dreta); els marges verticals no desplacen altres elements.
- **No poden contenir elements de bloc** (fer-ho pot provocar comportaments inesperats o errors de validació HTML).

Exemples d’elements en línia:  
`<span>`, `<a>`, `<strong>`, `<em>`, `<img>`, `<input>`, `<label>`, `<button>`, `<code>`, `<br>`.

> **Nota**: Alguns elements com `<img>` o `<button>` són tècnicament *inline*, però es comporten com si fossin `inline-block` perquè admeten dimensions.

![Diferència entre els elements en línia i de bloc](img/boxmodel-block-vs-inline.png)

### La propietat CSS `display`

El comportament per defecte d’un element ve determinat pel valor de la propietat CSS `display`:

- `display: block;` → comportament de bloc.
- `display: inline;` → comportament en línia.
- `display: inline-block;` → combina característiques de tots dos: es posiciona com un element en línia, però permet definir `width`, `height`, `margin` i `padding` completament.

Aquesta propietat permet **modificar el comportament predeterminat** d’un element quan calgui adaptar-lo al disseny desitjat.

# Exemples pràctics, visuals i exercicis

## 1. Exemple visual comparatiu

### Elements de bloc:
```
[ Paràgraf 1: Ocupa tot l’ample ]
[ Paràgraf 2: Ocupa tot l’ample ]
[ Paràgraf 3: Ocupa tot l’ample ]
```
→ Cada element apareix en una línia separada.

### Elements en línia:
```
[Text] [Enllaç] [Icona] [Botó]
```
→ Tots apareixen en la **mateixa línia**, un al costat de l’altre.

## 2. Codi pràctic

### Exemple d’elements de bloc:

```html
<!DOCTYPE html>
<html lang="ca">
<head>
  <meta charset="UTF-8">
  <title>Elements de bloc</title>
  <style>
    .bloc {
      background-color: #d0f0c0;
      border: 2px solid #4CAF50;
      padding: 10px;
      margin: 8px 0;
    }
  </style>
</head>
<body>
  <p class="bloc">Aquest és un &lt;p&gt; (bloc).</p>
  <div class="bloc">Aquest és un &lt;div&gt; (bloc).</div>
  <section class="bloc">Aquest és un &lt;section&gt; (bloc).</section>
</body>
</html>
```

### Exemple d’elements en línia:

```html
<!DOCTYPE html>
<html lang="ca">
<head>
  <meta charset="UTF-8">
  <title>Elements en línia</title>
  <style>
    .en-linea {
      background-color: #ffe0b2;
      border: 1px solid #ff9800;
      padding: 4px 8px;
      /* Aquestes propietats s’ignoren: */
      width: 200px;
      height: 50px;
    }
  </style>
</head>
<body>
  <p>
    Elements en línia:
    <span class="en-linea">Span</span>
    <a href="#" class="en-linea">Enllaç</a>
    <strong class="en-linea">Negreta</strong>
  </p>
</body>
</html>
```

### Exemple amb `inline-block` (menú horitzontal):

```html
<style>
  .caixa {
    display: inline-block;
    width: 100px;
    height: 100px;
    background: #bbdefb;
    margin: 10px;
    text-align: center;
    line-height: 100px;
  }
</style>

<div class="caixa">1</div>
<div class="caixa">2</div>
<div class="caixa">3</div>
```

## 3. Exercicis

### Exercici 1: Identifica el tipus
Indica si són **bloc** o **en línia** per defecte:
1. `<h2>` → **Bloc**  
2. `<span>` → **En línia**  
3. `<nav>` → **Bloc**  
4. `<img>` → **En línia** (però es comporta com `inline-block`)  
5. `<button>` → **En línia** (però admet dimensions)  
6. `<footer>` → **Bloc**

---

### Exercici 2: Corregeix l’error
Per què aquest codi és incorrecte?

```html
<span><div>Contingut</div></span>
```

**Resposta**: Un element en línia (`<span>`) **no pot contenir un element de bloc** (`<div>`). Això viola les regles d’HTML semàntic.

### Exercici 3: Crea un menú horitzontal
Fes tres enllaços que:
- Estiguin alineats horitzontalment.
- Tinguin 120px d’ample i 40px d’alçada.
- Tinguin fons blau clar i text centrat.

**Solució**:

```html
<style>
  .menu-item {
    display: inline-block;
    width: 120px;
    height: 40px;
    background: #e3f2fd;
    text-align: center;
    line-height: 40px;
    text-decoration: none;
    color: #0d47a1;
    margin-right: 5px;
  }
</style>

<a href="#" class="menu-item">Inici</a>
<a href="#" class="menu-item">Serveis</a>
<a href="#" class="menu-item">Contacte</a>
```
