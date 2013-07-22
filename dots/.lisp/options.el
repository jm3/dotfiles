;; random tweaks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(pending-delete-mode)        ;; replace the selection when typing
(display-time)               ;; Put the time on the modeline.
(transient-mark-mode t)      ;; funky X selection highlighting thing
(setq vc-command-messages t) ;; show geeky rcs diagnostics
(setq make-backup-files nil) ;; no backups. free-ballin' it.
(setq scroll-step 1)         ;; don't scroll spasmodically

(setq toggle-text-mode-auto-fill "y")

;; prefer aspell
(setq ispell-program-name "/usr/local/bin/aspell")

;; replace y-e-s by y
(fset 'yes-or-no-p 'y-or-n-p)

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

