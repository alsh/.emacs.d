
(setq secret-token-openai (or (secrets-get-secret "Login" "openai-home-key") ""))
(setq secret-token-gemini (or (secrets-get-secret "Login" "gemini-api-key") ""))
(setq secret-token-openrouter (or (secrets-get-secret "Login" "openrouter-aider") ""))

(use-package aidermacs
  :ensure t
  :bind (("C-c a" . aidermacs-transient-menu))
  :config
  (setenv "OPENAI_API_KEY" secret-token-openai)
  (setenv "GEMINI_API_KEY" secret-token-gemini)
  (setenv "OLLAMA_API_BASE" "http://127.0.0.1:11434")
  (setenv "OPENROUTER_API_KEY" secret-token-openrouter)
  :custom
  (aidermacs-use-architect-mode t)
  (aidermacs-architect-model "openrouter/google/gemini-2.5-pro-preview-03-25")
  (aidermacs-editor-model "openrouter/google/gemini-2.0-flash-001")
  )
