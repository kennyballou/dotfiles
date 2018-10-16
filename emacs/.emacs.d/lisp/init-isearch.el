;;; init-isearch --- isearch configuration
;;; Commentary:
;;; Code:

;; show number of matches while searching
(defvar anzu-mode-lighter)
(defvar anzu)
(use-package anzu
  :init
  (global-anzu-mode t)
  (setq anzu-mode-lighter "")
  :config
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  (global-set-key [remap query-replace] 'anzu-query-replace))

;; Activate occur easily inside isearch
(when (version< emacs-version "24.3")
  (define-key isearch-mode-map (kbd "C-c C-o") 'isearch-occur))

;; DEL during isearch should edit the search string
;; not jump back to the previous result
(define-key isearch-mode-map [remap isearch-delete-char] 'isearch-del-char)

(provide 'init-isearch)
;;; init-isearch.el ends here
