(use-package python
  :ensure nil ;; package is bundled with emacs

  :custom
  (python-indent-offset 4)
  (python-indent-guess-indent-offset nil)

  :config
  (add-hook 'python-mode-hook
          (lambda ()
            ;; disable electric indent
            (setq-local electric-indent-mode nil)
            ;; highlight lines longer than 79 characters (pep8)
            (setq-local fill-column 79)
            ;; use flat index in imenu
            (setq-local imenu-create-index-function
                        'python-imenu-create-flat-index))))

(use-package anaconda-mode
  :commands anaconda-mode
  :init
  (add-hook 'python-mode-hook 'anaconda-mode)

  :config
  (use-package company-anaconda
    :init
    (add-to-list 'company-backends 'company-anaconda)))

(use-package pyvenv
  :config (progn
            (add-hook 'python-mode-hook 'pyvenv-mode)))

(use-package pip-requirements)


(use-package yapfify
  :init
  (add-hook 'python-mode-hook 'yapf-mode))

(provide 'init-python-mode)
