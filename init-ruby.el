;;; init-ruby.el --- Ruby
;;; Basic ruby setup

;;; Commentary:
;; 

;;; Code:

(use-package ruby-hash-syntax)
(use-package ruby-mode
  :defer t
  :init
  (after-load 'ruby-mode
  ;; Stupidly the non-bundled ruby-mode isn't a derived mode of
  ;; prog-mode: we run the latter's hooks anyway in that case.
  (add-hook 'ruby-mode-hook
            (lambda ()
              (unless (derived-mode-p 'prog-mode)
                (run-hooks 'prog-mode-hook)))))
  :config
  (progn
    (add-auto-mode 'ruby-mode
               "Rakefile\\'"
               "\\.rake\\'"
               "\\.rxml\\'"
               "\\.rjs\\'"
               "\\.irbrc\\'"
               "\\.pryrc\\'"
               "\\.builder\\'"
               "\\.ru\\'"
               "\\.gemspec\\'"
               "Gemfile\\'"
               "Kirkfile\\'")

    (setq ruby-use-encoding-map nil)
    (add-hook 'ruby-mode-hook 'subword-mode)
    )
  )




;;; Inferior ruby
(use-package inf-ruby
  :defer t
  :config
  (progn
    (after-load 'auto-complete
      (add-to-list 'ac-modes 'inf-ruby-mode))))

(use-package ac-inf-ruby
  :defer t
  :config
  (progn
    (add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)
    (after-load 'inf-ruby
      (define-key inf-ruby-mode-map (kbd "TAB") 'auto-complete))
    )
  )


;;; Ruby compilation
(use-package ruby-compilation)

;;; Robe
(use-package robe
  :defer t
  :config
  (progn
    (add-hook 'ruby-mode-hook 'robe-mode)
    (add-hook 'robe-mode-hook 'ac-robe-setup)
    )
  )

;;; ri support
(use-package yari
  :config (defalias 'ri 'yari)
  )


(use-package rsense
  :config
  (progn
    (setq rsense-home (expand-file-name "~/Application/rsense"))
    (if (file-accessible-directory-p rsense-home)
        (progn
          (add-to-list 'load-path (concat rsense-home "/etc"))
          (require 'rsense)
          (add-hook 'ruby-mode-hook
                    (lambda ()
                      (add-to-list 'ac-sources 'ac-source-rsense-method)
                      (add-to-list 'ac-sources 'ac-source-rsense-constant)))))
    )
  )


(provide 'init-ruby)

;;; init-ruby.el ends here
