;;; init-flyspell -- flyspell configuration and setup
;;; Commentary:
;;; Code:

(defvar flyspell)
(defvar helm-flyspell)
(defvar helm-flyspell-correct)
(defvar ispell-program-name)
(defvar flyspell-prog-mode)
(defvar flyspell-use-meta-tab)
(defvar flyspell-prog-text-faces)
(defvar flyspell-mode-map)

(use-package flyspell
  :diminish
  :preface (require 'ispell)
  :bind (:map flyspell-mode-map
              ("C-;" . nil)
              ("C-c $" . nil))
  :when (executable-find ispell-program-name)
  :commands (flyspell-mode flyspell-prog-mode)
  :config
  (setq flyspell-use-meta-tab nil)
  (add-to-list 'flyspell-prog-text-faces 'nxml-text-face)
  :init
  (add-hook 'text-mode-hook 'flyspell-mode)
  (add-hook 'prog-mode-hook 'flyspell-prog-mode))

(use-package helm-flyspell
  :commands helm-flyspell-correct
  :after flyspell
  :bind (:map flyspell-mode-map
              ("C-c ." . helm-flyspell-correct)))

(provide 'init-flyspell)
;;; init-flyspell.el ends here
