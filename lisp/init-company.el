(require 'package)
(use-package company
  :diminish
  :config 
  (setq company-tooltip-idle-delay nil
	company-minimum-prefix-length 1
	company-dabbrev-downcase 0)
  (global-company-mode)
  (define-key company-mode-map (kbd "C-SPC") 'company-complete)
  ;; (add-to-list 'company-backends 'company-yasnippet) TODO: Fix yasnippet dominance
  )
(use-package company-php
  :config
  (add-hook 'php-mode-hook
	    (lambda ()
	      (require 'company-php)
	      (company-mode t)
	      (ac-php-core-eldoc-setup) ;; enable eldoc
	      (make-local-variable 'company-backends)
	      (add-to-list 'company-backends 'company-ac-php-backend))))
(use-package company-c-headers
  :config
  (add-to-list 'company-backends 'company-c-headers))
(use-package company-irony
  :config
  (add-to-list 'company-backends 'company-irony))
(use-package company-tern
  :config
  (setq company-tern-property-marker nil)
  (add-to-list 'company-backends 'company-tern))
(use-package ac-html-csswatcher
  :config
  (company-web-csswatcher-setup)
  (add-hook 'web-mode-hook 'ac-html-csswatcher+)
  )
(use-package company-web
  :config
  (add-to-list 'company-backends 'company-web-html))
(use-package helm-company)
(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "M-SPC") 'helm-company)
     (define-key company-active-map (kbd "M-SPC") 'helm-company)))
(use-package company-statistics
  :init
  (add-hook 'after-init-hook 'company-statistics-mode))
(use-package company-quickhelp
  :config
  (setq company-quickhelp-color-background "gray14"
	company-quickhelp-color-foreground "white smoke"
	company-quickhelp-max-lines nil
	company-quickhelp-use-propertized-text t
	company-selection-wrap-around t
	company-quickhelp-idle-delay nil)
  (company-quickhelp-mode))
(use-package company-box
  :hook (company-mode . company-box-mode))
;; (use-package company-jedi
;;   :config
;;   (add-to-list 'company-backends '(company-jedi company-files)))
(provide 'init-company)
