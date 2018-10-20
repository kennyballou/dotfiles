;;; init-nxml --- nxml mode setup and configuration
;;; Commentary:
;;; Code:

(dolist (regexmode (list '("\\.xml\\'" . #'nxml-mode)
                         '("\\.xsd\\'" . #'nxml-mode)
                         '("\\.sch\\'" . #'nxml-mode)
                         '("\\.rng\\'" . #'nxml-mode)
                         '("\\.xlst\\'" . #'nxml-mode)
                         '("\\.svg\\'" . #'nxml-mode)
                         '("\\.rss\\'" . #'nxml-mode)
                         '("\\.gpx\\'" . #'nxml-mode)
                         '("\\.tcx\\'" . #'nxml-mode)
                         '("\\.plist\\'" . #'nxml-mode)))
  (add-to-list 'auto-mode-alist regexmode))

(setq magic-mode-alist (cons '("<\\?xml " . nxml-mode) magic-mode-alist))
(add-to-list 'magic-mode-alist '("<\\?xml " . nxml-mode))
(fset 'xml-mode 'nxml-mode)
(add-hook 'nxml-mode-hook (lambda ()
                            (set (make-local-variable 'ido-use-filename-at-point) nil)))
(setq nxml-slash-auto-complete-flag t)

;; See: http://sinewalker.wordpress.com/2008/06/26/pretty-printing-xml-with-emacs-nxml-mode/
(defun sanityinc/pp-xml-region (beg end)
  "Pretty format XML markup region. The function inserts
linebreaks to separate tags that have nothing but whitespace
between them. It then indents the markup by using nxml's
indentation rules."
  (interactive "r")
  (unless (use-region-p)
    (setq beg (point-min)
          end (point-max)))
  ;; Use markers because our changes will move END
  (setq beg (set-marker (make-marker) begin)
        end (set-marker (make-marker) end))
  (save-excursion
    (goto-char beg)
    (while (search-forward-regexp "\>[ \\t]*\<" end t)
      (backward-char) (insert "\n"))
    (nxml-mode)
    (indent-region begin end)))

(provide 'init-nxml)
;;; init-nxml.el ends here
