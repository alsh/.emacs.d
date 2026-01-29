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
  (aidermacs-backend 'vterm)
  ;; (aidermacs-use-architect-mode t)
  ;; (aidermacs-default-model "openrouter/google/gemini-2.5-pro-preview-03-25")
  ;; (aidermacs-architect-model "openrouter/google/gemini-2.5-pro-preview-03-25")
  ;; (aidermacs-editor-model "openrouter/google/gemini-2.0-flash-001")
  )

(use-package gptel
  :ensure t
  :config
  (setq gptel-backend (gptel-make-openai "OpenRouter"
			:host "openrouter.ai"
			:endpoint "/api/v1/chat/completions"
			:stream t
			:key secret-token-openrouter
			:models '(google/gemini-3-pro-preview
                                  openai/gpt-5.2
                                  google/gemini-3-flash-preview)))
  (setq gptel-model 'google/gemini-3-flash-preview))

(use-package mcp
  :ensure t
  :after gptel
  :custom (mcp-hub-servers
	   `(("basic-memory" . (:command "uvx" :args ("basic-memory" "mcp")))
	     ("blender-mcp" . (:command "uvx" :args ("blender-mcp")))
	     ("mcp-server-deep-research" . (:command "uvx" :args ("mcp-server-deep-research")))
	     ("mcp-solver-z3" . (:command "uv" :args ("--directory" "/home/alexeys/src/mcp-solver" "run" "mcp-solver-z3")))
	     )
	   )
  :config
  (require 'mcp-hub)
  (require 'gptel-integrations)
  :hook (after-init . mcp-hub-start-all-server)
  )

(use-package elisp-dev-mcp :ensure t)
