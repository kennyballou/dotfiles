;;; init-docker --- Docker and related configuration
;;; Commentary:
;;; Code:

(defvar docker)
(defvar dockerfile-mode)
(defvar docker-compose-mode)
(defvar docker-tramp)
(use-package docker)
(use-package dockerfile-mode)
(use-package docker-compose-mode)
(use-package docker-tramp)
(require 'docker-tramp-compat)

(provide 'init-docker)
;;; init-docker.el ends here
