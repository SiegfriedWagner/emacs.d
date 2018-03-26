(require 'package)
(use-package company
  :config
  (setq company-tooltip-idle-delay nil company-minimum-prefix-length 1))
(add-hook 'after-init-hook 'global-company-mode)
(define-key company-mode-map (kbd "C-SPC") 'company-complete)
(use-package company-web
  :config
  (add-to-list 'company-backends 'company-web-html)
  (add-to-list 'company-backends 'company-web-jade)
  (add-to-list 'company-backends 'company-web-slim))
(use-package company-c-headers
  :config
  (add-to-list 'company-backends 'company-c-headers))
(use-package irony
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode))
(use-package company-irony
  :config
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-irony)))
(use-package helm-company)
(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "C-:") 'helm-company)
     (define-key company-active-map (kbd "C-:") 'helm-company)))
(provide 'init-company)
