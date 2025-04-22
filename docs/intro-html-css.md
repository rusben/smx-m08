# **Tutorial d'HTML i CSS**
## **1. Primers passos amb HTML**

HTML és el llenguatge bàsic per crear pàgines web. És estructurat i fàcil d'entendre.

### Estructura bàsica d'un document HTML:
```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>El meu primer document HTML</title>
</head>
<body>
    <h1>Títol principal de la pàgina</h1>
    <p>Aquest és un paràgraf.</p>
</body>
</html>
```

- **`<!DOCTYPE html>`**: Declara que el document és HTML5.
- **`<html>`**: Conté tot el contingut del document.
- **`<head>`**: Metadades i configuracions generals.
- **`<body>`**: Conté el contingut visible de la pàgina.

---

## **2. Metadades en HTML**

Les metadades són informació sobre la pàgina que no es mostra directament als usuaris, però és crucial per navegadors i motors de cerca.

### Exemple de metadades:
```html
<head>
    <meta charset="UTF-8"> <!-- Codificació del text -->
    <meta name="description" content="Descripció del meu lloc web">
    <meta name="keywords" content="HTML, CSS, tutorial">
    <meta name="author" content="Nom de l'autor">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Optimització per a dispositius mòbils -->
    <link rel="icon" href="favicon.ico" type="image/x-icon"> <!-- Icona de la pestanya -->
</head>
```

---

## **3. Fonaments de text en HTML**

HTML permet estructurar el text mitjançant etiquetes específiques.

### Etiquetes comunes per al text:
```html
<h1>Títol principal</h1>
<h2>Subtítol</h2>
<p>Aquest és un paràgraf normal.</p>
<strong>Text en negreta.</strong>
<em>Text en cursiva.</em>
<br> <!-- Salt de línia -->
<hr> <!-- Línia horitzontal -->
<small>Text petit.</small>
<mark>Text ressaltat.</mark>
<del>Text eliminat (ratllat).</del>
<ins>Text inserit (subratllat).</ins>
```

---

## **4. Encapçalaments (Headings)**

Els encapçalaments (`<h1>` a `<h6>`) s'utilitzen per definir títols i subtítols. El número indica la jerarquia.

### Exemple:
```html
<h1>Títol principal</h1>
<h2>Subtítol 1</h2>
<h3>Subtítol 2</h3>
<h4>Subtítol 3</h4>
<h5>Subtítol 4</h5>
<h6>Subtítol 5</h6>
```

**Nota:** Utilitza `<h1>` només una vegada per pàgina, ja que representa el títol principal.

---

## **5. Llistes**

Les llistes són útils per organitzar informació en punts o numeracions.

### Tipus de llistes:
1. **Llista no ordenada (`<ul>`):**
   ```html
   <ul>
       <li>Element 1</li>
       <li>Element 2</li>
       <li>Element 3</li>
   </ul>
   ```

2. **Llista ordenada (`<ol>`):**
   ```html
   <ol>
       <li>Primer element</li>
       <li>Segon element</li>
       <li>Tercer element</li>
   </ol>
   ```

3. **Llista de definicions (`<dl>`):**
   ```html
   <dl>
       <dt>Terme 1</dt>
       <dd>Definició del terme 1.</dd>
       <dt>Terme 2</dt>
       <dd>Definició del terme 2.</dd>
   </dl>
   ```

---

## **6. Crear hipervincles**

Els hipervincles (`<a>`) permeten navegar entre pàgines o recursos externs.

### Exemple:
```html
<a href="https://www.google.com" target="_blank">Visita Google (obrirà en una nova pestanya)</a>
<a href="contact.html">Contacte</a> <!-- Enllaç a una pàgina local -->
<a href="#seccio1">Vés a la secció 1</a> <!-- Enllaç intern -->
```

- **`target="_blank"`**: Obre l'enllaç en una nova pestanya.

---

## **7. ¿Què és el CSS?**

CSS (Cascading Style Sheets) és un llenguatge que s'utilitza per donar estil als documents HTML. Permet controlar colors, tipus de lletra, marges, etc.

### Com incloure CSS en HTML:
```html
<head>
    <style>
        body {
            background-color: lightblue;
        }
        h1 {
            color: navy;
        }
    </style>
</head>
```
O bé en un fitxer extern:
```html
<head>
    <link rel="stylesheet" href="styles.css">
</head>
```

---

## **8. Estructuració del CSS**

El CSS s'organitza mitjançant selectors, propietats i valors.

### Exemple bàsic:
```css
/* Selector { propietat: valor; } */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}
h1 {
    color: red;
    text-align: center;
}
```

### Tipus de selectors:
- **Selector de tipus**: `p { color: blue; }` (aplica a tots els `<p>`).
- **Selector de classe**: `.nom-classe { color: green; }`.
- **Selector d'ID**: `#id-unic { font-size: 20px; }`.

---

## **9. Estils avançats amb CSS**

### Colors i fons:
```css
body {
    background-color: #f0f0f0; /* Color de fons */
    color: #333; /* Color del text */
}
```

### Marges i posició:
```css
div {
    margin: 20px; /* Marge exterior */
    padding: 10px; /* Marge interior */
    border: 1px solid black; /* Vora */
    box-sizing: border-box; /* Inclou el padding i la vora en l'amplada total */
}
```

### Flexbox (per centrar elements):
```css
.container {
    display: flex;
    justify-content: center; /* Centra horitzontalment */
    align-items: center; /* Centra verticalment */
    height: 100vh; /* Alçada completa de la pantalla */
}
```

---

## **10. Taules**

Les taules s'utilitzen per organitzar dades en files i columnes.

### Exemple bàsic:
```html
<table border="1">
    <thead>
        <tr>
            <th>Nom</th>
            <th>Edat</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Ana</td>
            <td>25</td>
        </tr>
        <tr>
            <td>Pere</td>
            <td>30</td>
        </tr>
    </tbody>
</table>
```

- **`<table>`**: Defineix la taula.
- **`<thead>`**: Capçalera de la taula.
- **`<tbody>`**: Cos de la taula.
- **`<tr>`**: Fila.
- **`<th>`**: Capçalera de columna.
- **`<td>`**: Dades de la cel·la.

---

## **11. Animacions**

Les animacions en HTML/CSS permeten moure o canviar elements dinàmicament.

### Exemple bàsic amb CSS:
```css
@keyframes exemple {
    0% { background-color: red; }
    100% { background-color: blue; }
}

div {
    width: 100px;
    height: 100px;
    background-color: red;
    animation: exemple 2s infinite;
}
```

---

## **12. Formularis**

Els formularis permeten recollir dades dels usuaris.

### Exemple bàsic:
```html
<form action="/enviar" method="post">
    <label for="nom">Nom:</label>
    <input type="text" id="nom" name="nom"><br><br>

    <label for="email">Correu electrònic:</label>
    <input type="email" id="email" name="email"><br><br>

    <label for="password">Contrasenya:</label>
    <input type="password" id="password" name="password"><br><br>

    <label for="missatge">Missatge:</label><br>
    <textarea id="missatge" name="missatge" rows="4" cols="50"></textarea><br><br>

    <input type="submit" value="Enviar">
</form>
```

- **`<input>`**: Camps d'entrada (text, correu, contrasenya, etc.).
- **`<textarea>`**: Àrea de text ampliat.
- **`<button>`**: Botó d'enviament.

---

Amb aquests conceptes ampliats, ja tens una base sòlida per crear pàgines web més complexes. Practica creant documents amb llistes, taules, formularis i estils CSS. Experimenta amb diferents combinacions per millorar les teves habilitats!
