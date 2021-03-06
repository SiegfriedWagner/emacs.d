(require 'package)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(defun my/org-bindkeys ()
  (local-unset-key (kbd "C-<tab>"))
  (local-set-key (kbd "C-c l") 'org-store-link))
(add-hook 'org-mode-hook 'my/org-bindkeys)
(setq org-image-actual-width nil)
(setq org-log-done t)
(setq org-agenda-files '("~/.emacs.d" "~/MEGA/todo"))
(setq org-agenda-files (append (directory-files-recursively "~/Documents/git" "\.org$") org-agenda-files))
;; (use-package org-bullets
;;   :hook
;;   (org-mode . org-bullets-mode))
(provide 'init-org)
