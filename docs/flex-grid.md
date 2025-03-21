### Tutorial de Flexbox i Gridbox

En aquest tutorial, aprendràs els conceptes bàsics i avançats de **Flexbox** i **Gridbox**, dos sistemes de disseny que s'utilitzen per crear layouts responsius i moderns en CSS. Començarem amb una introducció a cada sistema i després veurem exemples pràctics.

---

## **1. Introducció a Flexbox**

**Flexbox** és un model de disseny unidimensional que permet organitzar elements dins d'un contenidor en una sola fila o columna (horitzontal o vertical). És ideal per distribuir espai entre elements i alinear-los de manera precisa.

### **Conceptes bàsics de Flexbox**
- **Contenidor flex (flex container)**: L'element pare que utilitza `display: flex`.
- **Elements flex (flex items)**: Els fills directes del contenidor flex.
- **Eix principal (main axis)**: La direcció principal del layout (per defecte horitzontal).
- **Eix transversal (cross axis)**: Perpendicular al main axis (per defecte vertical).

### **Propietats principals de Flexbox**
- **`display: flex;`**: Activa el mode flexbox en el contenidor.
- **`flex-direction`**: Defineix la direcció del main axis (`row`, `column`, etc.).
- **`justify-content`**: Aligneu els elements al llarg del main axis.
- **`align-items`**: Aligneu els elements al llarg del cross axis.
- **`flex-wrap`**: Controla si els elements es col·loquen en múltiples línies.
- **`gap`**: Defineix l'espai entre els elements.

---

### **Exemple bàsic de Flexbox**

```html
<div class="container">
  <div class="item">1</div>
  <div class="item">2</div>
  <div class="item">3</div>
</div>
```

```css
.container {
  display: flex;
  justify-content: space-between; /* Espai equitatiu entre elements */
  align-items: center; /* Centra verticalment */
  gap: 10px; /* Espai entre elements */
}

.item {
  background-color: lightblue;
  padding: 20px;
  border: 1px solid #ccc;
}
```

**Resultat**: Tres quadrats centrats verticalment amb espai equitatiu entre ells.

---

### **Exemple avançat de Flexbox**

```html
<div class="flex-container">
  <div class="header">Header</div>
  <div class="content">
    <div class="sidebar">Sidebar</div>
    <div class="main">Main Content</div>
  </div>
  <div class="footer">Footer</div>
</div>
```

```css
.flex-container {
  display: flex;
  flex-direction: column;
  height: 100vh;
}

.header, .footer {
  background-color: #333;
  color: white;
  text-align: center;
  padding: 10px;
}

.content {
  display: flex;
  flex: 1;
}

.sidebar {
  background-color: #f4f4f4;
  width: 200px;
  padding: 10px;
}

.main {
  flex: 1;
  background-color: #fff;
  padding: 10px;
}
```

**Resultat**: Un layout amb header, footer i una secció de contingut dividida en sidebar i main content.

---

## **2. Introducció a Gridbox**

**Gridbox** és un model de disseny bidimensional que permet organitzar elements en files i columnes simultàniament. És ideal per crear layouts complexes i responsius sense necessitat de fer servir trucs addicionals.

### **Conceptes bàsics de Gridbox**
- **Grid container**: L'element pare que utilitza `display: grid`.
- **Grid items**: Els fills directes del contenidor grid.
- **Grid lines**: Les línies que defineixen les files i columnes.
- **Grid cells**: Les cel·les individuals que formen part de la graella.
- **Grid areas**: Àrees definides per agrupar múltiples cel·les.

### **Propietats principals de Gridbox**
- **`display: grid;`**: Activa el mode gridbox en el contenidor.
- **`grid-template-columns`**: Defineix el nombre i amplada de les columnes.
- **`grid-template-rows`**: Defineix el nombre i alçada de les files.
- **`grid-gap`**: Defineix l'espai entre files i columnes.
- **`grid-area`**: Assigna un nom a una àrea específica de la graella.

---

### **Exemple bàsic de Gridbox**

```html
<div class="grid-container">
  <div class="item item1">1</div>
  <div class="item item2">2</div>
  <div class="item item3">3</div>
  <div class="item item4">4</div>
</div>
```

```css
.grid-container {
  display: grid;
  grid-template-columns: repeat(2, 1fr); /* Dues columnes iguals */
  grid-gap: 10px;
}

.item {
  background-color: lightcoral;
  padding: 20px;
  text-align: center;
  border: 1px solid #ccc;
}
```

**Resultat**: Una graella de 2x2 amb quatre quadrats.

---

### **Exemple avançat de Gridbox**

```html
<div class="grid-container">
  <div class="header">Header</div>
  <div class="sidebar">Sidebar</div>
  <div class="main">Main Content</div>
  <div class="footer">Footer</div>
</div>
```

```css
.grid-container {
  display: grid;
  grid-template-areas:
    "header header"
    "sidebar main"
    "footer footer";
  grid-template-columns: 200px 1fr; /* Sidebar + Main */
  grid-template-rows: auto 1fr auto; /* Header + Content + Footer */
  height: 100vh;
}

.header {
  grid-area: header;
  background-color: #333;
  color: white;
  text-align: center;
  padding: 10px;
}

.sidebar {
  grid-area: sidebar;
  background-color: #f4f4f4;
  padding: 10px;
}

.main {
  grid-area: main;
  background-color: #fff;
  padding: 10px;
}

.footer {
  grid-area: footer;
  background-color: #333;
  color: white;
  text-align: center;
  padding: 10px;
}
```

**Resultat**: Un layout complet amb header, sidebar, main content i footer.

---

## **3. Comparativa entre Flexbox i Gridbox**

| Característica          | Flexbox                          | Gridbox                          |
|-------------------------|----------------------------------|----------------------------------|
| Dimensions              | Unidimensional                 | Bidimensional                  |
| Ús principal            | Distribució lineal             | Layouts complexos              |
| Facilitat d'ús          | Ideal per components simples   | Ideal per full-page layouts    |
| Responsivitat           | Més manual                     | Més automàtic                  |

---

## **4. Exemple combinat: Flexbox i Gridbox**

```html
<div class="combined-container">
  <header>Header</header>
  <main>
    <aside>Sidebar</aside>
    <section class="cards">
      <div class="card">Card 1</div>
      <div class="card">Card 2</div>
      <div class="card">Card 3</div>
    </section>
  </main>
  <footer>Footer</footer>
</div>
```

```css
.combined-container {
  display: grid;
  grid-template-rows: auto 1fr auto;
  height: 100vh;
}

header, footer {
  background-color: #333;
  color: white;
  text-align: center;
  padding: 10px;
}

main {
  display: grid;
  grid-template-columns: 200px 1fr;
}

aside {
  background-color: #f4f4f4;
  padding: 10px;
}

.cards {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  padding: 10px;
}

.card {
  background-color: lightblue;
  padding: 20px;
  flex: 1 1 calc(33.333% - 20px);
  text-align: center;
}
```

**Resultat**: Un layout complet que combina grid per organitzar les seccions principals i flexbox per gestionar les targetes dins del contingut principal.

