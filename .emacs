;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Custom jm3 Mods for Emacs 20  :  john manoogian III <jm3@monkey.org>  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq toggle-text-mode-auto-fill "y")

(setq load-path (cons "/home/jm3/.lisp/" load-path))

;; replace y-e-s by y
(fset 'yes-or-no-p 'y-or-n-p)

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

;; random tweaks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(pending-delete-mode)        ;; replace the selection when typing
(display-time)               ;; Put the time on the modeline.
(transient-mark-mode t)      ;; funky X selection highlighting thing
(setq vc-command-messages t) ;; show geeky rcs diagnostics
(setq make-backup-files nil) ;; no backups. free-ballin' it.
(setq scroll-step 1)         ;; don't scroll spasmodically

;; startup in auto-fill [justified] mode
(setq default-major-mode 'text-mode)
(setq text-mode-hook 'turn-on-auto-fill)

;; allow tabs in the middle of a line in a .c file
(setq c-tab-always-indent nil)
(setq perl-tab-always-indent nil)

;; cc mode crap  ;; i forget what the fuck this does.
(add-hook 'c-mode-common-hook
	  '(lambda () (c-toggle-auto-hungry-state 1)))

;; don't add dumb newlines
(setq next-line-add-newlines nil) 

;; allow lowercase [downcase] command
(put 'downcase-region 'disabled nil)

;; i hate --
(setq message-signature-separator nil)

;; mah shit.  -jm3
(custom-set-variables
 '(sentence-end-double-space nil)
 '(tab-stop-list (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32)))
 '(comment-start ">")
 '(standard-indent 2)
 '(fill-column 72))

;; Make CTRL-x CTRL-u the "undo" command; this is better than "CTRL-x u"
;; because you don't have to release the CTRL key.
(define-key global-map "\C-x\C-u" 'undo)

;; This makes M-h consistant with M-<Del>.  (WRONG! -jm3, see below)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                      my big ugly font settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-faces
 '(default ((t (:foreground "white" :background "black" :family "Fixed"))))
 '(fg:black ((t (:foreground "black" :background "black"))) t)
 '(custom-variable-sample-face ((t (:foreground "tan"))))
 '(font-lock-comment-face ((t (:foreground "gray60" :background "back"))) t)
 '(gui-button-face ((t (:bold t :foreground "black" :background "gray70" :size "10"))) t)
 '(font-lock-string-face ((t (:foreground "cadetblue" :background "black"))) t)
 '(pointer ((t (:foreground "green" :background "black"))) t)
 '(font-lock-keyword-face ((t (:foreground "green2" :background "black"))) t)
 '(custom-saved-face ((t (:underline t :foreground "tan"))))
 '(isearch ((t (:foreground "red" :background "black"))) t)
 '(primary-selection ((t (:foreground "gray70" :background "gray20"))) t)
 '(paren-match ((t (:foreground "red" :background "black"))) t)
 '(custom-face-empty ((t (:foreground "orange" :background "black"))) t)
 '(font-lock-preprocessor-face ((t (:foreground "tan"))) t)
 '(zmacs-region ((t (:foreground "gray90" :background "gray20"))) t)
 '(font-lock-type-face ((t (:foreground "yellow" :background "black"))) t)
 '(highlight ((t (:foreground "green" :background "gray20"))))
 '(font-lock-variable-name-face ((t (:foreground "yellow" :background "black"))) t)
 '(font-lock-doc-string-face ((t (:foreground "gray50" :background "black"))) t)
 '(font-lock-function-name-face ((t (:bold nil :foreground "green" :background "black"))) t)
 '(bold-italic ((t (:bold t :italic t))))
 '(secondary-selection ((t (:foreground "orange2" :background "gray20"))))
 '(text-cursor ((t (:foreground "black" :background "green"))) t))
(custom-set-faces)
