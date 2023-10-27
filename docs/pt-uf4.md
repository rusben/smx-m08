# Pràctica UF4 - Instal·lació i configuració de moodle
## Objectius generals de la pràctica
* Instal·lar i configurar gestors de continguts, concretament `moodle`.
* Aprende a utilitzar `moodle` com a administrador.

## Desenvolupament de la pràctica

Aquesta pràctica consisteix en fer un portal de temàtica lliure. El portal haurà d’estar fet en `moodle`.

* Heu d’instal·lar `moodle` en la vostra màquina mitjançant `vagrant`. Seguiex els passos que indica el [manual d'instal·lació d'aplicacions web](installacio-aplicacions-web.md)

* Descarrega la última versió de moodle des de la pàgina oficial https://moodle.org

* ***IMPORTANT:*** Documenta tot el que facis amb captures de pantalla i explicacions. Crea un repositori a github per guardar el teu manual de configuració amb capttures de pantalla i explicacions dins d'un fitxer MarkDown.

* Heu de configurar `moodle` amb els requisits mínims que s'indiquen a continuació:

## Configuració


**1.** Inicia sessió com a administrador del teu Moodle i realitza les següents tasques prèvies d'administració.
    
    **a)** Canvia la teva direcció de correu electrònic i també la teva contrasenya per una altra. Afegeix-te a més un avatar. Tot això es pot fer anant al teu perfil (opció que apareix sota el teu nom que es veu a la part superior dreta de la finestra del Moodle) i clicant sobre l'enllaç `Editar` (o també anant a l'opció `Preferències`, situada al mateix lloc).
   
   **b)** Canvia el nom del teu lloc (tant llarg com curt) i fes que la pàgina principal no mostri res pels usuaris que no estiguin autentificats. Això es pot fer anant a l'opció `Administració del lloc > Primera plana > Paràmetres`
   
   **c)** Comprova que la franja horària del teu lloc sigui la correcta. Això es pot fer anant a l'opció `Administració del lloc > Ubicació > Paràmetres`.
   
   **NOTA:** Aquesta configuració és important, per exemple, per les hores límit d'entregues d'exercicis
   
   **d)** Canvia l'idioma del teu lloc. Això es pot fer anant a l'opció `Administració del lloc > Idioma > Paràmetres` i tenint en compte tant el checkbox `Detecció automàtica de l'idioma` com el desplegable `Idioma per defecte`.
   
   **NOTA:** Per disposar d'un determinat idioma, primer cal instal.lar-lo des de `Administració del lloc > Idioma > Paquets d'idioma`
   
   **e)** Canvia la política de contrasenyes de manera que els usuaris que es creiïn tinguin una contrasenya de com a mínim 4 caràcters incloent-hi, majúscules, minúscules i xifres. Això es pot fer anant a l'opció `Administració del lloc > Seguretat >Normatives del lloc`.

**2.** Crea els següents cursos: un curs anomenat A (sense categoria) que estigui format per 3 temes i un altre anomenat B (també sense categoria) que estigui format per 5 temes. Tot això ho pots fer des de Administració del lloc->Gestiona cursos i categories o també des del quadre `Navegació` anant a `Cursos > Afegeix curs`

**3.** Vés a algun dels cursos creats al punt anterior (simplement seleccionant-lo dins del quadre `Navegació`) i fes que contingui en algun del seus temes algun tipus de material (un document PDF, per exemple), canvia el títol d'algun tema i, en general, investiga les possibilitats que et dóna el botó `Activar edició` en un curs.

   **NOTA:** Aquestes possibilitats no les estudiarem a fons perquè són una tasca més pròpia del professor que no pas de l'administrador del Moodle, però sempre va bé tenir-ne alguna idea.

**4.** Creació d’usuaris i alumnes. 
   
   **a)** Crea manualment un usuari anomenat `Bob` que ha de fer servir el `mètode d'autenticació manual`. Això es pot fer des de `Administració del lloc > Usuaris > Comptes > Afegeix un usuari`
   
   **b)** Genera deu alumnes que ho seran dels dos cursos A i B . Fes servir un arxiu CSV per realitzar aquesta creació en bloc. Vés a `Administració del lloc > Usuaris > Comptes > Carrega usuaris` i segueix els passos que et marca. 
   
   **NOTA:** Per saber el contingut que hauria de tenir aquest fitxer, consulteu: https://docs.moodle.org/30/en/Upload_users#File_formats_for_upload_users_file
   
   **c)** Elimina dos dels deu alumnes creats a l'apartat anterior fent servir l'opció `Administració del lloc > Usuaris > Accions amb usuaris en bloc`

