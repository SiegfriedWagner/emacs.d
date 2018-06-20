(require 'package)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook (lambda()
			   (local-unset-key (kbd "C-<tab>"))))
(setq org-image-actual-width nil)
(use-package org-bullets
  :hook
  (org-mode . org-bullets-mode))
(provide 'init-org)
