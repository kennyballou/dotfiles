;;; init-php --- PHP configurations
;;; Commentary:
;;; Code:

(defvar php-mode)
(defvar geben)
(defvar geben-helm-projectile)
(defvar projectile)
(use-package php-mode)

(use-package geben)

(use-package geben-helm-projectile
  :after (helm projectile geben))

(provide 'init-php)
;;; init-php.el ends here
