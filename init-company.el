;;; init-company.el --- company


;;; Commentary:
;; 

;;; Code:

(use-package company
  :demand t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-jedi
  :after (:all company jedi)
  :config (add-to-list 'company-backends 'company-jedi))

(use-package company-coq
  :if (featurep 'proof-site)
  :after (:all company))

(use-package company-quickhelp
  :after (:all company)
  :config (company-quickhelp-mode 1))

(use-package company-math
  :after (:all company)
  :config
  (add-to-list 'company-backends 'company-math-symbols-unicode))

;; (use-package company-inf-ruby
;; 	:after (:all company)
;;   :demand t
;;   :config (add-to-list 'company-backends 'company-inf-ruby))


(use-package company-glsl
  :after (:all company)
  :config
  (when (executable-find "glslangValidator")
    (add-to-list 'company-backends 'company-glsl)))

(use-package company-web
  :config
  (add-to-list 'company-backends 'company-web-html)
  (add-to-list 'company-backends 'company-web-jade)
  (add-to-list 'company-backends 'company-web-slim))

(use-package company-shell)

(use-package company-axiom)

(use-package company-dict)

(use-package company-restclient)

(use-package company-box
  :after company
  :hook (company-mode . company-box-mode))

(provide 'init-company)

;;; init-company.el ends here
