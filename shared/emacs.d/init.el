;; Disable UI stuff.
(tool-bar-mode -1)
(menu-bar-mode -1)
(when (display-graphic-p)
  (scroll-bar-mode -1))


;; Enable smex.
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(load (expand-file-name "~/.emacs.d/zen-mode.el"))
(require 'zen-mode)
