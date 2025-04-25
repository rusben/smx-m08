### Enunciat de l'exercici

Crea una **landing page** senzilla per a un producte utilitzant HTML i CSS. L'estructura de la pàgina ja està definida a continuació, però hauràs de crear el fitxer `styles.css` per donar-li un disseny atractiu i organitzat.

#### Objectius:
1. Utilitza l'estructura HTML proporcionada (**NO ES POT MODIFICAR**).
2. Crea un fitxer anomenat `styles.css` on aplicaràs estils mitjançant selectors de classe.
3. El disseny ha de ser visualment atractiu i organitzat, amb elements com colors, tipus de lletra i espais en blanc adequats.
4. Assegura't que la landing page tingui un menú de navegació, una imatge destacada, un títol, un subtítol, una descripció del producte, un botó de crida a l'acció (CTA) i un peu de pàgina (footer).

---

### Estructura `HTML`. (`index.html`)

```html
<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Landing Page</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header class="main-header">
        <nav class="navbar">
            <ul class="nav-list">
                <li class="nav-item"><a href="#home" class="nav-link">Inici</a></li>
                <li class="nav-item"><a href="#features" class="nav-link">Característiques</a></li>
                <li class="nav-item"><a href="#contact" class="nav-link">Contacte</a></li>
            </ul>
        </nav>
    </header>

    <div class="landing-container">
        <header class="header">
            <h1 class="product-title">Producte Innovador</h1>
            <p class="product-subtitle">La millor solució per a les teves necessitats</p>
        </header>
        <section class="hero-section">
            <img class="hero-image" src="images/product.png" alt="Imatge del Producte" />
            <p class="hero-text"> Descobreix els beneficis d'aquest producte! </p>
        </section>
        <section class="description-section">
            <p class="product-description">
                Descobreix el nostre producte innovador, dissenyat per millorar la teva vida diària. Amb tecnologia avançada i materials de primera qualitat, aquest producte és perfecte per a tothom.
            </p>
        </section>
        <footer class="footer">
            <a href="#" class="cta-button">Compra ara</a>
        </footer>
    </div>

    <footer class="main-footer">
        <p class="footer-text">© 2025 Producte Innovador. Tots els drets reservats.</p>
        <ul class="footer-links">
            <li><a href="#privacy" class="footer-link">Política de privacitat</a></li>
            <li><a href="#terms" class="footer-link">Termes i condicions</a></li>
            <li><a href="#contact" class="footer-link">Contacte</a></li>
        </ul>
    </footer>
</body>
</html>
```

---

