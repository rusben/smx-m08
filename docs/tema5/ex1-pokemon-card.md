### Enunciat de l'exercici

Crea una pàgina web senzilla que mostri una tarjeta d'un Pokémon utilitzant HTML i CSS. L'estructura de la pàgina ja està definida a continuació, però hauràs de crear el fitxer `styles.css` per donar-li un disseny atractiu i organitzat.

#### Objectius:
1. Utilitza l'estructura HTML proporcionada (NO ES POT MODIFICAR).
2. Crea un fitxer anomenat `styles.css` on aplicaràs estils mitjançant selectors de classe.
3. El disseny ha de ser visualment atractiu i organitzat, amb elements com colors, tipus de lletra i espais en blanc adequats.
4. Assegura't que la tarjeta del Pokémon tingui una imatge, un nom, un tipus i una descripció.

---

### Estructura `HTML`. (`index.html`)

```html
<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tarjeta de Pokémon</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="pokemon-card">
        <img class="pokemon-image" src="images/bulbasaur.png" alt="Imatge del Pokémon">
        <div class="pokemon-info">
            <h2 class="pokemon-name">Bulbasaur</h2>
            <p class="pokemon-type plant">Planta</p>
            <p class="pokemon-type poison">Verí</p>
            <p class="pokemon-description">
                Bulbasaur és un Pokémon de tipus Planta i Verí. És fàcil distingir-lo per la llavor que té a l'esquena, que creix a mesura que ell ho fa.
            </p>
        </div>
    </div>
</body>
</html>
```

---

### Creació del repositori a GitHub
1. **Crea un nou repositori a GitHub amb el nom `pokemon`**
    - Selecciona l'opció de crear el repositori amb un `README.md` i la llicència `GNU General Public License`. 
    - Ves al terminal del teu ordinador (l'ordinador on els primers dies de classe vam crear la clau de `SSH` a `GitHub`) i clona el repositori, assegura't de clonar mitjançant l'enllaç que apareix a la pestanya `SSH`. Utilitza la comanda `git clone git@github.com:el_teu_usuari/pokemon.git`
    - La clonació ha creat una nova carpeta a la teva màquina, obre el `Visual Studio Code` i obre la carpeta creada.

### Creació de la carpeta d'imatges 
1. **Crea la carpeta (`images`)**
    - Dins del `Visual Studio Code` crea una nova carpeta anomenada `images`.
    - Descarrega la imatge del bulbasaur a la carpeta. La imatge la pots trobar a: [bulbasaur.png](../img/bulbasaur.png)

### Copia el codi HTML
1. **Crea un fitxer index anomenat (`index.html`)**:
    - Dins del `Visual Studio Code` crea un un fitxer anomenat `index.html` i copia el codi de l'apartat anterior, recorda que aquest codi **NO** es pot modificar.

### Indicacions per al CSS (`styles.css`)
1. **Crea el fitxer d'estils CSS (`styles.css`)**:
    - Dins del `Visual Studio Code` crea un nou fitxer anomenat `styles.css`.
    - Al fitxer `CSS` fes les tasques que venen a continuació.

2. **Dissenya la capa principal (`.pokemon-card`)**:
   - Estableix un fons de color gris clar i arrodoneix les cantonades.
   - Afegeix ombra per donar profunditat.
   - Afegeix un padding per a tenir un marge interior.
   - Centra la tarjeta horitzontalment i verticalment a la pantalla.

3. **Estil de la imatge (`.pokemon-image`)**:
   - Fixa un ample màxim per a la imatge.
   - Arrodoneix les cantonades de la imatge.
   - Afegeix un marge inferior per separar-la del text.

4. **Informació del Pokémon (`.pokemon-info`)**:
   - Estableix un fons de color verd clar i arrodoneix les cantonades.
   - Afegeix un padding per a tenir un marge inferior per separar-la del text.

5. **Estil del nom (`.pokemon-name`)**:
   - Utilitza un tipus de lletra distintiu per destacar el nom.
   - Aplica un color que contrasti amb el fons.

6. **Estil del tipus (`.pokemon-type`)**:
   - Utilitza un color específic per als tipus (per exemple, verd per a Planta, morat per a Venen).
   - Afegeix un petit marge inferior.

7. **Estil de la descripció (`.pokemon-description`)**:
   - Redueix el tamany de la lletra respecte al nom.
   - Aplica un color gris clar per diferenciar-lo del text principal.

---

### Publicació dels canvis a GitHub
Un cop acabat l'exercici publiqueu els vostres canvis a `GitHub`:

1. Entreu al terminal i aneu fins a la carpeta que conté el repositori.
2. Feu `git add .` per afegir els canvis.
3. Feu `git commit -m "Missatge descriptiu dels canvis"` per a guardar els canvis en el registre local.
4. Finalment feu `git push` per a publicar els canvis.

### Activeu GitHub Pages
En el vostre perfil de `GitHub` aneu fins al repositori del pokemon.

1. Ves al menú superior per gestionar les `Settings` del repositori.
2. Un cop a `Settings` aneu a `Pages` al menú de l'esquerra.
3. Un cop a `Pages` seleccioneu en la secció `Branch` la branca `main`.
4. Us apareixerà un enllaç on s'ha publicat la vostra web, aneu altre cop a la pàgina principal del repositori, cliqueu a l'engranatge de la dreta, al menú `About` i escriviu aquest enllaç on diu `Website`.

### Resultat esperat
El resultat final ha de ser una tarjeta visualment atractiva que mostri la informació del Pokémon de manera clara i organitzada. La tarjeta ha de quedar centrada a la pantalla, amb una combinació harmònica de colors i tipografia.

---

**Nota**: Pots personalitzar els colors i estils segons el teu gust, sempre que segueixis les indicacions bàsiques i utilitzis selectors de classe per aplicar els estils.

Pots consultar la informació bàsica sobre CSS i el model de capsa als següents enllaços:
- [Tutorial d'HTML i CSS](../intro-html-css.md)
- [El model de capsa (Box Model)](../box-model.md)
