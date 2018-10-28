(require 'company)
(require 'projectile)
(use-package lsp-mode
  :config
  (require 'lsp-imenu)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)  
  (lsp-define-stdio-client lsp-python "python"
                           #'projectile-project-root
                           '("pyls"))
  (add-hook 'python-mode-hook
            (lambda ()
              (lsp-python-enable)))
  
  (use-package lsp-ui
    :config
    (setq lsp-ui-sideline-ignore-duplicate t)
    (setq lsp-ui-doc-position "top")
    (add-hook 'lsp-mode-hook 'lsp-ui-mode))
  (defun lsp-set-cfg ()
    (let ((lsp-cfg `(:pyls (:configurationSources ("flake8")))))
      ;; TODO: check lsp--cur-workspace here to decide per server / project
      (lsp--set-configuration lsp-cfg)))
   
   (add-hook 'lsp-after-initialize-hook 'lsp-set-cfg)
)
(use-package company-lsp
  :config
  (setq
   company-lsp-async t
   company-lsp-enable-snippet t
   company-lsp-enable-recompletion t
   company-lsp-cache-candidates t)
  (push 'company-lsp company-backends))
(provide 'init-lsp)
