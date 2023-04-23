;;   EEEEE  MM      MM      AA       CCCC  SSSS
;;   EE     MMMM  MMMM     AAAA     CCC   SSS
;;   EEEEE  MM MMMM MM    AA  AA    CC     SSSS
;;   EE     MM  MM  MM   AAAAAAAA   CCC      SSS
;;   EEEEE  MM      MM  AA      AA   CCCC  SSSS
;; [=============================================]


;;                   PACKAGES
;;                  [========]

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Use Package
(eval-when-compile
  (add-to-list 'load-path "~/.config/emacs/elpa/use-package-20230203.2004")
  (require 'use-package))

;; Auto Update
(use-package auto-package-update
  :defer 10
  :config
  ;; Delete residual old versions
  (setq auto-package-update-delete-old-versions t)
  ;; Do not bother me when updates have taken place.
  (setq auto-package-update-hide-results t)
  ;; Update installed packages at startup if there is an update pending.
  (auto-package-update-maybe))

;; Beacon
;; Highlights cursor so you don't get lost.
(use-package beacon
  :init
  (setq beacon-blink-when-point-moves t)
  (setq beacon-blink-when-window-changes t)
  (setq beacon-blink-when-window-scrolls t)
  (setq beacon-blink-when-buffer-changes t)
  (setq beacon-blink-when-focused t)
  (beacon-mode 1))

;; WS-Butler
;; Cleans up whitespace on the ends of lines.
(use-package ws-butler
  :hook ((text-mode . ws-butler-mode)
         (prog-mode . ws-butler-mode)))

;; Comment-DWIM
;; Allows for commenting out reigons and lines with a keypress. (M-;)
(use-package comment-dwim-2
 :bind (("M-;" . comment-dwim-2)
        (:map org-mode-map
              ("M-;" . org-comment-dwim-2))))

;; Which-Key
;; Shows keybind in command minibuffer menu.
(use-package which-key
  :init (which-key-mode)
  :config
  (setq which-key-idle-delay 0.1))

;; Rainbow Delimiters
;; Highlights Corresponding Brackets
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Keep .config/emacs clean
(use-package no-littering)


;;             BASIC CONFIGURATAION
;;            [====================]

;; Safe Themes
;; Doom Themes can run elisp? this shouldn't be neccessary but whatever
(custom-set-variables
 '(custom-safe-themes
   '("b54376ec363568656d54578d28b95382854f62b74c32077821fdfd604268616a"
     default)))

;; Load Theme Based On Current Host
;; Load Catppuccin on my desktop and Monokai on my Thinkpad
(if (string= (system-name) "littlefella")
    (progn
      (add-to-list 'custom-theme-load-path "~/.config/emacs/themes/")
      (setq catppuccin-flavor 'macchiato)
      (load-theme 'catppuccin t))
  (load-theme 'doom-monokai-spectrum))

;; Font
(custom-set-faces
 '(default ((t (:family "JetBrainsMono Nerd Font" :foundry "JB" :slant normal
                :weight normal :height 113 :width normal)))))

;; Remove Black Bars From Emacs Window
(set-fringe-mode 0)

;; Remove all GUI!
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)
(setq use-dialog-box nil)

;; Add 80 Column Line to Clean up Code
(display-fill-column-indicator-mode 1)
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)

;; Whitespace Mode
;; Highlights lines over 80 characters.
(setq whitespace-line-column 80)
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

;; User Configuration
(setq user-mail-address "nhe@air.net.au")

;; Remove Scratch Message
(setq initial-scratch-message nil)

;; Change C-a Behaviour
;; C-a now sends the cursor to the first non whitespace character on a line
;; (consecutive C-a will send to the true beggining of line)
(defadvice move-beginning-of-line (around smarter-bol activate)
  ;; Move to requested line if needed.
  (let ((arg (or (ad-get-arg 0) 1)))
    (when (/= arg 1)
      (forward-line (1- arg))))
  ;; Move to indentation on first call, then to actual BOL on second.
  (let ((pos (point)))
    (back-to-indentation)
    (when (= pos (point))
      ad-do-it)))

;; Double Check Before Quit
(setq confirm-kill-proccesses t)

;; Refresh File When File Changes Outside of Emacs
(global-auto-revert-mode 1)

;; Refresh Buffers Like Dired When File Changes Outside of Emacs
(setq global-auto-revert-non-file-buffers t)

;; UTF-8 Encoding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Emoji Support!
(use-package emojify
  :hook (erc-mode . emojify-mode)
  :commands emojify-mode)

;; Line Numbers
(global-display-line-numbers-mode 1)

;; Line Numbers in Some Modes
(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))

;; Increase Wrap Column to fit modern standards
(setq-default fill-column 80)

;; Disable Double Space After Sentences
(setq-default sentence-end-double-space nil)

