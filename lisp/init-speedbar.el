(use-package speedbar
  :config
  (setq speedbar-directory-unshown-regexp "^$"
	speedbar-show-unknown-files t))
(use-package sr-speedbar
  :config
  (setq sr-speedbar-right-side nil
	sr-speedbar-max-width 20
	sr-speedbar-width 20
	sr-speedbar-default-width 20
	sr-speedbar-skip-other-window-p nil)
  (defun sr-speedbar-init ()
    (sr-speedbar-open)
    (with-current-buffer sr-speedbar-buffer-name
      (setq window-size-fixed 'width)))
  (when window-system
    (add-hook 'emacs-startup-hook 'sr-speedbar-init)
    (add-hook 'kill-emacs-hook 'sr-speedbar-close))
  (global-set-key (kbd "<f5>") 'sr-speedbar-toggle))
(provide 'init-speedbar)
;;; init-speedbar ends here
