;; Prefer tree-sitter modes when available
(setq major-mode-remap-alist
      '((python-mode . python-ts-mode)))

(use-package bitbake-ts-mode :ensure t)
(use-package groovy-mode :ensure t)

(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (c-mode . lsp)
	 (c++-mode . lsp)
	 (c-ts-mode . lsp)
	 (c++-ts-mode . lsp)
         (python-ts-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :ensure t :commands lsp-ui-mode)
(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)
(use-package lsp-pyright :ensure t)

(use-package dap-mode
  :ensure t
  :config
  (setq dap-python-debugger 'debugpy) ;; Explicitly use debugpy
  ;; Load dap-python *after* dap-mode is loaded and configured
  (require 'dap-python)
  (require 'dap-gdb)
  )

;; Removed the separate dap-python block as its config is now merged above

(use-package yasnippet
  :ensure t
  :hook ((lsp-mode . yas-minor-mode)))

(use-package magit :ensure t)

(use-package direnv
  :ensure t
  :config
  (direnv-mode))

(use-package meson-mode
  :ensure t)
