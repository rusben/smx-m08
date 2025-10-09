# **Tutorial Complet d’HTML i CSS: Guia Estructurada per a Principiants**

## **Introducció**

HTML (HyperText Markup Language) i CSS (Cascading Style Sheets) són els pilars fonamentals del desenvolupament web.  
- **HTML** estructura el contingut d’una pàgina web.  
- **CSS** li dona estil: colors, tipografies, disposició, animacions, etc.

Aquest tutorial t’ensenyarà pas a pas com crear pàgines web des del zero, combinant contingut i disseny.

## **1. Estructura Bàsica d’un Document HTML**

Tot document HTML5 comença amb aquesta estructura:

```html
<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Títol de la pàgina</title>
</head>
<body>
    <!-- Contingut visible aquí -->
</body>
</html>
```

### **Elements clau:**
- `<!DOCTYPE html>`: Declara que el document és HTML5.
- `<html>`: Arrel del document. L’atribut `lang="ca"` indica l’idioma.
- `<head>`: Conté metadades, títol, enllaços a CSS/JS, etc.
- `<body>`: Conté tot el contingut visible per l’usuari.

## **2. Metadades Essencials**

Les metadades ajuden els navegadors i motors de cerca a entendre la pàgina:

```html
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Descripció curta del lloc">
    <meta name="keywords" content="HTML, CSS, tutorial">
    <meta name="author" content="El teu nom">
    <link rel="icon" href="favicon.ico">
    <title>Pàgina d'exemple</title>
</head>
```

> **Consell**: La metaetiqueta `viewport` és essencial per a la **responsivitat** en dispositius mòbils.

## **3. Etiquetes Bàsiques de Text**

HTML permet estructurar i donar significat al text:

| Etiqueta        | Funció                          |
|-----------------|----------------------------------|
| `<h1>–<h6>`     | Títols jeràrquics               |
| `<p>`           | Paràgraf                        |
| `<strong>`      | Text important (negreta)        |
| `<em>`          | Èmfasi (cursiva)                |
| `<br>`          | Salt de línia                   |
| `<hr>`          | Línia horitzontal               |
| `<small>`       | Text petit                      |
| `<mark>`        | Text ressaltat                  |
| `<del>`         | Text eliminat (ratllat)         |
| `<ins>`         | Text inserit (subratllat)       |

> **Millor pràctica**: Usa `<h1>` **només un cop** per pàgina (títol principal).

## **4. Llistes**

### **Llista no ordenada (`<ul>`)**

```html
<ul>
    <li>Poma</li>
    <li>Taronja</li>
</ul>
```

### **Llista ordenada (`<ol>`)**

```html
<ol>
    <li>Primer pas</li>
    <li>Segon pas</li>
</ol>
```

### **Llista de definicions (`<dl>`)**

```html
<dl>
    <dt>HTML</dt>
    <dd>Llenguatge de marcatge per a pàgines web.</dd>
</dl>
```

## **5. Hipervincles (`<a>`)**

```html
<a href="https://www.google.com" target="_blank" rel="noopener">Visita Google</a>
<a href="contacte.html">Contacte</a>
<a href="#seccio1">Anar a la secció 1</a>
```

- `target="_blank"`: Obre en una nova pestanya.
- `rel="noopener"`: Millora la seguretat quan s’obre en una nova pestanya.

## **6. Imatges (`<img>`)**

```html
<img src="imatge.jpg" alt="Descripció de la imatge" width="300">
```

- **`alt`** és obligatori per accessibilitat i SEO.
- Evita especificar `width`/`height` en línia; millor fer-ho amb CSS.

## **7. Taules**

```html
<table>
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
    </tbody>
</table>
```

- `<thead>`: Capçalera de la taula.
- `<tbody>`: Cos de la taula.
- `<th>`: Cel·la de capçalera (negreta i centrada per defecte).

## **8. Formularis**

