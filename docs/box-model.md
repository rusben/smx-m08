## El model de capsa (Box Model) en CSS

En CSS, el **model de capsa** (*Box Model*) és un dels conceptes fonamentals per entendre com es dissenyen i posicionen els elements en una pàgina web. **Cada element HTML es tracta com una caixa rectangular**, independentment del tipus d’element (bloc, en línia, en línia-bloc, etc.). Aquesta "capsa" està formada per quatre capes concèntriques que defineixen la seva mida, espaiat i aparença visual.

### Les quatre capes del Box Model

![Model de capsa (Box Model)](img/box-model.gif)

1. **Contingut** (*content*)  
   - És l’àrea on es mostra el contingut real: text, imatges, icones, vídeos, etc.  
   - La seva mida es controla amb les propietats `width` i `height`.  
   - Per als elements en línia (com `<span>` o `<a>`), `width` i `height` **no tenen efecte** per defecte.

2. **Marge interior** (*padding*)  
   - Espai transparent **dins de l’element**, entre el contingut i la vora.  
   - Afegeix "respiració" al contingut i millora la llegibilitat i l’accessibilitat (per exemple, en botons).  
   - El *padding* **hereta el fons** de l’element (color de fons, imatge, etc.), però **no** el color de text ni les vores.  
   - No pot ser negatiu.

3. **Vora** (*border*)  
   - Línia que envolta el *padding* i el *contingut*.  
   - Es pot personalitzar amb:  
     - `border-width` (gruix),  
     - `border-style` (`solid`, `dashed`, `dotted`, `none`, etc.),  
     - `border-color` (color).  
   - També es pot aplicar per costats individuals (`border-top`, `border-left`, etc.).  
   - La vora **no és transparent**: sempre té un color o estil visible (llevat que sigui `border: none`).

4. **Marge exterior** (*margin*)  
   - Espai **fora de la vora**, que separa l’element dels altres.  
   - És **totalment transparent** i **no hereta cap estil** (ni color de fons, ni vores).  
   - Pot ser **negatiu**, cosa que permet superposar elements o ajustar el flux del document.  
   - **Col·lapse de marges**: quan dos marges verticals (superior i inferior) es toquen, es combinen en un sol marge igual al més gran (això només passa amb elements en bloc i en flux normal).


### Com es calcula la mida total d’un element?

Per defecte (`box-sizing: content-box`), la mida total d’un element es calcula així:

```
Amplada total = width + padding-esquerra + padding-dreta + border-esquerra + border-dreta + margin-esquerra + margin-dreta
```

> **Important**: Els *marges* **no** formen part de la mida de l’element per al càlcul del layout, però **sí** ocupen espai en la pàgina.

Per exemple, si definim:
```css
div {
  width: 200px;
  padding: 20px;
  border: 5px solid black;
  margin: 10px;
}
```

- **Contingut**: 200px  
- **Padding + Border**: 20 + 5 + 20 + 5 = 50px  
- **Amplada ocupada pel layout**: 200 + 50 = **250px**  
- **Espai total a la pàgina** (incloent marges): 250 + 10 + 10 = **270px**

Això pot provocar que els elements no encaixin com esperem en dissenys de columna o graella.

### La propietat `box-sizing`: controlar com es calculen les mides

La propietat `box-sizing` permet canviar la forma en què el navegador interpreta les mides (`width` i `height`).

![Comparació del box-sizing](img/box-sizing-comparison.png)

#### 1. `content-box` (valor per defecte)
- `width` i `height` **només afecten el contingut**.
- El *padding* i la *border* s’afegeixen **a sobre** de la mida declarada.
- Pot fer que el layout sigui menys previsible, especialment en dissenys responsius.

#### 2. `border-box`
- `width` i `height` **inclouen el contingut, el *padding* i la *border***.
- El *margin* **sempre queda fora**.
- És molt més intuïtiu per al disseny modern, ja que la mida declarada és la mida real que ocupa l’element (sense comptar marges).

#### Exemple pràctic:
```css
.capsa {
  box-sizing: border-box;
  width: 300px;
  padding: 20px;
  border: 10px solid blue;
}
```
→ L’element ocuparà exactament **300px d’amplada**, incloent-hi padding i vora.

### Millor pràctica: Aplicar `box-sizing: border-box` globalment

Per evitar sorpreses i simplificar els càlculs, molts desenvolupadors apliquen aquesta regla a tot el document:

```css
/* Aplica border-box a tots els elements i pseudo-elements */
*, *::before, *::after {
  box-sizing: border-box;
}
```

Aquesta tècnica:
- Assegura coherència en tot el projecte.
- Facilita el treball amb frameworks com Bootstrap o Tailwind.
- Millora la mantenibilitat del codi.

> 🔍 **Per què `*::before` i `*::after`?**  
> Perquè aquests pseudo-elements també poden tenir mides, padding o border, i volem que segueixin la mateixa lògica.

### Consideracions d’accessibilitat i UX

- **Padding suficient**: Assegura que els elements interactius (botons, enllaços) tinguin prou espai intern per ser fàcils de tocar (mínim 44×44 px segons les WCAG).
- **Marges adequats**: Evita que els elements estiguin massa junts, cosa que pot dificultar la lectura o la navegació amb teclat.
- **Vores clares**: En elements interactius, una vora visible millora la percepció visual, especialment per a persones amb baixa visió.

### Casos especials i curiositats

- **Elements en línia** (`<span>`, `<a>`, `<strong>`, etc.):  
  - El *padding* i la *border* es mostren, però **no afecten l’alçada de la línia**.  
  - El *margin-top* i *margin-bottom* **no tenen efecte** (només *margin-left* i *margin-right*).

- **Elements substituïts** (`<img>`, `<input>`, `<video>`):  
  - Tenen comportaments lleugerament diferents, però segueixen el mateix model de capsa.

- **Disposició flexible i de graella**:  
  - En `display: flex` o `display: grid`, el model de capsa segueix aplicant-se, però el comportament dels marges i l’alineació pot variar.

### Resum visual

| Capa          | Propietats CSS          | Transparent? | Afecta la mida total? |
|---------------|--------------------------|--------------|------------------------|
| Contingut     | `width`, `height`        | No           | Sí (base)              |
| Padding       | `padding`                | No¹          | Sí                     |
| Border        | `border`                 | No           | Sí                     |
| Margin        | `margin`                 | Sí           | No (però ocupa espai)  |

> ¹ El *padding* hereta el fons de l’element, per tant no és transparent visualment, tot i que no té color propi.


### Conclusió

El **Box Model** és la base del disseny web en CSS. Entendre com funcionen les seves quatre capes —i com la propietat `box-sizing` les afecta— és essencial per crear maquetacions previsibles, responsives i accessibles.  
Amb l’ús consistent de `box-sizing: border-box`, pots evitar molts dels errors més comuns en el càlcul d’espais i dimensions, i centrar-te en construir interfícies robustes i atractives.

> **Consell final**: Quan inspeccionis un element amb les **DevTools del navegador**, podràs veure visualment el Box Model i com s’apliquen les mides. És una eina indispensable per depurar maquetacions!
