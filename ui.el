;; ui.el
;; This file contains configurations related to Emacs user interface,
;; including fonts, visual settings, themes, and interaction modes.
;; Future UI-related configurations should be placed here.

(use-package ligature
  :ensure t
  :config
  ;; Enable global ligature mode
  (global-ligature-mode t)

  ;; Configure ligatures for programming modes
  ;; This list is common for Iosevka and other popular programming fonts
  (ligature-set-ligatures 'prog-mode
                          '("www" "**" "***" "**/" "*>" "*/" "\\\\\\\\" "\\\\\\\\\\\\" "{-" "::" ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>" "-<" "-<<" "-~" "#{" "#[" "##"
                            "###" "####" "<>" "<|>" "</>" "<!--" "<!---" "-<>" "<->" "<-" "<<-" "<<<" "<==" "<=>" "==" "===" "=>" "=>>" ">-" ">=" ">>" ">>-" ">>=" ">>|"
                            "|>" "|->" "|=>" "|>>" "[||]" "[]" "___" "`>" "~~" "~~>" "::=" "$>" "$$" "&&" "||" "?." "?=" "++" "+>" "+++" "---" "-~>" "#=" "#:")))
