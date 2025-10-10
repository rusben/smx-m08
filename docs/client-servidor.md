# El paradigma client-servidor en aplicacions web

Les aplicacions web modernes es basen fonamentalment en el **paradigma client-servidor**, un model d’arquitectura distribuïda en què la comunicació entre els participants es realitza mitjançant protocols estàndard, principalment **HTTP (Hypertext Transfer Protocol)**. Aquest model divideix clarament les responsabilitats entre dues entitats principals: el **client** i el **servidor**.

## Components principals

### El client
El client és el component que **inicia les peticions** cap al servidor. En el context de les aplicacions web, el client sol ser un **navegador web** (com Chrome, Firefox o Safari) que s’executa en un dispositiu de l’usuari —un ordinador, una tauleta o un telèfon mòbil— i que interpreta i presenta el contingut rebut del servidor. Aquesta part de l’aplicació rep el nom de **frontend**.

### El servidor
El servidor, per la seva banda, és el component que **respon a les peticions** del client. S’executa en una màquina remota —sovint un servidor dedicat o un entorn en núvol— i pot estar basat en qualsevol sistema operatiu i maquinari, independent del client. Aquesta part de l’aplicació es coneix com a **backend**.

Tot i que client i servidor solen executar-se en màquines diferents, el protocol HTTP assegura que la comunicació sigui **transparent, estàndard i independent de la plataforma**.

![Paradigma client/servidor](img/client-servidor.jpg)

## Aplicacions del costat del servidor (backend)

El servidor HTTP no només pot servir **pàgines estàtiques** (fitxers HTML predefinits), sinó que també pot **executar programes d’aplicació** per generar contingut dinàmic. Aquests programes reben les peticions del client, processen les dades rebudes (com paràmetres de formularis, cookies o capçaleres HTTP), interactuen amb bases de dades o altres serveis, i generen una resposta que el servidor envia de tornada al client.

Per fer això, els servidors web poden integrar tecnologies com:
- **Servlets i JSP** (Java),
- **PHP**,
- **Node.js**,
- **Python (amb frameworks com Django o Flask)**,
- **Ruby on Rails**, entre d’altres.

Aquests programes permeten que el contingut servit sigui **personalitzat, contextual i dinàmic**, adaptant-se a les necessitats de cada usuari o situació, tot respectant les regles del protocol HTTP des del punt de vista del client.

## Aplicacions del costat del client (frontend)

Tot i que el HTML permet definir l’estructura i l’estil bàsic d’una pàgina web, és un llenguatge **estàtic** i no permet implementar lògica interactiva. Per superar aquesta limitació, s’han desenvolupat tecnologies que permeten **executar codi directament al navegador**, millorant l’experiència d’usuari i reduint la necessitat de comunicacions constants amb el servidor.

Les tecnologies més destacades inclouen:

- **JavaScript**: el llenguatge estàndard del web per a la programació del costat del client. Permet validar formularis, manipular el DOM, gestionar esdeveniments, fer peticions asíncrones (AJAX), i molt més.
- **Frameworks i llibreries frontend**: com React, Angular o Vue.js, que faciliten la construcció d’interfícies d’usuari riques i dinàmiques.
- **Applets Java** (ja en desús): eren petits programes compilats que s’executaven dins del navegador mitjançant la màquina virtual de Java. Avui en dia han estat substituïts per tecnologies més lleugeres i segures com JavaScript i WebAssembly.

Aquest codi del costat del client pot estar **emmagatzemat dins del mateix document HTML** (com en el cas del JavaScript emprat) o carregar-se des de fitxers externs. La seva execució és totalment **independent del servidor un cop carregat**, tot i que sovint es comunica amb ell per actualitzar dades o enviar informació.

## Conclusió

El model client-servidor és la base sobre la qual es construeixen totes les aplicacions web modernes. La separació clara entre **frontend** (interacció amb l’usuari) i **backend** (processament de dades i lògica de negoci) permet desenvolupar sistemes escalables, mantenibles i eficients. Gràcies a la combinació de tecnologies del costat del client i del servidor, les aplicacions web poden oferir experiències riques, dinàmiques i altament interactives, tot respectant els estàndards oberts que fan possible la interoperabilitat a Internet.
