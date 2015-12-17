;; melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


;; make sure packages are installed
(unless (package-installed-p 'alchemist)
  (package-install 'alchemist))
(unless (package-installed-p 'elixir-mode)
  (package-install 'elixir-mode))
(unless (package-installed-p 'web-mode)
  (package-install 'web-mode))
(unless (package-installed-p 'symon)
  (package-install 'symon))
(unless (package-installed-p 'battery)
  (package-install 'battery))
(unless (package-installed-p 'ample-theme)
  (package-install 'ample-theme))
(unless (package-installed-p 'markdown-mode)
  (package-install 'markdown-mode))
(unless (package-installed-p 'gh-md)
  (package-install 'gh-md))


;; fix path. FU OSX.
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(require 'battery)

;; symon
(require 'symon)
(setq symon-sparkline-type 'boxed)
(setq symon-monitors
      '(;;symon-darwin-memory-monitor
	;;symon-darwin-cpu-monitor
	symon-darwin-battery-monitor
	symon-darwin-network-rx-monitor
	symon-darwin-network-tx-monitor))
(symon-mode)


;; elixir-mode
(require 'elixir-mode)


;; alchemist
(require 'alchemist)
(setq alchemist-hooks-test-on-save t) ;; test on save


;; web-mode associations
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))
(setq web-mode-engines-alist
      '(("elixir" . "\\.eex\\."))
)

;; markdown-mode
(defun md_mode_hook ()
  (add-hook 'after-save-hook 'gh-md-render-buffer))
(add-hook 'markdown-mode-hook   'md_mode_hook)
(autoload 'markdown-mode "markdown-mode"
       "Major mode for editing Markdown files" t)
    (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; hooks
(add-hook 'after-init-hook 'global-company-mode)


(load-theme 'ample t)
(set-face-attribute 'default t :font "Source Code Pro-12" )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4f5bb895d88b6fe6a983e63429f154b8d939b4a8c581956493783b2515e22d6d" "ad950f1b1bf65682e390f3547d479fd35d8c66cafa2b8aa28179d78122faa947" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
