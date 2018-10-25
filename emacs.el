;; globals
(set-default 'truncate-lines t)
(setq delete-old-versions -1 )		; delete excess backup versions silently
(setq version-control t )		; use version control
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq vc-make-backup-files nil )		; don't make backup files, I don't care
(setq vc-follow-symlinks t )				       ; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ) ;transform backups file name
(setq inhibit-startup-screen t )	; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore )	; silent bell when you make a mistake
(setq coding-system-for-read 'utf-8 )	; use utf-8 by default
(setq coding-system-for-write 'utf-8 )
(setq sentence-end-double-space nil)	; sentence SHOULD end with only a point.
(setq default-fill-column 140)		; toggle wrapping text at the 80th character
(setq initial-scratch-message "Good day sir") ; 


;; font
(push '(font . "firacode-16") default-frame-alist)
;;; Fira code
;; This works when using emacs --daemon + emacsclient
(add-hook 'after-make-frame-functions (lambda (frame) (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")))
;; This works when using emacs without server/client
;(set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")
;; I haven't found one statement that makes both of the above situations work, so I use both for now

(defconst fira-code-font-lock-keywords-alist
  (mapcar (lambda (regex-char-pair)
            `(,(car regex-char-pair)
              (0 (prog1 ()
                   (compose-region (match-beginning 1)
                                   (match-end 1)
                                   ;; The first argument to concat is a string containing a literal tab
                                   ,(concat "	" (list (decode-char 'ucs (cadr regex-char-pair)))))))))
          '(("\\(www\\)"                   #Xe100)
            ("[^/]\\(\\*\\*\\)[^/]"        #Xe101)
            ("\\(\\*\\*\\*\\)"             #Xe102)
            ("\\(\\*\\*/\\)"               #Xe103)
            ("\\(\\*>\\)"                  #Xe104)
            ("[^*]\\(\\*/\\)"              #Xe105)
            ("\\(\\\\\\\\\\)"              #Xe106)
            ("\\(\\\\\\\\\\\\\\)"          #Xe107)
            ("\\({-\\)"                    #Xe108)
            ("\\(\\[\\]\\)"                #Xe109)
            ("\\(::\\)"                    #Xe10a)
            ("\\(:::\\)"                   #Xe10b)
            ("[^=]\\(:=\\)"                #Xe10c)
            ("\\(!!\\)"                    #Xe10d)
            ("\\(!=\\)"                    #Xe10e)
            ("\\(!==\\)"                   #Xe10f)
            ("\\(-}\\)"                    #Xe110)
            ("\\(--\\)"                    #Xe111)
            ("\\(---\\)"                   #Xe112)
            ("\\(-->\\)"                   #Xe113)
            ("[^-]\\(->\\)"                #Xe114)
            ("\\(->>\\)"                   #Xe115)
            ("\\(-<\\)"                    #Xe116)
            ("\\(-<<\\)"                   #Xe117)
            ("\\(-~\\)"                    #Xe118)
            ("\\(#{\\)"                    #Xe119)
            ("\\(#\\[\\)"                  #Xe11a)
            ("\\(##\\)"                    #Xe11b)
            ("\\(###\\)"                   #Xe11c)
            ("\\(####\\)"                  #Xe11d)
            ("\\(#(\\)"                    #Xe11e)
            ("\\(#\\?\\)"                  #Xe11f)
            ("\\(#_\\)"                    #Xe120)
            ("\\(#_(\\)"                   #Xe121)
            ("\\(\\.-\\)"                  #Xe122)
            ("\\(\\.=\\)"                  #Xe123)
            ("\\(\\.\\.\\)"                #Xe124)
            ("\\(\\.\\.<\\)"               #Xe125)
            ("\\(\\.\\.\\.\\)"             #Xe126)
            ("\\(\\?=\\)"                  #Xe127)
            ("\\(\\?\\?\\)"                #Xe128)
            ("\\(;;\\)"                    #Xe129)
            ("\\(/\\*\\)"                  #Xe12a)
            ("\\(/\\*\\*\\)"               #Xe12b)
            ("\\(/=\\)"                    #Xe12c)
            ("\\(/==\\)"                   #Xe12d)
            ("\\(/>\\)"                    #Xe12e)
            ("\\(//\\)"                    #Xe12f)
            ("\\(///\\)"                   #Xe130)
            ("\\(&&\\)"                    #Xe131)
            ("\\(||\\)"                    #Xe132)
            ("\\(||=\\)"                   #Xe133)
            ("[^|]\\(|=\\)"                #Xe134)
            ("\\(|>\\)"                    #Xe135)
            ("\\(\\^=\\)"                  #Xe136)
            ("\\(\\$>\\)"                  #Xe137)
            ("\\(\\+\\+\\)"                #Xe138)
            ("\\(\\+\\+\\+\\)"             #Xe139)
            ("\\(\\+>\\)"                  #Xe13a)
            ("\\(=:=\\)"                   #Xe13b)
            ("[^!/]\\(==\\)[^>]"           #Xe13c)
            ("\\(===\\)"                   #Xe13d)
            ("\\(==>\\)"                   #Xe13e)
            ("[^=]\\(=>\\)"                #Xe13f)
            ("\\(=>>\\)"                   #Xe140)
            ("\\(<=\\)"                    #Xe141)
            ("\\(=<<\\)"                   #Xe142)
            ("\\(=/=\\)"                   #Xe143)
            ("\\(>-\\)"                    #Xe144)
            ("\\(>=\\)"                    #Xe145)
            ("\\(>=>\\)"                   #Xe146)
            ("[^-=]\\(>>\\)"               #Xe147)
            ("\\(>>-\\)"                   #Xe148)
            ("\\(>>=\\)"                   #Xe149)
            ("\\(>>>\\)"                   #Xe14a)
            ("\\(<\\*\\)"                  #Xe14b)
            ("\\(<\\*>\\)"                 #Xe14c)
            ("\\(<|\\)"                    #Xe14d)
            ("\\(<|>\\)"                   #Xe14e)
            ("\\(<\\$\\)"                  #Xe14f)
            ("\\(<\\$>\\)"                 #Xe150)
            ("\\(<!--\\)"                  #Xe151)
            ("\\(<-\\)"                    #Xe152)
            ("\\(<--\\)"                   #Xe153)
            ("\\(<->\\)"                   #Xe154)
            ("\\(<\\+\\)"                  #Xe155)
            ("\\(<\\+>\\)"                 #Xe156)
            ("\\(<=\\)"                    #Xe157)
            ("\\(<==\\)"                   #Xe158)
            ("\\(<=>\\)"                   #Xe159)
            ("\\(<=<\\)"                   #Xe15a)
            ("\\(<>\\)"                    #Xe15b)
            ("[^-=]\\(<<\\)"               #Xe15c)
            ("\\(<<-\\)"                   #Xe15d)
            ("\\(<<=\\)"                   #Xe15e)
            ("\\(<<<\\)"                   #Xe15f)
            ("\\(<~\\)"                    #Xe160)
            ("\\(<~~\\)"                   #Xe161)
            ("\\(</\\)"                    #Xe162)
            ("\\(</>\\)"                   #Xe163)
            ("\\(~@\\)"                    #Xe164)
            ("\\(~-\\)"                    #Xe165)
            ("\\(~=\\)"                    #Xe166)
            ("\\(~>\\)"                    #Xe167)
            ("[^<]\\(~~\\)"                #Xe168)
            ("\\(~~>\\)"                   #Xe169)
            ("\\(%%\\)"                    #Xe16a)
           ;; ("\\(x\\)"                   #Xe16b) This ended up being hard to do properly so i'm leaving it out.
            ("[^:=]\\(:\\)[^:=]"           #Xe16c)
            ("[^\\+<>]\\(\\+\\)[^\\+<>]"   #Xe16d)
            ("[^\\*/<>]\\(\\*\\)[^\\*/<>]" #Xe16f))))

(defun add-fira-code-symbol-keywords ()
  (font-lock-add-keywords nil fira-code-font-lock-keywords-alist))

(add-hook 'prog-mode-hook
          #'add-fira-code-symbol-keywords)

;; me me me
(setq user-full-name "Jappie J. T. Klooster"
      user-mail-address "jappieklooster@hotmail.com"
      calendar-latitude 52.782
      calendar-longitude 6.331
      calendar-location-name "Kerkdijk 2, Ansen")

;; use windows logo as meta, alt is used by i3
(setq x-super-keysym 'meta) 

;; Annoying random freezes
(setq x-select-enable-clipboard-manager nil)

;;; I'm not a mouse peasant (disable menu/toolbars)
(tool-bar-mode -1) ;; disables tool buttons (little icons)
(menu-bar-mode -1) ;; disables file edit help etc
(scroll-bar-mode -1) ;; disables scrol bar

(global-hl-line-mode +1) ;; highlight current line

;; initialize package
(eval-when-compile
  (require 'use-package))

;; vanity
(use-package linum-relative ;; TODO switch to C backend once on emacs 26: https://github.com/coldnew/linum-relative#linum-relative-on
  :config
  (linum-relative-global-mode)
)

;;; theme
(use-package monokai-theme
   :load-path "themes"
   :config
  (load-theme 'monokai t)
)

;; load packages
(use-package evil
  :init
  (setq evil-want-integration nil) ; required for evil collection; but I patched it so no
  :config
  (evil-mode 1))

(use-package evil-escape
  :commands (evil-escape) ;; load it after press
  :after evil)

; some day I'll get this to behave, probably by patching both this and evil
(use-package evil-collection
 :after evil
 :custom
 (evil-collection-mode-list `(ediff)) ; we'll add what we need
 :config
  (evil-collection-init))

  ;; todo delete in favor of evil collection?
(use-package evil-magit
  :after (magit evil-collection)
)

;;; keybindings
(use-package general
  :config
  (general-define-key "<escape>" 'evil-escape) ;; escape anything
  (general-define-key "C-'" 'avy-goto-word-1)
  (general-define-key "C-x b" 'ivy-switch-buffer)
  (general-define-key
      :keymaps 'normal
        ;; simple command
        "K" 'newline
        )
  (general-define-key
    ;; replace default keybindings
    "C-s" 'swiper             ; search for string in current buffer
    "M-x" 'counsel-M-x        ; replace default M-x with ivy backend
    )
  (general-define-key
    :keymaps '(normal visual insert emacs)
    :prefix "SPC"
    :non-normal-prefix "C-SPC"

      ;; simple command
      "/"   'counsel-projectile-ag
      "SPC" '(avy-goto-word-or-subword-1  :which-key "go to char")
      "b"	'ivy-switch-buffer  ; change buffer, chose using ivy
      ;; bind to double key press
      "j"  'xref-find-definitions ; lsp find definition
      "f"   '(:ignore t :which-key "find")
      "ff"  'counsel-projectile-find-file
      "fr"  'projectile-replace
      "fg"  'counsel-git-grep
      "fa"  'counsel-projectile-ag
      "s"  'save-some-buffers
      "p"  'counsel-projectile
      "r"	 'counsel-recentf
      "q"   'kill-emacs
      "g"   '(:ignore t :which-key "git")
      "gg"  'counsel-git-grep
      "gf"  '(counsel-git :which-key "find file in git dir")
      "gs"  'magit-status
      "gp"  'magit-push-to-remote
      "gb"  'magit-blame
      ;; Applications
      "a" '(:ignore t :which-key "Applications")
      "d" 'insert-date
      "ar" 'ranger)
)

;;; project navigation
(use-package 
    counsel-projectile)

(use-package swiper
  :commands (
    swiper
    ))

(use-package flx)

(use-package ivy
  :after flx
  :commands (ivy-switch-buffer)
  :config
    (setq ivy-re-builders-alist
        '((ivy-switch-buffer . ivy--regex-plus)
          (t . ivy--regex-fuzzy)))
    (setq ivy-initial-inputs-alist nil)
)

(use-package ranger
  :commands (ranger)
  :config
  (setq
    ranger-cleanup-eagerly t
    ranger-parent-depth 0)
  )

;;; show what keys are possible
(use-package which-key
  :config
  (setq which-key-idle-delay 0.01)
  (which-key-mode)
)

;;; jump around
(use-package avy
  :commands (avy-goto-word-1 avy-goto-word-or-subword-1))

;;; git
(use-package magit
  :defer
  :commands (magit-status magit-dispatch-popup magit-push-to-remote)
  )

;;; I can't spell
(use-package flycheck
  :defer 2
  :config (global-flycheck-mode))

;;; I can't program
(use-package company
  :diminish company-mode
  :commands (company-mode global-company-mode)
  :defer 1
  :config
  (global-company-mode))

;;; more info
(use-package powerline
  :config
  (powerline-default-theme)
)

;;; nix syntax highlighting
(use-package nix-mode
    :after company
)

(use-package yaml-mode
  :mode "\\.yaml\\'")
(use-package markdown-mode
  :mode "\\.md\\'")

;;; JS
(use-package rjsx-mode
   ; maybe this should work:
   ; :mode ("\\.js\\" . rjsx-mode)
)
; but no this instead:
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

;;; python
(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode))

;;; Haskell
(use-package haskell-mode
  :config
  (custom-set-variables
    '(haskell-stylish-on-save t))
)

(use-package lsp-ui)
(use-package lsp-haskell
    :disabled ; need to figure out how to use this with nix-shell
    :after lsp-ui
    :config
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    (add-hook 'haskell-mode-hook #'lsp-haskell-enable)
    (add-hook 'haskell-mode-hook 'flycheck-mode)
)

(use-package rust-mode
    :config
    ;; install toolchain (rustup toolchain install stable)
    ;; install https://crates.io/crates/rustfmt-nightly
    (setq rust-format-on-save t)
)
(use-package racer
    :hook (racer-mode . rust-mode)
    :config
    (add-hook 'racer-mode-hook #'eldoc-mode)
    (add-hook 'racer-mode-hook #'company-mode)
)
(use-package flycheck-rust
    :after rust-mode
    :config
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
)
; doesn't work yet
;   (use-package lsp-rust
;       :after lsp-ui
;       ;; install https://github.com/rust-lang-nursery/rls
;       :init
;       (setq lsp-rust-rls-command '("rustup" "run" "stable" "rls"))
;       :config
;       (add-hook 'lsp-mode-hook 'lsp-ui-mode)
;       (add-hook 'rust-mode-hook #'lsp-rust-enable)
;       (add-hook 'rust-mode-hook 'flycheck-mode)
;   )
;;; use emacs as mergetool
(defvar ediff-after-quit-hooks nil
  "* Hooks to run after ediff or emerge is quit.")

(defadvice ediff-quit (after edit-after-quit-hooks activate)
  (run-hooks 'ediff-after-quit-hooks))

(setq git-mergetool-emacsclient-ediff-active nil)


(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

(defun local-ediff-before-setup-hook ()
  (setq local-ediff-saved-frame-configuration (current-frame-configuration))
  (setq local-ediff-saved-window-configuration (current-window-configuration))
  ;; (local-ediff-frame-maximize)
  (if git-mergetool-emacsclient-ediff-active
      (raise-frame)))

(defun local-ediff-quit-hook ()
  (set-frame-configuration local-ediff-saved-frame-configuration)
  (set-window-configuration local-ediff-saved-window-configuration))

(defun local-ediff-suspend-hook ()
  (set-frame-configuration local-ediff-saved-frame-configuration)
  (set-window-configuration local-ediff-saved-window-configuration))

(add-hook 'ediff-before-setup-hook 'local-ediff-before-setup-hook)
(add-hook 'ediff-quit-hook 'local-ediff-quit-hook 'append)
(add-hook 'ediff-suspend-hook 'local-ediff-suspend-hook 'append)

;; Useful for ediff merge from emacsclient.
(defun git-mergetool-emacsclient-ediff (local remote base merged)
  (setq git-mergetool-emacsclient-ediff-active t)
  (if (file-readable-p base)
      (ediff-merge-files-with-ancestor local remote base nil merged)
    (ediff-merge-files local remote nil merged))
  (recursive-edit))

(defun git-mergetool-emacsclient-ediff-after-quit-hook ()
  (exit-recursive-edit))

(add-hook 'ediff-after-quit-hooks 'git-mergetool-emacsclient-ediff-after-quit-hook 'append)

(defun insert-date (prefix)
"Insert the current date. With prefix-argument, use ISO format. With
two prefix arguments, write out the day and month name."
(interactive "P")
(let ((format (cond
                ((not prefix) "%d.%m.%Y")
                ((equal prefix '(4)) "%Y-%m-%d")
                ((equal prefix '(16)) "%A, %d. %B %Y")))
        (system-time-locale "de_DE"))
    (insert (format-time-string format))))