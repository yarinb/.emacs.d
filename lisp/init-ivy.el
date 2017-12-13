; disable ido mode first
(add-hook 'after-init-hook
  (lambda ()
      (when (bound-and-true-p ido-ubiquitous-mode)
        (ido-ubiquitous-mode -1))
      (when (bound-and-true-p ido-mode)
        (ido-mode -1))))

;; Use smex to provide ido-like interface for M-x
(use-package smex
  :config
  (smex-initialize)
  :bind (("M-X" . smex-major-mode-commands)
         ;; This is the old M-x.
         ("C-c C-c M-x" . execute-extended-command)))

(use-package ivy
  :diminish ivy-mode
  :config
  (setq ivy-use-virtual-buffers t
        ivy-height 10
        ivy-display-style 'fancy
        ivy-count-format "(%d/%d) ")
  (setq ivy-re-builders-alist
          '((read-file-name-internal . ivy--regex-fuzzy)
            (counsel-M-x . ivy--regex-fuzzy)
            (t . ivy--regex-plus)))
  (define-key ivy-minibuffer-map (kbd "C-j") #'ivy-immediate-done)
  (define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done)
    (ivy-mode 1)

  :bind (
    ("\C-s" . swiper)
    ))

(use-package counsel
  :ensure t
  :bind (
    ("M-x" . counsel-M-x)
    ("C-h C-k" . counsel-descbinds)
    ))

(provide 'init-ivy)
