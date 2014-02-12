;; General
(setq initial-scratch-message nil)                                         ; *scratch* starts empty
(when (locate-library "clojure-mode")                                      ; Set *scratch* to Clojure mode
  (setq initial-major-mode 'clojure-mode))
 
(projectile-global-mode)                                                   ; Quickly navigate projects using Projectile (C-c p C-h for available commands)
(setq projectile-show-paths-function 'projectile-hashify-with-relative-paths) ; Projectile shows full relative paths
 
;; Visual
;;(load-theme 'light-blue t)
;;(load-theme 'wombat t)
(load-theme 'cyberpunk t)
                                        ; Load my preferred theme, twilight
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)                        ; Enable rainbow delimiters when programming
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)                    ; Disable emacs-starter-kits line highlighting
 
(global-linum-mode t)                                                      ; Always show line numbers on left
(setq linum-format "%4d ")                                                 ; Line numbers gutter should be four characters wide
 
(line-number-mode 1)                                                       ; Mode line shows line numbers
(column-number-mode 1)                                                     ; Mode line shows column numbers
 
(setq-default tab-width 2)                                                 ; Tab width of 2
(fset 'yes-or-no-p 'y-or-n-p)                                              ; Emacs prompts should accept "y" or "n" instead of the full word
 
(setq visible-bell nil)                                                    ; No more Mr. Visual Bell Guy.
 
 
;; Clojure
(setq auto-mode-alist (cons '("\\.edn$" . clojure-mode) auto-mode-alist))  ; *.edn are Clojure files
(setq auto-mode-alist (cons '("\\.cljs$" . clojure-mode) auto-mode-alist)) ; *.cljs are Clojure files
 
 
;; nREPL customizations
;;(setq nrepl-hide-special-buffers t)                                        ; Don't show buffers like connection or server
;;(setq nrepl-popup-on-error nil)                                            ; Don't popup new buffer for errors (show in nrepl buffer)
;;(setq nrepl-popup-stacktraces-in-repl t)                                   ; Display stacktrace inline
 
;;(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)          ; Enable eldoc - shows fn argument list in echo area
;;(add-hook 'nrepl-mode-hook 'paredit-mode)                                  ; Use paredit in *nrepl* buffer
 
(add-to-list 'same-window-buffer-names "*nrepl*")                          ; Make C-c C-z switch to *nrepl*
(add-hook 'cider-repl-mode-hook 'paredit-mode) 
 
;; Ido-mode customizations
(setq ido-decorations                                                      ; Make ido-mode display vertically
      (quote
       ("\n-> "           ; Opening bracket around prospect list
        ""                ; Closing bracket around prospect list
        "\n   "           ; separator between prospects
        "\n   ..."        ; appears at end of truncated list of prospects
        "["               ; opening bracket around common match string
        "]"               ; closing bracket around common match string
        " [No match]"     ; displayed when there is no match
        " [Matched]"      ; displayed if there is a single match
        " [Not readable]" ; current diretory is not readable
        " [Too big]"      ; directory too big
        " [Confirm]")))   ; confirm creation of new file or buffer
 
(add-hook 'ido-setup-hook                                                  ; Navigate ido-mode vertically
          (lambda ()
            (define-key ido-completion-map [down] 'ido-next-match)
            (define-key ido-completion-map [up] 'ido-prev-match)
            (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
            (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)))

;; My stuff

(setq exec-path (append exec-path '("/usr/local/bin/")))
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key (kbd "<left>") 'shrink-window-horizontally)
(global-set-key (kbd "<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "<down>") 'shrink-window)
(global-set-key (kbd "<up>") 'enlarge-window)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq require-final-newline t)

;; ;; auto complete clojure
;; (add-hook 'cider-mode-hook 'ac-cider-compliment-setup)
;; (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes cider-mode))
;; (defun set-auto-complete-as-completion-at-point-function ()
;;   (setq completion-at-point-functions '(auto-complete)))
;; (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
;; (add-hook cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; scpaste
(autoload 'scpaste "scpaste" "Paste the current buffer." t nil)
(setq scpaste-http-destination "http://files.steveolsen.us"
      scpaste-scp-destination "files.steveolsen.us:/files")

;; gettin real ivory tower with it
(setq scheme-program-name "petite")

;; 
(setq ring-bell-function 'ignore)
(setq auto-save-default nil)
(global-auto-revert-mode t)
