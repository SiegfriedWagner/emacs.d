(require 'package)
(require 'company)
(use-package auctex
  :ensure t)
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t))
(use-package company-auctex
  :ensure t
  :config
  (require 'company-auctex)
  (company-auctex-init))
(add-hook 'latex-mode 'visual-line-mode)
(provide 'init-tex)
