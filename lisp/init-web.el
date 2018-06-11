(add-to-list 'auto-mode-alist '("\\.html?\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.inc$" . php-mode)) ;; - For Drupal
  (add-to-list 'auto-mode-alist '("\\.\\(module\\|test\\|install\\|theme\\)$" . php-mode)) ;; - For Drupal
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("/\\(views\\|html\\|theme\\|templates\\)/.*\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq
   web-mode-markup-indent-offset 4
   web-mode-css-indent-offset 4
   web-mode-code-indent-offset 4
   web-mode-enable-auto-closing t
   web-mode-enable-auto-opening t
   web-mode-enable-auto-pairing t
   web-mode-enable-auto-indentation t
   web-mode-enable-auto-quoting t
   web-mode-enable-css-colorization t
   web-mode-enable-current-element-highlight t)
  (define-key web-mode-map (kbd "C-c C-v") 'browse-url-of-buffer)
  (local-set-key (kbd "RET") 'newline-and-indent))
(use-package web-beautify
  :commands (web-beautify-css
	     web-beautify-css-buffer
	     web-beautify-html
	     web-beautify-html-buffer
	     web-beautify-js
	     web-beautify-js-buffer))
(use-package php-mode
  ;; (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
  )
(use-package tern
  :config
  (add-hook 'js2-mode-hook 'tern-mode)
  (add-hook 'web-mode-hook 'tern-mode)
  (setq tern-command (append tern-command '("--no-port-file"))))
(provide 'init-web)
