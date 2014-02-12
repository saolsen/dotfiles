(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
 
(when (not package-archive-contents)
  (package-refresh-contents))
 
;; Add in your own as you wish:
(defvar my-packages '(starter-kit
                      starter-kit-bindings
                      starter-kit-js
                      starter-kit-lisp
                      ;; Clojure & friends
                      clojure-mode
                      cider
                      rainbow-delimiters

                      ;ac-cider-compliment
                      
                      ;; Project navigation
                      projectile
                      ack-and-a-half
                      ;; Misc.
                      markdown-mode
                      twilight-theme
                      hlinum
                      cyberpunk-theme
                      ;; racket
                      geiser
                      )
  "A list of packages to ensure are installed at launch.")
 
;; Automaticaly install any missing packages
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
 
;; Load the provided Clojure start kit configurations
(load (concat user-emacs-directory "clojure-starter-kit.el"))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-warning-face ((t (:inherit nil :foreground "red" :background nil))))
 '(linum-highlight-face ((t (:inherit default :background "color-238" :foreground "white"))) t)
 '(show-paren-match ((((class color) (background dark)) (:inherit nil :foreground "red")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("968d1ad07c38d02d2e5debffc5638332696ac41af7974ade6f95841359ed73e3" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "1f3304214265481c56341bcee387ef1abb684e4efbccebca0e120be7b1a13589" "31bfef452bee11d19df790b82dea35a3b275142032e06c6ecdc98007bf12466c" default))))
