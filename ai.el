
(setq secret-token-openai (or (secrets-get-secret "Login" "openai-home-key") ""))
(setq secret-token-gemini (or (secrets-get-secret "Login" "gemini-api-key") ""))

(use-package aidermacs
  :ensure t
  :bind (("C-c a" . aidermacs-transient-menu))
  :config
  (setenv "OPENAI_API_KEY" secret-token-openai)
  (setenv "GEMINI_API_KEY" secret-token-gemini)
  (setenv "OLLAMA_API_BASE" "http://127.0.0.1:11434")
  :custom
  (aidermacs-use-architect-mode t)
  (aidermacs-architect-model "gemini/gemini-2.0-pro-exp-02-05")
  (aidermacs-editor-model "gemini/gemini-2.0-flash-exp")
  )
