(require 'package)
(use-package company
  :diminish "x"
  :config 
  (setq company-tooltip-idle-delay nil company-minimum-prefix-length 1)
  (add-to-list 'company-backends 'company-yasnippet)
  (add-hook 'after-init-hook 'global-company-mode)
  (define-key company-mode-map (kbd "C-SPC") 'company-complete))
(use-package company-web
  :config
  (add-to-list 'company-backends 'company-web-html))
(use-package company-php
  :config
  (add-hook 'php-mode-hook
	    '(lambda ()
	       (require 'company-php)
	       (company-mode t)
	       (ac-php-core-eldoc-setup) ;; enable eldoc
	       (make-local-variable 'company-backends)
	       (add-to-list 'company-backends 'company-ac-php-backend))))
(use-package company-c-headers
  :config
  (add-to-list 'company-backends 'company-c-headers))
(use-package irony
  :config
  (defun my-irony-mode-on ()
    ;; avoid enabling irony-mode in modes that inherits c-mode, e.g: php-mode(!)
    (when (member major-mode irony-supported-major-modes)
      (irony-mode 1)))
  (add-hook 'c++-mode-hook 'my-irony-mode-on)
  (add-hook 'c-mode-hook 'my-irony-mode-on)
  (add-hook 'objc-mode-hook 'my-irony-mode-on))
(use-package company-irony
  :config
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-irony)))
(use-package company-tern
  :init (add-to-list 'company-backends 'company-tern)
  :config (setq company-tern-property-marker nil))
(use-package ac-html-csswatcher
  :config
  (company-web-csswatcher-setup)
  (add-hook 'web-mode-hook 'ac-html-csswatcher+)
  )
(use-package helm-company)
(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "M-SPC") 'helm-company)
     (define-key company-active-map (kbd "M-SPC") 'helm-company)))
(use-package company-statistics
  :init
  (add-hook 'after-init-hook 'company-statistics-mode))

(provide 'init-company)
