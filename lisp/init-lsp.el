(require 'company)
(require 'projectile)
(use-package lsp-mode
  :config
  (lsp-define-stdio-client lsp-python "python"
                           #'projectile-project-root
                           '("pyls"))
  )
(use-package lsp-ui
  :config
  (setq lsp-ui-sideline-ignore-duplicate t)
  (setq lsp-ui-doc-position "top")
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))
(use-package lsp-python
  :ensure t
  :init
  (add-hook 'python-mode-hook #'lsp-python-enable))
(use-package company-lsp
  :config
  (setq
   company-lsp-async t
   company-lsp-enable-snippet t
   company-lsp-enable-recompletion t
   company-lsp-cache-candidates t)
  (push 'company-lsp company-backends))
(provide 'init-lsp)
