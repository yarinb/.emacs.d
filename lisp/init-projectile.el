(use-package projectile
  :diminish projectile-mode

  :init
  ;; use git grep
  (setq projectile-use-git-grep t)

  ;; switching project opens the top-level directory
  (setq projectile-switch-project-action 'projectile-dired)

  ;; ignore remote projects
  (setq projectile-ignored-project-function 'file-remote-p)

  ;; enable caching
  (setq projectile-enable-caching t)

  ;; use Ivy for completions
  (setq projectile-completion-system 'ivy)

  :bind (;; C-x f finds file in project
         ("C-x f" . projectile-find-file)
         ;; C-c g runs git grep in project
         ("C-c g" . projectile-grep))

  :config
  ;; enable projectile mode in all buffers
  (projectile-global-mode 1)
  (use-package counsel-projectile
    :config
    (counsel-projectile-on)))

(provide 'init-projectile)
