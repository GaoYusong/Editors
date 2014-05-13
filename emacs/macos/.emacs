
;;------------------------------------------------------------------------------
;; personal info
;;------------------------------------------------------------------------------

;; add personal info
(setq user-full-name "GaoYusong")
(setq user-mail-address "yusong.gao@gmail.com")

;;------------------------------------------------------------------------------
;; set key
;;------------------------------------------------------------------------------

;; map C-x C-m and C-c C-m as M-x
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; prefer backward-kill-word over backspace from effective-emacs
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; add compile current cpp file
(defun compile-cpp ()
  (interactive)
  (compile (concat "g++ \"" (buffer-file-name) "\" -O2 -o main")))
(global-set-key [f5] 'compile-cpp)

;; add run eshell
(global-set-key [f9]
                (lambda () (interactive) (eshell)))

;;------------------------------------------------------------------------------
;; set visible, tab and etc...
;;------------------------------------------------------------------------------

;; add line number
(global-linum-mode 1)

;; add highlight line, this slow my emacs in windows
(global-hl-line-mode 1)

;; show column number
(setq column-number-mode t)

;; set do not move to match parentheses
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; set tabs to spaces and set tab width
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; don't genereate backup file tail with ~
(setq make-backup-files nil)

;;------------------------------------------------------------------------------
;; mode
;;------------------------------------------------------------------------------

;; add ido mode
(require 'ido)
(ido-mode t)

(require 'cc-mode)
;; set cc-mode tab width 4
(setq-default c-basic-offset 4)

;; set cc-mode auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)


;; add go mode
(add-to-list 'load-path "~/.emacs.plugin/go-mode")
(require 'go-mode-load)

;; start elscreen
;; (elscreen-start)

;; add elscreen configure, this code is ugly, and should be improved
;; (global-set-key [?\M-1] (lambda () (interactive) (elscreen-goto 0)))
;; (global-set-key [?\M-2] (lambda () (interactive) (elscreen-goto 1)))
;; (global-set-key [?\M-3] (lambda () (interactive) (elscreen-goto 2)))
;; (global-set-key [?\M-4] (lambda () (interactive) (elscreen-goto 3)))
;; (global-set-key [?\M-5] (lambda () (interactive) (elscreen-goto 4)))
;; (global-set-key [?\M-6] (lambda () (interactive) (elscreen-goto 5)))

;; (elscreen-start)

;;------------------------------------------------------------------------------
;; add command
;;------------------------------------------------------------------------------

;; rename file 
;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;; delete file and buffer
;; source: http://emacsredux.com/blog/2013/04/03/delete-file-and-buffer/
(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))


;;------------------------------------------------------------------------------
;; auto generate
;;------------------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (deeper-blue))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
