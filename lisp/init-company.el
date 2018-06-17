(require 'package)
(use-package company
  :diminish "x"
  :config 
  (setq company-tooltip-idle-delay nil company-minimum-prefix-length 1)
  (global-company-mode)
  (define-key company-mode-map (kbd "C-SPC") 'company-complete)
  ;; (add-to-list 'company-backends 'company-yasnippet) TODO: Fix yasnippet dominance
  )
(use-package company-php
  :config
  (add-hook 'php-mode-hook
	    '(lambda ()
	       (require 'company-php)
	       (company-mode t)
	       (ac-php-core-eldoc-setup) ;; enable eldoc
	       (make-local-variable 'company-backends)
	       (add-to-list 'company-backends 'company-ac-php-backend))))
(use-package company-c-headers
  :config
  (add-to-list 'company-backends 'company-c-headers))
(use-package irony
  :config
  (defun my-irony-mode-on ()
    ;; avoid enabling irony-mode in modes that inherits c-mode, e.g: php-mode(!)
    (when (member major-mode irony-supported-major-modes)
      (irony-mode 1)))
  (add-hook 'c++-mode-hook 'my-irony-mode-on)
  (add-hook 'c-mode-hook 'my-irony-mode-on)
  (add-hook 'objc-mode-hook 'my-irony-mode-on))
(use-package company-irony
  :config
  (add-to-list 'company-backends 'company-irony))
(use-package company-tern
  :config
  (setq company-tern-property-marker nil)
  (add-to-list 'company-backends 'company-tern))
(use-package ac-html-csswatcher
  :config
  (company-web-csswatcher-setup)
  (add-hook 'web-mode-hook 'ac-html-csswatcher+)
  )
(use-package company-web
  :config
  (add-to-list 'company-backends 'company-web-html)
  ;; Enable CSS completion between <style>...</style>
  ;; (defadvice company-css (before web-mode-set-up-ac-sources activate)
  ;;   "Set CSS completion based on current language before running `company-css'."
  ;;   (if (equal major-mode 'web-mode)
  ;; 	(let ((web-mode-cur-language (web-mode-language-at-pos)))
  ;;         (if (string= web-mode-cur-language "css")
  ;;             (unless css-mode (css-mode))))))

  ;; ;; Enable JavaScript completion between <script>...</script> etc.
  ;; (defadvice company-tern (before web-mode-set-up-ac-sources activate)
  ;;   "Set `tern-mode' based on current language before running `company-tern'."
  ;;   (if (equal major-mode 'web-mode)
  ;; 	(let ((web-mode-cur-language (web-mode-language-at-pos)))
  ;;         (if (or (string= web-mode-cur-language "javascript")
  ;; 		  (string= web-mode-cur-language "jsx"))
  ;;             (unless tern-mode (tern-mode))
  ;;           ;; (if tern-mode (tern-mode))
  ;;           ))))
  )
(use-package helm-company)
(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "M-SPC") 'helm-company)
     (define-key company-active-map (kbd "M-SPC") 'helm-company)))
(use-package company-statistics
  :init
  (add-hook 'after-init-hook 'company-statistics-mode))

(provide 'init-company)
