(require 'package)
;; (use-package anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (use-package company-anaconda)
;; (eval-after-load "company"
;;   '(add-to-list 'company-backends 'company-anaconda))
(use-package elpy)
;; (use-package ein)
;; (require 'ein)
;; (require 'ein-loaddefs)
;; (require 'ein-notebook)
;; (require 'ein-subpackages)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
(elpy-enable)
;; (setq python-shell-interpreter "IPython"
;;       python-shell-interpreter-args "console --simple-prompt"
;;       python-shell-prompt-detect-failure-warning nil)
;; (add-to-list 'python-shell-completion-native-disabled-interpreters
;;              "jupyter")
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(provide 'init-python)
