;;; init-web-mode.el --- Web Mode

;;; Commentary:
;; 

;;; Code:

(use-package web-mode
  :config
  (progn
    (setq web-mode-enable-current-element-highlight nil)
    (setq web-mode-enable-current-column-highlight nil)

    (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

    (setq web-mode-engines-alist
          '(("php"    . "\\.phtml\\'")
            ("blade"  . "\\.blade\\.")))

    (add-to-list 'auto-mode-alist '("\\.api\\'" . web-mode))

    (defun init-web/custom-web-mode-hook ()
      "Hooks for Web mode."
      (setq web-mode-markup-indent-offset 2)
      (setq web-mode-css-indent-offset 2)
      (setq web-mode-code-indent-offset 2)
      (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
      (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
      (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
      (setq web-mode-style-padding 1)
      (setq web-mode-script-padding 1)
      (setq web-mode-block-padding 0)
      (setq web-mode-comment-style 2)
      (setq web-mode-extra-auto-pairs
            '(("erb"  . (("beg" "end")))
              ("php"  . (("beg" "end")
                         ("beg" "end")))))
      (setq web-mode-enable-auto-pairing t)
      (setq web-mode-enable-css-colorization t)
      (setq web-mode-enable-block-face t)
      (setq web-mode-enable-part-face t)
      (setq web-mode-enable-comment-keywords t)
      (setq web-mode-enable-heredoc-fontification t))

    (add-hook 'web-mode-hook  'init-web/custom-web-mode-hook)
    (add-hook 'web-mode-before-auto-complete-hooks
              '(lambda ()
                 (let ((web-mode-cur-language
                        (web-mode-language-at-pos)))
                   (if (string= web-mode-cur-language "php")
                       (yas-activate-extra-mode 'php-mode)
                     (yas-deactivate-extra-mode 'php-mode))
                   (if (string= web-mode-cur-language "css")
                       (setq emmet-use-css-transform t)
                     (setq emmet-use-css-transform nil)))))
    )
  )


(use-package ac-html
  :config
  (progn
    (defun setup-ac-for-haml ()
      ;; Require ac-haml since we are setup haml auto completion
      (require 'ac-haml)
      ;; Require default data provider if you want to use
      (require 'ac-html-default-data-provider)
      ;; Enable data providers,
      ;; currently only default data provider available
      (ac-html-enable-data-provider 'ac-html-default-data-provider)
      ;; Let ac-haml do some setup
      (ac-haml-setup)
      ;; Set your ac-source
      (setq ac-sources '(ac-source-haml-tag
                         ac-source-haml-attr
                         ac-source-haml-attrv))
      ;; Enable auto complete mode
      (auto-complete-mode))

    (add-hook 'haml-mode-hook 'setup-ac-for-haml)

    (add-to-list 'web-mode-ac-sources-alist
                 '("html" . (ac-source-html-tag
                             ac-source-html-attr
                             ac-source-html-attrv)))

    (add-to-list  'web-mode-ac-sources-alist
                  '("php" . (ac-source-yasnippet ac-source-php-auto-yasnippets)))

    (add-to-list 'web-mode-ac-sources-alist
                 '("css" . (ac-source-css-property
                            ac-source-emmet-css-snippets)))

    ;; (add-to-list 'web-mode-ac-sources-alist
    ;;              '("html" . (
    ;;                          ;; attribute-value better to be first
    ;; 			 ;; ac-source-words-in-buffer
    ;; 			 ;; ac-source-abbrev
    ;; 			 ;; ac-source-emmet-html-aliases
    ;; 			 ;; ac-source-emmet-html-snippets
    ;;                          ;;ac-source-html-attribute-value
    ;;                          ;;ac-source-html-tag
    ;;                          ;;ac-source-html-attribute
    ;; 			 )))


    )
  )

(use-package ac-html-bootstrap)
(use-package ac-html-csswatcher :config (ac-html-csswatcher-setup))
(use-package web-beautify)
(use-package impatient-mode)
(use-package react-snippets)

;; CSS 
;;; Colourise CSS colour literals
(use-package rainbow-mode
  :config
  (progn
    (dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
      (add-hook hook 'rainbow-mode))
    )
  )


;;; SASS and SCSS
(use-package sass-mode)
(use-package scss-mode :config (setq-default scss-compile-at-save nil))


;;; LESS
(use-package less-css-mode)
(use-package skewer-less)

;;; Auto-complete CSS keywords
(after-load 'auto-complete
  (dolist (hook '(css-mode-hook sass-mode-hook scss-mode-hook))
    (add-hook hook 'ac-css-mode-setup)))

;;; Use eldoc for syntax hints
(use-package css-eldoc
  :config
  (progn
    (autoload 'turn-on-css-eldoc "css-eldoc")
    (add-hook 'css-mode-hook 'turn-on-css-eldoc)
    )
  )

(provide 'init-web)

;;; init-web.el ends here