### Creació del repositori a GitHub
1. **Crea un nou repositori a GitHub amb el nom `landing-page`**
    - Selecciona l'opció de crear el repositori amb un `README.md` i la llicència `GNU General Public License`. 
    - Ves al terminal del teu ordinador (l'ordinador on els primers dies de classe vam crear la clau de `SSH` a `GitHub`) i clona el repositori, assegura't de clonar mitjançant l'enllaç que apareix a la pestanya `SSH`. Utilitza la comanda `git clone git@github.com:el_teu_usuari/landing-page.git`
    - La clonació ha creat una nova carpeta a la teva màquina, obre el `Visual Studio Code` i obre la carpeta creada.

### Creació de la carpeta d'imatges 
1. **Crea la carpeta (`images`)**
    - Dins del `Visual Studio Code` crea una nova carpeta anomenada `images`.
    - Descarrega la imatge del producte a la carpeta. La imatge la pots trobar a: [product.png](../img/product.png)

### Copia el codi HTML
1. **Crea un fitxer index anomenat (`index.html`)**:
    - Dins del `Visual Studio Code` crea un un fitxer anomenat `index.html` i copia el codi de l'apartat anterior, recorda que aquest codi **NO** es pot modificar.

---

### Indicacions per al CSS (`styles.css`)
1. **Crea el fitxer d'estils CSS (`styles.css`)**:
    - Dins del `Visual Studio Code` crea un nou fitxer anomenat `styles.css`.
    - Al fitxer `CSS` fes les tasques que venen a continuació.

2. **Dissenya el menú de navegació (`.navbar`)**:
   - Estableix un fons de color fosca (com negre o gris fosc).
   - Afegeix un padding vertical i horitzontal per donar espai als elements.
   - Distribueix els elements del menú en horitzontal, de tal manera que apareixin en una sola línia.
   - Aplica un color clar (blanc) als enllaços per contrastar amb el fons.
   - Afegeix un efecte de hover als enllaços per canviar el color quan l'usuari hi passi el ratolí per sobre.

3. **Estil del contingut principal (`.landing-container`)**:
   - Estableix un fons de color suau (com un gris clar o un blanc cremós).
   - Centra el contingut horitzontalment i verticalment a la pantalla.
   - Afegeix un padding general per separar els elements dels marges.

4. **Estil de la capçalera (`.header`)**:
   - Utilitza un tipus de lletra distintiu per al títol del producte.
   - Aplica un color que contrasti amb el fons.
   - Afegeix un marge inferior per separar-lo del subtítol.

5. **Estil del subtítol (`.product-subtitle`)**:
   - Redueix el tamany de la lletra respecte al títol.
   - Aplica un color gris clar per diferenciar-lo del text principal.

6. **Estil de la imatge destacada (`.hero-image`)**:
   - Fixa un ample màxim per a la imatge.
   - Arrodoneix les cantonades de la imatge.
   - Afegeix un marge inferior per separar-la del text.

7. **Estil del text de la imatge (`.hero-text`)**:
   - Posiciona el text sobre la imatge.
   - Fes que el fons sigui de color negre amb transparència.
   - Aplica color blanc al text.
   - Afegeix un marge interior per separar el text de les vores.

8. **Estil de la descripció (`.product-description`)**:
   - Redueix el tamany de la lletra respecte al títol.
   - Aplica un color gris clar per diferenciar-lo del text principal.
   - Afegeix un marge inferior per separar-lo del botó CTA.

9. **Estil del botó de crida a l'acció (`.cta-button`)**:
   - Utilitza un fons de color vibrant (com blau o verd) per destacar el botó.
   - Aplica un color de lletra clar (blanc) per contrastar amb el fons.
   - Arrodoneix les cantonades del botó.
   - Afegeix un efecte de hover per canviar el color del botó quan l'usuari hi passi el ratolí per sobre.

10. **Estil del peu de pàgina (`.main-footer`)**:
   - Estableix un fons de color fosc (com negre o gris fosc).
   - Afegeix un padding vertical i horitzontal per donar espai als elements.
   - Centra el text dels enllaços i del text del copyright.
   - Aplica un color clar (blanc) als enllaços i al text per contrastar amb el fons.
   - Afegeix un efecte de hover als enllaços per canviar el color quan l'usuari hi passi el ratolí per sobre.

---

### Publicació dels canvis a GitHub
Un cop acabat l'exercici publiqueu els vostres canvis a `GitHub`:

1. Entreu al terminal i aneu fins a la carpeta que conté el repositori.
2. Feu `git add .` per afegir els canvis.
3. Feu `git commit -m "Missatge descriptiu dels canvis"` per a guardar els canvis en el registre local.
4. Finalment feu `git push` per a publicar els canvis.

### Activeu GitHub Pages
En el vostre perfil de `GitHub` aneu fins al repositori de la landing page.

1. Ves al menú superior per gestionar les `Settings` del repositori.
2. Un cop a `Settings` aneu a `Pages` al menú de l'esquerra.
3. Un cop a `Pages` seleccioneu en la secció `Branch` la branca `main`.
4. En uns minuts us apareixerà un enllaç on s'ha publicat la vostra web, recarregueu la pàgina `Pages` fins que aparegui l'enllaç, copieu l'enllaç i aneu altre cop a la pàgina principal del repositori, cliqueu a l'engranatge de la dreta a la secció `About` i escriviu aquest enllaç on diu `Website`.

---

### Resultat esperat
El resultat final ha de ser una landing page visualment atractiva que mostri la informació del producte de manera clara i organitzada. La pàgina ha de quedar centrada a la pantalla, amb una combinació harmònica de colors i tipografia. El menú de navegació i el peu de pàgina han de ser funcionals i ben integrats amb el disseny general.

---

**Nota**: Pots personalitzar els colors i estils segons el teu gust, sempre que segueixis les indicacions bàsiques i utilitzis selectors de classe per aplicar els estils.

Pots consultar la informació bàsica sobre CSS i el model de capsa als següents enllaços:
- [Tutorial d'HTML i CSS](../intro-html-css.md)
- [El model de capsa (Box Model)](../box-model.md)
