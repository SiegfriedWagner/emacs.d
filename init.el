(setq debug-on-error t)
(setq inhibit-startup-message t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(use-package try
	:ensure t)

(use-package which-key
	:ensure t
	:config
	(which-key-mode))

(use-package nyan-mode
  :ensure t
  :config
  (nyan-mode)
  (nyan-toggle-wavy-trail)
  (nyan-start-animation))

(use-package speedbar
  :config
  (setq speedbar-use-images t speedbar-show-unknown-files t)
  (use-package sr-speedbar
    :ensure t
    :config
    (setq sr-speedbar-right-side nil sr-speedbar-max-width 20 sr-speedbar-width 10 sr-speedbar-default-width 10 sr-speedbar-skip-other-window-p t)
    (when window-system
      (add-hook 'emacs-startup-hook 'sr-speedbar-open)
      (add-hook 'kill-emacs-hook 'sr-speedbar-close))))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'move-buffer)

(desktop-save-mode 1)
(desktop-load-default)
(global-linum-mode t)
