(require 'package)
(require 'company)
;; (load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t))
(use-package company-auctex
  :ensure t
  :config
  (company-auctex-init))
(provide 'init-tex)
