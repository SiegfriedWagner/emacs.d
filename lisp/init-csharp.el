(require 'package)
(require 'company)
(use-package omnisharp
  :config
  ;; (setq omnisharp-debug t)		
  (add-hook 'csharp-mode-hook 'omnisharp-mode)
  (add-to-list 'company-backends 'company-omnisharp))
(use-package dotnet
  :config
  (add-hook 'csharp-mode-hook 'dotnet-mode))
(provide 'init-csharp)

