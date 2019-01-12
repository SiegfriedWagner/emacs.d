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

(provide 'init-python)
