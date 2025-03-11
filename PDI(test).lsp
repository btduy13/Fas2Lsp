;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PurgeDictionaryItems - Utility for cleaning up dictionaries
;; Decompiled from FAS4 format
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun c:PDI ( / dict_name items_purged dict_obj continue)
  (setq items_purged 0)
  (princ "\nCommon Dictionaries:\n")
  (princ "------------------------------------------------------\n")
  (princ "    ACAD_GROUP\n")
  (princ "    ACAD_LAYOUT\n")
  (princ "    ACAD_MATERIAL\n")
  (princ "    ACAD_MLINESTYLE\n")
  (princ "    ACAD_PLOTSETTINGS\n")
  (princ "    ACAD_TABLESTYLE\n")
  (princ "    ACAD_COLOR\n")
  (princ "    ACAD_VISUALSTYLE\n")
  (princ "    ACAD_DETAILVIEWSTYLE\n")
  (princ "    ACAD_SECTIONVIEWSTYLE\n")
  (princ "    ACAD_SCALELIST\n")
  (princ "    ACAD_MLEADERSTYLE\n")
  (princ "    AcDbVariableDictionary\n")
  (princ "======================================================\n")
  (princ "NOTE: Purging \"ACAD_*\" may corrupt the drawing file.\n")
  (setq dict_name (getstring "\nPurge Dictionary Items <Enter case sensitive pattern>: "))
  (setq dict_obj (namedobjdict))
  (if (not dict_obj)
    (progn
      (princ "\nError: Could not access named objects dictionary.\n")
      (exit)
    )
  )
  (if (wcmatch dict_name "ACAD_*")
    (progn
      (princ "\nWARNING: Purging ACAD_* dictionaries may corrupt the drawing.\n")
      (setq continue (getstring "Continue? [y/N]: "))
      (if (not (or (= continue "y") (= continue "Y")))
        (exit)
      )
    )
  )
  (princ (strcat "\nAttempting to purge dictionary \"" dict_name "\"...\n"))
  (if (dictremove dict_obj dict_name)
    (progn
      (setq items_purged 1)
      (princ "Dictionary successfully purged.\n")
    )
    (princ "Could not purge dictionary. It may be in use or protected.\n")
  )
  (princ (strcat (itoa items_purged) " dictionary item(s) purged.\n"))
  (princ)
)

;; End of file
