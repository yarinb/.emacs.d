(use-package neotree
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  :bind (("<f8>" . neotree-toggle)
         ("M-<f8>" . neotree-find)))

(provide 'init-general)
