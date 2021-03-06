;;; init-edit.el --- Edit Config

;;; Commentary:
;;

;;; Code:

;; Access via Web
;; (use-package take-off )

;; emacs shell font confusion
(defvar ansi-color-for-comint-mode t)

;; close startup slash
(setq inhibit-startup-message t)

;; close close-bell
(setq visible-bell t)

;; do not create backup files
(setq make-backup-files nil)

;; semantic highlight
(global-font-lock-mode t)

;; open picture display.
(auto-image-file-mode t)

;; use y/n replace yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; display column number
(column-number-mode t)

;; match parentheses.
(show-paren-mode t)

(blink-cursor-mode t)

(size-indication-mode 1)

(when (window-system)
  (scroll-bar-mode -1))

(transient-mark-mode t)

;; display buffer name on the caption.
(setq frame-title-format
      (list
       '(:eval (buffer-name (current-buffer)))))

(setq-default truncate-lines nil)
(setq-default global-visual-line-mode t)

(require 'hl-line)

(use-package hl-anything
  :ensure t
  :demand t)

(use-package highlight-parentheses
  :ensure t
  :demand t)

(use-package highlight-thing
  :ensure t
  :demand t)

(use-package auto-highlight-symbol
  :ensure t
  :demand t
  :config
  (global-auto-highlight-symbol-mode t))

(use-package undo-tree
  :ensure t
  :demand t
  :config
  (global-undo-tree-mode))

(add-hook 'texinfo-mode-hook (lambda () (require 'sb-texinfo)))

(use-package anyins
  :ensure t
  :demand t)

(use-package popup-kill-ring
  :ensure t
  :demand t)

(use-package kill-ring-search
  :ensure t
  :demand t)

(global-display-line-numbers-mode)

(use-package backward-forward
  :demand
  :config
  (backward-forward-mode t)
  :bind (:map backward-forward-mode-map
              ("<C-left>" . nil)
              ("<C-right>" . nil)
              ("<M-left>" . backward-forward-previous-location)
              ("<M-right>" . backward-forward-next-location)))

(use-package visible-mark
  :ensure t
  :demand t
  :config
  (setq visible-mark-max 2)

  (defface init-ui/visible-mark-face-2
    `((t (:background "orange" :foreground "black")))
    "Face for the mark."
    :group 'visible-mark)
  
  (setq visible-mark-faces `(visible-mark-face init-ui/visible-mark-face-2))
  (global-visible-mark-mode +1))


(defun ui-set-transparency (alpha-level)
  "Set transparency as ALPHA-LEVEL."
  (interactive "p")
  (message (format "Alpha level passed in: %s" alpha-level))
  (let ((alpha-level
         (if (< alpha-level 2)
             (read-number "Opacity percentage: " 85)
           alpha-level))
        (myalpha (frame-parameter nil 'alpha)))
    (set-frame-parameter nil 'alpha alpha-level))
  (message (format "Alpha level is %d" (frame-parameter nil 'alpha))))

;;(set-frame-parameter (selected-frame) 'alpha '(85 50))
;;(add-to-list 'default-frame-alist '(alpha 85 50))


(require 'ls-lisp)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(use-package graphviz-dot-mode
  :ensure t
  :demand t)

(use-package multiple-cursors
	:ensure t
	:demand t
	:bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)))

(message "loading init-edit done.")

(provide 'init-edit)
;;; init-edit.el ends here
