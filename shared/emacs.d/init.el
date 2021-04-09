;; Disable UI stuff.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)


;; Enable smex.
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(require 'zen-mode)

