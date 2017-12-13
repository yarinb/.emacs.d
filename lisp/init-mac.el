;; use source code pro font if available
;; https://github.com/adobe-fonts/source-code-pro
(let ((font-family "Iosevka"))
  (when (and (display-graphic-p) (member font-family (font-family-list)))
    (set-face-attribute 'default nil :family font-family)
    (set-face-attribute 'default nil :height 140)))

;; configure modifiers
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)

;; don't open files from the workspace in a new frame
(setq ns-pop-up-frames nil)

;; use old-style fullscreen
(setq ns-use-native-fullscreen nil)

;; move deleted files to ~/.Trash
(setq trash-directory "~/.Trash")

;; use paths from shell
(use-package exec-path-from-shell
  :init (setq exec-path-from-shell-variables '("PATH" "MANPATH" "GOPATH"))
  :config (exec-path-from-shell-initialize))

;; add binding for toggling fullscreen
(global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)

;; use gls if available (which supports --dired option)
(when (executable-find "gls")
  (setq insert-directory-program "gls"))

;; use gdf if available as it provides more correct output. When apfs is used,
;; the ifree column of bsd df seems to be incorrect
(when (executable-find "gdf")
  (setq dired-free-space-program "gdf"))

(provide 'init-mac)
