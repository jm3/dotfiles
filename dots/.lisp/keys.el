;; general custom key-bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key   "\C-c\C-l" 'comment-region)
(global-unset-key "\M-=")    (global-set-key "\M-="    'delete-horizontal-space)
(global-unset-key "\C-b")    (global-set-key "\C-b"    'scroll-down)
(global-unset-key "\M-\C-h") (global-set-key "\M-\C-h" 'backward-kill-word)
(global-unset-key "\C-f")    (global-set-key "\C-f"    'forward-word)
(global-unset-key "\M-i")    (global-set-key "\M-i"    'ispell-buffer)
(global-unset-key "\C-j")    (global-set-key "\C-j"    'fill-paragraph)
(global-unset-key "\C-cc")   (global-set-key "\C-cc"   'copy-region-as-kill)

;; Make CTRL-x CTRL-u the "undo" command; this is better than "CTRL-x u"
;; because you don't have to release the CTRL key.
(define-key global-map "\C-x\C-u" 'undo)

;; This makes M-h consistant with M-<Del>.  (WRONG! see below)
(global-unset-key "\M-\C-h")
(global-set-key "\M-\C-h" 'backward-kill-word)

;; stuff to rebind the help key - from dug's .emacs

;; Make CTRL-h delete the previous character. Normally, this is "help"
(global-set-key "\C-h" 'delete-backward-char)
(define-key global-map "\C-h" 'backward-delete-char)

;; Make sure CTRL-h works in searches, too.
(setq search-delete-char (string-to-char "\C-h"))

;; Get rid of annoying ESC-ESC stuff.
(global-unset-key "\e\e")

;; Rebind ESC-? to get help in emacs, since C-h is backspace now.
(global-unset-key "\M-?")
(setq help-char ?\M-?)
(global-set-key "\M-?" 'help-for-help)

;;;  Set a key to call compile command
(global-set-key "\C-xc" 'compile)

