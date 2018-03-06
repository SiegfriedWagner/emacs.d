(setq debug-on-error t)
(setq inhibit-startup-message t)
(setq make-backup-files nil)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(defalias 'yes-or-no-p 'y-or-n-p)
;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))
(setq use-package-always-ensure t)
(use-package try)
(use-package which-key
	:config
	(which-key-mode))

(use-package nyan-mode
  :config
  (nyan-mode)
  (setq nyan-wavy-trail t)
  (setq nyan-animate-nyancat t))

(use-package speedbar
  :config
  (setq speedbar-use-images t speedbar-show-unknown-files t)
  (use-package sr-speedbar
    :config
    (setq sr-speedbar-right-side nil sr-speedbar-max-width 20 sr-speedbar-width 12 sr-speedbar-default-width 12 sr-speedbar-skip-other-window-p t)
    (when window-system
      (add-hook 'emacs-startup-hook 'sr-speedbar-open)
      (add-hook 'kill-emacs-hook 'sr-speedbar-close))))
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'init-move-buffer)
(require 'init-company)
(require 'init-org)
(desktop-save-mode 1)
(desktop-load-default)
(global-linum-mode t)
(global-set-key [C-tab] 'other-window)

(use-package  yasnippet
  :init
  (global-company-mode 1))

(use-package zygospore
  :config
  (use-package yasnippet-snippets)
  :init
  (global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows))
(use-package flycheck
  :init
  (global-flycheck-mode))
(setq  gdb-many-windows t gdb-show-main t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zygospore yasnippet buffer-move which-key use-package try sr-speedbar rainbow-delimiters nyan-mode))))
