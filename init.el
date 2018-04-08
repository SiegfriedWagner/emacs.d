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
(use-package sublimity)
(require 'sublimity)
;; (require 'sublimity-scroll)
(require 'sublimity-map) ;; experimental
;; (require 'sublimity-attractive)
(sublimity-map-set-delay 1)
;; (sublimity-mode 1)
(require 'init-move-buffer)
(require 'init-company)
(require 'init-org)
(require 'init-helm)
(require 'init-speedbar)
(require 'init-python)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/atom-one-dark-theme")
(load-theme 'atom-one-dark t)
(desktop-save-mode 1)
(desktop-load-default)
(global-linum-mode t)
(electric-pair-mode t)
(global-set-key [C-tab] 'other-window)
(provide 'init)
;;; init.el ends here

