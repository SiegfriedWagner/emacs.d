(require 'package)
(require 'init-company)
(require 'projectile)
;; (defun ccls//enable ()
;;   (condition-case nil
;;       (lsp-ccls-enable)
;;     (user-error nil)))
;; (use-package ccls
;;   :ensure t
;;   :commands lsp-ccls-enable
;;   :init
;;   (setq ccls-executable "/usr/bin/ccls")
;;   ;; (add-hook 'c-mode-hook #'ccls//enable)
;;   ;; (add-hook 'c++-mode-hook #'ccls//enable)
;;   (add-hook 'c-mode-hook #'lsp-ccls-enable)
;;   (add-hook 'c++-mode-hook #'lsp-ccls-enable) 
;;   )
;; (with-eval-after-load 'projectile
;;   (setq projectile-project-root-files-top-down-recurring
;;         (append '("compile_commands.json"
;;                   ".ccls")
;;                 projectile-project-root-files-top-down-recurring)))
(use-package irony
  :ensure t
  :config
  (defun my-irony-mode-on ()
    ;; avoid enabling irony-mode in modes that inherits c-mode, e.g: php-mode(!)
    (when (member major-mode irony-supported-major-modes)
      (irony-mode 1)))
  (add-hook 'c++-mode-hook 'my-irony-mode-on)
  (add-hook 'c-mode-hook 'my-irony-mode-on)
  (add-hook 'objc-mode-hook 'my-irony-mode-on)
  (use-package flycheck-irony
    :ensure t
    :init
    (eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))
  (use-package irony-eldoc
    :ensure t
    :init
    (add-hook 'irony-mode-hook #'irony-eldoc))
  )


(provide 'init-c|cpp)
