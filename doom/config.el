;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "xxx"
      user-mail-address "xxx")
(setq org-directory "~/d/xxx"
      org-roam-directory (concat org-directory "roam")
      org-crypt-key "xxx"
)
(setenv "GPG_AGENT_INFO" nil)

(load! "personal")

; https://github.com/Cardoso1994/doom-everforest-theme
(setq doom-everforest-background 'medium) 
(setq doom-theme 'doom-everforest)

; these themes have different font-sizes; make it all same and assign colors
(custom-theme-set-faces! '(doom-everforest doom-everforest-light)
  `(org-level-1 :foreground ,(doom-color 'red) :weight bold )
  `(org-level-2 :foreground ,(doom-color 'orange) :weight bold )
  `(org-level-3 :foreground ,(doom-color 'magenta):weight bold )
  `(org-level-4 :foreground ,(doom-color 'teal) :weight bold ))

(after! org
  (with-eval-after-load 'org-modern
    (setq
     org-modern-star '("◉" "○" "◈" "◇" "★" "☆")
     org-modern-block-name t     ; Prettify source block titles (e.g., #+begin_src)
     org-modern-block-fringe nil ; Hide or show the left edge fringe marker
     org-modern-table t          ; Enables modern styled tables
     org-modern-tag t
     org-modern-label-border 2   ; Thickness of the border box around labels/tags
     org-modern-priority 
     '((?A . "🟠")
       (?B . "🟡")
       (?C . "🟣"))
     org-modern-todo t
     org-modern-keyword t)))

(setq
  doom-font 
    (font-spec :family "JetBrains Mono" :height 140 :weight 'regular)
  ;; Used for non-monospace text like Org-mode or Markdown documentation
  doom-variable-pitch-font 
    (font-spec :family "Ubuntu Sans" :size 24)
  ;; Used for presentations or split-screen focus (toggled via SPC t B)
  doom-big-font
    (font-spec :family "JetBrains Mono" :size 48)
)
(setq display-line-numbers-type nil)
(menu-bar-mode 1)

(setq deft-directory org-directory 
  deft-recursive t
  ;; I don't like any summary, hence catch-all regexp. need to see if
  ;; an option to hide summary is there instead of this one.
  deft-strip-summary-regexp ".*$"
)
;(setq ob-mermaid-cli-path "~/node_modules/.bin/mmdce")
;(add-hook 'python-mode-hook 'eglot-ensure)

(setq package-native-compile t)

(defun my/org-export-headings-to-files ()
  "Export all headings with an EXPORT_FILE_NAME property to separate files."
  (interactive)
  (org-map-entries
   (lambda ()
     (let ((export-file (org-entry-get (point) "EXPORT_FILE_NAME")))
       (when export-file
         ;; Change 'html to 'latex, 'md, or 'ascii depending on your needs
         (org-html-export-to-html nil t))))
   ))

