(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq package-native-compile t)
(package-initialize)
(setq native-comp-async-report-warnings-errors 'nil)
(custom-set-variables '(inhibit-startup-screen t))

(defun load-config (file)
  ;;; loads elisp file directly from a user directory
  (load (concat user-emacs-directory file)))

;; Key bindings and operation
(windmove-default-keybindings)

;; Global modes
(global-auto-revert-mode)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(use-package vterm
    :ensure t)

(load-config "complete.el")
(load-config "ai.el")
(load-config "programming.el")
(load-config "ui.el")

(use-package yaml-mode
  :ensure t
  :mode "\\.yml\\'"
  )

(use-package emacs
  :custom
  ;; TAB cycle if there are only few candidates
  ;; (completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)

  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p))

;; Visual
;; (use-package eink-theme
;;   :ensure t
;;   :config
;;   (load-theme 'eink))

(use-package ef-themes
  :ensure t
  :config
  (ef-themes-select 'ef-duo-light))

;; Languages
(load-config "tree-sitter-grammars")

;; Programming modes
(use-package c-ts-mode :ensure t)
