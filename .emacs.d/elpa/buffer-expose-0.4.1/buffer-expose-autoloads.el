;;; buffer-expose-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "buffer-expose" "buffer-expose.el" (0 0 0 0))
;;; Generated autoloads from buffer-expose.el

(defvar buffer-expose-mode nil "\
Non-nil if Buffer-Expose mode is enabled.
See the `buffer-expose-mode' command
for a description of this minor mode.")

(custom-autoload 'buffer-expose-mode "buffer-expose" nil)

(autoload 'buffer-expose-mode "buffer-expose" "\
Expose buffers.

Instantiate bindings of `buffer-expose-mode-map'.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "buffer-expose" '("buffer-expose" "avy-dispatch-alist" "aw-" "exwm-input-line-mode-passthrough")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; buffer-expose-autoloads.el ends here
