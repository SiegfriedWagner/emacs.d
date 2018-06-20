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
  ;; (nyan-mode)
  )
(use-package powerline
  :config
  (setq powerline-buffer-size-suffix t
	powerline-default-separator "arrow-fade"
	powerline-display-buffer-size t
	powerline-display-hud nil
	powerline-gui-use-vcs-glyph t
	powerline-height nil
	powerline-text-scale-factor nil)
  (powerline-default-theme))
(use-package treemacs
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t))
(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
(use-package  yasnippet
  :config
  (use-package yasnippet-snippets)
  (yas-global-mode 1))
(use-package golden-ratio
  :config
  (add-to-list 'golden-ratio-exclude-buffer-names " *SPEEDBAR*")
  (add-to-list 'golden-ratio-exclude-buffer-names "*SPEEDBAR*")
  ;; (golden-ratio-mode t)
  )
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

;; (use-package gdscript-mode)
(require 'init-move-buffer)
(require 'init-company)
(require 'init-org)
(require 'init-helm)
;; (require 'init-speedbar)
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
;;; custom variables
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(powerline-active0 ((t (:inherit mode-line :background "royal blue" :foreground "white" :height 1.0))))
 '(powerline-active1 ((t (:background "dark magenta" :foreground "gainsboro" :height 1.0))))
 '(powerline-active2 ((t (:background "#2C323C" :foreground "#C678DD" :height 1.0))))
 '(powerline-inactive0 ((t (:inherit mode-line-inactive :foreground "gray" :height 0.95))))
 '(powerline-inactive1 ((t (:background "gray14" :foreground "#ABB2BF" :height 0.95))))
 '(powerline-inactive2 ((t (:background "#282C34" :foreground "#ABB2BF" :height 0.95)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (emacstree treemacs golden-ratio buffer-move which-key use-package try sr-speedbar rainbow-delimiters nyan-mode))))
