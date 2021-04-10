;; Disable UI stuff.
(tool-bar-mode -1)
(menu-bar-mode -1)
(when (display-graphic-p)
  ;; Disable the annoying bell.
  (setq ring-bell-function 'ignore)
  (scroll-bar-mode -1))


;; Enable smex.
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(load (expand-file-name "~/.emacs.d/zen-mode.el"))
(require 'zen-mode)

;; Highlight matching paren.
(show-paren-mode 1)

;; Enable flx-ido to fuzzy search all the places.
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

;; Disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(require 'ido)
(ido-mode t)
(setq ido-everywhere t)
(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)
