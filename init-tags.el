;;; init-tags.el --- TAGS

;;; Commentary:
;; 

;;; Code:

(use-package ggtags
  :config
  (progn
    (autoload 'gtags-mode "gtags" "" t)

    (add-hook 'c-mode-common-hook
              '(lambda ()
                 (gtags-mode 1)))
    ;; [Setting to make 'Gtags select mode' easy to see]
    (add-hook
     'gtags-select-mode-hook
     '(lambda ()
        (setq hl-line-face
              '((t (:bold t :foreground "blue" :weight extra-bold)
                   underline)))
        (hl-line-mode 1)))

    )
  )

(use-package ctags-update
  :config
  (progn
    (autoload
      'turn-on-ctags-auto-update-mode
      "ctags-update"
      "turn on
 `ctags-auto-update-mode'." t)
    (add-hook
     'c-mode-common-hook
     'turn-on-ctags-auto-update-mode)

    (add-hook
     'emacs-lisp-mode-hook
     'turn-on-ctags-auto-update-mode)

    (autoload 'ctags-update "ctags-update" "update TAGS using ctags" t)

    )
  )

(provide 'init-tags)

;;; init-tags.el ends here
