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
  (progn
    (setq treemacs-collapse-dirs              (if (executable-find "python") 3 0)
          treemacs-file-event-delay           1000
          treemacs-follow-after-init          t
          treemacs-follow-recenter-distance   0.1
          treemacs-goto-tag-strategy          'refetch-index
          treemacs-indentation                2
          treemacs-indentation-string         " "
          treemacs-is-never-other-window      nil
          treemacs-no-png-images              nil
          treemacs-project-follow-cleanup     nil
          treemacs-persist-file               (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-recenter-after-file-follow nil
          treemacs-recenter-after-tag-follow  nil
          treemacs-show-hidden-files          t
          treemacs-silent-filewatch           nil
          treemacs-silent-refresh             nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-space-between-root-nodes   t
          treemacs-tag-follow-cleanup         t
          treemacs-tag-follow-delay           1.5
          treemacs-width                      35)
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-git-mode 'extended)
    (treemacs)))
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
(use-package  yasnippet
  :config
  (use-package yasnippet-snippets)
  (yas-global-mode 1))
(use-package zoom
  :config
  (setq zoom-size '(0.5 . 0.5))
  (setq zoom-ignored-major-modes '(treemacs))
  (zoom-mode t))
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
(require 'init-python)
(require 'init-js)
(require 'init-web)
(require 'init-lsp)
(use-package atom-one-dark-theme
  :config
  (load-theme 'atom-one-dark t))

(desktop-save-mode 1)
(desktop-load-default)
(global-linum-mode t)
(scroll-bar-mode -1)
(electric-pair-mode t)
(setq tramp-verbose 10)
(setq gdb-many-windows t gdb-show-main t)
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
'(package-selected-packages
  (quote
   (company-lsp lsp-ui lsp-python lsp-mode realgud pdf-tools aggressive-indent flycheck zygospore yasnippet-snippets yasnippet zoom org-bullets buffer-move which-key use-package try sr-speedbar rainbow-delimiters nyan-mode)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-ui-doc-position (quote top))
 '(package-selected-packages
   (quote
    (buffer-move which-key use-package try sr-speedbar rainbow-delimiters nyan-mode))))
