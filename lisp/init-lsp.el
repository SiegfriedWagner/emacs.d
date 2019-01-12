;;(require 'company)
(require 'projectile)
(require 'init-company)

;; Clang support
(use-package ccls
  :ensure t
  :hook ((c-mode c++-mode) .
         (lambda () (require 'ccls) (lsp)))
  :init
  (setq ccls-executable "/usr/bin/ccls")
  )
(with-eval-after-load 'projectile
  (setq projectile-project-root-files-top-down-recurring
        (append '("compile_commands.json"
                  ".ccls")
                projectile-project-root-files-top-down-recurring)))

(use-package lsp-mode
  :init
  (require 'lsp-clients)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
  :hook ((python-mode . lsp)
	 (lsp-after-open . (lambda () (lsp-enable-imenu) (ding))))
  
  :preface (setq lsp-enable-flycheck 1
                 lsp-enable-indentation nil
                 lsp-highlight-symbol-at-point nil))
(use-package lsp-ui
  :config
  (setq lsp-ui-sideline-ignore-duplicate t
	lsp-ui-doc-position "top")
  :hook (lsp-mode . lsp-ui-mode))

(use-package company-lsp
  :config
  (setq
   company-lsp-async t
   company-lsp-enable-snippet t
   company-lsp-enable-recompletion t
   company-lsp-cache-candidates t)
  (push 'company-lsp company-backends))

(provide 'init-lsp)
