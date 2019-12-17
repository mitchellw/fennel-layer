;;; packages.el --- fennel layer packages file for Spacemacs.
;;
;; Copyright (c) 2019 Wilson Mitchell and contributors
;;
;; Author: Wilson Mitchell <github@wilsonmitchell.me>
;; URL: https://github.com/mitchellw/fennel-layer
;; Version: 0.1.0
;; Keywords: languages, tools
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst fennel-packages
  '(fennel-mode)
  "The list of Lisp packages required by the fennel layer.")


;;; packages.el ends here
(defun fennel/init-fennel-mode ()
  (use-package fennel-mode
    :defer t
    :init
    (progn
      (spacemacs/register-repl 'fennel-mode 'fennel-repl "fennel"))
    :config
    (progn
      ;; key bindings
      (dolist (prefix '(("mc" . "compile")
                        ("mg" . "goto")))
        (spacemacs/declare-prefix-for-mode
          'fennel-mode (car prefix) (cdr prefix)))
      (spacemacs/set-leader-keys-for-major-mode 'fennel-mode
        "r" 'fennel-repl

        ;; compile
        "cr" 'fennel-reload
        "cl" 'fennel-view-compilation

        ;; goto
        "gg" 'fennel-find-definition
        "gG" 'fennel-find-definition-pop))))
