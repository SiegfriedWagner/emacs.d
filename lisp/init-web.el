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
  (local-set-key (kbd "RET") 'newline-and-indent)

  ;; (defun my-web-mode-hook()
  ;;   "Hook for web-mode"
  ;;   (setq-local company-backends '(
  ;; 				   company-tern
  ;; 				   company-web-html
  ;; 				   ;; company-css
  ;; 				   company-files
  ;; 				   company-yasnippet
  ;; 				   ;; company-dabbrev
  
  ;; 				   :with company-css)))
  ;; (add-hook 'web-mode-hook 'my-web-mode-hook)
  (defun my-web-mode-hook ()
    "Hook for `web-mode'."
    (set (make-local-variable 'company-backends)
         '(company-tern (company-web-html
			 ;; company-yasnippet
			 company-files
			 company-css))))

  (add-hook 'web-mode-hook 'my-web-mode-hook)
  (advice-add 'company-tern :before
              #'(lambda (&rest _)
                  (if (equal major-mode 'web-mode)
                      (let ((web-mode-cur-language
                             (web-mode-language-at-pos)))
			(if (or (string= web-mode-cur-language "javascript")
				(string= web-mode-cur-language "jsx"))
                            (unless tern-mode (tern-mode))
                          (if tern-mode (tern-mode -1)))))))
  )
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
(provide 'init-web)
