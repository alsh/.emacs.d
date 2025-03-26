
(use-package aidermacs
  :ensure t
  :bind (("C-c a" . aidermacs-transient-menu))
  :config
  (setenv "OPENAI_API_KEY" (secrets-get-secret "Login" "openai-home-key"))
  :custom
  (aidermacs-use-architect-mode t)
  (aidermacs-architect-model "openai/o3-mini")
  (aidermacs-editor-model "openai/gpt-4o")
  )
