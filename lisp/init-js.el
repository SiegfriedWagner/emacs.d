(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(use-package js2-mode)
(use-package tern
  :config
  (add-hook 'js2-mode-hook 'tern-mode)
  (add-hook 'web-mode-hook 'tern-mode)
  (setq tern-command (append tern-command '("--no-port-file"))))
(use-package skewer-mode
  :config
  (add-hook 'js2-mode-hook 'skewer-mode))
(provide 'init-js)
