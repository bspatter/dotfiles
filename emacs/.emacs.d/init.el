;;
;;
;; Emacs package manager (M-x package-list-packages)
;; reference: http://batsov.com/articles/2012/02/19/package-management-in-emacs-the-good-the-bad-and-the-ugly/
(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-enable-at-startup nil)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (package-initialize)
  )
;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;;
;;
;;
;; Fix undo mode
(require 'undo-tree)
(global-undo-tree-mode)
;;
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (manoj-dark)))
 '(custom-safe-themes (quote ("e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(fci-rule-color "#073642")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors (--map (solarized-color-blend it "#002b36" 0.25) (quote ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors (quote (("#073642" . 0) ("#546E00" . 20) ("#00736F" . 30) ("#00629D" . 50) ("#7B6000" . 60) ("#8B2C02" . 70) ("#93115C" . 85) ("#073642" . 100))))
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#dc322f") (40 . "#c85d17") (60 . "#be730b") (80 . "#b58900") (100 . "#a58e00") (120 . "#9d9100") (140 . "#959300") (160 . "#8d9600") (180 . "#859900") (200 . "#669b32") (220 . "#579d4c") (240 . "#489e65") (260 . "#399f7e") (280 . "#2aa198") (300 . "#2898af") (320 . "#2793ba") (340 . "#268fc6") (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list (quote (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; add line numbers to the left side
;;(global-linum-mode t)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; shortcut to comment regions
(global-set-key (kbd "C-c C-z") 'comment-region)                                                      
(global-set-key (kbd "C-c M-z") 'uncomment-region) 
;;(global-set-key (kbd "C-M-c") 'comment-region)                                                      
;;(global-set-key (kbd "C-M-z") 'uncomment-region) 
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Set hotkeys to navigate buffers easily
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)
;;
;;
;;
;;
;;===============================================================================
;; Tell emacs not to follow simlinks, so that dot file colors are preserved
(setq vc-follow-symlinks t)
;;
;;
;;================================================================================
;;
;; Compile commands inspired from http://www.emacswiki.org/emacs/CompileCommand
;;
;;================================================================================
(setq compilation-last-buffer nil)
(setq compilation-scroll-output 'first-error)
;;
;; kill the compilation without prompt if recompile taken from
;; http://user42.tuxfamily.org/compilation-always-kill/index.html I
;; think this might exist in next versions of emacs already. though it
;; doesn't seem to exist for v23
(autoload 'compilation-always-kill-mode "~/.emacs.d/custom/compilation-always-kill" nil t)
(eval-after-load "compile" '(compilation-always-kill-mode 1))

;; Compile using the last compile command. Blurb: "M-x recompile just
;; executes the last compile command in the directory of the current
;; buffer which can be different from the directory of the compile
;; buffer. So you would have to manually switch to the compile buffer
;; and do compile there. This is what the above command does."
(defun compile-again (pfx)
  """Run the same compile as the last time.

If there was no last time, or there is a prefix argument, this acts like
M-x compile.
"""
(interactive "p")
(if (buffer-modified-p)
    (if (y-or-n-p (format "Buffer %s modified; Do you want to save? " (buffer-name)))
	(save-buffer)))
(if (and (eq pfx 1)
	 compilation-last-buffer)
    (progn
      (set-buffer compilation-last-buffer)
      (revert-buffer t t))
  (call-interactively 'compile)))

;; Set the shortcut command
(global-set-key (kbd "M-p") 'compile-again) ;; Works great for LaTeX
;;(global-set-key (kbd "C-c C-b") 'compile)	    ;; Compile for c++

;; notifications that compile finished and close the compile buffer if
;; successful.
(setq success-message "\n Compilation Successful :-) \n ")
(setq fail-message "\n Compilation Fail :-( \n ")
(defun notify-compilation-result(buffer msg)
  "Notify that the compilation is finished,
close the *compilation* buffer if the compilation is successful,
and set the focus back to Emacs frame"
  (if (string-match "^finished" msg)
      (progn
	(delete-windows-on buffer)
	(message success-message)
	(when (display-graphic-p)
	  (tooltip-show success-message))
	)
    (message fail-message)
    (when (display-graphic-p)
      (tooltip-show fail-message))
    (setq compilation-last-buffer nil) ;; resets compile buffer so as not to interfere with 'compile-again
    )
  (setq current-frame (car (car (cdr (current-frame-configuration)))))
  (select-frame-set-input-focus current-frame))

(add-to-list 'compilation-finish-functions
	     'notify-compilation-result)
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(require 'cl) ; If you don't have it already
;;
(defun* get-closest-pathname (&optional (file "Makefile"))
  "Determine the pathname of the first instance of FILE starting from the current directory towards root.
This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name
of FILE in the current directory, suitable for creation"
  (let ((root (expand-file-name "/"))) ; the win32 builds should translate this correctly
    (expand-file-name file
		      (loop 
		       for d = default-directory then (expand-file-name ".." d)
		       if (file-exists-p (expand-file-name file d))
		       return d
		       if (equal d root)
		       return nil))))
;;
;;  Compile c++ with closest makefile
(add-hook 'c++-mode-hook
	  '(lambda ()
	     (unless (file-exists-p "makefile")
	       (set (make-local-variable 'compile-command)
		    (format "make --directory=./../ DEFS=OMP_FLAG")))))
;;(define-key c++-mode-map "M-p" 'compile)
;;
;;	       (setq compile-command "make --directory=./../ DEFS=OMP_FLAG"))))
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Set mouse scrolling
;;(xterm-mouse-mode t)
;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;Highlight parenthesis
(show-paren-mode t)
;;
;; url: http://www.emacswiki.org/emacs/HighlightParentheses
(add-hook 'highlight-parentheses-mode-hook
          '(lambda ()
             (setq autopair-handle-action-fns
                   (append
		    (if autopair-handle-action-fns
			autopair-handle-action-fns
		      '(autopair-default-handle-action))
		    '((lambda (action pair pos-before)
			(hl-paren-color-update)))))))
;;
;;
(require 'highlight-parentheses)

;;define-globalized-minor-mode(define-globalized-minor-mode global-highlight-parentheses-mode highlight-parentheses-mode
;;  (lambda nil (highlight-parentheses-mode t)))

;;(global-highlight-parentheses-mode t)
;;

;; Kill current buffer, but ask to save, but only if it has been modified
;; Based on http://ergoemacs.org/emacs/elisp_close_buffer_open_last_closed.html and http://stackoverflow.com/questions/2357881/emacs-cant-get-buffer-offer-save-working
(defun kill-this-buffer-volatile ()
  "Kill current buffer, even if it has been modified."
  (interactive)
  (if (buffer-modified-p)
      (if (y-or-n-p (format "Buffer %s modified; Do you want to save? " (buffer-name)))
	  (save-buffer)))
  ;;    (set-buffer-modified-p nil)
  (kill-this-buffer))                                                                                                                                                       
;;
(global-set-key (kbd "C-x C-k") 'kill-this-buffer-volatile)
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
;;================================================================================                                                                        
;;                                                                                                                                                        
;; Minor mode shortcuts                                                                                                                                   
;;                                                                                                                                                        
;;================================================================================                                                                        
;; If a global-set-key didn't work because it was overwritten by a major mode,                                                                            
;; add it here. (from http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs)                                                   
;; "I use a minor mode for all my "override" key bindings"

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")                                                                                
(define-key my-keys-minor-mode-map (kbd "C-c C-z") 'comment-region)                                                                                       
(define-minor-mode my-keys-minor-mode                                                                                                                     
  "A minor mode so that my key settings override annoying major modes."                                                                                   
  t " my-keys" 'my-keys-minor-mode-map)                                                                                                                   
(my-keys-minor-mode 1)                                                                                                                                    

;; Turn off the custom mode in the minibuffer
(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)                                                     
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
;;
;;===============================================================================
;; Setup Jedi for python, based on http://tkf.github.io/emacs-jedi/latest/ on 2016-01-19
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; LaTeX stuff
;; 
;;
;; force all files ending in .tex to be opened in LaTeX mode (not TeX)
(add-to-list 'auto-mode-alist '("\\.tex$" . LaTeX-mode))
;;
;;
;; ;; Add shortcut to compile .tex file
;;(global-set-key (kbd "M-p") 'recompile)
(add-hook 'tex-mode-hook
	  '(lambda ()
	     (define-key LaTeX-mode-map "\C-c\C-a"
	       'compile)
	     (setq compilation-read-command nil)
	     (add-hook 'replace-newlines-with-percent-in-region 'replace-newlines-with-percent-in-region nil 'make-it-local)
	     (local-set-key (kbd "\C-c %") 'replace-newlines-with-percent-in-region)
	     (setq default-input-method "latin-1-prefix") ;; To toggle: C-\
	     (modify-coding-system-alist 'file "\\.tex\\'" 'utf-8)
	     (setq compile-command "/home/awesome/scripts/sh_latex.sh")
	     (local-set-key (kbd "\C-c k") (lambda ()(interactive) (shell-command "rm report.aux" "*shell-command-out*" "*shell-command-err*") (kill-compilation)))
	     (local-set-key (kbd "M-F") (lambda () (interactive) (insert "Figure\\,\\ref{fig:}") (backward-char 1)))
	     (local-set-key (kbd "M-E") (lambda () (interactive) (insert "Equation\\,(\\ref{equ:})") (backward-char 2)))
	     (local-set-key (kbd "M-T") (lambda () (interactive) (insert "Table\\,\\ref{tab:}") (backward-char 1)))
	     (local-set-key (kbd "M-H") (lambda () (interactive) (insert "Chapter\\,\\ref{chap:}") (backward-char 1)))
	     (local-set-key (kbd "M-G") (lambda () (interactive) (insert "Appendix\\,\\ref{app:}") (backward-char 1)))
	     (local-set-key (kbd "M-L (") (lambda () (interactive) (insert "\\left( \\right)") (backward-char 8)))
	     (local-set-key (kbd "M-L {") (lambda () (interactive) (insert "\\left\\{ \\right\\}") (backward-char 10)))
	     (local-set-key (kbd "M-L [") (lambda () (interactive) (insert "\\left[ \\right]") (backward-char 8)))
	     (local-set-key (kbd "M-L [") (lambda () (interactive) (insert "\\left[ \\right]") (backward-char 8)))))
;;
(add-hook 'LaTeX-mode-hook
	  '(lambda ()
	     (define-key LaTeX-mode-map "\C-c\C-a"
	       'compile)
	     (setq compilation-read-command nil)
	     (add-hook 'replace-newlines-with-percent-in-region 'replace-newlines-with-percent-in-region nil 'make-it-local)
	     (local-set-key (kbd "\C-c %") 'replace-newlines-with-percent-in-region)
	     (setq default-input-method "latin-1-prefix") ;; To toggle: C-\

	     (modify-coding-system-alist 'file "\\.tex\\'" 'utf-8)
	     (setq compile-command "/home/awesome/scripts/sh_latex.sh")
	     (local-set-key (kbd "\C-c k") (lambda ()(interactive) (shell-command "rm report.aux" "*shell-command-out*" "*shell-command-err*") (kill-compilation)))
	     (local-set-key (kbd "M-F") (lambda () (interactive) (insert "Figure\\,\\ref{fig:}") (backward-char 1)))
	     (local-set-key (kbd "M-E") (lambda () (interactive) (insert "Equation\\,(\\ref{equ:})") (backward-char 2)))
	     (local-set-key (kbd "M-T") (lambda () (interactive) (insert "Table\\,\\ref{tab:}") (backward-char 1)))
	     (local-set-key (kbd "M-H") (lambda () (interactive) (insert "Chapter\\,\\ref{chap:}") (backward-char 1)))
	     (local-set-key (kbd "M-G") (lambda () (interactive) (insert "Appendix\\,\\ref{app:}") (backward-char 1)))
	     (local-set-key (kbd "M-L (") (lambda () (interactive) (insert "\\left( \\right)") (backward-char 8)))
	     (local-set-key (kbd "M-L {") (lambda () (interactive) (insert "\\left\\{ \\right\\}") (backward-char 10)))
	     (local-set-key (kbd "M-L [") (lambda () (interactive) (insert "\\left[ \\right]") (backward-char 8)))
	     (local-set-key (kbd "M-L [") (lambda () (interactive) (insert "\\left[ \\right]") (backward-char 8))))
	  'turn-on'auto-fill)
;;
;;
;; From http://www.emacswiki.org/emacs/HighlightParentheses                                                                                                                       
;;(setq TeX-PDF-mode t)                                                                                                                                                             
(setq TeX-auto-save t)                                                                                                                                                            
(setq TeX-parse-self t)                                                                                                                                                           
(setq-default TeX-master nil)                                                                                                                                                     
(add-hook 'LaTeX-mode-hook 'flyspell-mode)                                                                                                                                        
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode) 
;;
;; function to replace all \n with %\n in a region. Useful for latex
;; when you are in the minipage environment.
(defun replace-newlines-with-percent-in-region ()
  "Replace newlines with %\n in region"
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\n" nil t) (replace-match "%\n" nil t))))
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;================================================================================
;;
;; Gmsh stuff
;;
;;================================================================================
(add-to-list 'auto-mode-alist '("\\.geo$" . c++-mode))
;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;================================================================================
;;
;; Shortcut to revert emacs buffer
;;
;;================================================================================
;;
(global-set-key [C-M-insert] '(lambda() (interactive) (load-file "~/.emacs")))
;;
;;
;;
;;================================================================================
;;
;; Syntax checking
;;
;;================================================================================
(use-package flycheck
  :ensure t
  :defer t
  :config
  (global-flycheck-mode)

  (setq flycheck-python-flake8-executable "flake8"))



;;================================================================================
;;
;; Projectile and helm
;;
;;================================================================================
(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (setq projectile-globally-ignored-files
	(append projectile-globally-ignored-files
		'(".DS_Store"))
	projectile-enable-caching t
	projectile-completion-system 'helm
	projectile-switch-project-action 'helm-projectile)

  (projectile-global-mode))

;; (use-package helm
;;   :ensure t
;;   :diminish helm-mode
;;   :bind
;;   ("M-x"     . helm-M-x)
;;   ("C-x C-f" . helm-find-files)
;;   ("C-x r l" . helm-bookmarks)
;;   ("C-h i"   . helm-google-suggest)
;;   ("M-y"     . helm-show-kill-ring)
;;   ("C-h a"   . helm-apropos)
;;   ("C-x p"   . helm-top)
;;   ("C-x C-b" . helm-buffers-list)
;;   ("C-x b"   . helm-mini)
;;   :init
;;   (use-package helm-projectile
;;     :ensure    helm-projectile
;;     :bind
;;     ("C-c h" . helm-projectile)
;;     ("C-c x" . helm-projectile-find-file-dwim)
;;     :config
;;     (setq shell-file-name "/bin/bash"))

;;   (use-package helm-swoop
;;     :ensure    helm-swoop
;;     :bind
;;     ("M-i" . helm-swoop)
;;     ("C-c M-i" . helm-multi-swoop)
;;     ("C-x M-i" . helm-multi-swoop-all)
;;     :config
;;     (setq helm-swoop-split-direction 'split-window-horizontally)
;;     (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
;;     (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
;;     (define-key helm-swoop-map (kbd "C-s") 'helm-next-line))

;;   (use-package helm-git-grep
;;     :ensure    helm-git-grep
;;     :bind
;;     ("C-c g" . helm-git-grep)
;;     :config
;;     (define-key isearch-mode-map (kbd "C-c g") 'helm-git-grep-from-isearch)
;;     (define-key helm-map (kbd "C-c g") 'helm-git-grep-from-helm)
;;     (define-key helm-git-grep-map (kbd "C-r") 'helm-previous-line)
;;     (define-key helm-git-grep-map (kbd "C-s") 'helm-next-line))

;;   (use-package helm-gtags
;;     :ensure    helm-gtags
;;     :bind
;;     ("C-c f" . helm-gtags-dwim)
;;     :config
;;     (add-hook 'c-mode-hook 'helm-gtags-mode)
;;     (add-hook 'c++-mode-hook 'helm-gtags-mode))

;;   (helm-mode t))

;;
;;
;;================================================================================
;;
;; Fortran
;;
;;================================================================================
(use-package fortran
  :init
  ;; Make Fortran indent at the level of the code. Not a fixed width.
  (add-hook 'f90-mode-hook
	    '(lambda ()
	       (setq fortran-comment-indent-style 'relative))))



;;================================================================================
;;
;; Matlab
;;
;;================================================================================
(use-package matlab
  :ensure matlab-mode)



;;================================================================================
;;
;; Miscellaneous functions
;;
;;================================================================================

;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph (M-q)
(defun unfill-paragraph ()
  "Take a multi-line paragraph and make it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))


;;================================================================================
;;
;; Auto-indentation: http://www.emacswiki.org/emacs/AutoIndentation
;;
;;================================================================================
(defun set-newline-and-indent ()
  "Newline and indent for C-mode."
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'lisp-mode-hook 'set-newline-and-indent)
(add-hook 'c-mode-common-hook 'set-newline-and-indent)


;;================================================================================
;;
;; Fun startup message
;;
;;================================================================================
(defconst animate-n-steps 0)
(defun emacs-reloaded()
  "Custom startup message."
  (animate-string (concat";;Initialization successful. Greetings, Commander, and welcome to a world of pain: "
			 (substring (emacs-version) 0 16)
			 ".")
		  0 0)
  (newline-and-indent) (newline-and-indent))
(add-hook 'after-init-hook 'emacs-reloaded)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;================================================================================
;;
;; Rainbow delimiters
;;
;;================================================================================
(use-package rainbow-delimiters
  :ensure    rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (custom-set-faces
   ;;http://ergoemacs.org/misc/emacs_rainbow-delimiters-mode.html
   '(rainbow-delimiters-depth-1-face ((t (:foreground "red" :height 2.0))))
   '(rainbow-delimiters-depth-2-face ((t (:foreground "orange" :height 1.8))))
   '(rainbow-delimiters-depth-3-face ((t (:foreground "yellow" :height 1.6))))
   '(rainbow-delimiters-depth-4-face ((t (:foreground "green" :height 1.4))))
   '(rainbow-delimiters-depth-5-face ((t (:foreground "blue" :height 1.2))))
   '(rainbow-delimiters-depth-6-face ((t (:foreground "violet" :height 1.1))))
   '(rainbow-delimiters-depth-7-face ((t (:foreground "purple" :height 1.0))))
   '(rainbow-delimiters-depth-8-face ((t (:foreground "black" :height 0.9))))
   '(rainbow-delimiters-unmatched-face ((t (:background "cyan" :height 0.8)))))
  )


