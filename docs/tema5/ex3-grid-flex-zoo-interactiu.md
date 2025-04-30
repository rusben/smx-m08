### **Descripció del Projecte: "Zoo Interactiu"**

L'objectiu és crear un zoo virtual on els animals es distribueixin utilitzant `display: grid` i `display: flex`. Els usuaris podran interactuar amb el layout canviant-ne l'organització o explorant detalls sobre cada animal.

#### **Estructura bàsica del projecte**
1. **HTML**: Crear una estructura bàsica amb seccions per als animals.
2. **CSS**: Utilitzar `display: grid` per organitzar els animals en una quadrícula i `display: flex` per ajustar els seus detalls.
3. **Interacció (opcional)**: Afegir JavaScript per permetre als usuaris canviar entre diferents disposicions (grid o flex) o mostrar informació addicional sobre cada animal.

---

### **Pas a Pas de la Pràctica**

#### **1. Estructura HTML**
Crea una pàgina bàsica amb una llista d'animals. Cada animal tindrà una imatge, un nom i una breu descripció.

```html
<!DOCTYPE html>
<html lang="ca">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Zoo Interactiu</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <header>
    <h1>Benvingut al Zoo Interactiu!</h1>
    <p>Explora els nostres animals i canvia com es mostren!</p>
  </header>

  <main>
    <section class="zoo-grid">
      <div class="animal">
        <img src="images/lion.jpg" alt="Leó">
        <h2>Leó</h2>
        <p>El rei de la jungla.</p>
      </div>
      <div class="animal">
        <img src="images/penguin.jpg" alt="Pingüí">
        <h2>Pingüí</h2>
        <p>Viu al fred i neda molt bé.</p>
      </div>
      <div class="animal">
        <img src="images/tiger.jpg" alt="Tigre">
        <h2>Tigre</h2>
        <p>Conegut pel seu bell estrí.</p>
      </div>
      <!-- Afegir més animals aquí -->
    </section>
  </main>

  <footer>
    <button id="toggle-layout">Canvia Layout</button>
  </footer>

  <script src="script.js"></script>
</body>
</html>
```

---

#### **2. Estils CSS**
Utilitza `display: grid` per organitzar inicialment els animals en una quadrícula i `display: flex` per ajustar el contingut intern de cada animal.

```css
/* styles.css */
body {
  font-family: Arial, sans-serif;
  text-align: center;
  background-color: #f4f4f9;
  margin: 0;
  padding: 0;
}

header {
  background-color: #ffcc00;
  padding: 20px;
  color: #333;
}

.zoo-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 20px;
  padding: 20px;
}

.animal {
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  transition: transform 0.3s ease;
}

.animal:hover {
  transform: scale(1.05);
}

.animal img {
  width: 100%;
  height: 150px;
  object-fit: cover;
}

.animal h2 {
  margin: 10px 0;
  font-size: 1.2em;
}

.animal p {
  padding: 0 10px 10px;
  font-size: 0.9em;
  color: #555;
}

footer {
  padding: 20px;
  background-color: #ffcc00;
}

button {
  padding: 10px 20px;
  font-size: 1em;
  border: none;
  border-radius: 5px;
  background-color: #333;
  color: #fff;
  cursor: pointer;
}

button:hover {
  background-color: #555;
}
```

---

#### **3. Interacció amb JavaScript**
Afegeix funcionalitat per canviar entre `display: grid` i `display: flex` quan l'usuari prem el botó.

```javascript
// script.js
const zooGrid = document.querySelector('.zoo-grid');
const toggleButton = document.getElementById('toggle-layout');

let isGrid = true;

toggleButton.addEventListener('click', () => {
  if (isGrid) {
    zooGrid.style.display = 'flex';
    zooGrid.style.flexDirection = 'row';
    zooGrid.style.flexWrap = 'wrap';
    zooGrid.style.justifyContent = 'center';
    toggleButton.textContent = 'Canvia a Grid';
  } else {
    zooGrid.style.display = 'grid';
    zooGrid.style.gridTemplateColumns = 'repeat(auto-fit, minmax(200px, 1fr))';
    toggleButton.textContent = 'Canvia a Flex';
  }
  isGrid = !isGrid;
});
```

---

### **Característiques Divertides i Curioses**
1. **Animacions**: Quan l'usuari passa el ratolí per sobre d'un animal, aquest es pot escalar lleugerament (`transform: scale(1.05)`).
2. **Imatges atractives**: Utilitza imatges d'animals divertits o poc habituals per captar l'atenció.
3. **Botó interactiu**: El botó de canvi de layout permetrà als usuaris experimentar directament amb les diferències entre `grid` i `flex`.
4. **Ampliació opcional**: Pots afegir més interactivitat, com ara mostrar una finestra emergent amb més informació sobre l'animal seleccionat.
