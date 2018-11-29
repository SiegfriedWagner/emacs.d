(require 'package)
(require 'init-company)
(require 'projectile)
(defun ccls//enable ()
  (condition-case nil
      (lsp-ccls-enable)
    (user-error nil))
  (flycheck-mode 1))
(use-package ccls
  :ensure t
  :commands lsp-ccls-enable
  :init
  (setq ccls-executable "/usr/bin/ccls")
  (add-hook 'c-mode-hook #'lsp-ccls-enable)
  (add-hook 'c++-mode-hook #'lsp-ccls-enable)
  )
(with-eval-after-load 'projectile
  (setq projectile-project-root-files-top-down-recurring
        (append '("compile_commands.json"
                  ".ccls")
                projectile-project-root-files-top-down-recurring)))


(provide 'init-clang)
