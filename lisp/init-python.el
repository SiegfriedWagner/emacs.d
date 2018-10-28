(require 'package)
(use-package ein
  :init
  (if (file-directory-p (concat "/home/" (getenv "USER") "/jupyter_notebooks"))
      (message "folder existes")
    ;; (make-directory (concat "/home/" (getenv "USER") "/jupyter_notebooks"))
    (message "folder doesnt exixst")
    )
  (setq ein:jupyter-default-notebook-directory "/home/siegfriedwagner/jupyter_notebooks/")
  (setq ein:completion-backend 'ein:use-company-backend)
  (setq ein:console-executable "/usr/bin/ipython")
  (setq ein:jupyter-default-server-command "jupyter"))

;; (use-package elpy
;;   :ensure t
;;   :init
;;   (elpy-enable)
;;   (when (require 'flycheck nil t)
;;     (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;     (add-hook 'elpy-mode-hook 'flycheck-mode))
;;   (setq python-shell-interpreter "ipython"
;; 	python-shell-interpreter-args "-i --simple-prompt"
;; 	python-shell-prompt-detect-failure-warning nil)
;;   )
(provide 'init-python)
