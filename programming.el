
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
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :ensure t :commands lsp-ui-mode)
(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)
(use-package dap-mode :ensure t)

(use-package yasnippet
  :ensure t
  :hook ((lsp-mode . yas-minor-mode)))
