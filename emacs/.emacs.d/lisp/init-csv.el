(require-package 'csv-mode)

(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . 'csv-mode))

(setq csv-separators '("," ";" "|" " "))

(provide 'init-csv)
