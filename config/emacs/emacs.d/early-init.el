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
  (setq modus-themes-slanted-constructs t)
  (setq modus-themes-bold-constructs nil)
  (setq modus-themes-no-mixed-fonts nil)
  (setq modus-themes-subtle-line-numbers nil)
  (setq modus-themes-success-deuteranopia t)

  (setq modus-themes-fringes nil) ; {nil,'subtle,'intense}

  ;; Options for `modus-themes-lang-checkers': nil,
  ;; 'straight-underline, 'subtle-foreground,
  ;; 'subtle-foreground-straight-underline, 'intense-foreground,
  ;; 'intense-foreground-straight-underline, 'colored-background
  (setq modus-themes-lang-checkers nil)

  ;; Options for `modus-themes-mode-line': nil, '3d, 'moody,
  ;; 'borderless, 'borderless-3d, 'borderless-moody, 'accented,
  ;; 'accented-3d, 'accented-moody
  (setq modus-themes-mode-line '(3d))

  ;; Options for `modus-themes-syntax': nil, 'faint,
  ;; 'yellow-comments, 'green-strings,
  ;; 'yellow-comments-green-strings, 'alt-syntax,
  ;; 'alt-syntax-yellow-comments, 'faint-yellow-comments
  (setq modus-themes-syntax nil)

  ;; Options for `modus-themes-hl-line': nil, 'intense-background,
  ;; 'accented-background, 'underline-neutral,
  ;; 'underline-accented, 'underline-only-neutral,
  ;; 'underline-only-accented
  (setq modus-themes-hl-line 'underline-neutral)

  (setq modus-themes-paren-match 'subtle-bold) ; {nil,'subtle-bold,'intense,'intense-bold}

  ;; Options for `modus-themes-links': nil, 'faint,
  ;; 'neutral-underline, 'faint-neutral-underline, 'no-underline,
  ;; 'underline-only, 'neutral-underline-only
  (setq modus-themes-links 'neutral-underline)

  ;; Options for `modus-themes-prompts': nil, 'subtle-accented,
  ;; 'intense-accented, 'subtle-gray, 'intense-gray
  (setq modus-themes-prompts 'subtle-gray)

  (setq modus-themes-completions 'opinionated) ; {nil,'moderate,'opinionated}

  ;; Options for `modus-themes-region': nil, 'no-extend, 'bg-only,
  ;; 'bg-only-no-extend, 'accent, 'accent-no-extend
  (setq modus-themes-region 'bg-only-no-extend)

  ;; Options for `modus-themes-diffs': nil, 'desaturated,
  ;; 'bg-only, 'deuteranopia, 'fg-only-deuteranopia
  (setq modus-themes-diffs 'desaturated)

  (setq modus-themes-org-blocks 'grayscale) ; {nil,'grayscale,'rainbow}
  (setq modus-themes-org-habit nil) ; {nil,'simplified,'traffic-light}

  (setq modus-themes-headings ; this is an alist: read the manual or its doc string
        '((1 . line)
          (2 . rainbow-line-no-bold)
          (t . no-bold)))

  (setq modus-themes-variable-pitch-ui nil)
  (setq modus-themes-variable-pitch-headings nil)
  (setq modus-themes-scale-headings t)
  (setq modus-themes-scale-1 1.1)
  (setq modus-themes-scale-2 1.15)
  (setq modus-themes-scale-3 1.21)
  (setq modus-themes-scale-4 1.27)
  (setq modus-themes-scale-5 1.33)
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

(set-face-attribute 'default nil
                    :family "DejaVuSansMono Nerd Font Mono"
                    :height 110
                    :weight 'normal
                    :width 'normal)

(defconst font-height 110
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
(set-fontset-font t '(#xF0000 . #xF14FF) "Material Design Icons" nil 'append)
(set-fontset-font t 'symbol "Symbola" nil 'append)

; Ignore X resources; its settings would be redundant with the other settings
;; in this file and can conflict with later config (particularly where the
;; cursor color is concerned).
(advice-add #'x-apply-session-resources :override #'ignore)

;; - Resetting Garbage Collection and file-name-handler values.
(add-hook 'after-init-hook
          (lambda ()
            (setq gc-cons-threshold 100000000)
            (setq gc-cons-percentage 0.1)
            (setq file-name-handler-alist file-name-handler-alist-original)
            (garbage-collect)) t)

(provide 'early-init)
;;; early-init.el ends here
