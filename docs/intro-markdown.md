# Què és Markdown?

**Markdown** és un llenguatge de marcatge lleuger dissenyat per permetre la **formatació de text pla** d’una manera **intuïtiva, llegible i eficient**. Va ser creat l’any **2004** per **John Gruber** i **Aaron Swartz** amb un objectiu clar: permetre que qualsevol persona pugui escriure contingut fàcilment llegible en format de text pur, que després es pugui convertir automàticament a **HTML** (o altres formats com PDF, DOCX, etc.).

Gràcies a la seva simplicitat i versatilitat, Markdown s’ha convertit en l’estàndard *de facto* en entorns com:

- Plataformes de documentació (com GitHub, GitLab o Notion)
- Blocs i wikis
- Fòrums i xats tècnics
- Editors de text moderns (com Obsidian, Typora o VS Code)



## Sintaxi bàsica de Markdown

La força de Markdown resideix en la seva **sintaxi mínima i natural**, que prioritza la **llegibilitat del codi font**. A continuació, es detallen els elements més comuns:

### Capçaleres

Les capçaleres es defineixen amb el símbol `#`. El nombre de `#` indica el nivell de la capçalera (de 1 a 6):

```markdown
# Capçalera 1
## Capçalera 2
### Capçalera 3
#### Capçalera 4
##### Capçalera 5
###### Capçalera 6
```

> **Consell:** La capçalera de nivell 1 (`#`) sol representar el títol principal del document.



### Paràgrafs i salts de línia

Els paràgrafs es separen amb **una línia en blanc**. Per forçar un salt de línia dins del mateix paràgraf, afegeix **dos o més espais al final d’una línia**.

```markdown
Aquest és el primer paràgraf.

Aquest és el segon paràgraf.
```



### Llistes

#### Llistes no ordenades  
Utilitza `-`, `*` o `+`:

```markdown
- Element 1
- Element 2
  - Subelement (indentat amb 2 espais)
- Element 3
```

#### Llistes ordenades  
Utilitza números seguits d’un punt:

```markdown
1. Primer element
2. Segon element
3. Tercer element
```

> Els números reals no importen; Markdown els renumera automàticament si cal.


### Enllaços

La sintaxi per enllaços és:

```markdown
[Text visible](URL "Títol opcional")
```

Exemple:

```markdown
[Visita Google](https://www.google.com)
```


### Imatges

Semblant als enllaços, però amb un `!` al principi:

```markdown
![Text alternatiu](URL_de_la_imatge "Títol opcional")
```

Exemple:

```markdown
![Logo de Markdown](https://markdownlogo.com/logo.png)
```

> 📌 El text alternatiu és important per l’accessibilitat i SEO.



### Èmfasi (negreta i cursiva)

- **Cursiva**: `*text*` o `_text_`
- **Negreta**: `**text**` o `__text__`
- **Negreta + cursiva**: `***text***`

Exemple:

```markdown
Aquest és *cursiva*, **negreta** i ***negreta cursiva***.
```



### Codi

#### Codi en línia  
Envoltat amb accents greus (backticks): `` `codi` ``

Exemple:  
```markdown
Instal·la el paquet `lodash` amb npm.
```

#### Blocs de codi  
Utilitza **tres accents greus** (```) i, opcionalment, especifica el llenguatge per ressaltat de sintaxi:

```markdown
```javascript
function exemple() {
  console.log("Hola, Markdown!");
}
```
```



## Exemple complet de document Markdown

```markdown
# El meu primer document en Markdown

Aquest és un paràgraf introductori. Markdown facilita la creació de contingut web sense haver d’escriure HTML.

## Llista de la compra

- Pomes
- Plàtans
- Taronjes

## Enllaços i recursos

Pots visitar [Google](https://www.google.com) o veure aquesta [imatge d'exemple](https://example.com/fruit.jpg).

![Fruita fresca](https://example.com/fruit.jpg "Imatge de fruita")

## Format de text

Resalta paraules en *cursiva* o **negreta** segons calgui. També pots combinar-les: ***molt important!***

## Codi d'exemple

```python
def saluda():
    print("Hola des de Python!")
```



> **Avantatges de Markdown**:  
> - Fàcil d’aprendre  
> - Compatible amb gairebé tots els sistemes moderns  
> - Independent de l’eina: pots editar-lo amb qualsevol editor de text  
> - Ideal per a documentació tècnica, notes personals i col·laboració



## Conclusió

Markdown és una eina **poderosa i elegant** per formatar text sense complicacions. Ofereix un equilibri perfecte entre **simplicitat** i **funcionalitat**, fent-lo ideal tant per a usuaris novells com per a desenvolupadors i escriptors tècnics.

