;; disable splash
(setq inhibit-startup-message t)

;; hide menubar when not on os x
(when (and (fboundp 'menu-bar-mode) (not (eq system-type 'darwin)))
  (menu-bar-mode -1))

;; hide toolbar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; hide scrollbar
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; disable dialogs
(setq use-dialog-box nil)

;; highlight current line
(use-package hl-line
  :config
  (global-hl-line-mode 1))

;; Cool icons
(when (display-graphic-p)
  (use-package all-the-icons
    :ensure t
    :config
    (cond
     ((string-equal system-type "darwin")
      (if (not (file-exists-p
		(concat (getenv "HOME") "/Library/Fonts/all-the-icons.ttf")))
	  (all-the-icons-install-fonts "t"))))
    (use-package all-the-icons-dired
      :ensure t
      :init (progn
	      (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)))))

;; set theme
(use-package dracula-theme)
(use-package color-theme-sanityinc-solarized)


;; highlight matching parentheses
(use-package paren
  :ensure nil ;; package is bundled with emacs
  :config
  (show-paren-mode 1))

;; highlight lines exceeding fill-column
(use-package whitespace
  :diminish whitespace-mode

  :init
  (setq whitespace-style '(face empty lines-tail trailing))
  (setq whitespace-line-column nil)

  :config
  ;; make whitespace-mode respect a mode-specific fill-column value
  (add-hook 'hack-local-variables-hook
            (lambda ()
              (when (derived-mode-p 'prog-mode)
                (whitespace-mode 1)))))

;; show empty lines
(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;; disable word wrapping
(setq-default truncate-lines t)

;; display line and column numbers in mode-line
(setq line-number-mode t
      column-number-mode t)


;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(dracula))

;; Make sure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)


;;------------------------------------------------------------------------------
;; Toggle between light and dark
;;------------------------------------------------------------------------------
(defun light ()
  "Activate a light color theme."
  (interactive)
  (setq custom-enabled-themes '(sanityinc-tomorrow-day))
  (reapply-themes))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (setq custom-enabled-themes '(dracula))
  (reapply-themes))

(provide 'init-appearance)
