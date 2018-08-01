(require 'company)
(use-package lsp-mode
  :config
  (use-package lsp-python
    :init
    
    :hook
    (python-mode . lsp-python-enable))
  (use-package lsp-ui
    ;; :hook
    ;; (lsp-mode . lsp-ui-mode)
    :config
    (setq ;; lsp-ui-doc-position (quote at-point)
     lsp-ui-doc-use-childframe t
     ))
  (use-package company-lsp
    :init
    (setq company-lsp-async t
	  company-lsp-enable-snippet t
	  company-lsp-enable-recompletion t)
    :config
    (push 'company-lsp company-backends)))



(provide 'init-lsp)
