(use-package dap-mode
  :ensure t)
(dap-mode 1)
(dap-ui-mode 1)
(require 'dap-python) ;; support for python debugger
(setq dap-python-default-debug-port 32001)
(provide 'init-dap)
