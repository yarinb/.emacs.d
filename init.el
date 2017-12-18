;; prevent emacs 25 from automatically initializing package.el
;; (package-initialize)

(let ((lisp-directory (expand-file-name "lisp" user-emacs-directory)))
  ;; add ~/.emacs.d/lisp to load path
  (add-to-list 'load-path lisp-directory)

  ;; save customizations as local (unversioned) settings
  (setq custom-file (expand-file-name "init-local.el" lisp-directory)))

;; load files
(require 'init-package)
(require 'init-appearance)
(require 'init-sane-defaults)
(require 'init-general)
(require 'init-help)
(when (eq system-type 'darwin)
  (require 'init-mac))
(require 'init-ivy)
(require 'init-windows)
(require 'init-fonts)
(require 'init-dired)
(require 'init-projectile)
(require 'init-editing)
(require 'init-server)
(require 'init-completion)
(require 'init-imenu)
(require 'init-flyspell)
(require 'init-rainbow-delimiters)
(require 'init-ibuffer)
(require 'init-tramp)
(require 'init-flycheck)
(require 'init-sessions)
(require 'init-git)
(require 'init-org)
(require 'init-grep)

;; Language support
(require 'init-lisp)
(require 'init-javascript)
(require 'init-yaml-mode)
(require 'init-markdown-mode)
(require 'init-go-mode)
(require 'init-python-mode)

;; local settings (optional)
(load custom-file 'noerror)

