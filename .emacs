;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(inhibit-startup-screen t)
 '(newsticker-url-list
   (quote
    (("bbc news" "http://feeds.bbci.co.uk/news/rss.xml" nil nil nil))))
 '(package-archives
   (quote
    (("melpa" . "http://stable.melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (go-mode cargo racer flycheck-rust rust-mode all-the-icons multiple-cursors iedit smartparens rainbow-delimiters hydra nyan-mode helm-projectile helm groovy-mode alchemist solarized-theme magit-gh-pulls markdown-mode magit powerline)))
 '(scroll-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; personal
(setq user-full-name "John Roberts")

;;tweaks
(tool-bar-mode -1) ;; off
(display-time-mode 1) ;; show
(fset 'yes-or-no-p 'y-or-n-p) ;; shorten
(setq initial-scratch-message "") ;; blank
(column-number-mode 1) ;; display
(setq search-whitespace-regexp ".*?") ;; words & spaces
(setq ring-bell-function 'ignore) ;; off
(setq large-file-warning-threshold (* 15 1024 1024)) ;; increase
(setq-default cursor-type '(bar . 1)) ;; change to bar cursor
(subword-mode) ;; move over camelCase words
(put 'narrow-to-region 'disabled nil)
;; initial window size
(setq initial-frame-alist
      (quote ((fullscreen . maximized))))
;; other frames
(setq default-frame-alist
      '((width . 100)
	(height . 52)))
;; file encoding
(prefer-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-auto-unix)
;; backup file location
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(require 'uniquify) ;; duplicate file names will have directory prepended
(setq uniquify-buffer-name-style 'forward)
(save-place-mode 1) ;; will go to last place edited
;; use below if perf issues with save-place-mode
;;(setq save-place-forget-unreadable-files nil)
(show-paren-mode 1)
(nyan-mode t) ;; on


;; added these hooks manually as not sure how with easy customize
 (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)

;; global key bindings
(global-set-key (kbd "C-x g") 'magit-status)

;; dired
(global-set-key (kbd "S-<f1>")
		(lambda ()
		  (interactive)
		  (dired "~/")))

 ;; helm settings 
(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "M-y") #'helm-show-kill-ring)
(global-set-key (kbd "C-c h o") #'helm-occur)
(global-set-key (kbd "C-X C-f") #'helm-find-files)

(setq helm-autoresize-max-height 0)
(setq helm-autoreszie-min-height 20)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t)
(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match t)
(setq helm-locate-fuzzy-match t)
(setq helm-apropos-fuzzy-match t)
(setq helm-lisp-fuzzy-completion t)

(helm-mode 1)
;;(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

;; projectile
(projectile-global-mode)
(global-set-key (kbd "M-g SPC") 'projectile-switch-project)
(add-to-list 'projectile-globally-ignored-files "node-modules")
(setq projectile-completion-system 'helm)
(require 'helm-projectile)
;; (helm-projectile-on)

;; dired
(require 'dired)
;;(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; company
(setq company-tooltip-align-annotations t)

;; tern and js2

;; docker

;; irc (erc)

;; email

;; elixir
(setq alchemist-hooks-test-on-save t)
(setq alchemist-hooks-compile-on-save t)

;; rust
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'racer-mode-hook #'company-mode)
(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq rust-format-on-save t)

;; avy
(avy-setup-default)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g g") 'avy-goto-char-timer)

;; eww
(global-set-key (kbd "M-g x") 'eww)
(global-set-key (kbd "M-g {") 'eww-back-url)
(global-set-key (kbd "M-g }") 'eww-forward-url)
(add-hook 'eww-mode-hook 'visual-line-mode)

;; winner mode on
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; autocorrect mistypes
(setq save-abbrevs 'silently)
(setq-default abbrev-mode t)

;; debugging with gdb
(setq gdb-many-windows t
      gdb-show-main t)

;; turn on rainbow-mode for most programming modes
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; smartparens
(require 'smartparens-config)
(add-hook 'prog-mode-hook #'smartparens-mode)

;; iedit
(require 'iedit)

;; multiple cursors
(require 'multiple-cursors)

;;hydra
(defhydra hydra-zoom (global-map "S-<f2>")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))

(defhydra hydra-dired (:hint nil :color pink)
  "
_+_ mkdir          _v_iew           _m_ark             _(_ details        _i_nsert-subdir    wdired
_C_opy             _O_ view other   _U_nmark all       _)_ omit-mode      _$_ hide-subdir    C-x C-q : edit
_D_elete           _o_pen other     _u_nmark           _l_ redisplay      _w_ kill-subdir    C-c C-c : commit
_R_ename           _M_ chmod        _t_oggle           _g_ revert buf     _e_ ediff          C-c ESC : abort
_Y_ rel symlink    _G_ chgrp        _E_xtension mark   _s_ort             _=_ pdiff
_S_ymlink          ^ ^              _F_ind marked      _._ toggle hydra   \\ flyspell
_r_sync            ^ ^              ^ ^                ^ ^                _?_ summary
_z_ compress-file  _A_ find regexp
_Z_ compress       _Q_ repl regexp

T - tag prefix
"
  ("\\" dired-do-ispell)
  ("(" dired-hide-details-mode)
  (")" dired-omit-mode)
  ("+" dired-create-directory)
  ("=" diredp-ediff)         ;; smart diff
  ("?" dired-summary)
  ("$" diredp-hide-subdir-nomove)
  ("A" dired-do-find-regexp)
  ("C" dired-do-copy)        ;; Copy all marked files
  ("D" dired-do-delete)
  ("E" dired-mark-extension)
  ("e" dired-ediff-files)
  ("F" dired-do-find-marked-files)
  ("G" dired-do-chgrp)
  ("g" revert-buffer)        ;; read all directories again (refresh)
  ("i" dired-maybe-insert-subdir)
  ("l" dired-do-redisplay)   ;; relist the marked or singel directory
  ("M" dired-do-chmod)
  ("m" dired-mark)
  ("O" dired-display-file)
  ("o" dired-find-file-other-window)
  ("Q" dired-do-find-regexp-and-replace)
  ("R" dired-do-rename)
  ("r" dired-do-rsynch)
  ("S" dired-do-symlink)
  ("s" dired-sort-toggle-or-edit)
  ("t" dired-toggle-marks)
  ("U" dired-unmark-all-marks)
  ("u" dired-unmark)
  ("v" dired-view-file)      ;; q to exit, s to search, = gets line #
  ("w" dired-kill-subdir)
  ("Y" dired-do-relsymlink)
  ("z" diredp-compress-this-file)
  ("Z" dired-do-compress)
  ("q" nil)
  ("." nil :color blue))

(define-key dired-mode-map "." 'hydra-dired/body)

(defhydra hydra-smartparens (:hint nil)
  "
 Moving^^^^                       Slurp & Barf^^   Wrapping^^            Sexp juggling^^^^               Destructive
------------------------------------------------------------------------------------------------------------------------
 [_a_] beginning  [_n_] down      [_h_] bw slurp   [_R_]   rewrap        [_S_] split   [_t_] transpose   [_c_] change inner  [_w_] copy
 [_e_] end        [_N_] bw down   [_H_] bw barf    [_u_]   unwrap        [_s_] splice  [_A_] absorb      [_C_] change outer
 [_f_] forward    [_p_] up        [_l_] slurp      [_U_]   bw unwrap     [_r_] raise   [_E_] emit        [_k_] kill          [_g_] quit
 [_b_] backward   [_P_] bw up     [_L_] barf       [_(__{__[_] wrap (){}[]   [_j_] join    [_o_] convolute   [_K_] bw kill       [_q_] quit"
  ;; Moving
  ("a" sp-beginning-of-sexp)
  ("e" sp-end-of-sexp)
  ("f" sp-forward-sexp)
  ("b" sp-backward-sexp)
  ("n" sp-down-sexp)
  ("N" sp-backward-down-sexp)
  ("p" sp-up-sexp)
  ("P" sp-backward-up-sexp)
  
  ;; Slurping & barfing
  ("h" sp-backward-slurp-sexp)
  ("H" sp-backward-barf-sexp)
  ("l" sp-forward-slurp-sexp)
  ("L" sp-forward-barf-sexp)
  
  ;; Wrapping
  ("R" sp-rewrap-sexp)
  ("u" sp-unwrap-sexp)
  ("U" sp-backward-unwrap-sexp)
  ("(" sp-wrap-round)
  ("{" sp-wrap-curly)
  ("[" sp-wrap-square)
  
  ;; Sexp juggling
  ("S" sp-split-sexp)
  ("s" sp-splice-sexp)
  ("r" sp-raise-sexp)
  ("j" sp-join-sexp)
  ("t" sp-transpose-sexp)
  ("A" sp-absorb-sexp)
  ("E" sp-emit-sexp)
  ("o" sp-convolute-sexp)
  
  ;; Destructive editing
  ("c" sp-change-inner :exit t)
  ("C" sp-change-enclosing :exit t)
  ("k" sp-kill-sexp)
  ("K" sp-backward-kill-sexp)
  ("w" sp-copy-sexp)

  ("q" nil)
  ("g" nil))

(global-set-key (kbd "S-<f6>") 'hydra-smartparens/body)

(defhydra hydra-windows (:color red
                               :hint nil)
  "
 ^Move^    ^Size^    ^Change^                    ^Split^           ^Text^
 ^^^^^^^^^^^------------------------------------------------------------------
 ^ ^ _k_ ^ ^   ^ ^ _K_ ^ ^   _u_: winner-undo _o_: rotate  _v_: vertical    
 _h_ ^+^ _l_   _H_ ^+^ _L_   _r_: winner-redo            _s_: horizontal   
 ^ ^ _j_ ^ ^   ^ ^ _J_ ^ ^   _c_: close                  _z_: zoom         _q_: quit
"
  ("h" windmove-left)
  ("j" windmove-down)
  ("k" windmove-up)
  ("l" windmove-right)
  ("H" shrink-window-horizontally)
  ("K" shrink-window)
  ("J" enlarge-window)
  ("L" enlarge-window-horizontally)
  ("v" gr/split-right-move)
  ("s" gr/split-below-move)
  ("c" delete-window)
  ("f" sk/toggle-frame-fullscreen-non-native :color blue)
  ("o" grjqq/rotate-windows)
  ("z" delete-other-windows)
  ("u" (progn
         (winner-undo)
         (setq this-command 'winner-undo)))
  ("r" winner-redo)
  ("q" nil :color blue))
(global-set-key (kbd "S-<f3>") 'hydra-windows/body)

(defhydra hydra-bookmarks (:color blue
                              :hint nil)
  "
 _s_: set  _b_: bookmark   _j_: jump   _d_: delete   _q_: quit
  "
  ("s" bookmark-set)
  ("b" bookmark-save)
  ("j" bookmark-jump)
  ("d" bookmark-delete)
  ("q" nil :color blue))
(global-set-key (kbd "S-<f4>") 'hydra-bookmarks/body)

(defhydra hydra-multiple-cursors (:hint nil)
  "
 Up^^             Down^^           Miscellaneous           % 2(mc/num-cursors) cursor%s(if (> (mc/num-cursors) 1) \"s\" \"\")
------------------------------------------------------------------
 [_p_]   Next     [_n_]   Next     [_l_] Edit lines  [_0_] Insert numbers
 [_P_]   Skip     [_N_]   Skip     [_a_] Mark all    [_A_] Insert letters
 [_M-p_] Unmark   [_M-n_] Unmark   [_s_] Search
 [Click] Cursor at point       [_q_] Quit"
  ("l" mc/edit-lines :exit t)
  ("a" mc/mark-all-like-this :exit t)
  ("n" mc/mark-next-like-this)
  ("N" mc/skip-to-next-like-this)
  ("M-n" mc/unmark-next-like-this)
  ("p" mc/mark-previous-like-this)
  ("P" mc/skip-to-previous-like-this)
  ("M-p" mc/unmark-previous-like-this)
  ("s" mc/mark-all-in-region-regexp :exit t)
  ("0" mc/insert-numbers :exit t)
  ("A" mc/insert-letters :exit t)
  ("<mouse-1>" mc/add-cursor-on-click)
  ;; Help with click recognition in this hydra
  ("<down-mouse-1>" ignore)
  ("<drag-mouse-1>" ignore)
  ("q" nil))
(global-set-key (kbd "S-<f5>") 'hydra-multiple-cursors/body)


(defhydra hydra-launcher (:color blue)
   "Launch"
   ("h" man "man")
   ("r" (browse-url "http://www.reddit.com/r/emacs/") "reddit")
   ("w" (browse-url "http://www.emacswiki.org/") "emacswiki")
   ("s" shell "shell")
   ("e" eshell "eshell")
   ("t" term "terminal")
   ("q" nil "cancel"))
(global-set-key (kbd "S-<f6>") 'hydra-launcher/body)


;; custom funcs
(defun gr/split-below-move()
  (interactive)
  (split-window-below)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'gr/split-below-move)
(defun gr/split-right-move()
  (interactive)
  (split-window-right)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'gr/split-right-move)
(defun gr/rotate-windows ()
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))

;; refresh MELPA package list
;;(unless package-archive-contents
;;    (package-refresh-contents))
