;;; init-unicode --- Unicode Fonts Configuration
;;; Commentary:
;;; ;;; https://emacs-fu.blogspot.com/2009/08/managing-e-mail-addresses-with-bbdb.html
;;; Code:

(defvar unicode-fonts)

(use-package unicode-fonts
  :init
  (unicode-fonts-setup))

(provide 'init-unicode)
;;; init-unicode.el ends here