;; Add Trailing Newline to end of files
(setq require-final-newline t)

;; Line Mode (Highlight current line
;; (could uses some theme to make it more subtle))
(hl-line-mode -1)

;; Tab width
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; Tab Indents Before Completion
(setq-default tab-always-indent 'complete)

;; Auto Indent on Newline
(electric-indent-mode 1)

;; Unbind Manual Newline and Indent
(global-unset-key ( kbd "C-j"))

;; Toggle Auto Indentations
(defun turn-on-electric-indent-mode ()
  "Turns on electric-indent-mode"
  (interactive)
  (electric-indent-mode 1))


(defun turn-off-electric-indent-mode ()
  "Turns off electric-indent-mode"
  (interactive)
  (electric-indent-mode -1))

(add-hook 'prog-mode-hook 'turn-on-electric-indent-mode)

;; Improve Scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Cursor Configurations
(setq cursor-type 'box)
(blink-cursor-mode 1)

;; Remember Recent Edited Files
(recentf-mode 1)
(global-set-key (kbd "C-x r") 'recentf-open-files)

;; Remove Warning on Large Files
(setq large-file-warning-threshold nil)

;; Remove Warning on Advised Functions
(setq ad-redefinition-action 'accept)


;;             MODELINE MODIFICATIONS
;;            [======================]

;; Clean Up Modeline
(use-package diminish)


;;             KEYBOARD MODIFICATIONS
;;            [======================]

;; Bind M-p to previous paragraph to match C-Up
(global-set-key (kbd "M-p") 'backward-paragraph)

;; Bind M-n to previous paragraph to match C-Down
(global-set-key (kbd "M-n") 'forward-paragraph)

;; ESC Cancels All
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Bind C-j to Line Jump Relative
(global-set-key (kbd "C-j") 'goto-line-relative)

;; Bind C-S-j to Goto Line
(global-set-key (kbd "C-S-j") 'goto-line)

;; Bind C-x r to Open Recent Files
;; global-set-key (kbd "C-x r") 'recentf-open-files)

;; Unbind C-z because C-x C-z does the same thing
(global-unset-key (kbd "C-z"))

;; Zoom Keys
;; C-z i to zoom in and C-z o to zoom out
(defhydra hydra-zoom (global-map "C-z")
  "zoom"
  ("i" text-scale-increase "in")
  ("o" text-scale-decrease "out"))

;; Helpful Keys
(global-set-key (kbd "C-h f") #'helpful-callable)
(global-set-key (kbd "C-h v") #'helpful-variable)
(global-set-key (kbd "C-h k") #'helpful-key)
(global-set-key (kbd "C-h x") #'helpful-command)

;; More Helpful Keys
(global-set-key (kbd "C-c C-d") #'helpful-at-point)
(global-set-key (kbd "C-h F") #'helpful-function)

;; Dictionary Definition of Current Word
(global-set-key (kbd "C-h d") #'dictionary-lookup-definition)
(global-set-key (kbd "C-h C-d") #'apropos-documentation)

;; Bind M-o to switch frame becuase C-x o is slow
(global-set-key (kbd "M-o") 'other-window)

;; Change list-buffers to ibuffer because ibuffer is cooler B)
(global-set-key (kbd "C-x C-b") 'ibuffer)


;;             BACKUP CONFIGURATAION
;;            [=====================]

;; Backup Directory
(setq backup-directory-alist '(("." . "~/.config/emacs/backups")))

;; Only Keep 500 Backups Of A File
(setq kept-new-versions 500)

;; Clean Out Old Backups
(setq delete-old-versions t)

;; Backups Work With Symlinks
(setq backup-by-copying t)

;; Add Version Numbers to Backups
(setq version-control t)

;; Make Backup Every Save
(defun force-backup-of-buffer ()
  (setq buffer-backed-up nil))
(add-hook 'before-save-hook  'force-backup-of-buffer)

;;                      MISC
;;                    [======]

;; TheThe
(defun the-the ()
  "Search forward for for a duplicated word."
  (interactive)
  (message "Searching for for duplicated words ...")
  (push-mark)

;; This regexp is not perfect
;; but is fairly good over all:
  (if 2(re-search-forward
       "\\b\\([^@ \n\t]+\\)[ \n\t]+\\1\\b" nil 'move)
      (message "Found duplicated word.")
    (message "End of buffer")))


;; Bind 'the-the' to  C-c
(global-set-key "\C-c\\" 'the-the)

;; Remove Bothersome Compiler Warnings
(setq comp-async-report-warnings-errors nil)
(when (fboundp 'native-compile-async)
  (setq comp-deferred-compilation t
        comp-deferred-compilation-black-list '("/mu4e.*\\.el$")))

;; Time Emacs Startup
(setq gc-cons-threshold (* 50 1000 1000))
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Custom File to clean up init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
