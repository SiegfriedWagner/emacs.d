(require 'package)
(use-package company
  :ensure t
  :config
  (setq company-tooltip-idle-delay 0)
  :init
  (global-company-mode))

(provide 'init-company)