Els formularis recullen dades de l’usuari:

```html
<form action="/enviar" method="post">
    <label for="nom">Nom:</label>
    <input type="text" id="nom" name="nom"><br><br>

    <label for="email">Correu:</label>
    <input type="email" id="email" name="email"><br><br>

    <label for="missatge">Missatge:</label><br>
    <textarea id="missatge" name="missatge"></textarea><br><br>

    <input type="submit" value="Enviar">
</form>
```

- **`<label>`** millora l’accessibilitat.
- Usa `type="email"` per validació automàtica.

## **9. Introducció al CSS**

CSS separa el contingut (HTML) de la presentació (estil).

### **Formes d’incloure CSS:**

1. **Intern (dins `<head>`):**
   ```html
   <style>
       body { background-color: #f0f0f0; }
   </style>
   ```

2. **Extern (recomanat):**
   ```html
   <link rel="stylesheet" href="estils.css">
   ```

## **10. Sintaxi Bàsica de CSS**

```css
selector {
    propietat: valor;
}
```

### **Tipus de selectors:**

| Tipus         | Exemple               | Aplica a                     |
|---------------|-----------------------|------------------------------|
| Tipus         | `p { color: blue; }`  | Tots els `<p>`               |
| Classe        | `.destacat { ... }`   | Elements amb `class="destacat"` |
| ID            | `#capçalera { ... }`  | Element únic amb `id="capçalera"` |

> **Evita abusar dels ID**; les classes són més reutilitzables.

## **11. Propietats CSS Comunes**

### **Colors i tipografia**
```css
body {
    font-family: Arial, sans-serif;
    color: #333;
    background-color: #fff;
}
```

### **Marges i padding**
```css
div {
    margin: 20px;     /* Exterior */
    padding: 15px;    /* Interior */
    border: 1px solid #ccc;
    box-sizing: border-box; /* Inclou padding i border a l'amplada */
}
```

### **Flexbox (per centrar elements)**
```css
.contenidor {
    display: flex;
    justify-content: center; /* Horitzontal */
    align-items: center;     /* Vertical */
    height: 100vh;
}
```

## **12. Animacions CSS**

```css
@keyframes canviColor {
    0%   { background-color: red; }
    100% { background-color: blue; }
}

.caixa {
    width: 100px;
    height: 100px;
    animation: canviColor 2s infinite alternate;
}
```

## **13. Exemple Complet Integrat**

```html
<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exemple HTML + CSS</title>
    <style>
        body {
            font-family: sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }
        .contenidor {
            max-width: 800px;
            margin: auto;
        }
        h1 { color: navy; }
        table { width: 100%; border-collapse: collapse; margin: 20px 0; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        .caixa {
            background-color: lightcoral;
            padding: 20px;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="contenidor">
        <h1>Benvingut al meu lloc!</h1>
        <p>Aquesta és una pàgina d'exemple amb <strong>HTML i CSS</strong>.</p>

        <h2>Llista de fruites</h2>
        <ul>
            <li>Poma</li>
            <li>Plàtan</li>
        </ul>

        <h2>Dades d'usuaris</h2>
        <table>
            <thead>
                <tr><th>Nom</th><th>Edat</th></tr>
            </thead>
            <tbody>
                <tr><td>Marc</td><td>28</td></tr>
            </tbody>
        </table>

        <div class="caixa">
            <p>Aquesta caixa té estil CSS!</p>
        </div>

        <a href="https://www.google.com" target="_blank" rel="noopener">Visita Google</a>
    </div>
</body>
</html>
```

## **Consells Finals**

- **Valida el teu codi**: Usa el [Validador de HTML del W3C](https://validator.w3.org/).
- **Practica**: Crea projectes petits (perfil personal, llista de tasques, etc.).
- **Aprèn JavaScript després**: Per afegir interactivitat.
- **Usa eines de desenvolupador** del navegador (F12) per provar canvis en temps real.
