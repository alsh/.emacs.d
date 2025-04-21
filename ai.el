(defun get-secret-safely (collection key)
  "Retrieve a secret using secrets-get-secret, handling errors.
Return the secret string or an empty string if not found or on error."
  (or (condition-case err
          (secrets-get-secret collection key)
        (error (message "Error getting secret '%s' from collection '%s': %s" key collection err) nil))
      ""))

(setq secret-token-openai (get-secret-safely "Login" "openai-home-key"))
(setq secret-token-gemini (get-secret-safely "Login" "gemini-api-key"))
(setq secret-token-openrouter (get-secret-safely "Login" "openrouter-aider"))

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
  (aidermacs-backend 'vterm)
  (aidermacs-default-model "openrouter/google/gemini-2.5-pro-preview-03-25")
  (aidermacs-architect-model "openrouter/google/gemini-2.5-pro-preview-03-25")
  (aidermacs-editor-model "openrouter/google/gemini-2.0-flash-001")
  )
