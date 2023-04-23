;; Custom File
;; This is where emacs' garbage goes so
;; that it doesnt clog up my enit.el

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b54376ec363568656d54578d28b95382854f62b74c32077821fdfd604268616a" default))
 '(global-display-line-numbers-mode t)
 '(minimap-mode t)
 '(minimap-update-delay 0)
 '(minimap-window-location 'right)
 '(package-selected-packages
   '(treemacs-all-the-icons treemacs all-the-icons-ivy all-the-icons-ivy-rich
     all-the-icons doom-modeline ivy-rich minimap emojify no-littering counsel
     beacon consult helpful avy hydra swiper ivy doom-themes rainbow-delimiters
     which-key auto-package-update comment-dwim-2 minions ws-butler))
 '(tool-bar-mode nil))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:family "JetBrainsMono Nerd Font" :foundry "JB" :slant normal
;;  :weight normal :height 113 :width normal)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMono Nerd Font" :foundry "JB" :slant normal :weight normal :height 113 :width normal))))
 '(minimap-active-region-background ((t (:extend nil)))))
