(use-package speedbar
  :config
  (setq speedbar-directory-unshown-regexp "^$")
  (setq speedbar-show-unknown-files t))
(use-package sr-speedbar)
(setq sr-speedbar-right-side nil sr-speedbar-max-width 20 sr-speedbar-width 20 sr-speedbar-default-width 20 sr-speedbar-skip-other-window-p t)
(when window-system
  (add-hook 'emacs-startup-hook 'sr-speedbar-open)
  (add-hook 'kill-emacs-hook 'sr-speedbar-close))
(global-set-key (kbd "C-c C-c C-s") 'sr-speedbar-toggle)
(provide 'init-speedbar)
;;; init-speedbar ends here
