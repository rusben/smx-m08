# El model de capsa (Box Model)

En `CSS`, el terme `Box Model` s'utilitza quan es parla de disseny i maquetació.

El model de capsa `CSS` és essencialment una capsa que envolta tots els elements `HTML`. Consta de: `margin`, `border`, `padding` i `content`. La imatge següent il·lustra el model de capsa:

![Model de capsa (Box Model)](img/box-model.gif)

Explicació de les diferents parts:

* ***Contingut (`content`)***: el contingut del quadre, on apareixen text i imatges

* ***Marge interior (`padding`)***: afegeix un marge interior a la capsa. El marge interior és transparent.

* ***Vora (`border`)***: una vora que envolta el farciment i el contingut

* ***Marge exterior (`margin`)***: neteja una àrea fora de la frontera. El marge exterior és transparent.

El model de capsa ens permet afegir una vora al voltant dels elements i definir l'espai entre elements.


A l'hora de dissenyar webs hem de tenir en compte l'atribut `box-sizing`, que indicarà com el navegador aplicarà la llargaria als elements, en la següent imatge es veuen les diferències entre els diferents valors que rep l'atribut.

![Comparació del box-sizing](img/box-sizing-comparison.png)


Normalment els nostres dissenys els realitzarem amb el valor border-box a l'atribut box-sizing de tots els nostres elements.
