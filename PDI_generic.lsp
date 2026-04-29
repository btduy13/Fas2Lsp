;; Auto-decompiled from PDI.fas
;; Decompiler: fas4_decompiler.py  (full-semantics pass)
;; Functions: 2   Warnings: 0

;; Recovered strings (first 12):
;;   \nNo dictionary item(s) matched pattern.\s
;;    dictionary item(s) purged.\s
;;   \n
;;   ".
;;   \n Purging dictionary "
;;   \n Purge Dictionary Items <Enter case sensitive pattern>:\s
;;   \n NOTE: Purging "ACAD_*" may corrupt the drawing file.\s
;;   \n ======================================================
;;   \n\s\s\s\s\s
;;   \n ------------------------------------------------------
;;   \n Current Dictionary List:\s

;; Referenced symbols: MSG, A
(defun msg ()
  (a 'msg)
)

;; Original arg hints: B
;; Referenced symbols: PRINC, _al-bind-alist, NAMEDOBJDICT, ENTGET, CDR, C, CAR, =, N, CONS
;; Referenced strings: \n Current Dictionary List:\s, \n ------------------------------------------------------, \n\s\s\s\s\s
(defun c:pdi (/ b c n gvar_31_princ *error* gvar_28_entget)
  (setq c nil)
  (setq n nil)
  (setq gvar_31_princ nil)
  (setq *error* nil)
  (princ)
  (setq gvar_28_entget '_al-bind-alist)
  (setq c (cdr (entget (namedobjdict))))
  (while c
    (if (= (car (car c)) 3)
      (progn
        (setq n (cons (cdr (car c)) n))
      )
    )
    (if (cdr c)
      (progn
        (setq c (cdr c))
      )
      (progn
        (setq c nil)
      )
    )
  )
  (princ "\n Current Dictionary List: ")
  (princ "\n ------------------------------------------------------")
  (setq b (acad_strlsort n))
  ;; init-args 3: 'c, nil
  (foreach c b
    (princ (strcat "\n     " c))
  )
  (princ "\n ======================================================")
  (princ "\n NOTE: Purging \"ACAD_*\" may corrupt the drawing file. ")
  (textscr)
  (if (> (strlen (setq gvar_31_princ (getstring "\n Purge Dictionary Items <Enter case sensitive pattern>: "))) 0)
    (progn
      (setq *error* 0)
      (setq b n)
      ;; init-args 3: 'c, nil
      (foreach c b
        (if (wcmatch c gvar_31_princ)
          (progn
            (dictremove (namedobjdict) c)
            (princ (strcat "\n Purging dictionary \"" c "\"."))
            (setq *error* (1+ *error*))
          )
        )
      )
      (if (> *error* 0)
        (progn
          (princ (strcat "\n" (itoa *error*) " dictionary item(s) purged. "))
        )
        (progn
          (princ "\nNo dictionary item(s) matched pattern. ")
        )
      )
    )
  )
  (setq c nil)
  (setq n nil)
  (setq gvar_31_princ nil)
  (setq *error* nil)
  (princ)
)
