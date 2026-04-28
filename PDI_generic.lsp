;; Auto-decompiled from PDI.fas
;; Decompiler: fas4_decompiler.py  (full-semantics pass)
;; Functions: 3   Warnings: 0

;; Recovered strings (first 12):
;;   \nNo dictionary item(s) matched pattern. 
;;    dictionary item(s) purged. 
;;   \n
;;   ".
;;   \n Purging dictionary "
;;   \n Purge Dictionary Items <Enter case sensitive pattern>: 
;;   \n NOTE: Purging "ACAD_*" may corrupt the drawing file. 
;;   \n ======================================================
;;   \n     
;;   \n ------------------------------------------------------
;;   \n Current Dictionary List: 

;; Referenced symbols: MSG, A
(defun msg ()
  (a 'msg)
)

;; Original arg hints: B
;; Referenced symbols: NAMEDOBJDICT, _al-bind-alist, CDR, CAR, =, C, CONS, N, ACAD_STRLSORT, STRCAT
;; Referenced strings: \n     , \n ======================================================, \n Purge Dictionary Items <Enter case sensitive pattern>: 
(defun c:pdi (b)
  (setq c nil)
  (setq n nil)
  (setq gvar_31_princ nil)
  (setq *error* nil)
  (namedobjdict)
  (setq gvar_28_entget '_al-bind-alist)
  (setq c (car (car (namedobjdict))))
  (while c
    (if (cons (car (car c)) 3)
      (progn
        (setq n (cons (car (car c)) n))
      )
    )
    (if (car c)
      (progn
        (setq c (car c))
      )
      (progn
        (setq c nil)
      )
    )
  )
  (entget 'acad_strlsort)
  (princ "\n     ")
  (setq b (strcat n))
  ;; init-args 3: 'c, nil
  (foreach c b
    (entget (getstring "\n ======================================================" c))
  )
  (entget 'textscr)
  (princ "\n Purge Dictionary Items <Enter case sensitive pattern>: ")
  (textscr)
  (strlen 'strlen)
  (setq *error* 0)
  (setq b n)
  ;; init-args 3: 'c, nil
  (foreach c b
    (if (dictremove c gvar_31_princ)
      (progn
        (dictremove (namedobjdict) c)
        (entget (wcmatch '1+ c "\n"))
        (setq *error* (itoa *error*))
      )
    )
  )
)

;; Referenced symbols: *ERROR*, DICTREMOVE, NAMEDOBJDICT, vl-ACAD-defun
;; Referenced strings:  dictionary item(s) purged. 
(defun fas_init_2 ()
  (if (dictremove *error* 0)
    (progn
      (entget (wcmatch " dictionary item(s) purged. " (itoa *error*) '((cons 20 59) (cons 0 517))))
    )
    (progn
      (entget 'vl-acad-defun)
    )
  )
  (setq c nil)
  (setq n nil)
  (setq gvar_31_princ nil)
  (setq *error* nil)
  (namedobjdict)
)
