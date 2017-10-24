;;; init-csv --- csv mode configurations
;;; Commentary:
;;; Code:

(defvar csv-mode)
(defvar csv-separators)
(use-package csv-mode
  :mode "\\.[Cc][Ss][Vv]\\'"
  :config (setq csv-separators '("," ";" "|" " ")))

(provide 'init-csv)
;;; init-csv.el ends here
