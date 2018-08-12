(require 'company)
(require 'projectile)
(use-package lsp-mode
  :config
  (lsp-define-stdio-client lsp-python "python"
                           #'projectile-project-root
                           '("pyls"))
  (require 'lsp-imenu)
  (use-package lsp-python
    :hook
    (python-mode . lsp-python-enable))
  (use-package lsp-ui
    :config
    (setq lsp-ui-sideline-ignore-duplicate t)
    (add-hook 'lsp-mode-hook 'lsp-ui-mode))
  (use-package company-lsp
    :init
    (setq company-lsp-async t
	  company-lsp-enable-snippet t
	  company-lsp-enable-recompletion t)
    :config
    (push 'company-lsp company-backends))
  :hook
  (lsp-after-open-hook . lsp-enble-imenu))


(provide 'init-lsp)
