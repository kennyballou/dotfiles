;;; early-init --- Early Emacs Initialization
;;; Commentary:
;;; https://git.sr.ht/~vdemeester/home/tree/master/item/tools/emacs/early-init.el
;;; Code:

(setq package-enable-at-startup nil)
(setq frame-inhibit-implied-resize t)

(setq gc-cons-threshold 402653184)
(setq gc-cons-percentage 0.6)

(defvar file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)

(defvar contrib/after-load-theme-hook nil
  "Hook run after a color theme is loaded using `load-theme'.")

(defun contrib/run-after-load-theme-hook (&rest _)
  "Run `contrib/after/load-theme-hook'"
  (run-hooks 'contrib/after-load-theme-hook))

(advice-add #'load-theme :after #'contrib/run-after-load-theme-hook)
(require 'modus-operandi-theme)

(defun kb/modus-operandi ()
  "Enable some Modus Operandi variables and load the theme.

This is used internally by `vde/modus-themes-toggle'.
https://git.sr.ht/~vdemeester/home/tree/master/item/tools/emacs/early-init.el#L26"
  (setq modus-operandi-theme-slanted-constructs t)
  (setq modus-operandi-theme-bold-constructs t)
  (setq modus-operandi-theme-subtle-diffs t)
  (setq modus-operandi-theme-rainbow-headings t)
  (setq modus-operandi-theme-section-headings nil)
  (setq modus-operandi-theme-scale-headings nil)
  (setq modus-operandi-theme-fringes 'subtle) ; {nil,'subtle,'intense}
  (setq modus-operandi-theme-mode-line 'moody) ; {nil,'3d,'moody}
  (setq modus-operandi-theme-3d-modeline t)
  (setq modus-operandi-theme-faint-syntax nil)
  (setq modus-operandi-theme-intense-hl-line t)
  (setq modus-operandi-theme-intense-paren-match t)
  (setq modus-operandi-theme-prompts 'subtle) ; {nil,'subtle,'intense}
  (setq modus-operandi-theme-completions 'opinionated) ; {nil,'moderate,'opinionated}
  (setq modus-operandi-theme-diffs 'desaturated) ; {nil,'desaturated,'fg-only}
  (setq modus-operandi-theme-org-blocks 'greyscale) ; {nil,'greyscale,'rainbow}
  (setq modus-operandi-theme-variable-pitch-headings nil)
  (setq modus-operandi-theme-rainbow-headings t)
  (setq modus-operandi-theme-section-headings nil)
  (setq modus-operandi-theme-scale-headings t)
  (setq modus-operandi-theme-scale-1 1.05)
  (setq modus-operandi-theme-scale-2 1.1)
  (setq modus-operandi-theme-scale-3 1.15)
  (setq modus-operandi-theme-scale-4 1.2)
  (load-theme 'modus-operandi t))

(defun vde/modus-operandi-custom ()
  "Customize modus-operandi theme"
  ;; (if (member 'modus-operandi custom-enabled-themes)
  ;;     (modus-operandi-theme-with-color-variables ; this macro allows us to access the colour palette
  ;;      (custom-theme-set-faces
  ;;       'modus-operandi
  ;;       `(whitespace-tab ((,class (:background "#ffffff" :foreground "#cccccc"))))
  ;;       `(whitespace-space ((,class (:background "#ffffff" :foreground "#cccccc"))))
  ;;       `(whitespace-hspace ((,class (:background "#ffffff" :foreground "#cccccc"))))
  ;;       `(whitespace-newline ((,class (:background "#ffffff" :foreground "#cccccc"))))
  ;;       `(whitespace-indentation ((,class (:background "#ffffff" :foreground "#cccccc"))))
  ;;       )))
  )

(add-hook 'contrib/after-load-theme-hook 'vde/modus-operandi-custom)
(kb/modus-operandi)

(defconst font-height 130
  "Default font-height to use.")
(defconst font-family-mono "DejaVu Mono"
  "Default monospace font-family to use.")
(defconst font-family-sans "DejaVu Sans Mono"
  "Default sans font-family to use")
;; Middle/Near East: שלום, السّلام عليكم
(when (member "Noto Sans Arabic" (font-family-list))
  (set-fontset-font t 'arabic "Noto Sans Arabic"))
(when (member "Noto Sans Hebrew" (font-family-list))
  (set-fontset-font t 'arabic "Noto Sans Hewbrew"))
;; East Asia: 你好, 早晨, こんにちは, 안녕하세요
;;
;; Make sure you use the right font. See
;; https://www.google.com/get/noto/help/cjk/.
;;
;; This font requires "Regular". Other Noto fonts dont.
;; ¯\_(ツ)_/¯
(when (member "Noto Sans CJK" (font-family-list))
  (set-fontset-font t 'han "Noto Sans CJK SC Regular")
  (set-fontset-font t 'kana "Noto Sans CJK JP Regular")
  (set-fontset-font t 'hangul "Noto Sans CJK KR Regular")
  (set-fontset-font t 'cjk-misc "Noto Sans CJK KR Regular"))
;; South East Asia: ជំរាបសួរ, ສະບາຍດີ, မင်္ဂလာပါ, สวัสดีครับ
(when (member "Noto Sans Khmer" (font-family-list))
  (set-fontset-font t 'khmer "Noto Sans Khmer"))
(when (member "Noto Sans Lao" (font-family-list))
  (set-fontset-font t 'lao "Noto Sans Lao"))
(when (member "Noto Sans Myanmar" (font-family-list))
  (set-fontset-font t 'burmese "Noto Sans Myanmar"))
(when (member "Noto Sans Thai" (font-family-list))
  (set-fontset-font t 'thai "Noto Sans Thai"))

;; Africa: ሠላም
(when (member "Noto Sans Ethiopic" (font-family-list))
  (set-fontset-font t 'ethiopic "Noto Sans Ethiopic"))

;;  South Asia: નમસ્તે, नमस्ते, ನಮಸ್ಕಾರ, നമസ്കാരം, ଶୁଣିବେ,
;;              ආයුබෝවන්, வணக்கம், నమస్కారం, བཀྲ་ཤིས་བདེ་ལེགས༎
(when (member "Noto Sans Gujarati" (font-family-list))
  (set-fontset-font t 'gujarati "Noto Sans Gujarati"))
(when (member "Noto Sans Devanagari" (font-family-list))
  (set-fontset-font t 'devanagari "Noto Sans Devanagari"))
(when (member "Noto Sans Kannada" (font-family-list))
  (set-fontset-font t 'kannada "Noto Sans Kannada"))
(when (member "Noto Sans Malayalam" (font-family-list))
  (set-fontset-font t 'malayalam "Noto Sans Malayalam"))
(when (member "Noto Sans Oriya" (font-family-list))
  (set-fontset-font t 'oriya "Noto Sans Oriya"))
(when (member "Noto Sans Sinhala" (font-family-list))
  (set-fontset-font t 'sinhala "Noto Sans Sinhala"))
(when (member "Noto Sans Tamil" (font-family-list))
  (set-fontset-font t 'tamil "Noto Sans Tamil"))
(when (member "Noto Sans Telugu" (font-family-list))
  (set-fontset-font t 'telugu "Noto Sans Telugu"))
(when (member "Noto Sans Tibetan" (font-family-list))
  (set-fontset-font t 'tibetan "Noto Sans Tibetan"))


;; If font-family-mono or font-family-sans are not available, use the default Emacs face
(when (member font-family-mono (font-family-list))
  (set-face-attribute 'default nil
                      :family font-family-mono
                      :height font-height)
  (set-face-attribute 'fixed-pitch nil
                      :family font-family-mono))
(when (member font-family-sans (font-family-list))
  (set-face-attribute 'variable-pitch nil
                      :family font-family-sans
                      :weight 'regular))

(set-fontset-font t 'symbol "Noto Emoji")
(set-fontset-font t 'symbol "all-the-icons" nil 'append)
(set-fontset-font t 'symbol "Symbola" nil 'append)

; Ignore X resources; its settings would be redundant with the other settings
;; in this file and can conflict with later config (particularly where the
;; cursor color is concerned).
(advice-add #'x-apply-session-resources :override #'ignore)

;; - Resetting Garbage Collection and file-name-handler values.
(add-hook 'after-init-hook
          (lambda ()
            (setq gc-cons-threshold 67108864)
            (setq gc-cons-percentage 0.1)
            (setq file-name-handler-alist file-name-handler-alist-original)
            (garbage-collect)) t)

(provide 'early-init)
;;; early-init.el ends here
