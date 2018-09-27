(use-package helm
  config:
  (use-package helm-tramp)
  (require 'helm-config)
  (setq helm-autoresize-max-height 30
	helm-autoresize-min-height 20
	helm-split-window-inside-p t)
  (helm-autoresize-mode t)
  (helm-mode 1)
  (define-key global-map [remap find-file] 'helm-find-files)
  (define-key global-map [remap occur] 'helm-occur)
  (define-key global-map [remap list-buffers] 'helm-buffers-list)
  (define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
  (define-key global-map [remap execute-extended-command] 'helm-M-x)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (use-package helm-ag
    :config
    (global-set-key (kbd "C-S-s") 'helm-ag)
    )
  )
(provide 'init-helm)
