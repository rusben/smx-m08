# Guia completa: Treballar amb Git, GitHub i SSH a Linux

Aquesta guia t’ensenyarà a:

- Registrar-te a GitHub  
- Configurar una clau SSH per autenticació segura  
- Crear i clonar repositoris mitjançant SSH  
- Editar codi amb Visual Studio Code  
- Fer *commits*, gestionar branques i publicar canvis

Tot això des del teu sistema **Linux**, de forma eficient i professional.

## 1. Registre a GitHub

1. Ves a [https://github.com](https://github.com)  
2. Clica **Sign up** i crea un compte amb el teu correu (preferiblement institucional o personal estable).  
3. Verifica el correu i inicia sessió.

## 2. Configuració de clau SSH (recomanat)

Per evitar haver d’introduir usuari i token cada vegada que interactuïs amb GitHub, configurarem **autenticació SSH**.

### 2.1. Comprova si ja tens una clau SSH

```bash
ls -al ~/.ssh
```

Si veus fitxers com `id_ed25519.pub` o `id_rsa.pub`, ja tens una clau. Si no, continua.

### 2.2. Genera una clau SSH nova

```bash
ssh-keygen -t ed25519 -C "el-teu-correu@exemple.com"
```

> Si el teu sistema no suporta `ed25519`, usa:  
> ```bash
> ssh-keygen -t rsa -b 4096 -C "el-teu-correu@exemple.com"
> ```

Prem **Enter** per acceptar la ubicació per defecte (`~/.ssh/id_ed25519`).  
Pots deixar buida la contrasenya (prem **Enter** dues vegades) o posar-ne una per més seguretat.

### 2.3. Copia la clau pública

Mostra i copia la clau:

```bash
cat ~/.ssh/id_ed25519.pub
```

### 2.4. Afegeix la clau a GitHub

1. Ves a [https://github.com/settings/keys](https://github.com/settings/keys)  
2. Clica **New SSH key**  
3. Omple:
   - **Title**: `El meu ordinador Linux`  
   - **Key**: enganxa la clau que has copiat  
4. Clica **Add SSH key**

### 2.5. Prova la connexió

```bash
ssh -T git@github.com
```

Respon **yes** quan et demani confirmació. Si veus:

```
Hi teu-usuari! You've successfully authenticated...
```

La teva clau SSH funciona correctament!



## 3. Creació i clonació d’un repositori

### 3.1. Crea un repositori a GitHub

1. Clica el botó **+ → New repository**  
2. Omple:
   - **Name**: `my-first-webpage`  
   - **Public**  
   - **Add a README file** (opcional, però útil)  
3. Clica **Create repository**

### 3.2. Clona el repositori mitjançant SSH

1. A la pàgina del repositori, clica **Code → SSH**  
2. Copia l’URL (ex: `git@github.com:teu-usuari/my-first-webpage.git`)  
3. A la terminal:

```bash
git clone git@github.com:teu-usuari/my-first-webpage.git
```

> Ara ja pots treballar sense haver d’introduir credencials!

## 4. Treballa amb Visual Studio Code

1. Obre VS Code  
2. **File → Open Folder** i selecciona la carpeta del repositori (`my-first-webpage`)  
3. Crea o edita fitxers com `index.html`, `style.css`, etc.  
4. Guarda els canvis

> **Consell**: Instal·la l’extensió **Live Server** per veure els canvis en temps real al navegador.

## 5. Gestió de canvis amb Git

### 5.1. Comprova l’estat

```bash
cd my-first-webpage
git status
```

Els fitxers nous o modificats apareixeran en vermell (no seguits).

### 5.2. Afegeix fitxers a l’àrea d’escenari

- Tots els fitxers:
  ```bash
  git add .
  ```
- Un sol fitxer:
  ```bash
  git add index.html
  ```

### 5.3. Fes un *commit*

```bash
git commit -m "Afegida pàgina inicial i estils"
```

> Escriu missatges clars i descriptius.

### 5.4. Veure historial

```bash
git log
```

Prem **Q** per sortir.

## 6. ☁️ Publica els canvis a GitHub

```bash
git push
```

Gràcies a SSH, **no et demanarà usuari ni contrasenya**.

> Si és la primera vegada que puges una branca nova, potser hauràs de fer:  
> ```bash
> git push -u origin nom_branca
> ```


## 7. Treballar amb branques

Les branques et permeten desenvolupar funcionalitats sense afectar la versió principal.

### Crear i canviar a una branca nova

```bash
git checkout -b caracteristica-nova
```

### Llistar branques

```bash
git branch
```

### Canviar de branca

```bash
git checkout main
```

### Pujar una branca a GitHub

```bash
git push -u origin caracteristica-nova
```

## 8. Flux de treball recomanat

1. **Clona** el repositori via SSH → `git clone git@github.com:...`  
2. **Obre** la carpeta a VS Code  
3. **Edita** els fitxers  
4. **Revisa** els canvis → `git status`  
5. **Afegeix** → `git add .`  
6. **Guarda** → `git commit -m "..."`  
7. **Puja** → `git push`  
8. (Opcional) **Utilitza branques** per a noves funcionalitats


## 9. Consells finals

- **Fes *commits* petits i freqüents**  
- **Escriu bons missatges** que expliquin *què* i *per què*  
- **Utilitza `.gitignore`** per excloure fitxers innecessaris (`node_modules/`, `.vscode/`, etc.)  
- **Mantén el repositori sincronitzat**: si treballes en equip, fes `git pull` abans de començar

## Recursos útils

- [Documentació oficial de Git](https://git-scm.com/doc)  
- [GitHub Skills (cursos interactius)](https://skills.github.com/)  
- [Guia de `.gitignore`](https://www.toptal.com/developers/gitignore)

Amb aquesta guia ja tens tot el necessari per treballar de forma **professional, segura i eficient** amb Git i GitHub des del teu Linux! 🚀

> ✨ **Recorda**: la clau SSH només s’ha de configurar **un cop per equip**. Després, tot funcionarà de forma transparent!
