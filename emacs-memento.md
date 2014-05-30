Aide mémoire Emacs (memento)
================================

## Légende

* `C-` correspond à la touche `Ctrl`
* `M-` correspond à la touche `Alt`

Donc `C-k` est semblable à `Ctrl + k`.

## Varia

* Annule commande en cours:`C-g`
* Undo: `C-x u` ou `C-/`
* Répéter une commande: `C-x z` (Ensuite seulement `z` pour répéter à nouveau.)

## Déplacement

* Déplacement à travers les mots & les paragraphes: `C-flèches`
* Ligne suivante `C-n`
* Ligne précédente `C-p`
* Début d'une ligne `C-a`
* Début d'une ligne indentée `M-m`
* Fin d'une ligne `C-e`
* Mot suivant `M-f`
* Mot précédent `M-b`
* Phrase précédente `M-a`
* Phrase suivante `M-e`
* Écran précédent `M-v`
* Écran suivant `C-v`
* Début du buffer `M-<`
* Fin du buffer `M->`
* Braquette fermante `C-M flèche droite`
* Braquette ouvrante `C-M flèche gauche`

## Buffers

* Quitter emacs: `C-x C-c`
* Ouvir ou créer un fichier: `C-x C-f`
* Sauvegarder le buffer courant: `C-x C-s`
* Sauvegarder tous les buffers ouverts: `C-x s`
* Enregistrer-sous: `C-x C-w`
* Voir la liste des buffers: `C-x C-b`
* Aller à la ligne X: `M-g g`
* Fermer un buffer: `C-x k`
* Insérer le contenu d'un autre fichier dans un buffer: `C-x i`

## Effacer

* Efface le mot suivant: `M-d`
* Efface le mot précédant: `M-Backspace`

## Sélectionner

* Indiquer le début (point) d'une sélection (mark): `C-Spacebar`
* Sélectionner tout le paragraphe: `M-h`
* Sélectionner tout le buffer: `C-x h`
* Sélectionner une fonction `C-M-h`
* Modifier une sélection `C-x C-x`

On peut faire des actions spécifiques à une région qui est marquée. Ex.: Des undo, des trouver/remplacer, des recherches, etc.

## Couper/Copier/Coller

* Couper: `C-w`
* Copier: `M-w`
* Coller: `C-y`
* Couper une ligne: `C-k`
* Couper une phrase (vers l'avant): `M-k`

## Chercher/Remplacer

* Recherche vers la fin du fichier: `C-s` (répéter la commande pour l'occurrence suivante)
* Recherche vers le début du fichier: `C-r` (répéter la commande pour l'occurrence précédente)
* Remplacer: `M-%`
 * `y` pour remplacer la correspondance en cours;
 * `n` pour aller à la prohcaine correspondance sans remplacer;
 * `q` pour sortir du processus de remplacement courant;
 * `.` pour remplacer la correspondance en cours puis quitter le processus;
 * `!` pour tout remplacer sans aucune autre question.
* Chercher dans les fichiers: `M-x rgrep`

## Changements de casse

* Premier caractère en majuscule: `M-c`
* Mot en majuscule: `M-u`
* Mot en minuscule: `M-l`

## Permutations

* Intervertir deux lettres: `C-t`
* Intervertir deux mots: `M-t`
* Intervertir deux lignes: `C-x C-t`
* Déplacer un caractère vers l'avant ([transpose](https://www.gnu.org/software/emacs/manual/html_node/emacs/Transpose.html)) `C-t`

## Shell

* Lancer un commande du shell: `M-!`
* Démarrer un terminal shell: `M-x shell`

## Complétion

* Autocomplétion d'un mot se trouvant déjà dans le buffer: `M-/`

## Aide

* Tutorial Emacs: `F1 t`
* Documentation: `F1 r`
* Description d'une commande: `F1 k` ou `C-h k`
* Description d'une fonction: `F1 f` ou `C-h f`
* Apropos, chercher de l'info par regEx: `F1 a` ou `C-h a`

## HTML (Mode SGML)

* Effacer une balise en laissant intacte le contenu: `C-c Backspace`
* Créer une balise `C-c C-o`
* Compléter une balise: `C-c C-e`
* Aller à la fin d'un balise `C-c C-f`
* Aller au début d'un balise `C-c C-b`

## Gestion fichier/dossier (dired)

* Ouvrir un dossier `C-x d`
* Monter d'un niveau `^`
* Copier `C`
* Renommer `R`
* Effacer `D`
* Créer un nouveau dossier `+`
* Rafraichir un dossier `g`
* Archiver/Désarchiver avec Gzip `Z`

[Pour en savoir plus sur Dired] (https://www.gnu.org/software/emacs/manual/html_node/emacs/Dired.html).

## Manipulation du texte

### Rectangles

* Remplacer/ajouter du texte sur plusieurs lignes `C-x r t`
* Insérer des espaces sur plusieurs lignes `C-x r o`

[Pour en savoir plus sur les Rectangles] (http://www.gnu.org/software/emacs/manual/html_node/emacs/Rectangles.html).

## Macros

* Démarrer l'enregistrement d'un macro `C-x (`
* Stopper l'enregistrement d'un macro `C-x )`
* Exécuter le dernier macro enregistré `C-x e`
* Assigner un nom de commande à un macro `C-x C-k n`
* Assigner un raccourci clavier à un macro `C-x C-k b`

[En savoir plus sur les Macros] (http://www.gnu.org/software/emacs/manual/html_node/emacs/Keyboard-Macros.html).
