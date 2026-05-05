;; Auto-decompiled from PDI.fas
;; Generated AutoLISP output

(defun c:pdi (/ sorted_names dict_name dict_names pattern purged_count)
  (setq dict_name (cdr (entget (namedobjdict))))
  (while dict_name
    (if (= (car (car dict_name)) 3)
      (progn
        (setq dict_names (cons (cdr (car dict_name)) dict_names))
      )
    )
    (if (cdr dict_name)
      (progn
        (setq dict_name (cdr dict_name))
      )
      (progn
        (setq dict_name nil)
      )
    )
  )
  (princ "\n Current Dictionary List: ")
  (princ "\n ------------------------------------------------------")
  (setq sorted_names (acad_strlsort dict_names))
  (foreach dict_name sorted_names
    (princ (strcat "\n     " dict_name))
  )
  (princ "\n ======================================================")
  (princ "\n NOTE: Purging \"ACAD_*\" may corrupt the drawing file. ")
  (textscr)
  (if (> (strlen (setq pattern (getstring "\n Purge Dictionary Items <Enter case sensitive pattern>: "))) 0)
    (progn
      (setq purged_count 0)
      (setq sorted_names dict_names)
      (foreach dict_name sorted_names
        (if (wcmatch dict_name pattern)
          (progn
            (dictremove (namedobjdict) dict_name)
            (princ (strcat "\n Purging dictionary \"" dict_name "\"."))
            (setq purged_count (1+ purged_count))
          )
        )
      )
      (if (> purged_count 0)
        (progn
          (princ (strcat "\n" (itoa purged_count) " dictionary item(s) purged. "))
        )
        (progn
          (princ "\nNo dictionary item(s) matched pattern. ")
        )
      )
    )
  )
  (princ)
)
