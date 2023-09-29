# Etiquetes bàsiques en HTML
Segurament t'interessa aprendre com utilitzar les etiquetes bàsiques d'HTML per crear una pàgina web. HTML (Hypertext Markup Language) és el llenguatge de marcatge estàndard utilitzat per a la creació de pàgines web. Aquí tens una introducció a algunes de les etiquetes HTML més bàsiques:

## `<!DOCTYPE>`
Aquesta etiqueta s'utilitza per especificar la versió d'HTML que s'està utilitzant. La versió més comuna és HTML5:

```html
<!DOCTYPE html>
```

## `<html>`
L'element `<html>` és l'element arrel de tota pàgina web i conté tot el contingut de la pàgina.

```html
<html>
<!-- El teu contingut aquí -->
</html>
```

## `<head>` 
L'element `<head>` conté metainformació sobre la pàgina web, com ara el títol de la pàgina, vincles a arxius CSS i JavaScript, i metadades.

```html
<head>
    <title>Títol de la Pàgina</title>
</head>
```

## <body>
L'element `<body>` conté el contingut visible de la pàgina web, com text, imatges i altres elements multimèdia.

```html
<body>
    <h1>El meu primer títol</h1>
    <p>Aquesta és una pàgina web bàsica.</p>
</body>
```

## `<h1>` `<h2>` `<h3>` `<h4>` `<h5>` `<h6>`
S'utilitzen per crear títols i subtítols a la pàgina web. `<h1>` és el títol principal, i `<h2>`, `<h3>`, etc., són subtítols de nivells diferents.

```html
<h1>Títol Principal</h1>
<h2>Subtítol</h2>
```

## `<p>`
L'etiqueta `<p>` s'utilitza per a paràgrafs de text.

```html
<p>Aquest és un paràgraf de text.</p>
```

## `<a>`
L'etiqueta `<a>` s'utilitza per crear enllaços a altres pàgines web o recursos.

```html
<a href="https://www.exemple.com">Visita Exemple.com</a>
```

## `<img>`
L'etiqueta `<img>` s'utilitza per afegir imatges a la pàgina web.

```html
<img src="imatge.jpg" alt="Descripció de la imatge">
```

## `<ul>` `<li>`
S'utilitzen per crear llistes sense ordre (lliures).

```html
<ul>
    <li>Element 1</li>
    <li>Element 2</li>
</ul>
```

## `<ol>` `<li>`
S'utilitzen per crear llistes ordenades (numerades).

```html
<ol>
    <li>Primer element</li>
    <li>Segon element</li>
</ol>
```

## `<table>` `<tr>` `<th>` `<td>`

Les taules s'utilitzen per organitzar dades en files i columnes. Aquí tens un exemple senzill d'una taula amb capçaleres de columna i dades:

```html
<table>
    <tr>
        <th>Capçalera 1</th>
        <th>Capçalera 2</th>
    </tr>
    <tr>
        <td>Dada 1</td>
        <td>Dada 2</td>
    </tr>
    <tr>
        <td>Dada 3</td>
        <td>Dada 4</td>
    </tr>
</table>
```

Aquestes són algunes de les etiquetes bàsiques d'HTML que pots utilitzar per començar a crear una pàgina web. Per aprofundir en la creació de pàgines web, pots aprendre sobre CSS per estilitzar el teu contingut i JavaScript per fer les teves pàgines més interactives.

# Exemple complet

Ara, si vols veure un exemple complet que utilitza totes aquestes etiquetes, aquí tens un fragment d'HTML que inclou imatges, taules i llistes:

```html
<!DOCTYPE html>
<html>
<head>
    <title>Pàgina amb imatges, taules i llistes</title>
</head>
<body>
    <h1>Exemple d'imatges, taules i llistes</h1>
    
    <h2>Imatge</h2>
    <img src="imatge.jpg" alt="Descripció de la imatge">
    
    <h2>Taula</h2>
    <table>
        <tr>
            <th>Capçalera 1</th>
            <th>Capçalera 2</th>
        </tr>
        <tr>
            <td>Dada 1</td>
            <td>Dada 2</td>
        </tr>
        <tr>
            <td>Dada 3</td>
            <td>Dada 4</td>
        </tr>
    </table>
    
    <h2>Llistes</h2>
    <ul>
        <li>Element 1</li>
        <li>Element 2</li>
        <li>Element 3</li>
    </ul>
    
    <ol>
        <li>Primer element</li>
        <li>Segon element</li>
        <li>Tercer element</li>
    </ol>
</body>
</html>
```

Aquest exemple combina imatges, taules i llistes dins d'una pàgina HTML bàsica. Pots modificar-ho i afegir més contingut segons les teves necessitats.