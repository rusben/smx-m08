# El paradigma client-servidor en aplicacions web.

Les aplicacions web utilitzen l'esquema client/servidor, fent ús de l'protocol HTTP per a la gestió de la comunicació. Quan executem una aplicació web, hi ha dues parts ben diferenciades: el client, que és el procés que envia les peticions; i el servidor, que el procés responsable de respondre. Aquestes aplicacions solen estar en diferents màquines, equipades amb diferent maquinari i sistema operatiu.

El client es pot estar executant en un equip portàtil, i el servidor és el procés que s'executa en una màquina remota.

Els dos components d'una aplicació web solen denominar-se frontend i backend. El frontend és executat en un navegador web al costat del client; i el backend s'executa en el costat de servidor.


![Paradigma client/servidor](img/client-servidor.png)


## Aplicacions en el costat del servidor

A la banda de servidor, hem d'aconseguir que el nostre servidor HTTP sigui capaç d'executar programes d'aplicació que recullin els paràmetres de peticions de client, els processin i tornin a el servidor un document que aquest passarà al seu torn a client.

Així, per al client el servidor no haurà fet res diferent al que estipula el protocol HTTP, però el servidor es pot valer d'eines externes per processar i servir la petició sol·licitada, podent així no limitar-se a servir pàgines estàtiques, sinó utilitzar altres aplicacions (servlets, JSP, PHP, etc.) per servir documents amb contingut dinàmic.

Els programes d'aplicació són típicament programes que realitzen consultes a bases de dades, processen la informació resultant i tornen la sortida a servidor, entre altres tasques.

## Aplicacions en el costat del client
Es tenen moltes tecnologies relacionades amb extensions de la banda de el client (entenent client com un navegador que interpreta codi HTML). El codi HTML és un codi estàtic que només permet formatar l'aparença d'una pàgina i definir enllaços a altres pàgines o URL. Això no és suficient si volem que el navegador realitzi funcions més complicades: validar entrades de formularis, mostrar l'evolució de l'preu d'unes accions, etc.

Per ampliar les funcionalitats de el navegador (respectant el protocol HTTP), s'utilitzen tecnologies com JavaScript, Applets etc. Aquestes es basen en fer que el navegador executi codi que li passa al servidor, bé embegut en documents HTML (com és el cas de JavaScript), o bé mitjançant fitxers compilats multiplataforma (com és el cas dels Applets Java).
