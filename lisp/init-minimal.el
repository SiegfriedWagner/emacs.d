;; (setq debug-on-error t)
(server-start)
(setq warning-minimum-level :error) ;; Turns off anoying warrning popups
(setq inhibit-startup-message t)
(setq backup-by-copying t
      backup-directory-alist
      '(("." . "~/.emacs.d/backups"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)


(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(setenv "PATH" (concat (getenv "PATH") ":/usr/bin"))
(setq exec-path (append exec-path '("/usr/bin")))
(package-initialize)
(when (executable-find "aspell")
  (setq-default ispell-program-name "aspell"))
(defalias 'yes-or-no-p 'y-or-n-p)

(desktop-save-mode 1)
(desktop-load-default)
(global-linum-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(electric-pair-mode t)
(setq dired-dwim-target t)
(setq tramp-verbose 10)
(setq gdb-many-windows t gdb-show-main t)
(global-set-key (kbd "C-<tab>") 'other-window)
(provide 'init-minimal)
