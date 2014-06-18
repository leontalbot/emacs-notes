Emacs pour les développeurs web

    ...
    
D'abord un peu d'histoire.

    ...
    
Pour faire simple, Emacs est créé en 1976 par Richard Stallman.
    
    ...

Nous n'avons qu'une heure, alors trève de détail !
    
    ...
    
Configuration de base

    ...
    
1 - Ajouter les numéros de ligne dans la marge :

    ...
    
`(global-linum-mode 1)`  
`(require 'linum)` 
    
    ...

2 - Surligner la ligne courante :

    ...

`(global-hl-line-mode +1)`

    ...

3 - Activer Ibuffer :

        ...

`(defalias 'list-buffers 'ibuffer)`

    ...

4 - Modifier la police de caractère :

        ...

`(set-face-attribute 'default nil :font "Ubuntu Mono" :height 130)`

    ...

Personnalisé certains raccourcis clavier.

    ...

1 - Naviguer à travers les fenetres :

    ...

`(global-set-key (kbd "C-x <up>") 'windmove-up)`  
`(global-set-key (kbd "C-x <down>") 'windmove-down)`  
`(global-set-key (kbd "C-x <right>") 'windmove-right)`  
`(global-set-key (kbd "C-x <left>") 'windmove-left)`  

    ...

2 - Abbr. dynamique (auto-complétion d'expression) :

    ...

Utiliser `C-<tab>` au lieu de `M-/`  
`(global-set-key (kbd "C-<tab>") 'dabbrev-expand)`  
`(define-key minibuffer-local-map (kbd "C-<tab>") 'dabbrev-expand)`
