(setq debug-on-error t)
(setq inhibit-startup-message t)
(setq make-backup-files nil)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(setenv "PATH" (concat (getenv "PATH") ":/usr/bin"))
(setq exec-path (append exec-path '("/usr/bin")))
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
  :init
  (setq nyan-wavy-trail t
	nyan-animate-nyancat t)
  :config
  (nyan-mode))

(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
(use-package  yasnippet
  :config
  (use-package yasnippet-snippets)
  (yas-global-mode 1))
;; (use-package golden-ratio
;;   :init
;;   )
(use-package rainbow-mode
  :hook
  (html-mode . rainbow-mode)
  (css-mode . rainbow-mode))
(use-package zygospore
  :config
  (global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows))
(use-package flycheck
  :config
  (global-flycheck-mode))
(setq gdb-many-windows t gdb-show-main t)
(use-package aggressive-indent
  :config
  (global-aggressive-indent-mode 1))
(use-package pdf-tools
  :config
  (add-hook 'pdf-view-mode-hook
	    (lambda()
	      (linum-mode -1)))
  (pdf-tools-install))
;; (use-package minimap
;;   :init
;;   (setq minimap-window-location "right")
;;   (setq minimap-width-fraction 0.1)
;;   (minimap-mode t)
;;   )
(use-package gdscript-mode)
(require 'init-move-buffer)
(require 'init-company)
(require 'init-org)
(require 'init-helm)
(require 'init-speedbar)
(require 'init-python)
(require 'init-js)
(require 'init-web)

(use-package atom-one-dark-theme
  :config
  (load-theme 'atom-one-dark t))
(desktop-save-mode 1)
(desktop-load-default)
(global-linum-mode t)
(scroll-bar-mode -1)

(electric-pair-mode t)
(setq tramp-verbose 10)
(global-set-key (kbd "C-<tab>") 'other-window)
(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-hide-fringes t)
 '(minimap-mode nil)
 '(minimap-recreate-window nil)
 '(package-selected-packages
   (quote
    (tern ac-html-csswatcher company-tern company-statistics company-php php-mode minimap buffer-move which-key use-package try sr-speedbar rainbow-delimiters nyan-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
