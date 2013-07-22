;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom Configs for Emacs 20-ish                                        ;;
;; John Manoogian III <jm3@{jm3.net, umich.edu, organic.com, monkey.org}> ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; some reminders: http://www.emacswiki.org/emacs/EmacsNewbieKeyReference

(setq load-path (cons "~/.emacs" load-path))
(load "~/.lisp/custom.el")
(load "~/.lisp/fonts_and_colors.el")
(load "~/.lisp/keys.el")
(load "~/.lisp/options.el")

;;; Kill other buffers (vs. just closing their splits with ctl-x 1)
(defun only-current-buffer ()
  (interactive)
    (mapc 'kill-buffer (cdr (buffer-list (current-buffer)))))
