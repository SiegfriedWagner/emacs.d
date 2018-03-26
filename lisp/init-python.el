(require 'package)
(use-package anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(use-package company-anaconda)
(eval-after-load "company"
 '(add-to-list 'company-backends 'company-anaconda))
(provide 'init-python)
