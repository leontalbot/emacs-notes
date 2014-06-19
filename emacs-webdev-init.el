;;  ,           , 
;;  /             \ 
;; ((__-^^-,-^^-__)) 
;;  `-_---' `---_-' 
;;   `--|o` 'o|--' 
;;      \  `  / 
;;       ): :( 
;;       :o_o: 
;;        "-" 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GNU EMACS POUR LES DÉVELOPPEURS WEB ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;; D'ABORD UN PEU D'HISTOIRE
;;

;; Pour faire simple, emacs est créé en 1976 par Richard Stallman au MIT.
;; Mais nous n'avons qu'une heure, alors trève de détail !!

;;
;; CONFIGURATION DE BASE
;;

;; D'abord il faut renommer ce fichier en init.el et le déposer dans le répertoire .emacs.d qui se trouve dans votre $HOME.

;; Pour avoir une instance emacs vierge :
;; - Créer un folder dans votre $HOME, par exemple «emacstest».
;; - Ensuite lancer Emacs en changeant votre variable d'environnement $HOME pour quelle pointe sur «emacstest» : HOME=/home/hs0ucy/emacstest emacs.

;; Config. 01
;; Ajouter les numéros de ligne dans la marge :

;; (global-linum-mode 1)
;; (require 'linum)

;; Config. 02
;; Surligner la ligne courante :

;; (global-hl-line-mode +1)

;; Config. 03
;; Modifier la police de caractère :

;; (set-face-attribute 'default nil :font "Ubuntu Mono" :height 130)

;;
;; PERSONNALISÉ CERTAINS RACCOURCIS CLAVIER
;;

;; Raccourci 01
;; Naviguer à travers les fenetres :

;; (global-set-key (kbd "C-x <up>") 'windmove-up)
;; (global-set-key (kbd "C-x <down>") 'windmove-down)
;; (global-set-key (kbd "C-x <right>") 'windmove-right)
;; (global-set-key (kbd "C-x <left>") 'windmove-left)

;; Raccourci 02
;; Abbr. dynamique (auto-complétion d'expression); utiliser C-<tab> au lieu de M-/

;; (global-set-key (kbd "C-<tab>") 'dabbrev-expand)
;; (define-key minibuffer-local-map (kbd "C-<tab>") 'dabbrev-expand)

;;
;; GESTION DES PAQUETS AVEC ELPA/MELPA
;;

;; Obtenir la liste des paquets : M-x package-list-packages

;; Installer les paquets du dépôt MELPA :

;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (package-initialize)
;;   (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;   )

;; Quelques paquets (modes) utiles pour le développement web :
;; - Emmet mode (Fork de Zen Coding)
;; - JS2 mode (JavaScript)
;; - Magit (Git) (Magit Cheatsheet)
;; - Markdown mode
;; - Multi-Web mode (Plusieurs modes selon la position du curseur)
;; - Multiple cursors
;; - PHP mode
;; - Projectile (Gestion de projet)
;; - SASS mode
;; - SCSS mode
;; - Web mode (Édition de template HTML)
;; - Yasnippet (Système de snippets/templates)

;; Installer un thème avec le gestionnaire de paquet (ample-theme, solarized-theme, zenburn-theme, etc.) :
;; Ensuite : M-x load-theme

;; Pour que le thème se charge au démarrage d'Emacs :
;; (load-theme 'nomdutheme t)

;;
;; AJOUTER QUELQUES FONCTIONNALITÉS (DEFUNS) PRATIQUES
;;

;; Fonction 01
;; Dupliquer une ligne :

;; (defun djcb-duplicate-line (&optional commentfirst)
;;   "comment line at point; if COMMENTFIRST is non-nil, comment the original" 
;;   (interactive)
;;   (beginning-of-line)
;;   (push-mark)
;;   (end-of-line)
;;   (let ((str (buffer-substring (region-beginning) (region-end))))
;;     (when commentfirst
;;       (comment-region (region-beginning) (region-end)))
;;     (insert-string
;;      (concat (if (= 0 (forward-line 1)) "" "\n") str "\n"))
;;     (forward-line -1)))

;; ;; duplicate a line
;; (global-set-key (kbd "C-c y") 'djcb-duplicate-line)

;; ;; duplicate a line and comment the first
;; (global-set-key (kbd "C-c c") (lambda()(interactive)(djcb-duplicate-line t)))

;; Fonction 02
;; Déplacer la ligne courante :

;; (defun move-line-up ()
;;   "Move up the current line."
;;   (interactive)
;;   (transpose-lines 1)
;;   (forward-line -2)
;;   (indent-according-to-mode))

;; (defun move-line-down ()
;;   "Move down the current line."
;;   (interactive)
;;   (forward-line 1)
;;   (transpose-lines 1)
;;   (forward-line -1)
;;   (indent-according-to-mode))

;; (global-set-key [(control shift up)]  'move-line-up)
;; (global-set-key [(control shift down)]  'move-line-down)

;; Fonction 03
;; Fusionner des lignes :

;; (defun top-join-line ()
;;   "Join the current line with the line beneath it."
;;   (interactive)
;;   (delete-indentation 1))

;; (global-set-key (kbd "M-é") 'top-join-line)

;; Fonction 04
;; Naviguer à travers les braquettes et les parenthèses :

;; (defun ergoemacs-forward-open-bracket (&optional number)
;;   "Move cursor to the next occurrence of left bracket or quotation mark.

;; With prefix NUMBER, move forward to the next NUMBER left bracket or quotation mark.

;; With a negative prefix NUMBER, move backward to the previous NUMBER left bracket or quotation mark."
;;   (interactive "p")
;;   (if (and number
;;            (> 0 number))
;;       (ergoemacs-backward-open-bracket (- 0 number))
;;     (forward-char 1)
;;     (search-forward-regexp
;;      (eval-when-compile
;;        (regexp-opt
;;         '("(" "{" "[" "<" "〔" "【" "〖" "〈" "《" "「" "『" "“" "‘" "‹" "«"))) nil t number)
;;     (backward-char 1)))

;; (defun ergoemacs-backward-open-bracket (&optional number)
;;   "Move cursor to the previous occurrence of left bracket or quotation mark.
;; With prefix argument NUMBER, move backward NUMBER open brackets.
;; With a negative prefix NUMBER, move forward NUMBER open brackets."
;;   (interactive "p")
;;   (if (and number
;;            (> 0 number))
;;       (ergoemacs-forward-open-bracket (- 0 number))
;;     (search-backward-regexp
;;      (eval-when-compile
;;        (regexp-opt
;; 	'("(" "{" "[" "<" "〔" "【" "〖" "〈" "《" "「" "『" "“" "‘" "‹" "«"))) nil t number)))

;; (defun ergoemacs-forward-close-bracket (&optional number)
;;   "Move cursor to the next occurrence of right bracket or quotation mark.
;; With a prefix argument NUMBER, move forward NUMBER closed bracket.
;; With a negative prefix argument NUMBER, move backward NUMBER closed brackets."
;;   (interactive "p")
;;   (if (and number
;;            (> 0 number))
;;       (ergoemacs-backward-close-bracket (- 0 number))
;;     (search-forward-regexp
;;      (eval-when-compile
;;        (regexp-opt '(")" "]" "}" ">" "〕" "】" "〗" "〉" "》" "」" "』" "”" "’" "›" "»"))) nil t number)))

;; (defun ergoemacs-backward-close-bracket (&optional number)
;;   "Move cursor to the previous occurrence of right bracket or quotation mark.
;; With a prefix argument NUMBER, move backward NUMBER closed brackets.
;; With a negative prefix argument NUMBER, move forward NUMBER closed brackets."
;;   (interactive "p")
;;   (if (and number
;;            (> 0 number))
;;       (ergoemacs-forward-close-bracket (- 0 number))
;;     (backward-char 1)
;;     (search-backward-regexp
;;      (eval-when-compile
;;        (regexp-opt '(")" "]" "}" ">" "〕" "】" "〗" "〉" "》" "」" "』" "”" "’" "›" "»"))) nil t number)
;;     (forward-char 1)))

;; (global-set-key (kbd "<home>") 'backward-open-bracket)
;; (global-set-key (kbd "<end>") 'forward-close-bracket)

;; Fonction 05
;; Afficher les couleurs hexadécimales dans le CSS :

;; (defvar hexcolour-keywords
;;   '(("#[abcdef[:digit:]]\\{6\\}"
;;      (0 (put-text-property
;;          (match-beginning 0)
;;          (match-end 0)
;;          'face (list :background
;;                      (match-string-no-properties 0)))))))
;; (defun hexcolour-add-to-font-lock ()
;;   (font-lock-add-keywords nil hexcolour-keywords))

;; (add-hook 'css-mode-hook 'hexcolour-add-to-font-lock)
;; (add-hook 'scss-mode-hook 'hexcolour-add-to-font-lock)
;; (add-hook 'php-mode-hook 'hexcolour-add-to-font-lock)
;; (add-hook 'html-mode-hook 'hexcolour-add-to-font-lock)