**5.** Ara matricula aquests usuaris als diferents cursos.

   **a)** Fes que al curs A no hi hagi possibilitat d'inscripció (és a dir, que només es permeti l'accés de visitant de manera que el curs sigui totalment públic sense control d'usuaris -ni alumnes ni professors-). D'altra banda, fes que al curs B es necessiti registre manual d'usuaris (és a dir, que sigui l'administrador -tu- qui matriculi cada usuari al curs, ja sigui com a professor o com a alumne). Tot això ho pots fer des de `Administració del curs > Ususaris > Mètodes d'inscripció`. Si no surt algun mètode d'inscripció disponible, has d'activar-lo a: `Administració de lloc > Connectors > Autenticació > Gestió de l'autenticació`

   **b)** Assigna com a professor del curs B l'usuari "Bob" i com a alumnes a tots els que fas afegir des de l'arxiu CSV Tot això ho pots fer anant a `Administració del curs > Usuaris inscrits > Inscriure`.

   **c)** Comprova que efectivament, el contingut del curs A (afegit per l'administrador del sistema -és a dir, tu- estigui disponible públicament i que per accedir al curs B s'hagi d'iniciar sessió amb un usuari registrat (alumne o professor)

**6.** Canvia l'aparença estètica del teu lloc. Concretament, descarrega't i activa un tema diferent dels que venen per defecte i prova de canviar també la capçalera i el peu de pàgina del lloc. Això ho pots fer primer anant a `Administració del lloc > Connectors > Instal·lar complement` i després a `Administració del lloc > Aparença > Temes > Selector de temes` Sempre pots fer servir l'enllaç `Canvi de rol` del menú de la dreta per observar com es veuria el lloc sent alumne, professor, etc.

**7.** Assigna un professor i matricula alumnes al curs A.

**8.** Amb el professor afegeix contingut al curs A. Afegeix diferents tipus d’activitats i recursos. Crea una tasca amb data d’entrega oberta que demani la càrrega d’un fitxer PDF. Documenta tot el que facis amb captures de pantalla i explicacions.

**9.** Entra amb un alumne i comprova que pots lliurar la tasca.

## Continguts
En el curs A crea una UF amb 2 NF dintre. En aquesta UF crea diverses activitats.

Botó Activar Edició (a dalt a la dreta). Una UF es pot crear amb una etiqueta i movent a la dreta el seu contingut. Es pot canviar el Format del curs a `Temes` a `Administració del Curs > Editar Curs > Format del Curs`

Fes servir el moodle del puig com a referència. Han d’haver tant activitats magistrals com evaluables (com a mínim una entrega i un questionari). Clona (importa) el curs sencer al curs B `Administració del Curs > Importar` (des del curs B)

## Qualificació
En el curs A fes que un alumne completi totes les tasques evaluables (entrant amb la seva compta). Calificales amb el professor i configura el calificador per a que doni una nota de la UF automàticament a `Administració del Curs > Configuració de qualificacions`.

Crea una insignia i atorga-la a aquest alumne des de `Administració del Lloc > Insígnies`

## Qüestionaris
Crea un qüestionari i afegeix preguntes del banc de preguntes. Crea diferents categories dintre del banc de preguntes i diverses preguntes en cada categoria. A l'hora de crear el qüestionari has de seleccionar les preguntes del banc de preguntes. Respon les preguntes del qüestionari amb un usuari estudiant i mira les qualificacions amb l'usuari professor.

## Importar i exportar un curs
Entra a la zona `Administració > Cursos > Còpies` i fes una còpia de seguretat del teu curs. Després envia aquest fitxer a un company i que l'importi al seu moodle. Has d'importar al teu moodle un altre curs d'un company. 

## Personalització
Descarrega i aplica un tema nou al teu LMS.

Edita també tant la capçalera (header) com el peu (footer) i la pàgina principal (Front page) Posa-li un logotip al teu moodle.

## Seguretat
Baneja una IP i aplica una política de seguretat. Pots posar la que vulguis però l’hauràs de justificar.

***NOTA:*** Capturar per a cada pregunta, les imatges que han de mostrar la resposta, i tenir-les a mà, farà que sigui molt més fàcil contestar les preguntes el dia de l’avaluació!

## Usuaris
Crea 10 usuaris alumnes i un usuari professor posant-li dades.
`Administració del Lloc > Usuaris > Crear Usuari / Pujar Usuaris` (de cop amb un arxiu csv, hi ha un model de csv al final del document).

Assigna al professor a A i B. Matricula els alumnes a A mitjançant `Administració del Curs > Usuaris > Usuaris Matriculats` i connectat amb un alumne i matricula'l a B amb la contrassenya.

### Fitxer usuaris.csv

```console
username,firstname,lastname,email,password
blobesponja,Blob,Esponja,blobesponja@elpuig.xeill.net,Abc123!
jsongoku,JSON,Goku,jsongoku@elpuig.xeill.net,Abc123!
canceligretel,Cancel,Gretel,canceligretel@elpuig.xeill.net,Abc123!
davidelgnome,David,Gnome,davidelgnome@elpuig.xeill.net,Abc123!
ritahardware,Rita,Hardware,trritahardwarees@elpuig.xeill.net,Abc123!
```

## Més informació
LMS: https://en.wikipedia.org/wiki/Learning_management_system
