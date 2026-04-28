;; Auto-decompiled from bib.fas
;; Decompiler: fas4_decompiler.py  (full-semantics pass)
;; Functions: 542   Warnings: 0

;; Recovered strings (first 12):
;;   AoporaV1
;;   Écoulements
;;   Réseaux
;;   Deux textes
;;   Un texte
;;   Réseau abandonné
;;   Réseau inconnu
;;   5
;;   Tag sans creux
;;   Tag avec creux
;;   7
;;   Quatre vides

(defun fas_init ()
  nil
)

;; Referenced symbols: GROUPBIB-ADDGROUP, ENTDEL, POLYBIB-VTXJOIN, LISTBIB-SUBST, vlax-ename->vla-object, APPEND, ORDREBIB-MOVETOTOP, AXEDYNDIAL-FILL, GEOMBIB-RACCORDMAX, RE_MAX
(defun aoblk-choixbloc ()
  (entdel 'groupbib-addgroup)
  (vlax-ename->vla-object 'listbib-subst)
  (setq append polybib-vtxjoin)
  (while append
    (if ordrebib-movetotop
      (progn
        (setq listbib-add (re_max nil (geombib-raccordmax 'axedyndial-fill ordrebib-movetotop '(ls_raymax re_max inc))))
      )
      (progn
        (setq listbib-add (re_max nil '(inc ls_ext1 ls_ext2 re_max pt_a pt_b pt_c ls_vtxs pt_f)))
      )
    )
    (if (and ordrebib-movetotop (ls_ext2 listbib-add 'ls_ext1))
      (progn
        (setq listbib-add ordrebib-movetotop)
      )
    )
    (if (or (ls_ext2 listbib-add 'listbib-subst) (ls_ext2 listbib-add 'ls_ext1))
      (progn
        (setq listbib-add (es_ext 'min nil (es_ext 'pt_f)))
        (if (cadr listbib-add)
          (progn
            (setq append nil)
          )
        )
        (if (and listbib-add (pt_ext listbib-add))
          (progn
            (< vlax-curve-getparamatpoint fix)
            (setq vlax-curve-getparamatpoint (vlax-curve-getclosestpointto listbib-add))
            (setq fix (re_param listbib-add))
            (setq listbib-add vlax-curve-getparamatpoint)
            (setq ordrebib-movetotop listbib-add)
          )
          (progn
            (setq ordrebib-movetotop listbib-add)
          )
        )
      )
      (progn
        (cdr listbib-add)
      )
    )
    (cadr (ocbib-ename2id '(ha_group ha_group ld_axe ha_axe ha_group ls_som0 ls_ray ls_ent ls_som in_lon0 in_lon in_node) listbib-add))
    (if (and listbib-add (setq append (cadr (ocbib-ename2id '(ha_group ha_group ld_axe ha_axe ha_group ls_som0 ls_ray ls_ent ls_som in_lon0 in_lon in_node) listbib-add))))
      (progn
        (ls_som0 'cdr)
      )
    )
  )
  listbib-add
)

;; Original arg hints: IN_LON0
;; Referenced symbols: IN_LON, ENTDEL, IN_LON0, OCBIB-ENAME2ID, CADR, IN_NODE, >, =, GEOMBIB-RACCORDMAX, ST_FLAG
;; Referenced strings: \nSommet(s) déplacé(s)
(defun aoblk-ins (in_lon0)
  (entdel 'in_lon)
  (if (cadr (ocbib-ename2id '(ha_group ha_group ld_axe ha_axe ha_group ls_som0 ls_ray ls_ent ls_som in_lon0 in_lon in_node) in_lon0_2))
    (progn
      T
      (geombib-raccordmax (cdr 'in_node) '= "\nSommet(s) déplacé(s)")
      (geombib-raccordmax in_lon0_2 'st_flag)
      (listbib-remove-i gvar_3419 3 100 gvar_3417)
      (ld_poly (= (listbib-insert-i (cdr (listbib-remove-i))) 'axedyn-pop) (rtos 'aobib-popall) (geombib-raccordmax (es_poly listbib-remove-i) '(en_poly ha_poly ld_poly ha_axe ha_ext ls_ray ls_ent in_node re_courant st_txt) in_lon0_2 'st_flag) 'en_poly 'en_poly 'en_poly 'ha_poly)
      (and (setq gvar_3419 (geombib-raccordmax (cdr 'in_node) '= "\nSommet(s) déplacé(s)")) (setq gvar_3417 (geombib-raccordmax in_lon0_2 'st_flag)) (setq listbib-remove-i (listbib-remove-i gvar_3419 3 100 gvar_3417)) (setq axedyn-get (ld_poly (= (listbib-insert-i (cdr (listbib-remove-i))) 'axedyn-pop) (rtos 'aobib-popall) (geombib-raccordmax (es_poly listbib-remove-i) '(en_poly ha_poly ld_poly ha_axe ha_ext ls_ray ls_ent in_node re_courant st_txt) in_lon0_2 'st_flag) 'en_poly 'en_poly 'en_poly 'ha_poly)) (member axedyn-get))
    )
  )
  (if (ocbib-ename2id '(ha_group ha_group ld_axe ha_axe ha_group ls_som0 ls_ray ls_ent ls_som in_lon0 in_lon in_node) in_lon0_2)
    (progn
      polybib-vtxjoin
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: VL-POSITION, AXEDYN-SETRAYEXT
(defun axedyn-list ()
  (axedyn-setrayext 'vl-position)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: VL-POSITION, EN_RAYON, RE_COURANT
(defun axedyn-get (en_rayon)
  (re_courant 'vl-position en_rayon_2)
)

;; Original arg hints: EN_RAYON, arg_2
;; Referenced symbols: VL-POSITION, EN_RAYON, RTOS
(defun axedyn-set (en_rayon arg_2)
  (rtos 'vl-position en_rayon_2 gvar_3396)
)

;; Original arg hints: ST_TXT, GETREAL, AXEDYN-SET, AOPORA-FIN, IN_LON0, LS_AXE, PT_PAS
;; Referenced symbols: POLY-POLYTAN, ENTDEL, GETREAL, RE_TAN, ST_TXT, POLAR, LS_AXE, PT_PROJ, IN_PARAM, LS_SOMS
;; Referenced strings: Choisir un sommet
(defun axedyn-create (st_txt getreal axedyn-set aopora-fin in_lon0 ls_axe pt_pas / re_tan pt_1 pt_2 ha_ext en_ext pt_proj in_param ls_soms in_length ls_vtxs ls_som pt_ptp1 pt_ptp2 local_7)
  (entdel 'poly-polytan)
  (ls_soms st_txt_2 8 (in_param (pt_proj ls_axe_2) 8))
  T
  T
  (pt_ptp1 getreal_2 pt_ptp1)
  (rtos 'vl-position (dcl-control-setenabled (st_axeid pt_ptp1)) projet_pa_axes_re_rayon)
  (setq re_tan (re_tan getreal_2))
  (setq pt_1 (polar st_txt_2))
  (setq pt_2 (1- getreal_2))
  (polybib-lwvertices 'in_length re_tan)
  (polybib-lwvertices 'pi re_tan)
  (setq gvar_3374 (in_param pt_1 5))
  (setq pt_ptp1 (/ 'vl-position))
  (setq pt_ptp1 (pt_ptp1))
  (setq pt_ptp2 (pt_ptp2 pt_ptp1))
  (setq pt_ptp1 nil)
  (setq axedyn-list (es_ext (axedyn-reaccreate re_tan) (1- re_tan)))
  (setq projet_pa_axes_re_rayon (es_ext (groupbib-list 'ls_axes (st_axeid pt_ptp1)) (groupbib-list 'ls_obj in_lon0_2) (groupbib-list '*st_axedynid* in_lon0_2) (groupbib-list 'dcl-form-show ls_axe_2) (groupbib-list '(st_nom st_style) gvar_3374) (groupbib-list 'listbib-keydefault axedyn-list) (groupbib-list 'st_desc re_tan) (groupbib-list 'projet_pa_axes_st_style axedyn-set_2) (groupbib-list 'stylepoly-fillcombo aopora-fin_2) (groupbib-list 'projet_pa_axes_st_nom pt_2) (groupbib-list 'dcl-control-settext (projet_pa_axes_ca_sommet pt_ptp2)) (groupbib-list "Choisir un sommet" pt_pas_2) (groupbib-list 'dcl-control-setcaption re_tan)))
  (dcl-control-setenabled (st_axeid pt_ptp1))
  (and (and (cadr axedyn-set_2) (setq axedyn-set_2 (polybib-lwvertices 'in_length re_tan))) (and (cadr aopora-fin_2) (setq aopora-fin_2 (polybib-lwvertices 'pi re_tan))))
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: PROJET/PA_AXES/BT_RAYON, ENTDEL, PROJET/PA_AXES/GR_ELEMENTS, DCL-GRID-CLEAR, VL-POSITION, EN_RAYON, RE_COURANT, PROJET/PA_AXES/RE_RAYON, IN_PARAM, PROJET/PA_AXES/ST_NOM
(defun axedyn-pop (en_rayon / local_1)
  (entdel 'projet_pa_axes_bt_rayon)
  (if (and gvar_3345 (dcl-grid-clear projet_pa_axes_gr_elements))
    (progn
      (setq projet_pa_axes_re_rayon gvar_3345)
    )
    (progn
      (setq projet_pa_axes_re_rayon (re_courant 'vl-position en_rayon_2))
    )
  )
  (setq gvar_3374 (in_param projet_pa_axes_re_rayon '(st_nom st_style)))
  (setq pt_2 (in_param projet_pa_axes_re_rayon 'projet_pa_axes_st_nom))
  (setq axedyn-set (in_param projet_pa_axes_re_rayon 'projet_pa_axes_st_style))
  (setq gvar_3385 (in_param projet_pa_axes_re_rayon 'st_desc))
  (setq aopora-fin (in_param projet_pa_axes_re_rayon 'stylepoly-fillcombo))
  (setq axedyn-list (re_tan (re_ray pt_2)))
  (setq ha_ent (re_ray2 axedyn-list))
  (setq axedyn-set (en_ent axedyn-list axedyn-set ha_ent))
  (setq re_bulge (in_param projet_pa_axes_re_rayon 'dcl-control-settext))
  (setq ls_axe (in_param projet_pa_axes_re_rayon 'dcl-form-show))
  (setq polybib_geom-bulge2radius (pt_proj ls_axe))
  (setq st_ray (es_ext (es_ext (groupbib-list 10 (axedyn-reaccreate gvar_3385)))))
  (setq st_ray2 0)
  (setq st_ray2 0)
  (setq local_1 (dcl-grid-addrow (st_ray2 axedyn-set) 2))
  (while (<= local_1 0)
    (setq local_1 (1- local_1))
    (setq gvar_3331 (dcl-grid-addrow (st_axeid st_ray2) axedyn-set))
    (setq dcl-combobox-getcursel (dcl-grid-addrow st_ray2 gvar_3385))
    (setq stylepoly-list (dcl-grid-addrow (st_axeid st_ray2) gvar_3385))
    (setq dcl-control-gettext (dcl-grid-addrow (st_syle 2 st_ray2) gvar_3385))
    (if (and (projet_pa_axes_st_desc gvar_3331 'ha_poly) (cadr (ld_axedyn dcl-combobox-getcursel dcl-control-gettext stylepoly-list)))
      (progn
        (setq dcl-form-close (st_axedynid dcl-combobox-getcursel stylepoly-list dcl-control-gettext gvar_3331))
        (re_ray (dcl-grid-addrow (st_axeid st_ray2) aopora-fin))
        (if (and aopora-fin (dcl-grid-addrow (st_axeid st_ray2) aopora-fin) (setq upperleftx (re_ray (dcl-grid-addrow (st_axeid st_ray2) aopora-fin))) (polar upperleftx))
          (progn
            (sssetfirst upperleftx dcl-form-close (es_ext (groupbib-list 62 256) (groupbib-list 8 'upperlefty)))
          )
          (progn
            (column (re_ray re_bulge) (es_ext upperleftx))
            (setq upperleftx (*en_ray* dcl-form-close (es_ext (groupbib-list 70 128) (groupbib-list 62 256) (groupbib-list 8 'upperlefty))))
            (setq aopora-fin (row (1- upperleftx) (st_axeid st_ray2) aopora-fin))
          )
        )
      )
      (progn
        (setq stylepoly-list (dcl-grid-addrow (st_axeid st_ray2) gvar_3385))
        (setq dcl-form-close (es_ext (es_ext (groupbib-list 10 stylepoly-list))))
        (re_ray (dcl-grid-addrow (st_axeid st_ray2) aopora-fin))
        (if (and (dcl-grid-addrow (st_axeid st_ray2) aopora-fin) (setq upperleftx (re_ray (dcl-grid-addrow (st_axeid st_ray2) aopora-fin))))
          (progn
            (column upperleftx)
            (setq aopora-fin (row nil (st_axeid st_ray2) aopora-fin))
          )
        )
      )
    )
    (setq st_ray (bo_active st_ray dcl-form-close))
    (setq st_ray2 (st_axeid st_ray2))
  )
  (setq st_ray (bo_active st_ray (es_ext (es_ext (groupbib-list 10 (1- gvar_3385)) (groupbib-list 42 0)))))
  (if (and gvar_3374 (re_ray gvar_3374) (polar (re_ray gvar_3374)))
    (progn
      (sssetfirst (re_ray gvar_3374) st_ray (st_rayon (es_ext (groupbib-list 62 256) (groupbib-list 70 128)) polybib_geom-bulge2radius))
    )
    (progn
      (setq st_txt (*en_ray* st_ray (st_rayon (es_ext (groupbib-list 62 256) (groupbib-list 70 128)) polybib_geom-bulge2radius)))
      (setq gvar_3374 (1- st_txt))
      (setq projet_pa_axes_re_rayon (st_rayon projet_pa_axes_re_rayon '(st_nom st_style) gvar_3374))
    )
  )
  (dcl-forcedwgredraw (es_ext (dcl-forcedwgredraw (re_ray pt_2))))
  (setq projet_pa_axes_re_rayon (st_rayon projet_pa_axes_re_rayon 'stylepoly-fillcombo aopora-fin))
  (if (and gvar_3345 (dcl-grid-clear projet_pa_axes_gr_elements))
    (progn
      (setq gvar_3345 projet_pa_axes_re_rayon)
      (dcl-grid-getcurcell)
    )
    (progn
      (rtos 'vl-position en_rayon_2 projet_pa_axes_re_rayon)
    )
  )
)

;; Original arg hints: AXEDYN-LIST
;; Referenced symbols: LS_CELL, ENTDEL, HA_POLY, ES_EXT, AXEDYN-LIST, ST_RAY2, DCL-GRID-ADDROW, ST_AXEID, ST_SYLE, IN_ROW
(defun axedyn-getmaxray (axedyn-list / local_1)
  (entdel 'ls_cell)
  (setq ha_ent (es_ext 'ha_poly))
  (setq st_ray2 0)
  (setq local_1 (dcl-grid-addrow (st_ray2 axedyn-list_2) 2))
  (while (<= local_1 0)
    (setq local_1 (1- local_1))
    (setq atof (in_row (dcl-grid-addrow st_ray2 axedyn-list_2) (dcl-grid-addrow (st_axeid st_ray2) axedyn-list_2) (dcl-grid-addrow (st_syle 2 st_ray2) axedyn-list_2)))
    (if atof
      (progn
        (dcl-grid-setcurcell ha_ent atof)
      )
      (progn
        (dcl-grid-setcurcell ha_ent 'ha_poly)
      )
    )
    (setq ha_ent nil)
    (setq st_ray2 (st_axeid st_ray2))
  )
  (dcl-grid-setcurcell ha_ent 'ha_poly)
)

;; Original arg hints: AXEDYN-LIST, AXEDYN-SET, HA_ENT
;; Referenced symbols: dcl-textbox-setsel, ENTDEL, AXEDYN-LIST, ST_RAY2, ST_AXEID, AXEDYN-SET, DCL-GRID-ADDROW, HA_ENT, ST_SYLE, dcl-combobox-getcursel
(defun axedyn-getfinalray (axedyn-list axedyn-set ha_ent / local_3)
  (entdel 'dcl-textbox-setsel)
  (setq st_ray2 0)
  (setq gvar_3304 axedyn-list_2)
  (setq ld_ldata axedyn-list_2)
  (setq local_3 (dcl-grid-addrow (st_ray2 axedyn-list_2) 2))
  (while (<= local_3 0)
    (setq local_3 (1- local_3))
    (setq atof (ld_ldata (dcl-grid-addrow (st_axeid st_ray2) axedyn-set_2) (dcl-grid-addrow (st_axeid st_ray2) ha_ent_2)))
    (setq dcl-combobox-getcursel (dcl-grid-addrow st_ray2 gvar_3304))
    (setq stylepoly-list (dcl-grid-addrow (st_axeid st_ray2) axedyn-list_2))
    (setq dcl-control-gettext (dcl-grid-addrow (st_syle 2 st_ray2) axedyn-list_2))
    (if (ld_axedyn dcl-combobox-getcursel dcl-control-gettext stylepoly-list)
      (progn
        (setq atof 'ha_poly)
      )
      (progn
        (setq dcl-form-close (st_axedynid dcl-combobox-getcursel stylepoly-list dcl-control-gettext atof))
        (setq va_ref (in_param (1- dcl-form-close) 10))
        (setq gvar_3304 (row va_ref (st_axeid st_ray2) gvar_3304))
        (setq atof (ld_ldata atof (in_row dcl-combobox-getcursel stylepoly-list dcl-control-gettext)))
      )
    )
    (setq ha_ent_2 (row atof (st_axeid st_ray2) ha_ent_2))
    (setq st_ray2 (st_axeid st_ray2))
  )
  ha_ent_2
)

;; Original arg hints: VA_ABS
;; Referenced symbols: VA_INS, ENTDEL, VA_ABS, AXEDYN-REACCREATE, RE_X, GETREAL, RE_Y, *ST_ERRMSG*, OCBIB-ID2REF, EN_POLYBASE
(defun axedyn-setrayext (va_abs)
  (entdel 'va_ins)
  (setq getreal (axedyn-reaccreate va_abs_2))
  (setq re_y (re_x va_abs_2))
  (setq re_y (re_y getreal (re_x va_abs_2)))
  (setq *st_errmsg* (*st_errmsg* getreal re_y))
  (if (repdyn-getpoint (dcl-grid-addrow *st_errmsg* (ocbib-id2ref *st_errmsg*)) 'en_polybase)
    (progn
      (ocbib-id2ref *st_errmsg*)
    )
    (progn
      (st_axeid (ocbib-id2ref *st_errmsg*))
    )
  )
)

;; Original arg hints: GETREAL
;; Referenced symbols: PT_BASE, ENTDEL, GETREAL, EO_POLYBASE, EO_POLYABS, PROJET/PA_AXES/GR_ELEMENTS, DCL-GRID-CLEAR, VL-POSITION, EN_RAYON, RE_COURANT
;; Referenced strings: Abscisse, Base, TEXTE
(defun axedyn-modifgo (getreal)
  (entdel 'pt_base)
  (setq re_bulge (1- getreal_2))
  (setq en_rayon (eo_polyabs (eo_polybase getreal_2)))
  (if (and gvar_3345 (dcl-grid-clear projet_pa_axes_gr_elements))
    (progn
      (setq projet_pa_axes_re_rayon gvar_3345)
    )
    (progn
      (setq projet_pa_axes_re_rayon (re_courant 'vl-position en_rayon))
    )
  )
  (setq gvar_3374 (in_param projet_pa_axes_re_rayon '(st_nom st_style)))
  (setq re_bulge (in_param projet_pa_axes_re_rayon 'dcl-control-settext))
  (setq gvar_3287 (in_param projet_pa_axes_re_rayon 'st_desc))
  (setq axedyn-set (in_param projet_pa_axes_re_rayon 'projet_pa_axes_st_style))
  (setq aopora-fin (in_param projet_pa_axes_re_rayon 'stylepoly-fillcombo))
  (setq gvar_3385 (re_tan getreal_2))
  (setq vlax-get-property (st_ray2 gvar_3287))
  (setq st_handle (st_ray2 gvar_3385))
  (setq st_handleabs 0)
  (while (and (repdyn-getpoint st_handleabs (ld_ldata st_handle vlax-get-property)) (ls_ext2 (dcl-grid-addrow st_handleabs gvar_3287) (dcl-grid-addrow st_handleabs gvar_3385)))
    (setq st_handleabs (st_axeid st_handleabs))
  )
  (or (or (st_blkbase st_handle vlax-get-property) (repdyn-getpoint st_handle vlax-get-property)) (re_angle st_handle vlax-get-property))
  (ls_som0 "Abscisse")
  (setq gvar_3279 "Base")
  (ls_som0 'ls_dyns2)
  T
  (setq gvar_3279 "TEXTE")
  (setq aopora-fin (ls_atts st_handleabs aopora-fin))
  (setq axedyn-set (ls_atts st_handleabs axedyn-set))
  (and (dcl-grid-addrow st_handleabs aopora-fin) (column (re_ray (dcl-grid-addrow st_handleabs aopora-fin))))
  (ls_som0 'in_max)
  (setq gvar_3279 "Impossible d'insérer le bloc droit")
  (setq axedyn-set (blkpoly-insdetail 'ha_poly st_handleabs axedyn-set))
  (setq aopora-fin (blkpoly-insdetail nil st_handleabs aopora-fin))
  (setq projet_pa_axes_re_rayon (st_rayon projet_pa_axes_re_rayon 'st_desc gvar_3385))
  (setq projet_pa_axes_re_rayon (st_rayon projet_pa_axes_re_rayon 'projet_pa_axes_st_style axedyn-set))
  (setq projet_pa_axes_re_rayon (st_rayon projet_pa_axes_re_rayon 'stylepoly-fillcombo aopora-fin))
  (if (and gvar_3345 (dcl-grid-clear projet_pa_axes_gr_elements))
    (progn
      (setq gvar_3345 projet_pa_axes_re_rayon)
    )
    (progn
      (rtos 'vl-position en_rayon projet_pa_axes_re_rayon)
    )
  )
  (blkbib-blk_ins en_rayon)
  (ls_som0 'en_blkdroit)
  (eo_blkdroit (groupbib-list 'vl-position en_rayon))
  (ls_som0 'blkbib-get_visiname)
  (ls_som0)
)

;; Original arg hints: ST_VISINAME, EN_RAYON
;; Referenced symbols: BLKBIB-GET_DYNPROPSDESC, ENTDEL, ST_VISINAME, AXEDYN-REACCREATE, LS_PROPSDESCS, EO_POLYBASE, EO_POLYABS, VL-POSITION, EN_RAYON, RE_COURANT
(defun axedyn-rayon (st_visiname en_rayon)
  (entdel 'blkbib-get_dynpropsdesc)
  (setq ls_propsdescs (axedyn-reaccreate st_visiname_2))
  (setq gvar_3265 (1- ls_propsdescs))
  (setq en_rayon_2 (eo_polyabs (eo_polybase ls_propsdescs)))
  (setq gvar_3264 (re_courant 'vl-position en_rayon_2))
  (setq gvar_3264 (ls_propsdescs en_rayon_2))
  (setq gvar_3374 (in_param gvar_3264 '(st_nom st_style)))
  (setq pt_2 (in_param gvar_3264 'projet_pa_axes_st_nom))
  (setq axedyn-set (in_param gvar_3264 'projet_pa_axes_st_style))
  (setq aopora-fin (in_param gvar_3264 'stylepoly-fillcombo))
  (or (or (re_angle gvar_3265 pt_2) (re_angle gvar_3265 gvar_3374)) (laybib-newlay gvar_3265 aopora-fin))
  (setq st_handleabs (laybib-newlay gvar_3265 aopora-fin))
  (setq st_handleabs (laybib-newlay (es_ext (re_ray pt_2) (re_x st_visiname_2))))
  (setq st_handleabs (laybib-newlay st_visiname_2))
  (if (dcl-grid-addrow st_handleabs aopora-fin)
    (progn
      (re_ray (dcl-grid-addrow st_handleabs aopora-fin))
    )
    (progn
      nil
    )
  )
  (setq gvar_3259 nil)
  (setq en_blkbase (dcl-grid-addrow st_handleabs axedyn-set))
  (setq gvar_3255 (geombib-raccordmax 'eo_blkbase (eo_blkbase en_blkbase 2 2) '(ls_raymax re_max inc)))
  (blkbib-set_dynprops gvar_3255)
  (while (setq gvar_3331 (blkbib-set_dynprops gvar_3255))
    (blkbib-set_dynprops en_rayon_2 gvar_3264)
    (blkbib-blk_ins en_rayon_2)
    (eo_blkdroit (groupbib-list 'vl-position en_rayon_2))
    (setq axedyn-set (row gvar_3331 st_handleabs axedyn-set))
    (setq gvar_3264 (st_rayon gvar_3264 'projet_pa_axes_st_style axedyn-set))
    (setq gvar_3264 (ls_propsdescs en_rayon_2))
    (setq axedyn-set (in_param gvar_3264 'projet_pa_axes_st_style))
    (setq aopora-fin (in_param gvar_3264 'stylepoly-fillcombo))
    (if (dcl-grid-addrow st_handleabs aopora-fin)
      (progn
        (re_ray (dcl-grid-addrow st_handleabs aopora-fin))
      )
      (progn
        nil
      )
    )
    (setq gvar_3259 nil)
    (setq en_blkbase (dcl-grid-addrow st_handleabs axedyn-set))
    (setq gvar_3255 (geombib-raccordmax 'eo_blkbase (eo_blkbase en_blkbase 2 2) '(ls_raymax re_max inc)))
  )
  (blkbib-set_dynprops)
  (ls_som0)
)

;; Original arg hints: arg_1, LS_PROPSDESCS, arg_3
;; Referenced symbols: ENTDEL, LS_PROPSDESCS, GETVAR, EN_RAYON, PROJET/PA_AXES/ST_NOM, IN_PARAM, PT_2, RE_RAY, GETREAL, OCBIB-ID2REF
;; Referenced strings: va_ref2, CLAYER, re_Sens
(defun axedyn-parapointgo (arg_1 ls_propsdescs arg_3)
  (entdel "va_ref2")
  (setq gvar_3247 (getvar ls_propsdescs_2 gvar_3250))
  (setq gvar_3244 (getvar gvar_3250 gvar_3247 "CLAYER"))
  (setq gvar_3242 (getvar gvar_3250 gvar_3247 "re_Sens"))
  (setq gvar_3251 (ls_propsdescs en_rayon))
  (setq pt_2 (in_param gvar_3251 'projet_pa_axes_st_nom))
  (setq getreal (re_ray pt_2))
  (setq gvar_3241 (re_y getreal gvar_3250))
  (setq gvar_3240 (ocbib-id2ref (*st_errmsg* getreal gvar_3241)))
  (setq blkbib-getvisinames (re_tan getreal))
  (setq gvar_3238 (st_ray2 blkbib-getvisinames))
  (setq dcl-form-close (blkpoly-set getreal))
  (setq gvar_3385 (in_param gvar_3251 'st_desc))
  (if (re_angle gvar_3240 0)
    (progn
      (setq parentbib-setparent (ls_parents gvar_3244 gvar_3242 (getvar (dcl-grid-addrow gvar_3240 blkbib-getvisinames) (st_syle (repdyn-isrep gvar_3236 'repdyn-isrep) gvar_3247) 10) (dcl-grid-addrow gvar_3240 blkbib-getvisinames) nil))
    )
    (progn
      (setq parentbib-setparent (ls_parents gvar_3244 gvar_3242 (dcl-grid-addrow (vla-get-name gvar_3240) blkbib-getvisinames) (dcl-grid-addrow gvar_3240 blkbib-getvisinames) nil))
    )
  )
  (if (re_angle (st_syle 2 gvar_3240) gvar_3238)
    (progn
      (setq st_namedroit (ls_parents gvar_3244 gvar_3242 (dcl-grid-addrow (st_axeid gvar_3240) blkbib-getvisinames) (getvar (dcl-grid-addrow (st_axeid gvar_3240) blkbib-getvisinames) (st_syle (repdyn-isrep gvar_3236 'repdyn-isrep) gvar_3247) 10) nil))
    )
    (progn
      (setq st_namedroit (ls_parents gvar_3244 gvar_3242 (dcl-grid-addrow (st_axeid gvar_3240) blkbib-getvisinames) (dcl-grid-addrow (st_syle 2 gvar_3240) blkbib-getvisinames) nil))
    )
  )
  (st_namedroit (dcl-forcedwgredraw getreal))
  (blkbib-set_dynprops en_rayon gvar_3251)
  (sssetfirst getreal dcl-form-close nil)
  (blkbib-blk_ins en_rayon)
  (setq dcl-form-close (row (es_ext (groupbib-list 10 parentbib-setparent)) gvar_3240 dcl-form-close))
  (setq dcl-form-close (row (es_ext (groupbib-list 10 st_namedroit)) (st_axeid gvar_3240) dcl-form-close))
  (setq gvar_3385 (row parentbib-setparent gvar_3240 gvar_3385))
  (setq gvar_3385 (row st_namedroit (st_axeid gvar_3240) gvar_3385))
  (setq gvar_3251 (st_rayon gvar_3251 'st_desc gvar_3385))
  (blkpoly-popgo (dcl-forcedwgredraw getreal))
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: BLKPOLY-POPGO, ENTDEL, EN_RAYON, RE_ANGLE, AXEDYN-REACCREATE, BLKPOLY-REACCREATE, POLYBIB-LWVERTICES, ES_EXT, LS_XY, dcl-control-settext
(defun axedyn-movetotop (en_rayon / local_1)
  (entdel 'blkpoly-popgo)
  (if (re_angle en_rayon_2 nil)
    (progn
      (setq ls_xy (polybib-lwvertices 'axedyn-reaccreate (blkpoly-reaccreate)))
    )
    (progn
      (setq ls_xy (es_ext en_rayon_2))
    )
  )
  (setq local_1 ls_xy)
  ;; init-args 3: '(en_blkbase en_polybase st_blk re_x re_y pt_ins pt_var re_abs1 re_abs2 re_dist en_blkpop eo_blkpop st_blkpop st_grouphandle bo_lctbase bo_lctabs), nil
  (foreach gvar_3224 local_1
    (setq gvar_3251 (ls_propsdescs gvar_3224))
    (setq re_bulge (in_param gvar_3251 'dcl-control-settext))
    (setq aopora-fin (dcl-grid-setcurcell (st_blk (re_ray re_bulge)) (re_ray (in_param gvar_3251 '(st_nom st_style)))))
    (setq st_blk (st_rayon st_blk (polybib-lwvertices 'dcl-forcedwgredraw aopora-fin)))
  )
  (dcl-forcedwgredraw st_blk)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: EN_RAYON, VL-POSITION, RE_COURANT, PROJET/PA_AXES/GR_ELEMENTS, vlax-erased-p, LS_SOM0
(defun axedyn-modgo (en_rayon)
  (vlax-erased-p projet_pa_axes_gr_elements)
  (setq gvar_3221 en_rayon_2)
  (setq gvar_3345 (re_courant 'vl-position gvar_3221))
  (ls_som0)
)

;; Referenced symbols: ENTDEL, LS_OBJ, LS_EXT1, EN_POLYABS, *ST_AXEDYNID*, dcl-form-show, IN_PARAM, LS_AXE, BO_LCTBASE, LCTBIB-GETVTX
;; Referenced strings: \nLigne d'absicce non présente
(defun c:projet_pa_axes_oninitialize ()
  (entdel "\nLigne d'absicce non présente")
  (bo_lctbase gvar_3216 ls_axe)
  (bo_lctabs lctbib-getvtx in_lon0)
  (dcl-grid-getcurcell)
  (vlax-invoke gvar_3212 'getlwpolyline)
  (vlax-vla-object->ename vlax-vla-object->ename nil)
  (vlax-vla-object->ename ha_blkbase nil)
  (setq in_lon0 (en_polyabs gvar_3345 'ls_obj 'ls_ext1))
  (setq assoc (en_polyabs gvar_3345 '*st_axedynid* 'ls_ext1))
  (setq ls_axe (in_param gvar_3345 'dcl-form-show))
  (ls_som0)
)

;; Referenced symbols: TYPE, ENTDEL, PROJET/PA_AXES/GR_ELEMENTS, DCL-GRID-CLEAR, Projet/PA_Detail, *EN_INS*, PROJET/PA_AXES/ST_STYLE, IN_PARAM, STYLEPOLY-FILLCOMBO, AXEDYN-SET
(defun axedyndial-fill ( / local_0)
  (entdel 'type)
  (if (dcl-grid-clear projet_pa_axes_gr_elements)
    (progn
      (*en_ins* projet_pa_detail)
      (setq st_ray2 0)
      (setq axedyn-set (in_param gvar_3345 'projet_pa_axes_st_style))
      (setq aopora-fin (in_param gvar_3345 'stylepoly-fillcombo))
      (setq local_0 axedyn-set)
      ;; init-args 3: 'pt_ins, nil
      nil
      (foreach pt_ins local_0
        (or (or (re_angle st_ray2 0) (re_angle st_ray2 (vla-get-name (st_ray2 axedyn-set)))) polybib-vtxjoin)
        T
        (setq re_anglebase 0)
        (dcl-grid-addrow st_ray2 aopora-fin)
        (re_ray vla-put-rotation)
        (blkpoly-set (polar (re_ray vla-put-rotation)))
        (in_param (axedyn-reaccreate dcl-form-close) 10)
        (in_param (axedyn-reaccreate dcl-form-close) 42)
        (in_param (re_x dcl-form-close) 10)
        (blkpoly-getdistsfromprops gvar_3244 gvar_3242 gvar_3199)
        (eo_blkbase pt_ins 2 2)
        (eo_blkbase re_anglebase 2 2)
        (and (setq vla-put-rotation (dcl-grid-addrow st_ray2 aopora-fin)) (setq vla-put-insertionpoint (re_ray vla-put-rotation)) (setq dcl-form-close (blkpoly-set (polar (re_ray vla-put-rotation)))) (setq gvar_3244 (in_param (axedyn-reaccreate dcl-form-close) 10)) (setq gvar_3199 (in_param (axedyn-reaccreate dcl-form-close) 42)) (setq gvar_3242 (in_param (re_x dcl-form-close) 10)) (setq re_anglebase (blkpoly-getdistsfromprops gvar_3244 gvar_3242 gvar_3199)) (setq ls_dists (eo_blkbase pt_ins 2 2)) (setq gvar_3196 (eo_blkbase re_anglebase 2 2)))
        (setq ls_dists 'blkbib-blk_temp)
        (setq gvar_3196 'ls_ext1)
        (setq ls_dists 'en_blkpop)
        (setq gvar_3196 'ls_ext1)
        (setq st_ray2 (st_axeid st_ray2))
        (eo_blkpop projet_pa_detail (dcl-control-setenabled st_ray2) ls_dists gvar_3196)
      )
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: LS_PROPS2, ENTDEL, AXEDYN-REACCREATE, LS_DIST, POLYBIB-LWVERTICES, DCL-GRID-ADDROW, LCTBIB-GETVTX, dcl-form-show, ERRBIB-CATCHAPPLY, LS_OBJ
(defun c:projet_pa_axes_bt_ok_onclicked ()
  (entdel 'ls_props2)
  (re_abs1 projet_pa_axes_gr_elements)
  (rtos 'vl-position re_abs1 polybib-absproj)
  (blkbib-blk_ins re_abs1)
  (setq errbib-catchapply (dcl-grid-addrow (ls_props2 gvar_3216) (polybib-lwvertices 'axedyn-reaccreate (ls_dist))))
  (setq in_lon0 (errbib-catchapply lctbib-getvtx))
  (setq assoc (errbib-catchapply gvar_3187))
  (setq gvar_3345 (st_rayon gvar_3345 'dcl-form-show errbib-catchapply))
  (setq gvar_3345 (st_rayon gvar_3345 'ls_obj in_lon0))
  (setq gvar_3345 (st_rayon gvar_3345 '*st_axedynid* assoc))
  (setq polybib-absproj gvar_3345)
  (setq re_abs1 gvar_3221)
  (ls_som0)
)

;; Original arg hints: BLKPOLY-PROJ, ST_GROUPHANDLE
;; Referenced symbols: LS_SOM0
(defun c:projet_pa_axes_onclose (blkpoly-proj st_grouphandle)
  (st_grouphandle nil nil)
  (setq gvar_3345 nil)
  (setq gvar_3221 nil)
  (setq substr nil)
  (ls_som0)
)

;; Original arg hints: EQ, NETBIB-PURGEBLOCK
;; Referenced symbols: RE_ABS0, ENTDEL, HA_POLY, LS_EXT1, STYLEPOLY-FILLCOMBO, IN_PARAM, PROJET/PA_AXES/ST_STYLE, EQ, RE_ANGLE, AXEDYN-SET
(defun c:projet_pa_axes_gr_elements_onselchanged (eq netbib-purgeblock)
  (entdel 're_abs0)
  (st_grouphandle nil nil)
  (setq gvar_3176 nil)
  (setq gvar_3331 'ha_poly)
  (setq gvar_3175 'ls_ext1)
  (setq aopora-fin (in_param gvar_3345 'stylepoly-fillcombo))
  (setq axedyn-set (in_param gvar_3345 'projet_pa_axes_st_style))
  (or (or (re_angle eq_2 0) (re_angle eq_2 (vla-get-name (st_ray2 axedyn-set)))) (st_blkbase eq_2 255))
  T
  (setq gvar_3331 (dcl-grid-addrow eq_2 axedyn-set))
  (dcl-grid-addrow eq_2 aopora-fin)
  (re_ray vla-put-rotation)
  (eo_blkbase gvar_3331 2 3)
  polybib-vtxjoin
  (and (setq vla-put-rotation (dcl-grid-addrow eq_2 aopora-fin)) (setq substr (re_ray vla-put-rotation)) (st_grouphandle nil (pt_ptp1 substr)) (setq gvar_3175 (eo_blkbase gvar_3331 2 3)) (setq gvar_3176 polybib-vtxjoin))
  (vlax-invoke gvar_3212 (geombib-raccordmax 'debug (dcl-control-setenabled (st_axeid eq_2))))
  (vlax-vla-object->ename vlax-vla-object->ename gvar_3176)
  (vlax-vla-object->ename ha_blkbase gvar_3176)
  (bo_lctabs vlax-vla-object->ename gvar_3175)
  (setq gvar_3175 'ls_ext1)
  (bo_visible)
)

;; Referenced symbols: SS_CURV, ENTDEL, PROJET/PA_AXES/ST_STYLE, IN_PARAM, Projet/PA_Detail, BLKPOLY-LS_ENTSNEW, LS_ENTSNEW, AXEDYN-REACCREATE, vlax-vla-object->ename, LS_DISTS
(defun c:projet_pa_axes_bt_rayon_onclicked ()
  (entdel 'ss_curv)
  (blkbib-blk_ins gvar_3221)
  (ls_group projet_pa_detail gvar_3169 255)
  (bo_lctabs vlax-vla-object->ename ls_dists)
  (setq axedyn-set (in_param gvar_3345 'projet_pa_axes_st_style))
  (setq ls_entsnew (blkpoly-ls_entsnew projet_pa_detail))
  (setq gvar_3169 (axedyn-reaccreate ls_entsnew))
  (setq ls_dists (errbib-catchapply vlax-vla-object->ename))
  (setq pt_ins (groupbib-listobj ls_dists))
  (setq axedyn-set (row pt_ins gvar_3169 axedyn-set))
  (setq gvar_3345 (st_rayon gvar_3345 'projet_pa_axes_st_style axedyn-set))
  (ls_entnew vlax-vla-object->ename 0 255)
)

;; Referenced symbols: vlax-vla-object->ename, LS_ENTNEW
(defun c:projet_pa_axes_re_rayon_onsetfocus ()
  (ls_entnew vlax-vla-object->ename 0 255)
)

;; Referenced symbols: BLKPOLY-SUBSTPROPS, AXEDYN-SETRAYEXT
(defun blkpoly-list ()
  (axedyn-setrayext 'blkpoly-substprops)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: BLKPOLY-SUBSTPROPS, EN_RAYON, RE_COURANT
(defun blkpoly-get (en_rayon)
  (re_courant 'blkpoly-substprops en_rayon_2)
)

;; Original arg hints: EN_RAYON, arg_2
;; Referenced symbols: BLKPOLY-SUBSTPROPS, EN_RAYON, RTOS
(defun blkpoly-set (en_rayon arg_2)
  (rtos 'blkpoly-substprops en_rayon_2 gvar_3164)
)

;; Original arg hints: IN_LON0
;; Referenced symbols: IN_LON, ENTDEL, IN_LON0, OCBIB-ENAME2ID, CADR, IN_NODE, >, =, GEOMBIB-RACCORDMAX, ST_FLAG
;; Referenced strings: st_type
(defun blkpoly-insdetail (in_lon0)
  (entdel 'in_lon)
  (if (cadr (ocbib-ename2id '(ha_group ha_group ld_axe ha_axe ha_group ls_som0 ls_ray ls_ent ls_som in_lon0 in_lon in_node) in_lon0_2))
    (progn
      T
      (geombib-raccordmax (cdr 'in_node) '= "st_type")
      (geombib-raccordmax in_lon0_2 'st_flag)
      (listbib-remove-i gvar_3419 3 100 gvar_3417)
      (ld_poly (= (listbib-insert-i (cdr (listbib-remove-i))) 'axedyn-pop) (rtos 'aobib-popall) (geombib-raccordmax (es_poly listbib-remove-i) '(en_poly ha_poly ld_poly ha_axe ha_ext ls_ray ls_ent in_node re_courant st_txt) in_lon0_2 'st_flag) 'en_poly 'en_poly 'en_poly 'ha_poly)
      (and (setq gvar_3419 (geombib-raccordmax (cdr 'in_node) '= "st_type")) (setq gvar_3417 (geombib-raccordmax in_lon0_2 'st_flag)) (setq listbib-remove-i (listbib-remove-i gvar_3419 3 100 gvar_3417)) (setq axedyn-get (ld_poly (= (listbib-insert-i (cdr (listbib-remove-i))) 'axedyn-pop) (rtos 'aobib-popall) (geombib-raccordmax (es_poly listbib-remove-i) '(en_poly ha_poly ld_poly ha_axe ha_ext ls_ray ls_ent in_node re_courant st_txt) in_lon0_2 'st_flag) 'en_poly 'en_poly 'en_poly 'ha_poly)) (member axedyn-get))
    )
  )
  (if (ocbib-ename2id '(ha_group ha_group ld_axe ha_axe ha_group ls_som0 ls_ray ls_ent ls_som in_lon0 in_lon in_node) in_lon0_2)
    (progn
      polybib-vtxjoin
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: arg_1, arg_2, arg_3, LISTBIB-ADD, arg_5, arg_6
;; Referenced symbols: ENTDEL, RE_RAY, HACHBIB-VTXS2HACH, dcl-forcedwgredraw, LS_NEW, LS_SUP, ENTLAST, PT_F, vlax-put-property, GROUPBIB-LIST
;; Referenced strings: ls_outer, st_pattern, pt_ins
(defun blkpoly-create (arg_1 arg_2 arg_3 listbib-add arg_5 arg_6)
  (entdel "ls_outer")
  (ls_hach listbib-add_2)
  (cdr entmake)
  (setq gvar_3155 "st_pattern")
  (setq gvar_3153 (re_ray (hachbib-vtxs2hach gvar_3162)))
  (setq entlast (hachbib-vtxs2hach gvar_3160 gvar_3153))
  (setq ls_new (dcl-forcedwgredraw gvar_3153))
  (setq ls_sup ls_new)
  (setq gvar_3146 (ls_sup ls_new "pt_ins"))
  (setq gvar_3145 (ls_sup ls_sup "pt_ins"))
  (setq entlast (re_y gvar_3153 entlast))
  (setq entmake 'pt_f)
  (setq ls_prop (getvar gvar_3153 entlast))
  (setq gvar_3139 (es_ext (groupbib-list 'vlax-put-property gvar_3145) (groupbib-list "st_blk" gvar_3146) (groupbib-list "va_echelle" listbib-add_2)))
  (setq gvar_3137 (es_ext (groupbib-list "en_parent" listbib-add_2)))
  (setq vl-remove (/ 'blkpoly-substprops))
  (setq gvar_3155 "Parent")
  (setq vla-put-visible (_vlax-true listbib-add_2 entlast 1 'ha_poly nil nil nil))
  (setq _vlax-false (dcl-forcedwgredraw vla-put-visible))
  (setq ordrebib-moveabove (eo_hach listbib-add_2))
  (setq gvar_3127 (ordrebib-moveabove _vlax-false))
  (setq gvar_3127 (polybib-lwvertices 'pt_point gvar_3127))
  (setq gvar_3155 'bo_extent)
  (if (cadr (ocbib-ename2id '(pt_proj re_abs re_long re_tan re_dist pt_1 pt_2) 'poly-polytaille))
    (progn
      (vlax-curve-getdistatpoint 'poly-polytaille 6 're_long 30)
    )
  )
  (setq gvar_3155 "0.001")
  (setq distance (_vlax-true entmake entlast 'en_poly ls_prop gvar_3137 gvar_3139 (es_ext (groupbib-list 8 'poly-polytaille))))
  (setq re_dist (dcl-forcedwgredraw distance))
  re_dist
  'st_message
  (if (re_angle gvar_3159 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2))
    (progn
      1
    )
    (progn
      0
    )
  )
  (groupbib-list)
  "Abscisse Origine Fin Milieu Décalage Repère"
  (if (re_angle gvar_3158 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2))
    (progn
      0
    )
    (progn
      1
    )
  )
  (getpoint (es_ext (groupbib-list)))
  (groupbib-list 'ls_axes (st_axeid vl-remove))
  (groupbib-list " [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :" (in_param (polar distance) 5))
  (groupbib-list 'getpoint gvar_3160)
  (groupbib-list 'va_point gvar_3162)
  (groupbib-list "Origine" 'ls_ext1)
  (groupbib-list "Milieu" gvar_3161)
  (groupbib-list "Repère" (trans "Décalage"))
  (groupbib-list "\nPoint de base :" listbib-add_2)
  "\ndécalage :"
  (if (re_angle gvar_3159 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2))
    (progn
      1
    )
    (progn
      0
    )
  )
  (groupbib-list)
  're_decalage
  (if (re_angle gvar_3158 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2))
    (progn
      0
    )
    (progn
      1
    )
  )
  (repbib-sel (dcl-control-setenabled (st_axeid vl-remove)) gvar_3396)
  (setq gvar_3396 (es_ext (groupbib-list) (groupbib-list 'polybib-absatpoint gvar_3127) (groupbib-list 'max (axedyn-reaccreate (vlax-curve-getpointatdist listbib-add_2))) (groupbib-list 'dcl-control-settext 'ls_ext1)))
  (setq gvar_3155 "Choix du repère")
  (setq gvar_3155 "\nPremier point :")
  (if (re_abs2 gvar_3160)
    (progn
      (setq gvar_3094 (es_ext (groupbib-list 're_abs2 gvar_3160) gvar_3162))
    )
    (progn
      (setq gvar_3094 (es_ext gvar_3162))
    )
  )
  (re_abs2 (groupbib-list 'blkpoly-substprops (dcl-control-setenabled (st_axeid vl-remove))) gvar_3094)
  (member _vlax-false)
  (setq gvar_3091 (projet_ml_choixstyle _vlax-false))
  (setq gvar_3155 'projet_ml_choixstyle)
  (or (and gvar_3127 polybib-vtxjoin) (cadr gvar_3127))
  (getpoint re_dist (es_ext (groupbib-list 'projet_ml_choixstyle_zl_list 'ls_ext1)))
  (dcl-listbox-getselecteditems (dcl-control-setenabled (st_axeid vl-remove)))
  (dcl-listbox-getselecteditems re_dist)
  (getpoint re_dist (dcl-grid-setcurcell gvar_3086 (groupbib-list 'projet_ml_choixstyle_zl_list 'ls_ext1)))
  (dcl-listbox-getselecteditems (dcl-control-setenabled (st_axeid vl-remove)))
  (dcl-listbox-getselecteditems re_dist)
  (dcl-control-setenabled (st_axeid vl-remove))
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: ENTDEL, BLKPOLY-SUBSTPROPS, EN_RAYON, RE_COURANT, PICKBIB-BLK, IN_PARAM, dcl-listbox-clear, OCBIB-ENAME2ID, BLKBIB-LIST, VA_POINT
;; Referenced strings: Choix du bloc de détail, \nPoint de base :, Milieu
(defun blkpoly-popgo (en_rayon / local_1)
  (entdel "Choix du bloc de détail")
  (if gvar_3345
    (progn
      (setq gvar_3396 gvar_3345)
    )
    (progn
      (setq gvar_3396 (re_courant 'blkpoly-substprops en_rayon_2))
    )
  )
  'pickbib-blk
  (in_param gvar_3396 "\nPoint de base :")
  'blkbib-list
  (in_param gvar_3396 'va_point)
  (re_ray (hachbib-vtxs2hach gvar_3162))
  'dcl-listbox-selectstring
  (in_param gvar_3396 "Milieu")
  (re_ray (hachbib-vtxs2hach gvar_3162))
  (if (and (setq gvar_3155 'pickbib-blk) (setq dcl-listbox-clear (in_param gvar_3396 "\nPoint de base :")) (ocbib-ename2id '(ha_group ha_group ld_axe ha_axe ha_group ls_som0 ls_ray ls_ent ls_som in_lon0 in_lon in_node) dcl-listbox-clear) (setq gvar_3155 'blkbib-list) (setq gvar_3162 (in_param gvar_3396 'va_point)) (setq gvar_3153 (re_ray (hachbib-vtxs2hach gvar_3162))) (cadr (dcl-listbox-addlist gvar_3153)) (setq gvar_3155 'dcl-listbox-selectstring) (setq gvar_3162 (in_param gvar_3396 "Milieu")) (setq gvar_3079 (re_ray (hachbib-vtxs2hach gvar_3162))) (cadr (dcl-listbox-addlist gvar_3079)) (re_angle (eo_polyabs (re_angle0 0 (polar gvar_3153))) "\nChoix de l'orientation :"))
    (progn
      (setq grread polybib-vtxjoin)
      (setq gvar_3153 (*en_ray* (gr gvar_3153) nil))
    )
  )
  (if (re_angle (eo_polyabs (re_angle0 0 (polar gvar_3079))) "\nChoix de l'orientation :")
    (progn
      (setq pt polybib-vtxjoin)
      (setq gvar_3079 (*en_ray* (gr gvar_3079) nil))
    )
  )
  (if (re_angle (eo_polyabs (re_angle0 0 (polar gvar_3153))) 'angle)
    (progn
      (setq grread polybib-vtxjoin)
      (setq gvar_3153 (rem (rem (dcl-forcedwgredraw gvar_3153) '*)))
    )
  )
  (if (re_angle (eo_polyabs (re_angle0 0 (polar gvar_3079))) 'angle)
    (progn
      (setq pt polybib-vtxjoin)
      (setq gvar_3079 (rem (rem (dcl-forcedwgredraw gvar_3079) '*)))
    )
  )
  "XScaleFactor"
  (setq gvar_3160 (en_polyabs gvar_3396 'getpoint (es_ext 'ha_poly 'ha_poly 'ha_poly)))
  (setq gvar_3068 (in_param gvar_3396 " [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :"))
  (setq distance (re_ray gvar_3068))
  (setq re_dist (dcl-forcedwgredraw distance))
  (if (and polybib-vtxjoin (setq gvar_3155 "XScaleFactor") (re_angle (undobib-start gvar_3160) 'es_ext))
    (progn
      (if (and gvar_3345 (dcl-grid-clear gvar_3066))
        (progn
          (in_param (polar *st_id*) 10)
        )
        (progn
          (in_param (polar distance) 10)
        )
      )
      (setq blkpoly-get nil)
      (setq blkpoly-get (re_y gvar_3153 blkpoly-get))
      (setq gvar_3396 (st_rayon gvar_3396 'getpoint blkpoly-get))
    )
    (progn
      (setq blkpoly-get (hachbib-vtxs2hach gvar_3160 gvar_3153))
      (setq blkpoly-get (re_y gvar_3153 blkpoly-get))
    )
  )
  (if (and gvar_3345 (dcl-grid-clear gvar_3066) (cadr T))
    (progn
      (repbib-sel en_rayon_2 gvar_3396)
    )
    (progn
      polybib-vtxjoin
    )
  )
  (st_layer re_dist *ld_mod0*)
  (*ha_blkbase* re_dist (rtos blkpoly-get))
  (setq *ld_mod0* (getvar gvar_3153 blkpoly-get))
  (setq gvar_3155 '*ha_blkbase2*)
  (setq polybib_geom-bulge2radius (in_param gvar_3396 'polybib-absatpoint))
  (setq *ls_props0* (*ls_props* polybib_geom-bulge2radius gvar_3396))
  (setq gvar_3155 'blkpoly-xy2wcs)
  (setq *ls_paramentxy* (ls_paramswcs dcl-listbox-clear blkpoly-get 1 'ha_poly nil nil nil))
  (setq *ls_paramreact* (dcl-forcedwgredraw *ls_paramentxy*))
  (setq gvar_3053 (ordrebib-moveabove *ls_paramreact*))
  (setq gvar_3155 "X")
  (setq local_1 *ls_props0*)
  (or (cadr polybib_geom-bulge2radius) *ls_props0*)
  ;; init-args 3: "Point", nil
  (foreach gvar_3051 local_1
    (*ls_rep* "\n" (es_ext *ls_paramreact* (es_ext gvar_3051)))
  )
  (member *ls_paramreact*)
  (setq gvar_3155 '*ls_rep*)
  (setq gvar_3155 'entbib-visible)
  (setq projet_pa_detail_vueblocs1 (palbib-init gvar_3079 blkpoly-get))
  (setq gvar_3155 'dcl-control-setblockname)
  (setq projet_pa_detail_lbl_nom (projet_pa_detail_st_layer gvar_3153 gvar_3079 distance projet_pa_detail_vueblocs1 *ls_paramentxy* gvar_3396))
  (setq gvar_3091 (projet_ml_choixstyle *ls_paramreact*))
  (if (odclbib-fillcombo 'projet_pa_detail_lbl_id (projet_pa_detail_ls_rep gvar_3091 1 2))
    (progn
      (ls_visi gvar_3091)
    )
  )
  (if projet_pa_detail_lbl_nom
    (progn
      (setq gvar_3396 (st_rayon gvar_3396 'dcl-control-settext projet_pa_detail_lbl_nom))
      (if gvar_3345
        (progn
          gvar_3396
          (setq gvar_3345 gvar_3396)
        )
        (progn
          (rtos 'blkpoly-substprops en_rayon_2 gvar_3396)
        )
      )
    )
    (progn
      nil
    )
  )
  T
  nil
  (if (and (setq gvar_3155 nil) gvar_3155)
    (progn
      (ls_som0 gvar_3155)
    )
  )
  (dcl-forcedwgredraw (es_ext re_dist))
  (setq gvar_3155 nil)
  (if grread
    (progn
      (column gvar_3153)
    )
  )
  (if pt
    (progn
      (column gvar_3079)
    )
  )
  (ls_som0)
)

;; Original arg hints: arg_1, DISTANCE, LS_VISINAME, *LS_PARAMENTXY*, arg_5
;; Referenced symbols: PROJET/PA_DETAIL/LS_VISI, ENTDEL, LD_BLKBASE, dcl-combobox-setcursel, POLYBIB-VTXJOIN, DISTANCE, dcl-forcedwgredraw, RE_DIST, dcl-control-settext, IN_PARAM
;; Referenced strings: pt_ins, Destruction des paramètres, Destruction des variables
(defun blkpoly-proj (arg_1 distance ls_visiname *ls_paramentxy* arg_5 / *error* pt_ins re_angle0 re_angle en_blkdroit eo_blkdroit gr pt re_x re_y local_1 local_6 local_7)
  (entdel 'projet_pa_detail_ls_visi)
  (dcl-combobox-setcursel 'ld_blkbase)
  (setq ls_paramwcs polybib-vtxjoin)
  (setq re_dist (dcl-forcedwgredraw distance_2))
  (setq gvar_3068 (ls_sup re_dist "pt_ins"))
  (setq re_bulge (in_param gvar_3396 'dcl-control-settext))
  (setq en_param (pt_ptp1))
  (setq pa_detail_grd_props_update (blkpoly-mod-paramreaccreate gvar_3153 re_angle0 distance_2 ls_visiname_2 *ls_paramentxy*_2 gvar_3396))
  (if pa_detail_grd_props_update
    (progn
      (if (re_ray re_bulge)
        (progn
          (setq in_num (*in_num* (ls_sup (dcl-forcedwgredraw (re_ray re_bulge)) '(ls_props ls_prop in_num))))
        )
      )
      (setq local_6 pa_detail_grd_props_update)
      ;; init-args 3: 'projet_pa_detail_grd_props, nil
      (foreach projet_pa_detail_grd_props local_6
        (setq polybib_geom-bulge2radius (in_param projet_pa_detail_grd_props 'polybib-absatpoint))
        (setq polybib_geom-bulge2radius (projet_pa_detail_grd_props polybib_geom-bulge2radius gvar_3396))
        (setq ls_paramwcs (in_param projet_pa_detail_grd_props 're_value))
        (or (or (or (or (ls_ext2 (in_param projet_pa_detail_grd_props 'st_type) 'in_pos) (ls_ext2 (in_param projet_pa_detail_grd_props 'st_type) 'projet_pa_detail_txt_value)) (ls_ext2 (in_param projet_pa_detail_grd_props 'st_type) 'projet_pa_detail_btn_param)) (ls_ext2 (in_param projet_pa_detail_grd_props 'st_type) 'dcl-control-setfocus)) (ls_ext2 (in_param projet_pa_detail_grd_props 'st_type) 'blkpoly-mod-paramupdate))
        (blkpoly-getparents (in_param projet_pa_detail_grd_props 'blkpolymod-close) nil (in_param projet_pa_detail_grd_props 'ld_detail) (in_param projet_pa_detail_grd_props '(ls_parents ls_props ls_prop)) (in_param projet_pa_detail_grd_props '(ls_parents)) (in_param projet_pa_detail_grd_props 'blkpoly-getparents) polybib_geom-bulge2radius)
        (setq vla-put-insertionpoint (undobib-stop))
        (*st_iddetail* (es_ext (groupbib-list 0 'dcl-control-setfocus) (groupbib-list 10 (in_param gvar_3011 'eo_paramreact)) (groupbib-list 50 (in_param gvar_3011 '(ls_parents ls_props ls_prop))) (groupbib-list 40 (in_param gvar_3011 'vlr-remove)) (groupbib-list 1 (in_param gvar_3011 "Destruction des paramètres")) (re_angle0 72 gvar_3011) (groupbib-list 11 (in_param gvar_3011 "Destruction des variables")) (re_angle0 73 gvar_3011)))
        (ls_soms vla-put-insertionpoint 11 (in_param gvar_3011 "Destruction des variables"))
        (setq gvar_3011 (re_x projet_pa_detail_grd_props))
        (setq gvar_3010 (in_param gvar_3011 'polybib-absatpoint))
        (setq vla-put-insertionpoint (undobib-stop))
        (setq local_7 polybib_geom-bulge2radius)
        ;; init-args 3: 'palbib-fin, nil
        (foreach palbib-fin local_7
          (palbib-fin (dcl-forcedwgredraw vla-put-insertionpoint) (axedyn-reaccreate palbib-fin) (eo_polyabs palbib-fin))
        )
        (_vlax-true (in_param projet_pa_detail_grd_props 'itemindexorcount) (in_param projet_pa_detail_grd_props 'eo_paramreact) (in_param projet_pa_detail_grd_props 'value) (in_param projet_pa_detail_grd_props '(ls_parents ls_props ls_prop)) (in_param projet_pa_detail_grd_props 'blkpolydial-modrefbouton) nil polybib_geom-bulge2radius)
        (setq vla-put-insertionpoint (undobib-stop))
        (sssetfirst vla-put-insertionpoint (in_param projet_pa_detail_grd_props 'blkpolydial-getrep) polybib_geom-bulge2radius)
        (setq vla-put-insertionpoint (in_param projet_pa_detail_grd_props '(st_type ls_props ls_prop)))
        (setq in_num (blkpolydial-getpoint (dcl-forcedwgredraw vla-put-insertionpoint) in_num))
        (*en_ray* (in_param projet_pa_detail_grd_props 'blkpolydial-getrep) polybib_geom-bulge2radius)
        (rtos (dcl-forcedwgredraw vla-put-insertionpoint) 'blkpolydial-getlong (re_x projet_pa_detail_grd_props))
        (setq vla-put-insertionpoint (undobib-stop))
        (if (ls_ext2 (axedyn-reaccreate projet_pa_detail_grd_props) 'blkpoly-mod-paramupdate)
          (progn
            (setq dcl-grid-setcelltext (dcl-grid-setcurcell dcl-grid-setcelltext (dcl-forcedwgredraw vla-put-insertionpoint)))
          )
          (progn
            (setq aopora-fin (dcl-grid-setcurcell aopora-fin (dcl-forcedwgredraw vla-put-insertionpoint)))
          )
        )
        (if ls_paramwcs
          (progn
            (ld_mod (dcl-forcedwgredraw vla-put-insertionpoint) ld_mod)
          )
          (progn
            (ld_mod (dcl-forcedwgredraw vla-put-insertionpoint) st_txtvalue)
          )
        )
        (pt_ptp1 vla-put-insertionpoint en_param)
      )
      (if in_num
        (progn
          (polybib-lwvertices 'member in_num)
        )
      )
      (setq local_6 dcl-grid-setcelltext)
      ;; init-args 3: "\nValeur non modifié", nil
      (foreach gvar_2991 local_6
        (st_txtvalue aopora-fin gvar_2991)
      )
      (if (re_ray re_bulge)
        (progn
          (column (re_ray re_bulge) (polybib-lwvertices "YScaleFactor" (st_rayon dcl-grid-setcelltext aopora-fin)))
        )
        (progn
          (setq reabib-deleteobjectreactor (pt_ptp2 en_param))
          (setq re_bulge (projet_pa_axes_ca_sommet reabib-deleteobjectreactor))
        )
      )
      (setq en_param nil)
      re_bulge
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: POLYBIB_GEOM-BULGE2RADIUS, arg_2
;; Referenced symbols: POLYBIB_GEOM-BULGE2RADIUS, IN_PARAM, ST_BTN, RE_ANGLE
;; Referenced strings: Appliquer, Repère
(defun blkpoly-substprops (polybib_geom-bulge2radius arg_2)
  (if (re_angle (in_param polybib_geom-bulge2radius_2 "Appliquer") 'st_btn)
    (progn
      (setq polybib_geom-bulge2radius_2 (st_rayon polybib_geom-bulge2radius_2 "Appliquer" (in_param gvar_3396 "Repère")))
    )
  )
  polybib_geom-bulge2radius_2
)

;; Original arg hints: LS_PROPSDESCS, STR, REPDYN-GET
;; Referenced symbols: ENTDEL, LS_PROPSDESCS, STR, dcl-control-setvisible, HA_POLY, LS_EXT2, REPDYN-ISREP, ST_SYLE, PT_REF, GETVAR
;; Referenced strings: Repère 
(defun polybib-proj2poly (ls_propsdescs str repdyn-get)
  (entdel "Repère ")
  (setq gvar_2983 (repdyn-get ls_propsdescs_2))
  (setq gvar_3241 (re_y ls_propsdescs_2 str_2))
  (setq gvar_3388 (dcl-control-setvisible gvar_3079 gvar_3241))
  (if (or (ls_ext2 gvar_3388 'ha_poly '(ls_props pt_ref)) (ls_ext2 gvar_3388 gvar_2983 '(ls_props pt_ref)))
    (progn
      (setq gvar_3247 (getvar ls_propsdescs_2 gvar_3241))
      (setq pt_ref (pt_ref gvar_3241 str_2))
      (setq gvar_3244 (getvar gvar_3241 (st_syle (repdyn-isrep gvar_3236 'repdyn-isrep) gvar_3247) pt_ref))
      (setq gvar_3242 (getvar gvar_3241 (dcl-grid-addrow (repdyn-isrep gvar_3236 'repdyn-isrep) gvar_3247) pt_ref))
      (if (or (ls_ext2 (pt_ref str_2 gvar_3244) 'ha_poly '(ls_props pt_ref)) (ls_ext2 (pt_ref str_2 gvar_3242) 'ha_poly '(ls_props pt_ref)))
        (progn
          (setq gvar_3241 gvar_3241)
        )
        (progn
          (setq gvar_3241 nil)
        )
      )
    )
    (progn
      (setq gvar_3241 gvar_3241)
    )
  )
  gvar_3241
)

;; Original arg hints: arg_1, BLKPOLY-PT2WXY
;; Referenced symbols: ENTDEL, vlax-ename->vla-object, REPDYN-GETPOINTANGLE, BLKPOLY-PT2WXY, GEOMBIB-RACCORDMAX, ST_VISI, RE_ANGLE, vlax-put-property, EO_BLKPARAM, BLKBIB-BLK_TEMP
;; Referenced strings: choix du repère, re_sens,  Mise à jour de la grille
(defun blkpoly-choixpoint (arg_1 blkpoly-pt2wxy / *error* pt_ins re_angle0 re_angle en_blkdroit eo_blkdroit gr pt re_x re_y local_1)
  (entdel '(ls_props pt_ref st_id))
  (vlax-ename->vla-object "choix du repère")
  (setq st_visi (st_visi (geombib-raccordmax 'repdyn-getpointangle blkpoly-pt2wxy_2 '(ls_visi ld_blkbase))))
  (or (or (or (or (or (or (or (or (re_angle st_visi nil) (re_angle st_visi 'vlax-put-property)) (re_angle st_visi 'eo_blkparam)) (re_angle st_visi 'blkbib-blk_temp)) (re_angle st_visi '(en_blkbase eo_blkbase pt_ins en_polybase en_polyabs ls_props ls_prop in_param))) (re_angle st_visi 'eg_blkbase)) (re_angle st_visi "re_sens")) (re_angle st_visi 'ls_ext1)) polybib-vtxjoin)
  (setq entlast (re_sens st_visi 1 0))
  (setq entlast (st_visi 're_cote))
  (setq entlast (re_sens entlast 1 0))
  T
  (st_visi 're_cote)
  (blkbib-set_dynprops 'en_blkparam)
  (setq gvar_3388 (st_param gvar_3153 entlast))
  (setq gvar_3388 (st_syle gvar_3388 pt_blkbase))
  (setq gvar_3388 (ld_ldata (blkpoly-lsparams 'ha_poly gvar_3388) (repdyn-get gvar_3153)))
  (ls_param gvar_3153 gvar_3388)
  (and (setq entlast (st_visi 're_cote)) (setq pt_blkbase (blkbib-set_dynprops 'en_blkparam)) (setq entlast (ls_param gvar_3153 gvar_3388)))
  (setq entlast (va_param 'blkpoly-wcs2wxy))
  T
  (st_visi " Mise à jour de la grille")
  (st_visi "Destruction des réacteurs des paramètres" gvar_3244)
  (setq gvar_3244 (re_sens gvar_3244 1 0))
  (setq gvar_3242 (re_sens gvar_3242 1 0))
  (setq projet_pa_detail_vueblocs1 (st_param gvar_3153 gvar_3244))
  (setq gvar_2956 (st_param gvar_3153 gvar_3242))
  (ls_param gvar_3153 (repdyn-isrep (st_syle projet_pa_detail_vueblocs1 gvar_2956) 'repdyn-isrep))
  (and (setq gvar_3244 (st_visi " Mise à jour de la grille")) (setq gvar_3242 (st_visi "Destruction des réacteurs des paramètres" gvar_3244)) (setq entlast (ls_param gvar_3153 (repdyn-isrep (st_syle projet_pa_detail_vueblocs1 gvar_2956) 'repdyn-isrep))))
  (setq entlast 'ls_paramentxy)
  (setq entlast "Reconstruction des réacteurs des paramètres")
  T
  (blkbib-set_dynprops '((cons _vlr-objectclosed blkpoly-paramreac1)))
  (setq gvar_3388 (ld_ldata (blkpoly-lsparams 'ha_poly gvar_3388) (repdyn-get gvar_3153)))
  (ls_param gvar_3153 gvar_3388)
  (and (setq gvar_3388 (blkbib-set_dynprops '((cons _vlr-objectclosed blkpoly-paramreac1)))) (setq entlast (ls_param gvar_3153 gvar_3388)))
  (setq entlast nil)
  entlast
)

;; Referenced symbols: GROUPBIB-ADDGROUP, ENTDEL, POLYBIB-VTXJOIN, VLR-Object-Reactor, vlax-ename->vla-object, OWN, DCL-GRID-CLEAR, REA, LST, AXEDYN-REACCREATE
(defun blkpoly-choixbloc ()
  (entdel 'groupbib-addgroup)
  (vlax-ename->vla-object 'vlr-object-reactor)
  T
  (setq append polybib-vtxjoin)
  (axedyn-reaccreate (lst rea))
  (while (and own (dcl-grid-clear own) (setq ordrebib-movetotop (axedyn-reaccreate (lst rea))) append)
    (if ordrebib-movetotop
      (progn
        (setq listbib-add (re_max nil (geombib-raccordmax '(en) ordrebib-movetotop '(ls_raymax re_max inc))))
      )
      (progn
        (setq listbib-add (re_max nil 'en))
      )
    )
    (if (and ordrebib-movetotop (ls_ext2 listbib-add 'ls_ext1))
      (progn
        (setq listbib-add ordrebib-movetotop)
      )
    )
    (if (or (ls_ext2 listbib-add 'listbib-subst) (ls_ext2 listbib-add 'ls_ext1))
      (progn
        (setq listbib-add (*obj-lst* '*reactor1* listbib-add nil nil))
        (if (cadr listbib-add)
          (progn
            (setq append nil)
          )
        )
        (if (and listbib-add (pt_ext listbib-add))
          (progn
            (< vlax-curve-getparamatpoint fix)
            (setq vlax-curve-getparamatpoint (vlax-curve-getclosestpointto listbib-add))
            (setq fix (re_param listbib-add))
            (setq listbib-add vlax-curve-getparamatpoint)
            (setq ordrebib-movetotop listbib-add)
          )
          (progn
            (setq ordrebib-movetotop listbib-add)
          )
        )
      )
      (progn
        (ls_hach listbib-add)
      )
    )
    (cadr (ocbib-ename2id '(ha_group ha_group ld_axe ha_axe ha_group ls_som0 ls_ray ls_ent ls_som in_lon0 in_lon in_node) listbib-add))
    (if (and listbib-add (setq append (cadr (ocbib-ename2id '(ha_group ha_group ld_axe ha_axe ha_group ls_som0 ls_ray ls_ent ls_som in_lon0 in_lon in_node) listbib-add))))
      (progn
        (ls_som0 'cdr)
      )
    )
  )
  T
  listbib-add
  (and own (dcl-grid-clear own) (*reactor2* rea) (vlr-command-reactor rea (*reactor2*)) (cmd rea listbib-add))
)

;; Original arg hints: arg_1, LISTBIB-ADD, ENTLAST
;; Referenced symbols: ENTDEL, ENTLAST, BLKPOLY-GET, LISTBIB-ADD, :vlax-true, vla-put-Visible, dcl-forcedwgredraw, BLKPOLY-MOD-PARAM, LS_SOM0, POLYBIB-VTXJOIN
(defun blkpoly-choixqua (arg_1 listbib-add entlast)
  (entdel '(re_angle))
  (ls_som0 'blkpoly-mod-param)
  (setq blkpoly-get (re_y gvar_3153 entlast_2))
  (setq gvar_2939 (getvar gvar_3153 blkpoly-get))
  (setq vla-put-visible (_vlax-true listbib-add_2 blkpoly-get 1 gvar_2939 nil nil nil))
  (setq _vlax-false (dcl-forcedwgredraw vla-put-visible))
  5
  (while (odclbib-fillcombo (blkpoly-mod-param polybib-vtxjoin 15 0) (axedyn-reaccreate (setq blkbib-getentities (blkpoly-mod-param polybib-vtxjoin 15 0))))
    (setq ls_ents (re_sens (re_x blkbib-getentities) 1 0))
    (setq ls_prop (blkbib-getvisient blkpoly-get ls_ents))
    (setq ls_prop (dcl-grid-addrow ls_prop gvar_2939))
    (setq ls_prop (>= (st_syle (ls_visient 2 gvar_3236) ls_prop) (ls_visient 2 gvar_3236)))
    (if (st_blkbase ls_prop gvar_3236)
      (progn
        (setq gvar_3158 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2))
      )
      (progn
        (setq gvar_3158 'en_poly)
      )
    )
    (if (and (st_blkbase ls_prop (repdyn-isrep gvar_3236 'repdyn-isrep)) (repdyn-getpoint ls_prop (ls_visient (repdyn-isrep gvar_3236 'repdyn-isrep) 3)))
      (progn
        (setq gvar_3159 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2))
      )
      (progn
        (setq gvar_3159 'en_poly)
      )
    )
    (palbib-fin _vlax-false 'ls_visiha gvar_3158)
    (palbib-fin _vlax-false 'bo_flag gvar_3159)
  )
  (column vla-put-visible)
  (es_ext gvar_3159 gvar_3158)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: BLKBIB-GET_DYNPROPS, ENTDEL, LS_DYNS, RE_XINV, <, vlax-erased-p, EN_RAYON, RE_YINV, BLKPOLY-GETPARENTENTITIES, ST_BTN
;; Referenced strings: Repère,  [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :, Milieu
(defun blkpoly-modgo (en_rayon / local_1)
  (entdel 'blkbib-get_dynprops)
  (ls_dyns)
  (cdr 're_xinv)
  (vlax-erased-p gvar_3066)
  (>= distance nil)
  (polybib-absrem)
  (pt_poly polybib-absrem (in_param gvar_3345 "\nPoint de base :"))
  (bo_lctabs polybib-proj2poly blkbib-getparententities)
  (vlax-invoke re_anglepoly (in_param gvar_3345 "\nPoint de base :"))
  (vlax-invoke gvar_2903 en_rayon_2)
  (ls_vtx0 ls_somcurves (polybib-lwvertices 'eo_polyabs vlax-curve-isclosed))
  (setq re_yinv en_rayon_2)
  (setq gvar_3345 (blkpoly-getparententities re_yinv))
  (setq ls_groupparent gvar_3345)
  (setq blkbib-getparententities (en_polyabs gvar_3345 "Repère" 'st_btn))
  (setq gvar_2922 (in_param gvar_3345 " [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :"))
  (setq ha_parent gvar_2922)
  (setq distance (re_ray gvar_2922))
  (setq re_dist (dcl-forcedwgredraw distance))
  (setq gvar_3153 (re_ray (hachbib-vtxs2hach (in_param gvar_3345 'va_point))))
  (setq gvar_3079 (re_ray (hachbib-vtxs2hach (in_param gvar_3345 "Milieu"))))
  (setq bo_visble (in_param gvar_3345 'polybib-absatpoint))
  (setq gvar_2919 bo_visble)
  (setq gvar_2917 (blkpoly-hach re_yinv))
  (setq blkpoly-txt (es_ext))
  (setq blkbib-vlget_atts (es_ext))
  (setq vlax-curve-isclosed (es_ext (groupbib-list "Impossible d'insérer le bloc droit" 'blkpoly-blk) (groupbib-list 'blkpoly-poly "ha_parent") (groupbib-list '(re_x re_y pt_poly re_anglepoly re_angle) 'eg_blkbase)))
  (vlax-curve-getpointatdist (in_param gvar_3345 "\nPoint de base :"))
  (if (setq pt_0 (vlax-curve-getpointatdist (in_param gvar_3345 "\nPoint de base :")))
    (progn
      (ls_vtx0 ls_vtx pt_0)
      (setq re_bu (vlax-curve-getpointatdist (in_param gvar_3345 "\nPoint de base :")))
      (if (laybib-newlay (in_param listbib-butlast 'max) re_bu)
        (progn
          (bo_invpoly1 ls_vtx (laybib-newlay (in_param gvar_3345 'max) re_bu))
        )
        (progn
          (bo_invpoly1 ls_vtx 0)
        )
      )
      (vlax-vla-object->ename ls_vtx polybib-vtxjoin)
    )
    (progn
      (vlax-vla-object->ename ls_vtx nil)
    )
  )
  (setq local_1 gvar_2917)
  ;; init-args 3: 'bo_invpoly2, nil
  (foreach bo_invpoly2 local_1
    (setq bo_invpoly (_vlax-true 're_xinv (dcl-grid-addrow 2 bo_invpoly2) 1 (dcl-grid-addrow 3 bo_invpoly2) (es_ext (groupbib-list "en_parent" (dcl-grid-addrow 1 bo_invpoly2))) nil (es_ext (groupbib-list 8 'poly-polytaille))))
    (setq blkbib-vlget_atts (dcl-grid-setcurcell blkbib-vlget_atts (re_off1 (dcl-forcedwgredraw bo_invpoly))))
    (setq blkpoly-txt (dcl-grid-setcurcell blkpoly-txt (groupbib-list bo_invpoly (dcl-grid-addrow 0 bo_invpoly2))))
  )
  (re_off2)
)

;; Referenced symbols: ENTDEL, POLYBIB-ABSATPOINT, IN_PARAM, POLYBIB-APPROXARC, LS_SOMCURVE, *EN_INS*, POLYBIB_GEOM-BULGE2RADIUS, PALBIB-FIN, DCL-GRID-ADDROW, EO_BLKPOP
;; Referenced strings: 0.01
(defun pa_detail_grd_props_update ( / local_0)
  (entdel "0.01")
  (*en_ins* ls_somcurve)
  (setq polybib_geom-bulge2radius (in_param gvar_3345 'polybib-absatpoint))
  (setq ls_vtxsapprox polybib-approxarc)
  (setq local_0 polybib_geom-bulge2radius)
  ;; init-args 3: 'palbib-fin, nil
  (foreach palbib-fin local_0
    (eo_blkpop ls_somcurve (dcl-grid-addrow 1 palbib-fin) (eo_blkbase (dcl-grid-addrow 2 palbib-fin) 2 2) (dcl-grid-addrow 4 palbib-fin))
  )
  ls_vtxsapprox
  (setq polybib-approxarc ls_vtxsapprox)
)

;; Original arg hints: EQ, NETBIB-PURGEBLOCK
;; Referenced symbols: LS_VTXAPPROX, ENTDEL, POLYBIB-ABSATPOINT, IN_PARAM, EQ, ST_BLKBASE, POLYBIB-APPROXARC, POLYBIB_GEOM-BULGE2RADIUS, DCL-GRID-ADDROW, PALBIB-FIN
;; Referenced strings: Impossible d'insérer le bloc droit
(defun c:projet_pa_detail_grd_props_onselchanged (eq netbib-purgeblock)
  (entdel 'ls_vtxapprox)
  (setq polybib_geom-bulge2radius (in_param gvar_3345 'polybib-absatpoint))
  (if (st_blkbase eq_2 255)
    (progn
      (setq polybib-approxarc eq_2)
    )
  )
  (setq palbib-fin (dcl-grid-addrow polybib-approxarc polybib_geom-bulge2radius))
  (setq blkpoly-point (dcl-grid-addrow 2 palbib-fin))
  (setq polybib-subpolybisinv (dcl-grid-addrow 4 palbib-fin))
  (if (cadr polybib-subpolybisinv)
    (progn
      (setq polybib-subpolybisinv "Impossible d'insérer le bloc droit")
    )
  )
  (bo_invpoly1 ls_somcurves (laybib-newlay polybib-subpolybisinv (polybib-lwvertices 'axedyn-reaccreate vlax-curve-isclosed)))
  (laybib-newlay (axedyn-reaccreate palbib-fin) (polybib-lwvertices 'eo_polyabs blkpoly-txt))
  (if (setq polybib-subpolyoffinv (laybib-newlay (axedyn-reaccreate palbib-fin) (polybib-lwvertices 'eo_polyabs blkpoly-txt)))
    (progn
      (st_grouphandle nil (pt_ptp1 bo_invpoly))
      (setq bo_invpoly (axedyn-reaccreate (dcl-grid-addrow polybib-subpolyoffinv blkpoly-txt)))
    )
    (progn
      (st_grouphandle nil nil)
    )
  )
  (bo_lctabs polybib-subpolyper (eo_blkbase blkpoly-point 2 2))
  (vlax-vla-object->ename polybib-subpolyper polybib-vtxjoin)
  (vlax-vla-object->ename ls_somcurves polybib-vtxjoin)
  (vlax-vla-object->ename gvar_2882 polybib-vtxjoin)
  (en_hatch polybib-subpolyper)
  (ls_entnew polybib-subpolyper 0 255)
)

;; Referenced symbols: LS_GROUPPARENT, RE_YINV, dcl-listbox-getselecteditems, EO_HATCH, LS_SOM0
(defun c:projet_pa_detail_btn_reset_onclicked ()
  (dcl-listbox-getselecteditems re_yinv)
  (eo_hatch)
  (setq gvar_3345 ls_groupparent)
  (ls_som0)
)

;; Original arg hints: BLKPOLY-PROJ, ST_GROUPHANDLE
;; Referenced symbols: LS_GROUPPARENT, RE_YINV, dcl-listbox-getselecteditems
(defun c:projet_pa_detail_onclose (blkpoly-proj st_grouphandle)
  (dcl-listbox-getselecteditems re_yinv)
  (setq gvar_3345 ls_groupparent)
  (eo_hatch)
)

;; Original arg hints: arg_1
;; Referenced symbols: ENTDEL, VA_POINT, IN_PARAM, ES_EXT, GETPOINT, RE_ABS2, GROUPBIB-LIST, dcl-grid-setcurcell, POLYBIB-ABSATPOINT, POLYBIB_GEOM-BULGE2RADIUS
;; Referenced strings: TrueColor
(defun blkpoly-getparents (arg_1 / local_1)
  (entdel "TrueColor")
  (setq gvar_3094 (es_ext (in_param gvar_2878 'va_point)))
  (if (re_abs2 (in_param gvar_2878 'getpoint))
    (progn
      (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 (groupbib-list 're_abs2 (in_param gvar_2878 'getpoint))))
    )
  )
  (setq polybib_geom-bulge2radius (in_param gvar_2878 'polybib-absatpoint))
  (setq local_1 polybib_geom-bulge2radius)
  ;; init-args 3: 'palbib-fin, nil
  (foreach palbib-fin local_1
    (if (ls_ext2 '(re_x re_y pt_poly re_anglepoly re_angle) (dcl-grid-addrow 4 palbib-fin))
      (progn
        (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 (groupbib-list 're_abs2 (dcl-grid-addrow 5 palbib-fin))))
      )
    )
  )
  gvar_3094
)

;; Referenced symbols: ENTDEL, HACHBIB-GETLOOPS, BLKPOLY-SUBSTPROPS, RE_YINV, GROUPBIB-LIST, RTOS, LS_SOM0
;; Referenced strings: PatternAngle
(defun c:projet_pa_detail_btn_save_onclicked ()
  (entdel "PatternAngle")
  (re_abs2 (groupbib-list 'blkpoly-substprops re_yinv) gvar_3094)
  (rtos 'blkpoly-substprops re_yinv gvar_3345)
  (re_abs1 gvar_3066)
  (setq gvar_3094 (hachbib-getloops gvar_3345))
  (setq ls_groupparent gvar_3345)
  (ls_som0)
)

;; Referenced symbols: LS_LOOPS, ENTDEL, LS_OUTERSPROJ, LS_INNERSPROJ, dcl-combobox-setcursel, LS_OUTER, BLKBIB-VLGET_ATTS, BLKPOLY-VTX, LS_INNER, BLKPOLY-TXT
;; Referenced strings: ls_inner,  [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :, PatternName
(defun blkpolymod-close ( / local_0)
  (entdel 'ls_loops)
  (ls_outersproj)
  (dcl-combobox-setcursel 'ls_innersproj)
  (dcl-combobox-setcursel 'ls_outer)
  (setq local_0 blkbib-vlget_atts)
  ;; init-args 3: 'blkpoly-vtx, nil
  (foreach blkpoly-vtx local_0
    T
    (and blkpoly-vtx (ls_inner blkpoly-vtx))
  )
  (dcl-combobox-setcursel "ls_inner")
  (dcl-combobox-setcursel blkpoly-txt)
  (setq local_0 blkpoly-txt)
  ;; init-args 3: 'bo_invpoly, nil
  (foreach bo_invpoly local_0
    (member (dcl-forcedwgredraw (axedyn-reaccreate bo_invpoly)))
  )
  (>= (re_ray (in_param gvar_3345 " [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :")) polybib-vtxjoin)
  (dcl-combobox-setcursel "PatternName")
  (eo_poly)
  (dcl-combobox-setcursel '(en_poly eo_poly ls_props ls_vtxs ls_som pt_0 ls_somcurve ls_somcurves re_bu ls_vtx0))
  (setq gvar_3345 nil)
  (setq ls_groupparent nil)
  (setq gvar_2922 nil)
  (setq blkpoly-txt nil)
  (setq blkbib-vlget_atts nil)
  (setq gvar_2866 nil)
  (ls_som0)
)

;; Original arg hints: EO_POLY, arg_2
(defun c:projet_pa_detail_ls_rep_onselchanged (eo_poly arg_2)
  (eo_poly)
)

;; Referenced symbols: ENTDEL, LS_SOMCURVES, AXEDYN-REACCREATE, vlax-curve-isClosed, POLYBIB-LWVERTICES, DCL-GRID-ADDROW, POLYBIB-ABSATPOINT, IN_PARAM, POLYBIB-APPROXARC, POLYBIB_GEOM-BULGE2RADIUS
;; Referenced strings: ConstantWidth, Impossible d'insérer le bloc droit
(defun c:projet_pa_detail_btn_param_onclicked ()
  (entdel "ConstantWidth")
  (setq polybib-subpolybisinv (dcl-grid-addrow (ls_props2 ls_somcurves) (polybib-lwvertices 'axedyn-reaccreate vlax-curve-isclosed)))
  (setq polybib_geom-bulge2radius (in_param gvar_3345 'polybib-absatpoint))
  (setq palbib-fin (dcl-grid-addrow polybib-approxarc polybib_geom-bulge2radius))
  (or (or (or (re_angle polybib-subpolybisinv "Impossible d'insérer le bloc droit") (re_angle polybib-subpolybisinv 'blkpoly-poly)) (re_angle polybib-subpolybisinv '(re_x re_y pt_poly re_anglepoly re_angle))) polybib-vtxjoin)
  (setq palbib-fin nil)
  (setq palbib-fin (reverse palbib-fin gvar_3345))
  (setq palbib-fin (reverse palbib-fin gvar_3345))
  (setq palbib-fin (reverse palbib-fin gvar_3345))
  (if palbib-fin
    (progn
      (en_blk ls_somcurve polybib-approxarc 1 (eo_blkbase (dcl-grid-addrow 2 palbib-fin) 2 2))
      (en_blk ls_somcurve polybib-approxarc 2 (dcl-grid-addrow 4 palbib-fin))
      (eo_poly)
      (eo_hatch)
      (setq polybib_geom-bulge2radius (row palbib-fin polybib-approxarc polybib_geom-bulge2radius))
      (setq gvar_3345 (st_rayon gvar_3345 'polybib-absatpoint polybib_geom-bulge2radius))
      (dcl-listbox-getselecteditems re_yinv)
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: PALBIB-FIN, VA_ECHELLE
;; Referenced symbols: LS_REP, ENTDEL, PALBIB-FIN, DCL-GRID-ADDROW, POLYBIB-SUBPOLYPER, *LS_REPBLKS*, BLKPOLY-POINT, RE_ANGLE, LS_REPBLK, LS_SOM0
;; Referenced strings: Impossible d'insérer le bloc droit
(defun blkpolydial-getlong (palbib-fin va_echelle)
  (entdel 'ls_rep)
  (setq blkpoly-point (dcl-grid-addrow 2 palbib-fin_2))
  (setq *ls_repblks* (errbib-catchapply polybib-subpolyper))
  (if (re_angle *ls_repblks* (eo_blkbase blkpoly-point 2 2))
    (progn
      (ls_som0 'ls_repblk)
      (setq palbib-fin_2 nil)
    )
    (progn
      (setq palbib-fin_2 (row (groupbib-listobj *ls_repblks*) 2 palbib-fin_2))
      (setq palbib-fin_2 (row "Impossible d'insérer le bloc droit" 4 palbib-fin_2))
    )
  )
  palbib-fin_2
)

;; Referenced symbols: LS_REPBLKS, ENTDEL, LS_SOMCURVES, AXEDYN-REACCREATE, vlax-curve-isClosed, POLYBIB-LWVERTICES, DCL-GRID-ADDROW, POLYBIB-ABSATPOINT, IN_PARAM, POLYBIB-APPROXARC
;; Referenced strings: Impossible d'insérer le bloc droit, normal
(defun blkpolydial-modrefbouton ()
  (entdel 'ls_repblks)
  (setq polybib-subpolybisinv (dcl-grid-addrow (ls_props2 ls_somcurves) (polybib-lwvertices 'axedyn-reaccreate vlax-curve-isclosed)))
  (setq polybib_geom-bulge2radius (in_param gvar_3345 'polybib-absatpoint))
  (setq palbib-fin (dcl-grid-addrow polybib-approxarc polybib_geom-bulge2radius))
  (setq ls_paramwcs nil)
  (or (or (or (re_angle polybib-subpolybisinv "Impossible d'insérer le bloc droit") (re_angle polybib-subpolybisinv 'blkpoly-poly)) (re_angle polybib-subpolybisinv '(re_x re_y pt_poly re_anglepoly re_angle))) polybib-vtxjoin)
  (setq gvar_2849 'blkbib-isuniform)
  (if (and (re_angle "normal" (undobib-start (dcl-grid-addrow 5 palbib-fin))) (en_txt (dcl-grid-addrow 5 palbib-fin)))
    (progn
      (setq gvar_2849 (geombib-raccordmax 'en_txt (dcl-grid-addrow 5 palbib-fin)))
    )
    (progn
      (setq gvar_2849 'eo_txt)
    )
  )
  (if (re_angle 'es_ext (undobib-start (dcl-grid-addrow 5 palbib-fin)))
    (progn
      (setq gvar_2849 'pt_11)
    )
    (progn
      (setq gvar_2849 'eo_txt)
    )
  )
  (re_hauteur polybib-subpolyper ls_paramwcs)
  (vlax-invoke gvar_2882 gvar_2849)
  (setq gvar_2849 'blkbib-isuniform)
  (setq ls_paramwcs polybib-vtxjoin)
  (ls_som0)
)

;; Original arg hints: PALBIB-FIN, VA_ECHELLE
;; Referenced symbols: *LS_REPS*, ENTDEL, LS_REPS, VA_ECHELLE, PT_INS11, PALBIB-FIN, ROW, BLKPOLY-POLY
(defun blkpolydial-getpoint (palbib-fin va_echelle)
  (entdel '*ls_reps*)
  (st_visi 'ls_reps)
  (if (setq gvar_2840 (st_visi 'ls_reps))
    (progn
      (setq palbib-fin_2 (row (pt_ins11 gvar_2840 va_echelle_2) 2 palbib-fin_2))
      (setq palbib-fin_2 (row 'blkpoly-poly 4 palbib-fin_2))
      (setq palbib-fin_2 (row gvar_2840 5 palbib-fin_2))
    )
    (progn
      (setq palbib-fin_2 nil)
    )
  )
  palbib-fin_2
)

;; Original arg hints: PALBIB-FIN, VA_ECHELLE
;; Referenced symbols: ENTDEL, VA_PARAM, EN_RAYON, AXEDYN-REACCREATE, VA_ECHELLE, PT_INS11, PALBIB-FIN, ROW
;; Referenced strings: Distance1_X, Position1 X
(defun blkpolydial-getrep (palbib-fin va_echelle)
  (entdel "Distance1_X")
  (va_param "Position1 X")
  (if (setq en_rayon (va_param "Position1 X"))
    (progn
      (setq gvar_2840 (axedyn-reaccreate (pt_ins11 en_rayon)))
      (setq palbib-fin_2 (row (pt_ins11 gvar_2840 va_echelle_2) 2 palbib-fin_2))
      (setq palbib-fin_2 (row '(re_x re_y pt_poly re_anglepoly re_angle) 4 palbib-fin_2))
      (setq palbib-fin_2 (row en_rayon 5 palbib-fin_2))
    )
    (progn
      (setq palbib-fin_2 nil)
    )
  )
  palbib-fin_2
)

;; Referenced symbols: POLYBIB-SUBPOLYPER, LS_ENTNEW
(defun c:projet_pa_detail_txt_value_onsetfocus ()
  (ls_entnew polybib-subpolyper 0 255)
)

;; Referenced symbols: ENTDEL, dcl-combobox-setcursel, IN_PARAM, vlax-curve-getPointAtDist, PT_0, LS_VTX, DCL-GRID-ADDROW, MAX, POLYBIB-PROJ2POLY, BLKBIB-GETPARENTENTITIES
;; Referenced strings: Distance2_X, Position2 X, \nPoint de base :
(defun c:projet_pa_detail_btn_preview_onclicked ()
  (entdel "Distance2_X")
  (dcl-combobox-setcursel "Position2 X")
  (setq pt_0 (vlax-curve-getpointatdist (in_param gvar_3345 "\nPoint de base :")))
  (if pt_0
    (progn
      (setq gvar_2833 (dcl-grid-addrow (ls_props2 ls_vtx) pt_0))
      (setq gvar_3345 (st_rayon gvar_3345 'max gvar_2833))
    )
  )
  (dcl-listbox-getselecteditems re_yinv)
  (setq blkbib-getparententities (errbib-catchapply polybib-proj2poly))
  (setq gvar_3345 (st_rayon gvar_3345 "Repère" blkbib-getparententities))
  (ls_som0)
)

;; Original arg hints: arg_1
;; Referenced symbols: ENTDEL, RE_RAY, DISTANCE, POLAR, dcl-forcedwgredraw, IN_PARAM, VA_POINT, RE_DECALAGE, POLYBIB-ABSATPOINT, BLKPOLY-GET
;; Referenced strings: Distance3_X, Milieu, Position3 Y
(defun blkpoly-mod-param (arg_1)
  (entdel "Distance3_X")
  (setq distance (re_ray gvar_2922))
  (setq gvar_2830 (polar distance))
  (setq re_dist (dcl-forcedwgredraw distance))
  (setq blkpoly-get (in_param gvar_2830 10))
  (setq gvar_3153 (re_ray (hachbib-vtxs2hach (in_param gvar_3345 'va_point))))
  (setq gvar_3079 (re_ray (hachbib-vtxs2hach (in_param gvar_3345 "Milieu"))))
  (setq gvar_2828 (in_param gvar_3345 "Position3 Y"))
  (setq gvar_2827 (in_param gvar_3345 're_decalage))
  (setq polybib_geom-bulge2radius (in_param gvar_3345 'polybib-absatpoint))
  (setq ls_visiname (dcl-control-setvisible gvar_3079 blkpoly-get))
  (if (re_angle gvar_2828 'ha_poly)
    (progn
      255
    )
    (progn
      1
    )
  )
  (setq gvar_2828 nil)
  (if (re_angle gvar_2827 'ha_poly)
    (progn
      255
    )
    (progn
      1
    )
  )
  (setq gvar_2827 nil)
  (setq gvar_2826 (rem gvar_2832))
  (setq gvar_2830 (polar gvar_2826))
  (setq gvar_2825 (in_param gvar_2830 10))
  (setq gvar_2824 (in_param blkpoly-txt gvar_2826))
  (setq gvar_2822 (in_param (re_angleins) gvar_2824))
  (setq palbib-fin (in_param polybib_geom-bulge2radius gvar_2824))
  (setq blkpoly-point (re_angleins gvar_2825 gvar_2824 re_yinv))
  (or (or (re_angle (dcl-grid-addrow 3 palbib-fin) 'blkpoly-poly) (re_angle (dcl-grid-addrow 3 palbib-fin) "Impossible d'insérer le bloc droit")) (re_angle (dcl-grid-addrow 3 palbib-fin) '(re_x re_y pt_poly re_anglepoly re_angle)))
  (setq re_angleins (dcl-grid-addrow 4 palbib-fin))
  (setq re_angleins blkpoly-point)
  (dcl-combobox-setcursel '(bo_flag ls_props ls_propsbase ls_params ls_dists st_dist re_sign st_x st_y ls_dist))
  (re_off2)
  (eo_hatch)
  (dcl-listbox-getselecteditems re_yinv)
  (setq re_angleins (in_param (polar gvar_2826) 10))
  (setq palbib-fin (row blkpoly-point 1 palbib-fin))
  (setq palbib-fin (row re_angleins 4 palbib-fin))
  (setq polybib_geom-bulge2radius (st_rayon polybib_geom-bulge2radius gvar_2824 palbib-fin))
  (setq gvar_3345 (st_rayon gvar_3345 'polybib-absatpoint polybib_geom-bulge2radius))
  (ls_som0)
)

;; Referenced symbols: LS_PROPSBASE, dcl-combobox-setcursel, BLKBIB-VLGET_ATTS, BLKPOLY-VTX, LS_INNER, LS_PARAMS, RE_YINV, BLKPOLY-HACH, BLKPOLY-TXT, ST_DIST
(defun blkpoly-mod-paramupdate ( / local_0)
  (dcl-combobox-setcursel 'ls_propsbase)
  (setq local_0 blkbib-vlget_atts)
  ;; init-args 3: 'blkpoly-vtx, nil
  (foreach blkpoly-vtx local_0
    (ls_inner blkpoly-vtx)
  )
  (dcl-combobox-setcursel 'ls_params)
  (setq gvar_2917 (blkpoly-hach re_yinv))
  (setq local_0 blkpoly-txt)
  ;; init-args 3: 'st_dist, nil
  (foreach st_dist local_0
    (*ha_blkbase* (dcl-forcedwgredraw bo_invpoly) (rtos (dcl-grid-addrow 1 bo_invpoly2)))
    (st_layer (dcl-forcedwgredraw bo_invpoly) (dcl-grid-addrow 2 bo_invpoly2))
    (dcl-forcedwgredraw (es_ext (dcl-forcedwgredraw bo_invpoly)))
    (setq bo_invpoly (axedyn-reaccreate st_dist))
    (setq gvar_2824 (eo_polyabs st_dist))
    (setq bo_invpoly2 (in_param gvar_2917 gvar_2824))
  )
  (dcl-combobox-setcursel 'st_axe)
  (setq blkbib-vlget_atts (es_ext))
  (setq local_0 blkpoly-txt)
  ;; init-args 3: 'st_dist, nil
  (foreach st_dist local_0
    (setq bo_invpoly (axedyn-reaccreate st_dist))
    (setq blkbib-vlget_atts (dcl-grid-setcurcell blkbib-vlget_atts (re_off1 (dcl-forcedwgredraw bo_invpoly))))
  )
  (ls_som0)
)

;; Original arg hints: arg_1
;; Referenced symbols: ES_EXT, RE_SIGN, ST_X
(defun blkpoly-mod-paramreaccreate (arg_1)
  (st_x (es_ext gvar_2832) nil 're_sign)
)

;; Original arg hints: ST_Y, BLKPOLY-GETDISTX, BLKPOLY-GETDISTY
;; Referenced symbols: ENTDEL, ST_Y, BLKPOLY-GETDISTX, PT_VAR, LS_INNER, ABS, RE_YORIGIN
(defun blkpoly-paramreac1 (st_y blkpoly-getdistx blkpoly-getdisty)
  (entdel '(re_x re_y pt_var re_abs1 re_abs2 re_dist))
  (rem st_y_2)
  (if (setq cdadr (rem st_y_2))
    (progn
      T
      (setq pt_origin blkpoly-getdistx_2)
      (setq re_xorigin st_y_2)
      (re_yorigin st_y_2 'abs)
      (setq pt_var (re_yorigin st_y_2 'abs))
      (and pt_var (ls_inner pt_var))
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: BLKPOLY-GETDISTX
;; Referenced symbols: LS_XYS, ENTDEL, AXEDYN-REACCREATE, LS_STRINGS, RE_ANGLE, POLYBIB-VTXJOIN, LS_SOM0, RE_XORIGIN, BLKPOLY-GETBASEX, PT_ORIGIN
(defun blkpoly-paramreac2 (blkpoly-getdistx / bo_flag ls_props ls_xys ls_xy ls_params ls_param ls_strings st_dist st_axe re_sign st_x st_y local_1)
  (entdel 'ls_xys)
  (or (re_angle (axedyn-reaccreate ls_xys) 'ls_strings) polybib-vtxjoin)
  (ls_som0 (axedyn-reaccreate ls_xys))
  (blkpoly-getbasex re_xorigin)
  T
  (blkpoly-getbasex re_xorigin)
  T
  nil
  (setq pt_origin nil)
  nil
  (setq re_xorigin nil)
  (and (and pt_origin (ls_inner pt_origin)) (and pt_var (ls_inner pt_var) (setq pt_var nil)))
)

;; Original arg hints: arg_1, DISTANCE, LS_VISINAME, *LS_PARAMENTXY*, arg_5
;; Referenced symbols: BLKPOLY-GETBASEY, ENTDEL, ES_EXT, *LS_PARAMENTXY*, dcl-forcedwgredraw, ST_1, IN_PARAM, EO_HACH, ORDREBIB-MOVEABOVE, RE_FLIPX
;; Referenced strings: \nPoint de base :, \ndécalage :, Fin BlKPoly-XY2WCS
(defun blkpoly-ls_entsnew (arg_1 distance ls_visiname *ls_paramentxy* arg_5 / *error* pt_ins re_angle0 re_angle en_blkdroit eo_blkdroit gr pt re_x re_y local_1 local_6)
  (entdel 'blkpoly-getbasey)
  (setq pa_detail_grd_props_update (es_ext))
  (setq st_2 (st_1 (ls_sup (dcl-forcedwgredraw *ls_paramentxy*_2) '(ls_props ls_prop in_num))))
  (setq ordrebib-moveabove (eo_hach (in_param gvar_3396 "\nPoint de base :")))
  (if ordrebib-moveabove
    (progn
      (setq re_flipy (re_flipx (in_param gvar_3396 "\nPoint de base :")))
      (setq re_flipy (in_param re_flipy (in_param gvar_3396 'max)))
      (setq re_base (polybib-lwvertices '(ls_prop re_abs0 re_abs pt re_dist re_base re_angle re_x re_y) re_flipy))
    )
  )
  (setq princl polybib-vtxjoin)
  (setq re_dist (dcl-forcedwgredraw distance_2))
  (setq gvar_3068 (projet_pa_axes_ca_sommet re_dist))
  (setq cos (princl re_dist))
  (setq sin (dcl-grid-addrow 'en_poly (ls_visient 'repdyn-isrep (in_param gvar_3396 "\ndécalage :"))))
  (setq gvar_2787 (dcl-grid-addrow 'en_poly (ls_visient 'repdyn-isrep (in_param gvar_3396 're_decalage))))
  (if (re_ray (in_param gvar_3396 'dcl-control-settext))
    (progn
      (setq gvar_2785 (sin *ls_paramentxy*_2 distance_2 gvar_3396))
      (setq gvar_3094 (re_ang *ls_paramentxy*_2))
    )
  )
  (dcl-combobox-setcursel 'pt_int)
  (setq local_6 st_2)
  ;; init-args 3: 'aopora-fin, nil
  (foreach aopora-fin local_6
    (setq polybib-subpolybisinv (in_param aopora-fin 0))
    (setq pt_abs (in_param gvar_3094 (in_param aopora-fin 5)))
    (setq pt_param T)
    (in_param gvar_3094 (in_param aopora-fin 5))
    (and (and (and (and (and (or (cadr ordrebib-moveabove) (laybib-newlay pt_abs re_base)) (and princl (re_angle "Fin BlKPoly-XY2WCS" polybib-subpolybisinv) (setq pt_abs (in_param gvar_3094 (in_param aopora-fin 5))) (in_param gvar_2785 pt_abs))) (and princl (re_angle "Fin BlKPoly-XY2WCS" polybib-subpolybisinv))) (and princl (re_angle 'projet_pa_detail_btn_param polybib-subpolybisinv))) (and princl (re_angle 'dcl-control-setfocus polybib-subpolybisinv))) (and princl (re_angle 'blkpoly-mod-paramupdate polybib-subpolybisinv)))
    (setq polybib_geom-bulge2radius (pt_param gvar_3153 re_angle0 aopora-fin ls_visiname_2 sin gvar_2787))
    (if polybib_geom-bulge2radius
      (progn
        (setq pa_detail_grd_props_update (dcl-grid-setcurcell pa_detail_grd_props_update (st_rayon (es_ext (groupbib-list 'st_type 'blkpoly-mod-paramupdate) (groupbib-list 're_value pt_param)) polybib_geom-bulge2radius)))
      )
      (progn
        (setq princl nil)
      )
    )
    (dcl-combobox-setcursel "BlkPoly-GetParentEntities")
    (setq polybib_geom-bulge2radius (id_group gvar_3153 re_angle0 aopora-fin ls_visiname_2 sin gvar_2787))
    (if polybib_geom-bulge2radius
      (progn
        (setq pa_detail_grd_props_update (dcl-grid-setcurcell pa_detail_grd_props_update (es_ext (groupbib-list 'st_type 'dcl-control-setfocus) (groupbib-list 're_value pt_param) polybib_geom-bulge2radius)))
      )
      (progn
        (setq princl nil)
      )
    )
    (setq gvar_3137 (id_group (dcl-forcedwgredraw (in_param aopora-fin 255))))
    (setq polybib_geom-bulge2radius (poly-polyside gvar_3153 re_angle0 aopora-fin gvar_3137 ls_visiname_2 sin gvar_2787))
    (if polybib_geom-bulge2radius
      (progn
        (setq pa_detail_grd_props_update (dcl-grid-setcurcell pa_detail_grd_props_update (st_rayon (es_ext (groupbib-list 'st_type 'projet_pa_detail_btn_param) (groupbib-list 're_value pt_param)) polybib_geom-bulge2radius)))
      )
      (progn
        (setq princl nil)
      )
    )
    (setq polybib_geom-bulge2radius (poly-polyside gvar_3153 re_angle0 aopora-fin ls_visiname_2 sin gvar_2787))
    (if polybib_geom-bulge2radius
      (progn
        (setq pa_detail_grd_props_update (dcl-grid-setcurcell pa_detail_grd_props_update (es_ext (groupbib-list 'st_type 'in_pos) (groupbib-list 're_deltay pt_abs) (groupbib-list 're_value pt_param) (axedyn-reaccreate polybib_geom-bulge2radius) (re_x polybib_geom-bulge2radius))))
      )
      (progn
        (setq princl nil)
      )
    )
    (setq vla-put-insertionpoint (re_ray (in_param gvar_2785 pt_abs)))
    (setq polybib_geom-bulge2radius (poly-polyside gvar_3153 re_angle0 aopora-fin ls_visiname_2 sin gvar_2787))
    (if polybib_geom-bulge2radius
      (progn
        (setq pa_detail_grd_props_update (dcl-grid-setcurcell pa_detail_grd_props_update (es_ext (groupbib-list 'st_type 'projet_pa_detail_txt_value) (groupbib-list '(st_type ls_props ls_prop) vla-put-insertionpoint) (axedyn-reaccreate polybib_geom-bulge2radius) (re_x polybib_geom-bulge2radius) (groupbib-list 're_value pt_param))))
      )
      (progn
        (setq princl nil)
      )
    )
  )
  (if princl
    (progn
      pa_detail_grd_props_update
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: LS_PROPSDESCS
;; Referenced symbols: LS_PROPSDESCS, ST_SYLE
(defun polybib-absrem (ls_propsdescs / re_tan pt_1 pt_2 ha_ext en_ext pt_proj in_param ls_soms in_length ls_vtxs ls_som pt_ptp1 pt_ptp2 local_1)
  (>= (st_syle re_tan (repdyn-get ls_propsdescs_2)) (repdyn-get ls_propsdescs_2))
)

;; Original arg hints: arg_1, BLKPOLY-GET, LS_VISINAME, SIN
;; Referenced symbols: RE_DELTAX, ENTDEL, HA_POLY, LS_VISINAME, SIN, BLKPOLY-GET, AXEDYN-REACCREATE, LS_VISIENT, ST_SYLE, RE_X
(defun blkpoly-point (arg_1 blkpoly-get ls_visiname sin / *error* pt_ins re_angle0 re_angle en_blkdroit eo_blkdroit gr pt re_x re_y ls_prop re_abs0 re_abs re_base pt_2 re_dist re_angle_2 re_x_2 re_y_2 local_1 local_5)
  (entdel 're_deltax)
  (setq gvar_2939 'ha_poly)
  (setq gvar_3159 (st_syle ls_visiname_2 (ls_visient sin_2 (axedyn-reaccreate blkpoly-get_2))))
  (if (and (re_deltax re_angle0) (and (re_deltax gvar_3159 'ha_poly) (re_deltax gvar_3159 (repdyn-get re_angle0))))
    (progn
      (setq gvar_3159 (re_deltax re_angle0 gvar_3159))
      (setq gvar_3158 (ls_visient gvar_2787 (re_x blkpoly-get_2)))
      (setq gvar_2767 (ls_param re_angle0 gvar_3159))
      (setq gvar_2767 (ls_blk gvar_3153 gvar_2767 nil))
      (if gvar_2767
        (progn
          (setq gvar_2765 (getvar gvar_3153 gvar_2767))
          (setq ls_prop (st_syle gvar_2939 (getvar gvar_3153 gvar_2767)))
          (setq blkpoly-get_2 (getvar gvar_2767 (st_syle (repdyn-isrep gvar_3236 'repdyn-isrep) gvar_2765) gvar_3158))
        )
      )
    )
  )
  blkpoly-get_2
)

;; Original arg hints: arg_1, dcl-form-close, LS_VISINAME, SIN
;; Referenced symbols: LS_BLK, ENTDEL, ES_EXT, dcl-form-close, AXEDYN-REACCREATE, dcl-combobox-addlist, IN_PARAM, SIN, LS_VISIENT, EO_POLYABS
(defun blkpoly-vtx (arg_1 dcl-form-close ls_visiname sin / *error* pt_ins re_angle0 re_angle en_blkdroit eo_blkdroit gr pt re_x re_y ls_prop re_abs0 re_abs re_base pt_2 re_dist re_angle_2 re_x_2 re_y_2 local_1 local_5 local_6 local_7)
  (entdel 'ls_blk)
  (setq projet_md_repblk_cb_blk1 (es_ext))
  (setq dcl-combobox-addlist (axedyn-reaccreate dcl-form-close_2))
  (setq projet_md_repblk_cb_blk2 (in_param dcl-combobox-addlist 10))
  (setq ls_update (ls_visient sin_2 gvar_2787 (in_param dcl-combobox-addlist 42)))
  (setq local_6 (eo_polyabs dcl-form-close_2))
  ;; init-args 3: 'c:projet_md_repblk_oninitialize, nil
  (foreach gvar_2759_c_projet_md_repblk_oninitialize local_6
    (setq projet_md_repblk_cb_blk1 (vl-acad-defun projet_md_repblk_cb_blk1))
    (setq gvar_2767 (in_param gvar_2759_c_projet_md_repblk_oninitialize 10))
    (setq projet_pa_detail_vueblocs1 (st_syle ls_visiname_2 (ls_visient sin_2 (axedyn-reaccreate projet_md_repblk_cb_blk2))))
    (setq gvar_2956 (st_syle ls_visiname_2 (ls_visient sin_2 (axedyn-reaccreate gvar_2767))))
    (setq projet_md_repblk_bv_1 nil)
    (setq dcl-blockview-displayblock nil)
    (if (and (and re_base (re_deltax re_angle0)) (and re_base (re_deltax projet_pa_detail_vueblocs1 'ha_poly) (re_deltax gvar_2956 'ha_poly) (re_deltax projet_pa_detail_vueblocs1 gvar_2983) (re_deltax gvar_2956 gvar_2983)))
      (progn
        (if (or (re_deltax projet_pa_detail_vueblocs1 'ha_poly) (re_deltax projet_pa_detail_vueblocs1 gvar_2983))
          (progn
            (setq projet_pa_detail_vueblocs1 (re_deltax re_angle0 projet_pa_detail_vueblocs1))
            (setq projet_md_repblk_bv_1 polybib-vtxjoin)
          )
        )
        (if (or (re_deltax gvar_2956 'ha_poly) (re_deltax gvar_2956 gvar_2983))
          (progn
            (setq gvar_2956 (re_deltax re_angle0 gvar_2956))
            (setq dcl-blockview-displayblock polybib-vtxjoin)
          )
        )
        (if (re_angle projet_md_repblk_bv_1 dcl-blockview-displayblock)
          (progn
            (setq gvar_2755_c_projet_md_repblk_cb_blk1_onselchanged nil)
          )
          (progn
            (setq gvar_2755_c_projet_md_repblk_cb_blk1_onselchanged polybib-vtxjoin)
          )
        )
        (setq gvar_3244 (*st_errmsg* gvar_3153 (ls_param re_angle0 projet_pa_detail_vueblocs1)))
        (setq gvar_3242 (*st_errmsg* gvar_3153 (ls_param re_angle0 gvar_2956)))
        (if (and gvar_2755_c_projet_md_repblk_cb_blk1_onselchanged (re_deltax projet_pa_detail_vueblocs1 gvar_2956))
          (progn
            (setq projet_md_repblk_bv_2 (ls_visient 255 gvar_2787 (re_x projet_md_repblk_cb_blk2)))
            (setq gvar_2753_c_projet_md_repblk_cb_blk2_onselchanged (ls_visient 255 gvar_2787 (re_x gvar_2767)))
          )
          (progn
            (setq projet_md_repblk_bv_2 (ls_visient gvar_2787 (re_x projet_md_repblk_cb_blk2)))
            (setq gvar_2753_c_projet_md_repblk_cb_blk2_onselchanged (ls_visient gvar_2787 (re_x gvar_2767)))
          )
        )
        (or (and (and (or (ls_ext2 (axedyn-reaccreate projet_md_repblk_cb_blk2) (axedyn-reaccreate gvar_2767) '(st_blk1 st_blk2 ls_blk st_msg bo_go)) (ls_ext2 projet_md_repblk_bv_2 gvar_2753_c_projet_md_repblk_cb_blk2_onselchanged '(st_blk1 st_blk2 ls_blk st_msg bo_go))) (and (odclbib-fillcombo ls_update 'ha_poly) (projet_pa_axes_st_desc projet_md_repblk_bv_2 gvar_2753_c_projet_md_repblk_cb_blk2_onselchanged))) (and (re_angle (ocbib-id2ref (*st_errmsg* gvar_3153 gvar_3244)) (ocbib-id2ref (*st_errmsg* gvar_3153 gvar_3242))) (re_angle 'ha_poly (in_param (dcl-grid-addrow (ocbib-id2ref (*st_errmsg* gvar_3153 gvar_3244)) (blkpoly-set (polar gvar_3153))) 42)))) (projet_pa_axes_st_desc projet_md_repblk_bv_2 gvar_2753_c_projet_md_repblk_cb_blk2_onselchanged))
        (setq st_blk2 (st_blk1 (in_param dcl-combobox-addlist 10) (in_param gvar_2759_c_projet_md_repblk_oninitialize 10) (ls_visient ls_update sin_2 gvar_2787) '(st_blk1 st_blk2 ls_blk st_msg bo_go)))
        (setq gvar_2749 (es_ext))
        (setq local_7 st_blk2)
        ;; init-args 3: 'st_msg, nil
        (foreach st_msg local_7
          (setq gvar_2749 (dcl-grid-setcurcell gvar_2749 (es_ext (groupbib-list 10 (st_msg gvar_3153 re_angle0 (st_rayon (in_param st_msg 10) (es_ext 'ha_poly)) ls_visiname_2 sin_2 gvar_2787)))))
        )
        (setq gvar_2749 (es_ext (es_ext (groupbib-list 10 (st_msg gvar_3153 re_angle0 projet_md_repblk_cb_blk2 ls_visiname_2 sin_2 gvar_2787)) (groupbib-list 40 'ha_poly) (groupbib-list 41 'ha_poly) (groupbib-list 42 ls_update)) (es_ext (groupbib-list 10 (st_msg gvar_3153 re_angle0 gvar_2767 ls_visiname_2 sin_2 gvar_2787)) (groupbib-list 40 'ha_poly) (groupbib-list 41 'ha_poly) (groupbib-list 42 'ha_poly))))
        (setq gvar_2749 (bo_go gvar_3153 gvar_3244 gvar_3242 (dcl-grid-addrow projet_md_repblk_bv_2) (dcl-grid-addrow gvar_2753_c_projet_md_repblk_cb_blk2_onselchanged) gvar_2755_c_projet_md_repblk_cb_blk1_onselchanged))
        (setq gvar_2749 (alert gvar_3153 gvar_3244 gvar_3242 (dcl-grid-addrow projet_md_repblk_bv_2) polybib-vtxjoin gvar_2755_c_projet_md_repblk_cb_blk1_onselchanged))
        (setq gvar_2749 (c:projet_md_repblk_bt_add_onclicked gvar_3153 gvar_3244 projet_md_repblk_bv_2 gvar_2753_c_projet_md_repblk_cb_blk2_onselchanged ls_update gvar_2787))
        (setq projet_md_repblk_cb_blk1 (st_rayon projet_md_repblk_cb_blk1 gvar_2749))
        (setq dcl-combobox-addlist gvar_2759_c_projet_md_repblk_oninitialize)
      )
      (progn
        (setq re_base nil)
      )
    )
    (setq ls_update (ls_visient (in_param gvar_2759_c_projet_md_repblk_oninitialize 42) sin_2 gvar_2787))
    (setq projet_md_repblk_cb_blk2 gvar_2767)
  )
  projet_md_repblk_cb_blk1
)

;; Original arg hints: arg_1, AOPORA-FIN, LS_VISINAME, SIN
;; Referenced symbols: ENTDEL, POLYBIB-VTXJOIN, AOPORA-FIN, IN_PARAM, PROJET/MD_REPBLK/GR_REPBLK, dcl-forcedwgredraw, C:PROJET/MD_REPBLK/GR_REPBLK#ONSELCHANGED, GROUPBIB-LIST, C:PROJET/MD_REPBLK/BT_DEL#ONCLICKED, ES_EXT
;; Referenced strings: Appliquer, Choix du ficher
(defun blkpoly-hach (arg_1 aopora-fin ls_visiname sin / *error* pt_ins re_angle0 re_angle en_blkdroit eo_blkdroit gr pt re_x re_y ls_prop re_abs0 re_abs re_base pt_2 re_dist re_angle_2 re_x_2 re_y_2 local_1 local_5 local_6)
  (entdel '(ls_repblk))
  (setq re_base polybib-vtxjoin)
  (setq projet_md_repblk_gr_repblk (in_param aopora-fin_2 255))
  (setq gvar_2741_c_projet_md_repblk_gr_repblk_onselchanged (dcl-forcedwgredraw projet_md_repblk_gr_repblk))
  (setq polybib_geom-bulge2radius (es_ext (groupbib-list "Appliquer" (ls_sup gvar_2741_c_projet_md_repblk_gr_repblk_onselchanged "Appliquer")) (groupbib-list '(st_blk ls_repblk) (ls_sup gvar_2741_c_projet_md_repblk_gr_repblk_onselchanged '(st_blk ls_repblk))) (groupbib-list 'c:projet_md_repblk_bt_del_onclicked (ls_sup gvar_2741_c_projet_md_repblk_gr_repblk_onselchanged 'c:projet_md_repblk_bt_del_onclicked)) (groupbib-list '(st_file ls_reps ls_repblks) (ls_sup gvar_2741_c_projet_md_repblk_gr_repblk_onselchanged '(st_file ls_reps ls_repblks)))))
  (setq ls_prop (ls_sup gvar_2741_c_projet_md_repblk_gr_repblk_onselchanged "Choix du ficher"))
  (setq gvar_2939 (getvar re_angle0 (ls_param re_angle0 ls_visiname_2)))
  (setq ls_prop (st_syle ls_prop gvar_2939))
  (setq gvar_2735 (getfiled projet_md_repblk_gr_repblk))
  (setq re_base polybib-vtxjoin)
  (setq getfiled (es_ext))
  (setq st_file (es_ext))
  (setq local_6 (axedyn-reaccreate gvar_2735))
  ;; init-args 3: 'filebib-readcsv, nil
  (foreach filebib-readcsv local_6
    (setq getfiled (dcl-grid-setcurcell getfiled (filebib-readcsv gvar_3153 re_angle0 filebib-readcsv ls_visiname_2 sin_2 gvar_2787)))
  )
  (setq local_6 (eo_polyabs gvar_2735))
  ;; init-args 3: 'c:projet_md_repblk_bt_load_onclicked, nil
  (foreach gvar_2730_c_projet_md_repblk_bt_load_onclicked local_6
    (if gvar_2730_c_projet_md_repblk_bt_load_onclicked
      (progn
        (setq st_file (dcl-grid-setcurcell st_file (filebib-readcsv gvar_3153 re_angle0 gvar_2730_c_projet_md_repblk_bt_load_onclicked ls_visiname_2 sin_2 gvar_2787)))
      )
    )
  )
  (if re_base
    (progn
      (es_ext (groupbib-list 'blkpolymod-close getfiled) (groupbib-list '(st_file ls_temp) st_file) (groupbib-list 'ld_detail (ls_sup gvar_2741_c_projet_md_repblk_gr_repblk_onselchanged '(lambda (ls_repblk) (list (car ls_repblk) (cdr ls_repblk))))) (groupbib-list '(ls_parents) (ls_sup gvar_2741_c_projet_md_repblk_gr_repblk_onselchanged 'ls_temp)) (groupbib-list '(ls_parents ls_props ls_prop) ls_prop) (groupbib-list 'blkpoly-getparents (ls_sup gvar_2741_c_projet_md_repblk_gr_repblk_onselchanged 'filebib-writecsv)) (groupbib-list 'polybib-absatpoint polybib_geom-bulge2radius))
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: arg_1, AOPORA-FIN, LS_VISINAME, SIN
;; Referenced symbols: C:PROJET/MD_REPBLK/BT_SAVE#ONCLICKED, ENTDEL, AOPORA-FIN, IN_PARAM, LS_PROPSDESCS, dcl-forcedwgredraw, Projet/MD_RepBlk, GROUPBIB-LIST, C:PROJET/MD_REPBLK/BT_OK#ONCLICKED, dcl-project-load
;; Referenced strings: Appliquer, Projet
(defun blkpoly-poly (arg_1 aopora-fin ls_visiname sin / *error* pt_ins re_angle0 re_angle en_blkdroit eo_blkdroit gr pt re_x re_y ls_prop re_abs0 re_abs re_base pt_2 re_dist re_angle_2 re_x_2 re_y_2 local_1 local_5)
  (entdel 'c:projet_md_repblk_bt_save_onclicked)
  (setq ls_propsdescs (in_param aopora-fin_2 255))
  (setq projet_md_repblk (dcl-forcedwgredraw ls_propsdescs))
  (setq gvar_2983 (repdyn-get gvar_3153))
  (groupbib-list "Appliquer" (ls_sup projet_md_repblk "Appliquer"))
  (groupbib-list '(st_blk ls_repblk) (ls_sup projet_md_repblk '(st_blk ls_repblk)))
  (groupbib-list 'c:projet_md_repblk_bt_ok_onclicked (ls_sup projet_md_repblk 'c:projet_md_repblk_bt_ok_onclicked))
  (groupbib-list "Projet" (ls_sup projet_md_repblk "Projet"))
  'dcl-project-load
  (if (in_param aopora-fin_2 43)
    (progn
      (in_param aopora-fin_2 43)
    )
    (progn
      0
    )
  )
  (setq polybib_geom-bulge2radius (es_ext (groupbib-list) (groupbib-list 'c:projet_md_repblk_bt_del_onclicked (ls_sup projet_md_repblk 'c:projet_md_repblk_bt_del_onclicked)) (groupbib-list '(st_file ls_reps ls_repblks) (ls_sup projet_md_repblk '(st_file ls_reps ls_repblks))) (groupbib-list '(ss_blk ls_blk) (ls_sup projet_md_repblk '(ss_blk ls_blk)))))
  (setq dcl-form-close (blkpoly-set (polar ls_propsdescs)))
  (setq projet_md_repblk_cb_blk1 (es_ext))
  (setq re_base polybib-vtxjoin)
  (if (re_angle ld_mod (ls_sup projet_md_repblk '(ss_blk ls_blk)))
    (progn
      (setq dcl-form-close (dcl-grid-setcurcell dcl-form-close (axedyn-reaccreate dcl-form-close)))
    )
  )
  (if (repdyn-getpoint sin_2 0)
    (progn
      (setq gvar_3385 (ssget gvar_3385))
    )
  )
  (setq projet_md_repblk_cb_blk1 (filebib-readcsv gvar_3153 re_angle0 dcl-form-close ls_visiname_2 sin_2 gvar_2787))
  (if re_base
    (progn
      (es_ext (groupbib-list 'blkpolydial-getrep projet_md_repblk_cb_blk1) (groupbib-list 'polybib-absatpoint polybib_geom-bulge2radius))
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: arg_1, AOPORA-FIN, arg_3, LS_VISINAME, SIN
;; Referenced symbols: SSGET, ENTDEL, AOPORA-FIN, IN_PARAM, dcl-forcedwgredraw, ES_EXT, VA_FIN, BO_INV, AXEDYN-REACCREATE, EO_POLYABS
;; Referenced strings: Bordure , Appliquer
(defun blkpoly-blk (arg_1 aopora-fin arg_3 ls_visiname sin / *error* pt_ins re_angle0 re_angle en_blkdroit eo_blkdroit gr pt re_x re_y ls_prop re_abs0 re_abs re_base pt_2 re_dist re_angle_2 re_x_2 re_y_2 local_1 local_6 local_7)
  (entdel 'ssget)
  (setq ss_blk nil)
  (setq axedyn-get (dcl-forcedwgredraw (in_param aopora-fin_2 255)))
  (setq blkpoly-get (in_param aopora-fin_2 10))
  (setq dcl-listbox-clear (in_param aopora-fin_2 2))
  (setq blkbib-blkname (in_param aopora-fin_2 41))
  (setq gvar_2939 (in_param aopora-fin_2 50))
  (setq ssbib-ss2li (es_ext))
  (setq gvar_3011 nil)
  (setq local_7 gvar_2714)
  ;; init-args 3: 'va_fin, nil
  (foreach va_fin local_7
    (setq bo_inv (dcl-grid-setcurcell bo_inv (groupbib-list (axedyn-reaccreate va_fin) (eo_polyabs va_fin))))
    (setq bo_inv (dcl-grid-setcurcell bo_inv (groupbib-list (eo_polyabs va_fin) (axedyn-reaccreate va_fin))))
  )
  (or (and (and (and (and (and (and (re_angle sin_2 'en_poly) (re_angle gvar_2787 'en_poly)) (and (re_angle sin_2 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)) (re_angle gvar_2787 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)))) (and (re_angle gvar_2787 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)) (ls_ext2 dcl-listbox-clear (in_param bo_inv dcl-listbox-clear)))) (and (re_angle sin_2 'en_poly) (re_angle gvar_2787 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)) (ls_ext2 dcl-listbox-clear (in_param bo_inv dcl-listbox-clear)))) (and (re_angle sin_2 'en_poly) (re_angle gvar_2787 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)) (in_param bo_inv dcl-listbox-clear))) (and (re_angle sin_2 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)) (re_angle gvar_2787 'en_poly) (in_param bo_inv dcl-listbox-clear))) (ls_inters dcl-listbox-clear))
  (setq gvar_2939 (st_syle gvar_3236 gvar_2939))
  (setq dcl-listbox-clear (in_param bo_inv dcl-listbox-clear))
  (setq dcl-listbox-clear (in_param bo_inv dcl-listbox-clear))
  (setq gvar_2939 (st_syle gvar_3236 gvar_2939))
  (setq dcl-listbox-clear (in_param bo_inv dcl-listbox-clear))
  (setq dcl-listbox-clear (in_param bo_inv dcl-listbox-clear))
  (dcl-combobox-setcursel '(in_id st_id ld_bord))
  (setq gvar_2939 gvar_2939)
  (dcl-combobox-setcursel "Bordure ")
  (setq gvar_2939 gvar_2939)
  (setq blkbib-blkname (es_ext (ls_visient sin_2 (in_param aopora-fin_2 41)) (ls_visient gvar_2787 (in_param aopora-fin_2 42)) 1))
  (setq polybib_geom-bulge2radius (es_ext (groupbib-list "Appliquer" (ls_sup axedyn-get "Appliquer")) (groupbib-list '(st_blk ls_repblk) (ls_sup axedyn-get '(st_blk ls_repblk))) (groupbib-list '(st_file ls_reps ls_repblks) (ls_sup axedyn-get '(st_file ls_reps ls_repblks)))))
  (setq gvar_3159 (st_syle (ls_visient sin_2 (axedyn-reaccreate blkpoly-get)) ls_visiname_2))
  (if (and (re_deltax gvar_3159 'ha_poly) (re_deltax gvar_3159 (repdyn-get re_angle0)))
    (progn
      (setq gvar_3158 (ls_visient gvar_2787 (re_x blkpoly-get)))
      (setq gvar_2767 (ls_param re_angle0 gvar_3159))
      (setq gvar_2767 (ls_blk gvar_3153 gvar_2767 nil))
      (if gvar_2767
        (progn
          (setq gvar_2765 (getvar gvar_3153 gvar_2767))
          (setq ls_prop (st_syle gvar_2939 gvar_2765))
          (setq blkpoly-get (getvar gvar_2767 (st_syle (repdyn-isrep gvar_3236 'repdyn-isrep) gvar_2765) gvar_3158))
          (setq gvar_3011 (es_ext (groupbib-list 'itemindexorcount dcl-listbox-clear) (groupbib-list 'eo_paramreact blkpoly-get) (groupbib-list 'value blkbib-blkname) (groupbib-list '(ls_parents ls_props ls_prop) ls_prop) (groupbib-list 'blkpolydial-modrefbouton gvar_3137) (groupbib-list 'polybib-absatpoint polybib_geom-bulge2radius)))
        )
      )
    )
  )
  gvar_3011
)

;; Original arg hints: arg_1, AOPORA-FIN, LS_VISINAME, SIN
;; Referenced symbols: ENTDEL, AOPORA-FIN, IN_PARAM, dcl-forcedwgredraw, ES_EXT, LD_BORD, SSBIB-SS2LI, AXEDYN-REACCREATE, RE_X, GROUPBIB-LIST
;; Referenced strings: va_fin, Appliquer, Destruction des paramètres
(defun blkpoly-txt (arg_1 aopora-fin ls_visiname sin / *error* pt_ins re_angle0 re_angle en_blkdroit eo_blkdroit gr pt re_x re_y ls_prop re_abs0 re_abs re_base pt_2 re_dist re_angle_2 re_x_2 re_y_2 local_1 local_5 local_6)
  (entdel "va_fin")
  (setq gvar_2707 nil)
  (setq gvar_2706 (dcl-forcedwgredraw (in_param aopora-fin_2 255)))
  (setq blkpoly-get (in_param aopora-fin_2 10))
  (setq gvar_2705 (in_param aopora-fin_2 11))
  (setq gvar_3255 (in_param aopora-fin_2 1))
  (setq gvar_2939 (in_param aopora-fin_2 50))
  (setq gvar_2704 (in_param aopora-fin_2 40))
  (setq ssbib-ss2li (es_ext))
  (setq gvar_3011 nil)
  (setq local_6 gvar_2703)
  ;; init-args 3: 'ld_bord, nil
  (foreach ld_bord local_6
    (setq ssbib-ss2li (dcl-grid-setcurcell ssbib-ss2li (groupbib-list (axedyn-reaccreate ld_bord) (re_x ld_bord))))
    (setq ssbib-ss2li (dcl-grid-setcurcell ssbib-ss2li (groupbib-list (re_x ld_bord) (axedyn-reaccreate ld_bord))))
  )
  (setq polybib_geom-bulge2radius (es_ext (groupbib-list "Appliquer" (ls_sup gvar_2706 "Appliquer")) (groupbib-list '(st_blk ls_repblk) (ls_sup gvar_2706 '(st_blk ls_repblk))) (groupbib-list '(st_file ls_reps ls_repblks) (ls_sup gvar_2706 '(st_file ls_reps ls_repblks))) (groupbib-list 'bordyn-set (ls_sup gvar_2706 'bordyn-set))))
  (setq blkpoly-get (st_msg gvar_3153 re_angle0 blkpoly-get ls_visiname_2 sin_2 gvar_2787))
  (setq bordyn-getparents (st_msg gvar_3153 re_angle0 gvar_2705 ls_visiname_2 sin_2 gvar_2787))
  (setq gvar_3011 (es_ext (groupbib-list "Destruction des paramètres" gvar_3255) (groupbib-list 'eo_paramreact blkpoly-get) (groupbib-list "Destruction des variables" bordyn-getparents) (groupbib-list 'vlr-remove gvar_2704) (groupbib-list '(ls_parents ls_props ls_prop) ls_prop) (groupbib-list 'polybib-absatpoint polybib_geom-bulge2radius) (groupbib-list 71 (in_param aopora-fin_2 71)) (groupbib-list 72 (in_param aopora-fin_2 72)) (groupbib-list 73 (in_param aopora-fin_2 73))))
  gvar_3011
)

;; Referenced symbols: BLKPOLY-POLY, EN_POLY, LS_BORDYN, RE_RAD, ES_EXT, RE_RAYONMIN, RE_LARG, VL-REMOVE-IF-NOT, LS_BORD, LS_RADS
(defun blkpoly-lsparams ()
  (es_ext (es_ext '(ls_parents va_deb va_fin) 'blkpoly-poly 'en_poly 'ls_bordyn 're_rad) (es_ext 're_rayonmin 'blkpoly-poly 'en_poly 're_larg '(ls_bord a)) (es_ext '(lambda (a) (equal re_rad (car a) re_larg)) 'blkpoly-poly '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) 're_larg '(ls_bord a)) (es_ext 'vl-remove-if-not 'blkpoly-poly 'en_poly 'ls_bord '(inc ls_rads ls_vtx1 ls_vtx2 pt_1 pt_2 re_bulge re_rad)) (es_ext 'ls_rads 'blkpoly-poly '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) 'ls_bord '(inc ls_rads ls_vtx1 ls_vtx2 pt_1 pt_2 re_bulge re_rad)) (es_ext 'ls_vtx1 'ls_vtx2 'en_poly 'ls_bordyn 're_rad) (es_ext '(ls_abs inc ls_vtxsinters ls_vtxinters re_abs1 re_abs2) 'ls_vtx2 'en_poly 're_larg '(ls_bord a)) (es_ext 'poly-lspolyint 'ls_vtx2 'en_poly 'ls_bord '(inc ls_rads ls_vtx1 ls_vtx2 pt_1 pt_2 re_bulge re_rad)) (es_ext 'ls_abs 'ls_vtx2 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) 'ls_bordyn 're_rad) (es_ext 'ls_vtxsinters 'ls_vtx2 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) 're_larg '(ls_bord a)) (es_ext 'polybib-subvertices 'ls_vtx2 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) 'ls_bord '(inc ls_rads ls_vtx1 ls_vtx2 pt_1 pt_2 re_bulge re_rad)))
)

;; Original arg hints: RE_DIST, arg_2, *LS_PARAMREACT*, BLKPOLY-GET, LS_VTXINTERS
;; Referenced symbols: ENTDEL, POLYBIB-VTXJOIN, RE_DIST, ES_EXT, *LS_PARAMREACT*, DCL-GRID-ADDROW, PRINCL, POLYBIB_GEOM-BULGE2RADIUS, OCBIB-ID2ENT, RE_ANGLE0
;; Referenced strings: Distance2_YN
(defun blkpoly-getdist (re_dist arg_2 *ls_paramreact* blkpoly-get ls_vtxinters / *error* pt_ins re_angle0 re_angle en_blkdroit eo_blkdroit gr pt re_x re_y local_2 local_6)
  (entdel '(ld_bord ls_group en_ref va_deb re_deb va_fin re_fin re_cote))
  (setq princl polybib-vtxjoin)
  (setq bordyn-get (princl re_dist_2))
  (setq gvar_2678 (re_angleins))
  (setq *ls_props0* (es_ext))
  (setq local_6 gvar_2678)
  ;; init-args 3: "Distance2_YN", nil
  (foreach gvar_2822 local_6
    (setq polybib_geom-bulge2radius (princl *ls_paramreact*_2))
    (setq ocbib-id2ent (dcl-grid-addrow 0 gvar_2822))
    (setq en_ref (dcl-grid-addrow 1 gvar_2822))
    (setq gvar_2675 (dcl-grid-addrow 2 gvar_2822))
    (setq repdyn-getabs (dcl-grid-addrow 3 gvar_2822))
    (setq re_deb (dcl-grid-addrow 4 gvar_2822))
    (if (and princl polybib_geom-bulge2radius (re_angle0 ocbib-id2ent polybib_geom-bulge2radius))
      (progn
        (if (re_angle en_ref 'blkpoly-poly)
          (progn
            (re_deb re_dist_2 gvar_3153 re_angle0 blkpoly-get_2 ls_vtxinters_2 bordyn-get polybib_geom-bulge2radius ocbib-id2ent gvar_2675 repdyn-getabs re_deb)
          )
          (progn
            (re_fin re_dist_2 gvar_3153 re_angle0 blkpoly-get_2 ls_vtxinters_2 bordyn-get polybib_geom-bulge2radius ocbib-id2ent gvar_2675 repdyn-getabs re_deb)
          )
        )
        (setq gvar_3051 nil)
        (if gvar_3051
          (progn
            (dcl-grid-setcurcell *ls_props0* gvar_3051)
          )
          (progn
            nil
          )
        )
        (setq *ls_props0* nil)
        (if gvar_3051
          (progn
            polybib-vtxjoin
          )
          (progn
            nil
          )
        )
        (setq princl nil)
      )
    )
    (if princl
      (progn
        (getpoint *ls_paramreact*_2 *ls_props0*)
      )
    )
  )
  *ls_props0*
)

;; Original arg hints: RE_DIST, arg_2, BLKPOLY-GET, LS_VTXINTERS, BORDYN-GET, POLYBIB_GEOM-BULGE2RADIUS, OCBIB-ID2ENT, arg_8, REPDYN-GETABS, RE_DEB
;; Referenced symbols: HA_POLYINT, ENTDEL, EN_POLY, REPDYN-ISREP, BORDYN-GET, ST_MESSAGE, IN_PARAM, LS_VISIENT, REPDYN-GETABS, RE_DEB
(defun blkpoly-getdistx (re_dist arg_2 blkpoly-get ls_vtxinters bordyn-get polybib_geom-bulge2radius ocbib-id2ent arg_8 repdyn-getabs re_deb / *error* pt_ins re_angle0 re_angle en_blkdroit eo_blkdroit gr pt re_x re_y local_2)
  (entdel 'ha_polyint)
  (setq sin (dcl-grid-addrow 'en_poly (ls_visient 'repdyn-isrep (in_param bordyn-get_2 'st_message))))
  (setq gvar_3159 (in_param bordyn-get_2 repdyn-getabs_2))
  (setq gvar_3158 (in_param bordyn-get_2 re_deb_2))
  (setq bordyn-trace (ha_polyext (laybib-newlay (re_angle0 ocbib-id2ent_2 polybib_geom-bulge2radius_2) polybib_geom-bulge2radius_2)))
  (setq ls_intext (ls_visient (axedyn-reaccreate bordyn-trace) sin))
  (setq entib-handle2ename (getvar blkpoly-get_2 (st_syle ls_vtxinters_2 (blkbib-getvisient (es_ext 'ha_poly 'ha_poly) (es_ext gvar_3159 gvar_3158))) (pt_ref (es_ext 'ha_poly 'ha_poly) (es_ext gvar_3159 gvar_3158))))
  (setq blkpoly-get_2 (ls_blk re_angle0 blkpoly-get_2 nil))
  (setq entib-handle2ename (ls_blk re_angle0 entib-handle2ename nil))
  (if (and blkpoly-get_2 entib-handle2ename)
    (progn
      (setq projet_pa_detail_vueblocs1 (dcl-control-setvisible re_angle0 blkpoly-get_2))
      (setq gvar_2956 (dcl-control-setvisible re_angle0 entib-handle2ename))
      (setq pt_ref (entib-handle2ename (ls_visient gvar_2675 sin (dcl-grid-addrow gvar_2956 projet_pa_detail_vueblocs1 ls_intext))))
      (groupbib-list ocbib-id2ent_2 pt_ref)
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: RE_DIST, arg_2, BLKPOLY-GET, LS_VTXINTERS, BORDYN-GET, POLYBIB_GEOM-BULGE2RADIUS, OCBIB-ID2ENT, arg_8, REPDYN-GETABS, RE_DEB
;; Referenced symbols: HA_POLYINT, ENTDEL, EN_POLY, REPDYN-ISREP, BORDYN-GET, ST_MESSAGE, IN_PARAM, LS_VISIENT, REPDYN-GETABS, RE_DEB
(defun blkpoly-getdisty (re_dist arg_2 blkpoly-get ls_vtxinters bordyn-get polybib_geom-bulge2radius ocbib-id2ent arg_8 repdyn-getabs re_deb / *error* pt_ins re_angle0 re_angle en_blkdroit eo_blkdroit gr pt re_x re_y local_2)
  (entdel 'ha_polyint)
  (setq sin (dcl-grid-addrow 'en_poly (ls_visient 'repdyn-isrep (in_param bordyn-get_2 'st_message))))
  (setq gvar_3159 (in_param bordyn-get_2 repdyn-getabs_2))
  (setq gvar_3158 (in_param bordyn-get_2 re_deb_2))
  (setq bordyn-trace (ha_polyext (laybib-newlay (re_angle0 ocbib-id2ent_2 polybib_geom-bulge2radius_2) polybib_geom-bulge2radius_2)))
  (setq groupbib-remove (re_x bordyn-trace))
  (setq entib-handle2ename (getvar blkpoly-get_2 (st_syle ls_vtxinters_2 (blkbib-getvisient (es_ext 'ha_poly 'ha_poly) (es_ext gvar_3159 gvar_3158))) (pt_ref (es_ext 'ha_poly 'ha_poly) (es_ext gvar_3159 gvar_3158))))
  (setq gvar_3241 (ls_blk re_angle0 entib-handle2ename nil))
  (if gvar_3241
    (progn
      (setq pt_ref (pt_ref gvar_3241 entib-handle2ename))
      (setq pt_ref (dcl-grid-addrow pt_ref groupbib-remove))
      (groupbib-list ocbib-id2ent_2 pt_ref)
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: :vlax-false, arg_2, ENTLAST, arg_4, arg_5
;; Referenced symbols: GROUPBIB-DELGROUP, ENTDEL, POLYBIB-VTXJOIN, :vlax-false, ES_EXT, BLKPOLY-POLY, EN_POLY, LS_BORDYN, RE_RAD, RE_RAYONMIN
;; Referenced strings: Distance2_YN
(defun blkpoly-getbase (_vlax-false arg_2 entlast arg_4 arg_5 / local_5)
  (entdel 'groupbib-delgroup)
  (setq princl polybib-vtxjoin)
  (setq polybib_geom-bulge2radius (ordrebib-moveabove _vlax-false_2))
  (setq gvar_2662 (es_ext))
  (setq groupbib-ls2group (es_ext))
  (setq gvar_2678 (es_ext (es_ext '(ls_parents va_deb va_fin) 'blkpoly-poly 'en_poly 'ls_bordyn 're_rad) (es_ext 're_rayonmin 'blkpoly-poly 'en_poly 're_larg '(ls_bord a)) (es_ext '(lambda (a) (equal re_rad (car a) re_larg)) 'blkpoly-poly '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) 're_larg '(ls_bord a)) (es_ext 'vl-remove-if-not 'blkpoly-poly 'en_poly 'ls_bord '(inc ls_rads ls_vtx1 ls_vtx2 pt_1 pt_2 re_bulge re_rad)) (es_ext 'ls_rads 'blkpoly-poly '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) 'ls_bord '(inc ls_rads ls_vtx1 ls_vtx2 pt_1 pt_2 re_bulge re_rad)) (es_ext 'ls_vtx1 'ls_vtx2 'en_poly 'ls_bordyn 're_rad) (es_ext '(ls_abs inc ls_vtxsinters ls_vtxinters re_abs1 re_abs2) 'ls_vtx2 'en_poly 're_larg '(ls_bord a)) (es_ext 'poly-lspolyint 'ls_vtx2 'en_poly 'ls_bord '(inc ls_rads ls_vtx1 ls_vtx2 pt_1 pt_2 re_bulge re_rad)) (es_ext 'ls_abs 'ls_vtx2 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) 'ls_bordyn 're_rad) (es_ext 'ls_vtxsinters 'ls_vtx2 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) 're_larg '(ls_bord a)) (es_ext 'polybib-subvertices 'ls_vtx2 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) 'ls_bord '(inc ls_rads ls_vtx1 ls_vtx2 pt_1 pt_2 re_bulge re_rad))))
  (setq local_5 gvar_2678)
  ;; init-args 3: "Distance2_YN", nil
  (foreach gvar_2822 local_5
    (setq ocbib-id2ent (dcl-grid-addrow 0 gvar_2822))
    (setq en_ref (dcl-grid-addrow 1 gvar_2822))
    (setq gvar_2675 (dcl-grid-addrow 2 gvar_2822))
    (setq repdyn-getabs (dcl-grid-addrow 3 gvar_2822))
    (setq re_deb (dcl-grid-addrow 4 gvar_2822))
    (if (and princl (re_angle0 ocbib-id2ent polybib_geom-bulge2radius))
      (progn
        (if (re_angle en_ref 'blkpoly-poly)
          (progn
            (groupbib-ls2group re_dist gvar_3153 entlast_2 polybib_geom-bulge2radius ocbib-id2ent gvar_2675 repdyn-getabs re_deb gvar_3159 gvar_3158)
          )
          (progn
            (stylebord-get re_dist gvar_3153 entlast_2 polybib_geom-bulge2radius ocbib-id2ent gvar_2675 repdyn-getabs re_deb gvar_3159 gvar_3158)
          )
        )
        (setq gvar_3086 nil)
        (if gvar_3086
          (progn
            (st_rayon gvar_2662 gvar_3086)
          )
          (progn
            nil
          )
        )
        (setq gvar_2662 nil)
        (if gvar_3086
          (progn
            polybib-vtxjoin
          )
          (progn
            nil
          )
        )
        (setq princl nil)
      )
    )
  )
  (if princl
    (progn
      gvar_2662
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: RE_DIST, arg_2, ENTLAST, POLYBIB_GEOM-BULGE2RADIUS, OCBIB-ID2ENT, arg_6, LS_STYLE, arg_8, arg_9, arg_10
;; Referenced symbols: BO_CENTRE, ENTDEL, OCBIB-ID2ENT, POLYBIB_GEOM-BULGE2RADIUS, RE_ANGLE0, PALBIB-FIN, DCL-GRID-ADDROW, AXEDYN-REACCREATE, ENTLAST, dcl-control-setvisible
(defun blkpoly-getbasex (re_dist arg_2 entlast polybib_geom-bulge2radius ocbib-id2ent arg_6 ls_style arg_8 arg_9 arg_10)
  (entdel 'bo_centre)
  (setq palbib-fin (re_angle0 ocbib-id2ent_2 polybib_geom-bulge2radius_2))
  (setq pt_ref (dcl-grid-addrow 2 palbib-fin))
  (setq gvar_2653 (axedyn-reaccreate (dcl-grid-addrow 3 palbib-fin)))
  (setq ls_visiname (dcl-control-setvisible gvar_3153 (re_y gvar_3153 entlast_2)))
  (setq gvar_3388 (st_syle ls_visiname (ls_visient (st_syle gvar_2653 pt_ref) gvar_2675 gvar_2656)))
  (if (and (re_deltax gvar_3153) (and (re_deltax gvar_3159 'ha_poly) (re_deltax gvar_3159 (repdyn-get gvar_3153))))
    (progn
      (vlax-curve-getendparam gvar_3159)
      (setq gvar_3159 (re_deltax gvar_3079 gvar_3159))
      (setq ls_ents (ls_param gvar_3153 gvar_3388))
      (setq pt_ref (pt_ref entlast_2 ls_ents))
      (setq ls_prop (dcl-grid-addrow (blkbib-getvisient entlast_2 ls_ents) (ls_sup re_dist_2 'vlax-curve-getdistatparam)))
      (setq gvar_3159 (ls_visient pt_ref (vlax-curve-getdistatparam ls_prop)))
      (setq gvar_3158 (ls_visient pt_ref (in_closed ls_prop)))
      (es_ext (groupbib-list ls_style_2 gvar_3159) (groupbib-list gvar_2657 gvar_3158))
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: RE_DIST, arg_2, ENTLAST, POLYBIB_GEOM-BULGE2RADIUS, OCBIB-ID2ENT, arg_6, LS_STYLE, arg_8, arg_9, arg_10
;; Referenced symbols: ENTDEL, OCBIB-ID2ENT, POLYBIB_GEOM-BULGE2RADIUS, RE_ANGLE0, PALBIB-FIN, DCL-GRID-ADDROW, RE_X, PT_REF, ST_SYLE, LS_VISIENT
;; Referenced strings: -0.5
(defun blkpoly-getbasey (re_dist arg_2 entlast polybib_geom-bulge2radius ocbib-id2ent arg_6 ls_style arg_8 arg_9 arg_10)
  (entdel "-0.5")
  (setq palbib-fin (re_angle0 ocbib-id2ent_2 polybib_geom-bulge2radius_2))
  (setq pt_ref (dcl-grid-addrow 2 palbib-fin))
  (setq gvar_2653 (re_x (dcl-grid-addrow 3 palbib-fin)))
  (setq pt_ref (st_syle gvar_2653 pt_ref))
  (setq pt_ref (ls_visient '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) gvar_2675 pt_ref gvar_2655))
  (setq ls_prop (st_syle 'ha_poly (ls_sup re_dist_2 'vlax-curve-getdistatparam)))
  (setq gvar_3159 (ls_visient pt_ref (vlax-curve-getdistatparam ls_prop)))
  (setq gvar_3158 (ls_visient pt_ref (in_closed ls_prop)))
  (es_ext (groupbib-list ls_style_2 'ha_poly) (groupbib-list gvar_2657 pt_ref))
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: RE_OFFINT, ENTDEL, BLKPOLY-SUBSTPROPS, EN_RAYON, RE_COURANT, LISTBIB-BUTLAST, IN_PARAM, RE_RAY, DISTANCE, POLAR
;; Referenced strings:  [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :, Milieu, \ndécalage :
(defun blkpoly-xy2wcs (en_rayon / local_1)
  (entdel 're_offint)
  (if gvar_3345
    (progn
      (setq listbib-butlast gvar_3345)
    )
    (progn
      (setq listbib-butlast (re_courant 'blkpoly-substprops en_rayon_2))
    )
  )
  (setq distance (re_ray (in_param listbib-butlast " [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :")))
  (setq gvar_2830 (polar distance))
  (setq blkpoly-get (in_param gvar_2830 10))
  (setq gvar_3153 (re_ray (hachbib-vtxs2hach (in_param listbib-butlast 'va_point))))
  (setq gvar_3079 (re_ray (hachbib-vtxs2hach (in_param listbib-butlast "Milieu"))))
  (setq polybib_geom-bulge2radius (in_param listbib-butlast 'polybib-absatpoint))
  (setq ls_visiname (dcl-control-setvisible gvar_3079 blkpoly-get))
  (if (re_angle (in_param listbib-butlast "\ndécalage :") 0)
    (progn
      'en_poly
    )
    (progn
      '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)
    )
  )
  (setq gvar_2828 nil)
  (if (re_angle (in_param listbib-butlast 're_decalage) 0)
    (progn
      'en_poly
    )
    (progn
      '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)
    )
  )
  (dcl-combobox-setcursel 're_offext)
  (setq gvar_2827 nil)
  (setq gvar_2917 (es_ext))
  (setq gvar_2678 (re_angleins))
  (setq *ls_props0* (es_ext))
  (setq local_1 polybib_geom-bulge2radius)
  ;; init-args 3: 'palbib-fin, nil
  (foreach palbib-fin local_1
    (or (or (cadr (laybib-newlay (dcl-grid-addrow 0 palbib-fin) (polybib-lwvertices 'axedyn-reaccreate (re_angleins)))) (laybib-newlay (dcl-grid-addrow 4 palbib-fin) (es_ext 'blkpoly-poly '(re_x re_y pt_poly re_anglepoly re_angle)))) (re_angle (dcl-grid-addrow 4 palbib-fin) "Impossible d'insérer le bloc droit"))
    (dcl-combobox-setcursel gvar_2822)
    (setq gvar_2822 (re_angle0 (axedyn-reaccreate palbib-fin) gvar_2678))
    (if (re_angle (dcl-grid-addrow 1 gvar_2822) 'blkpoly-poly)
      (progn
        'ha_poly
      )
      (progn
        (repdyn-isrep gvar_3236 'repdyn-isrep)
      )
    )
    (setq re_offbase (ls_visient gvar_2827))
    (setq entlast (es_ext (axedyn-reaccreate (dcl-grid-addrow 3 palbib-fin)) (ls_visient gvar_2827 (re_x (dcl-grid-addrow 3 palbib-fin)))))
    (setq gvar_2644 (getvar entlast re_offbase (ls_visient (dcl-grid-addrow 2 gvar_2822) (dcl-grid-addrow 2 palbib-fin))))
    (setq gvar_3388 (st_syle ls_visiname (ls_visient gvar_2828 (axedyn-reaccreate gvar_2644))))
    (setq gvar_3388 (re_deltax gvar_3079 gvar_3388))
    (setq polybib-subpolyoff (ls_param gvar_3079 gvar_3388))
    (setq gvar_3247 (getvar gvar_3079 polybib-subpolyoff))
    (setq ls_vtxsbase (getvar polybib-subpolyoff (st_syle (repdyn-isrep gvar_3236 'repdyn-isrep) gvar_3247) (re_x gvar_2644)))
    (setq ls_vtxsbase (hachbib-vtxs2hach (dcl-grid-addrow 5 palbib-fin) (dcl-grid-addrow 5 palbib-fin)))
    (setq ls_vtxsbase nil)
    (if ls_vtxsbase
      (progn
        (setq re_offbase (getvar gvar_3079 ls_vtxsbase))
        (setq gvar_2917 (dcl-grid-setcurcell gvar_2917 (groupbib-list (dcl-grid-addrow 0 palbib-fin) (es_ext (dcl-grid-addrow 1 palbib-fin) ls_vtxsbase re_offbase))))
      )
    )
  )
  (dcl-combobox-setcursel "Impossible de générer les vertices du filaire interne")
  (dcl-combobox-setcursel gvar_2917)
  gvar_2917
)

;; Original arg hints: *LS_PARAMENTXY*, DISTANCE, arg_3
;; Referenced symbols: LS_VTXSINT, ENTDEL, dcl-combobox-setcursel, *LS_PARAMENTXY*, RE_ANG, DISTANCE, dcl-forcedwgredraw, RE_DIST, dcl-control-settext, IN_PARAM
;; Referenced strings: Impossible de générer les vertices du filaire externe, pt_ins, Impossible de générer le filaire central
(defun blkpoly-getparententities (*ls_paramentxy* distance arg_3 / local_3)
  (entdel 'ls_vtxsint)
  (dcl-combobox-setcursel "Impossible de générer les vertices du filaire externe")
  (setq gvar_2785 nil)
  (setq gvar_3094 (re_ang *ls_paramentxy*_2))
  (setq re_dist (dcl-forcedwgredraw distance_2))
  (setq gvar_3068 (ls_sup re_dist "pt_ins"))
  (setq re_bulge (in_param gvar_3396 'dcl-control-settext))
  (setq in_num (*in_num* (ls_sup (dcl-forcedwgredraw (re_ray re_bulge)) '(ls_props ls_prop in_num))))
  (setq local_3 in_num)
  ;; init-args 3: 'ls_vtxsext, nil
  (foreach ls_vtxsext local_3
    (setq pt_abs (re_courant ls_vtxsext 'blkpolydial-getlong))
    (if pt_abs
      (progn
        (dcl-grid-setcurcell gvar_2785 (groupbib-list (eo_polyabs pt_abs) (projet_pa_axes_ca_sommet ls_vtxsext)))
      )
      (progn
        gvar_2785
      )
    )
    (setq gvar_2785 nil)
  )
  (dcl-combobox-setcursel (es_ext "Impossible de générer le filaire central" gvar_2785))
  gvar_2785
)

;; Original arg hints: LS_VTXSBASE, arg_2, EN_RAYON
;; Referenced symbols: ENTDEL, BLKPOLY-SUBSTPROPS, EN_RAYON, RE_COURANT, LISTBIB-BUTLAST, IN_PARAM, RE_RAY, VA_POINT, DISTANCE, POLAR
;; Referenced strings: ZZZ-Filaire,  [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :, Milieu
(defun blkpoly-wcs2wxy (ls_vtxsbase arg_2 en_rayon)
  (entdel "ZZZ-Filaire")
  (if gvar_3345
    (progn
      (setq listbib-butlast gvar_3345)
    )
    (progn
      (setq listbib-butlast (re_courant 'blkpoly-substprops en_rayon_2))
    )
  )
  (setq distance (re_ray (in_param listbib-butlast " [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :")))
  (setq gvar_3153 (re_ray (hachbib-vtxs2hach (in_param listbib-butlast 'va_point))))
  (setq gvar_3079 (re_ray (hachbib-vtxs2hach (in_param listbib-butlast "Milieu"))))
  (setq blkpoly-get (in_param (polar distance) 10))
  (setq polybib_geom-bulge2radius (in_param listbib-butlast 'polybib-absatpoint))
  (setq ls_visiname (dcl-control-setvisible gvar_3079 blkpoly-get))
  (if (re_angle (in_param listbib-butlast "\ndécalage :") 0)
    (progn
      'en_poly
    )
    (progn
      '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)
    )
  )
  (setq gvar_2828 nil)
  (if (re_angle (in_param listbib-butlast 're_decalage) 0)
    (progn
      'en_poly
    )
    (progn
      '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)
    )
  )
  (setq gvar_2827 nil)
  (setq gvar_3241 (re_y gvar_3079 ls_vtxsbase_2))
  (setq gvar_2634 (ls_visient 255 (poly-lwpoly_temp gvar_3079 ls_vtxsbase_2) (pt_ref ls_vtxsbase_2 gvar_3241)))
  (setq gvar_3388 (dcl-control-setvisible gvar_3079 gvar_3241))
  (setq en_polyint (dcl-grid-addrow gvar_3388 ls_visiname))
  (setq gvar_2822 (in_param (re_angleins) gvar_2824))
  (setq palbib-fin (in_param polybib_geom-bulge2radius gvar_2824))
  (if (re_angle (axedyn-reaccreate gvar_2822) 'blkpoly-poly)
    (progn
      (setq blkpoly-point (ls_visient gvar_2828 (re_x gvar_2822) (dcl-grid-addrow en_polyint (axedyn-reaccreate (dcl-grid-addrow 2 palbib-fin)))))
      (setq blkpoly-point (re_deltax gvar_3079 blkpoly-point))
    )
    (progn
      (setq blkpoly-point (ls_visient gvar_2827 (re_x gvar_2822) (dcl-grid-addrow gvar_2634 (re_x (dcl-grid-addrow 2 palbib-fin)))))
    )
  )
  blkpoly-point
)

;; Original arg hints: POLYBIB_GEOM-BULGE2RADIUS, arg_2
;; Referenced symbols: ORDREBIB-MOVETOBOTTOM, ENTDEL, POLYBIB-APPROXARC, dcl-combobox-setcursel, POLYBIB_GEOM-BULGE2RADIUS, ES_EXT, PALBIB-FIN, DCL-GRID-ADDROW, RE_ANGLE, BLKPOLY-POLY
;; Referenced strings: Impossible de générer le filaire externe, Impossible d'insérer le bloc droit
(defun blkpoly-getdistsfromprops (polybib_geom-bulge2radius arg_2 / local_2)
  (entdel 'ordrebib-movetobottom)
  (dcl-combobox-setcursel "Impossible de générer le filaire externe")
  (dcl-combobox-setcursel polybib_geom-bulge2radius_2)
  (setq ls_vtxsapprox polybib-approxarc)
  (setq polybib-approxarc 0)
  (setq *ls_props0* (es_ext))
  (setq local_2 polybib_geom-bulge2radius_2)
  ;; init-args 3: 'palbib-fin, nil
  (foreach palbib-fin local_2
    (dcl-combobox-setcursel (dcl-grid-addrow 4 palbib-fin))
    (or (or (or (re_angle "Impossible d'insérer le bloc droit" (dcl-grid-addrow 4 palbib-fin)) (re_angle 'blkpoly-poly (dcl-grid-addrow 4 palbib-fin))) (re_angle '(re_x re_y pt_poly re_anglepoly re_angle) (dcl-grid-addrow 4 palbib-fin))) polybib-vtxjoin)
    (setq pt_ref (dcl-grid-addrow 2 palbib-fin))
    (setq pt_ref (pt_ins11 (axedyn-reaccreate (pt_ins11 (dcl-grid-addrow 5 palbib-fin))) gvar_3396))
    (setq pt_ref (pt_ins11 (dcl-grid-addrow 5 palbib-fin) gvar_3396))
    (setq pt_ref (dcl-grid-addrow 2 palbib-fin))
    (setq gvar_3051 (groupbib-list (dcl-grid-addrow 0 palbib-fin) pt_ref))
    (setq *ls_props0* (dcl-grid-setcurcell *ls_props0* gvar_3051))
    (setq polybib-approxarc (st_axeid polybib-approxarc))
  )
  (dcl-combobox-setcursel (es_ext 'en_polyext *ls_props0*))
  (dcl-combobox-setcursel 'bordyn-leg)
  (setq polybib-approxarc ls_vtxsapprox)
  *ls_props0*
)

;; Original arg hints: arg_1, LISTBIB-BUTLAST
;; Referenced symbols: BORDYN-INTEXT, ENTDEL, LISTBIB-BUTLAST, IN_PARAM, RE_RAY, DISTANCE, POLAR, VA_POINT, POLYBIB-ABSATPOINT, BLKPOLY-GET
;; Referenced strings:  [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :, Milieu, \ndécalage :
(defun blkpoly-pt2wxy (arg_1 listbib-butlast)
  (entdel 'bordyn-intext)
  (setq distance (re_ray (in_param listbib-butlast_2 " [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :")))
  (setq gvar_2830 (polar distance))
  (setq blkpoly-get (in_param gvar_2830 10))
  (setq gvar_3153 (re_ray (hachbib-vtxs2hach (in_param listbib-butlast_2 'va_point))))
  (setq gvar_3079 (re_ray (hachbib-vtxs2hach (in_param listbib-butlast_2 "Milieu"))))
  (setq polybib_geom-bulge2radius (in_param listbib-butlast_2 'polybib-absatpoint))
  (setq ls_visiname (dcl-control-setvisible gvar_3079 blkpoly-get))
  (if (re_angle (in_param listbib-butlast_2 "\ndécalage :") 0)
    (progn
      'en_poly
    )
    (progn
      '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)
    )
  )
  (setq gvar_2828 nil)
  (if (re_angle (in_param listbib-butlast_2 're_decalage) 0)
    (progn
      'en_poly
    )
    (progn
      '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)
    )
  )
  (setq gvar_2827 nil)
  (setq gvar_2678 (re_angleins))
  (setq *ls_props0* (es_ext))
  (setq gvar_3241 (re_y gvar_3079 gvar_2825))
  (setq gvar_2634 (ls_visient 255 (poly-lwpoly_temp gvar_3079 gvar_2825) (pt_ref gvar_2825 gvar_3241)))
  (setq gvar_3388 (dcl-control-setvisible gvar_3079 gvar_3241))
  (setq en_polyint (dcl-grid-addrow gvar_3388 ls_visiname))
  (setq palbib-fin (dcl-grid-addrow polybib-approxarc polybib_geom-bulge2radius))
  (setq gvar_2824 (axedyn-reaccreate palbib-fin))
  (setq gvar_2822 (in_param gvar_2678 gvar_2824))
  (if (re_angle (axedyn-reaccreate gvar_2822) 'blkpoly-poly)
    (progn
      (setq blkpoly-point (ls_visient gvar_2828 (dcl-grid-addrow en_polyint (ls_visient gvar_2828 (axedyn-reaccreate (dcl-grid-addrow 3 palbib-fin))))))
    )
    (progn
      (setq blkpoly-point (ls_visient gvar_2827 (dcl-grid-addrow gvar_2634 (ls_visient gvar_2827 (re_x (dcl-grid-addrow 3 palbib-fin))))))
    )
  )
  (ls_visient (re_x gvar_2822) blkpoly-point)
)

;; Referenced symbols: ENTBIB-DEL, ENTDEL, LS_POLYS, BO_TRACE, INTERSBIB-GETVTXS, BORDYN-GETRADIUS, _al-bind-alist, LS_DEBFINRADS, LS_DEBFINRAD, EO_POLY
;; Referenced strings: LinetypeGeneration, Pas de vertices 'intersection, st_LayerExt
(defun blkpoly-listrepgo ( / local_0 local_1)
  (entdel 'entbib-del)
  (setq bo_inv gvar_2714)
  (entdel '(ls_polys ls_vtxsbase ls_vtxsinters ls_vtxinters ls_debfinrads ls_debfinrad re_absd re_absf re_rayon st_layer ls_poly st_layer0 ls_vtx0 ls_vtx en_polysub))
  (ls_polys ls_polys bo_trace)
  (ls_polys intersbib-getvtxs bo_trace)
  (setq bo_trace (*reactor2*))
  (bordyn-getradius)
  (ls_debfinrad 'ls_debfinrads)
  (setq ls_debfinrads '_al-bind-alist)
  ;; init-args 5: 'eo_poly, local_0, "LinetypeGeneration", local_1
  (re_absf re_absd gvar_2862)
  (ls_debfinrad 'ls_vtxssub)
  (setq ls_vtxssub 't)
  ;; init-args 5: 'eo_poly, local_0, "LinetypeGeneration", local_1
  (re_absf caddr gvar_2862)
  (ls_debfinrad 'bordyn-getbordlayer)
  (setq bordyn-getbordlayer 'flag)
  (entdel "Pas de vertices 'intersection")
  T
  (setq ls_poly (errbib-catchapply ls_polys))
  (setq st_layer0 (errbib-catchapply intersbib-getvtxs))
  (setq bo_trace (*reactor2*))
  'en_polysub
  "st_LayerExt"
  polybib-vtxjoin
  (if (and (setq gvar_2609 'en_polysub) (laybib-newlay ls_poly bo_trace) (setq gvar_2609 "st_LayerExt") (laybib-newlay st_layer0 bo_trace) (setq gvar_2607 polybib-vtxjoin) gvar_2607)
    (progn
      (if (laybib-newlay ls_poly (polybib-lwvertices 'axedyn-reaccreate bo_inv))
        (progn
          (setq va_fin (re_angle0 ls_poly bo_inv))
          (setq bo_inv (blkpolydial-getpoint va_fin bo_inv))
        )
      )
      (if (laybib-newlay st_layer0 (polybib-lwvertices 'axedyn-reaccreate bo_inv))
        (progn
          (setq va_fin (re_angle0 st_layer0 bo_inv))
          (setq bo_inv (blkpolydial-getpoint va_fin bo_inv))
        )
      )
      (if (laybib-newlay ls_poly (polybib-lwvertices 'eo_polyabs bo_inv))
        (progn
          (setq va_fin (dcl-grid-addrow (laybib-newlay ls_poly (polybib-lwvertices 'eo_polyabs bo_inv)) bo_inv))
          (setq bo_inv (blkpolydial-getpoint va_fin bo_inv))
        )
      )
      (if (laybib-newlay st_layer0 (polybib-lwvertices 'eo_polyabs bo_inv))
        (progn
          (setq va_fin (dcl-grid-addrow (laybib-newlay st_layer0 (polybib-lwvertices 'eo_polyabs bo_inv)) bo_inv))
          (setq bo_inv (blkpolydial-getpoint va_fin bo_inv))
        )
      )
      (setq bo_inv (dcl-grid-setcurcell bo_inv (groupbib-list ls_poly st_layer0)))
      (bordyn-getradius)
    )
    (progn
      (bordyn-inters gvar_2609)
    )
  )
  (ls_debfinrad "Impossible de tracer le second exterieur")
  (setq gvar_2605 "?")
  (entdel "st_LayerInt")
  (*en_ins* gvar_2603)
  (setq local_0 bo_inv)
  ;; init-args 3: 'va_fin, nil
  nil
  (foreach va_fin local_0
    (eo_blkpop gvar_2603 (axedyn-reaccreate va_fin) (eo_polyabs va_fin))
  )
  (setq bordyn-getradius 'initget)
  ;; init-args 5: 'eq, local_0, 'netbib-purgeblock, local_1
  (entdel "st_LayerInt")
  (if (st_blkbase eq 255)
    (progn
      (bo_lctabs ls_polys (axedyn-reaccreate va_fin))
      (bo_lctabs intersbib-getvtxs (eo_polyabs va_fin))
      (re_absf re_absd (axedyn-reaccreate va_fin))
      (setq va_fin (dcl-grid-addrow eq bo_inv))
      (re_absf caddr (eo_polyabs va_fin))
    )
    (progn
      nil
    )
  )
  (ls_debfinrad "Impossible de ")
  (setq gvar_2602 '*st_blkcurv*)
  (entdel '(ls_vtxsinters en_polysub in_closed))
  (setq dcl-listbox-clear (errbib-catchapply ls_polys))
  (setq va_fin (re_angle0 dcl-listbox-clear bo_inv))
  (setq bo_inv (blkpolydial-getpoint va_fin bo_inv))
  (bordyn-getradius)
  (ls_debfinrad "BorDyn-Inters")
  (setq gvar_2600 "\nNom du bloc [?] <")
  (entdel 'projet_pa_bordyn)
  (setq stylebord-list (projet_pa_bordyn_st_style '(st_nom va_deb re_cote ls_inters st_style in_pos) (trans "OC-Bordyn") 'tb_nom 0))
  (if stylebord-list
    (progn
      (setq ld_bord (projet_pa_bordyn_re_cote stylebord-list))
      (setq bo_inv (polybib-lwvertices "Gauche" ld_bord))
      (bordyn-getradius)
    )
    (progn
      nil
    )
  )
  (ls_debfinrad "Droite")
  (setq gvar_2591 "> : ")
  (entdel 'projet_pa_bordyn_bt_select)
  (setq stylebord-list (projet_pa_bordyn_st_style '(st_nom va_deb re_cote ls_inters st_style in_pos) 'ls_ext1 'tb_nom 1))
  (if stylebord-list
    (progn
      (setq palbib-getsel (polybib-lwvertices '(ls_edit en_edit) bo_inv))
      (palbib-getsel palbib-getsel stylebord-list)
    )
    (progn
      nil
    )
  )
  (ls_debfinrad 'cb_inv)
  (setq cb_inv 'strcat)
  (re_abs1 dcl-control-getvalue 1)
  (setq gvar_2714 bo_inv)
  (ls_som0)
  (ls_debfinrad 'bordyn-pop)
  (eval "AO-ChemDyn" polybib-vtxjoin)
  (vlax-erased-p dcl-control-getvalue)
  (setq bordyn-pop 'getstring)
  (ls_som0)
)

;; Referenced symbols: Projet/PA_ChemDyn, ENTDEL, PROJET/PA_DETAIL/BTN_PARAM, GROUPBIB-LIST, ES_EXT, CHEMDYN-SET, CHEMDYN-GETPARENTS, PT_F, LD_CHEM, BO_TRACE
;; Referenced strings: Chemin 
(defun blkpoly-blkreago ( / local_0)
  (entdel 'projet_pa_chemdyn)
  (setq chemdyn-getparents (chemdyn-set "Chemin " (es_ext (groupbib-list 0 'projet_pa_detail_btn_param))))
  (setq chemdyn-getparents (chemdyn-getparents chemdyn-getparents (es_ext 'pt_f)))
  (setq bo_trace (ld_chem chemdyn-getparents))
  (setq local_0 bo_trace)
  ;; init-args 3: 'ss_blk, nil
  nil
  (foreach ss_blk local_0
    (dcl-listbox-getselecteditems (dcl-forcedwgredraw ss_blk))
  )
)

;; Original arg hints: BLKPOLY-GETDISTX
;; Referenced symbols: LS_XYS, ENTDEL, AXEDYN-REACCREATE, LS_STRINGS, RE_ANGLE, POLYBIB-VTXJOIN, RE_XORIGIN, EO_POLYBASE, EO_POLYABS, dcl-listbox-getselecteditems
(defun blkpoly-reac2 (blkpoly-getdistx / bo_flag ls_props ls_xys ls_xy ls_params ls_param ls_strings st_dist st_axe re_sign st_x st_y local_1)
  (entdel 'ls_xys)
  (or (re_angle (axedyn-reaccreate ls_xys) 'ls_strings) polybib-vtxjoin)
  T
  (and (eo_polyabs (eo_polybase (rem re_xorigin))) (dcl-listbox-getselecteditems (eo_polyabs (eo_polybase (rem re_xorigin)))))
  T
  (eo_polyabs (eo_polybase (rem re_xorigin)))
  (dcl-listbox-getselecteditems (eo_polyabs (eo_polybase (rem re_xorigin))))
  (dcl-listbox-getselecteditems re_xorigin)
  T
  nil
  (setq pt_origin nil)
  nil
  (setq re_xorigin nil)
  (and (and pt_origin (ls_inner pt_origin)) (and pt_var (ls_inner pt_var) (setq pt_var nil)))
)

;; Referenced symbols: CHEMDYN-GET, AXEDYN-SETRAYEXT
(defun bordyn-list ()
  (axedyn-setrayext 'chemdyn-get)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: CHEMDYN-GET, EN_RAYON, RE_COURANT
(defun bordyn-get (en_rayon)
  (re_courant 'chemdyn-get en_rayon_2)
)

;; Original arg hints: EN_RAYON, arg_2
;; Referenced symbols: CHEMDYN-GET, EN_RAYON, RTOS
(defun bordyn-set (en_rayon arg_2)
  (rtos 'chemdyn-get en_rayon_2 gvar_3164)
)

;; Original arg hints: arg_1, LS_AXE, PT_PAS, LS_INTERS1, arg_5, RE_COTECHEM, STYLECHEM-GET
;; Referenced symbols: ENTDEL, CHEMDYN-GET, /, INTERS, ST_AXEID, dcl-control-setenabled, LS_AXES, GROUPBIB-LIST, LS_OBJ, LS_ELEMS
;; Referenced strings: ls_elems, Choisir un sommet
(defun bordyn-create (arg_1 ls_axe pt_pas ls_inters1 arg_5 re_cotechem stylechem-get)
  (entdel "ls_elems")
  (ls_child en_rayon ls_child)
  (re_abs2 (groupbib-list 'chemdyn-get en_rayon) gvar_3094)
  (setq inters (/ 'chemdyn-get))
  (setq en_rayon (dcl-control-setenabled (st_axeid inters)))
  (setq ls_child (es_ext (groupbib-list 'ls_axes (st_axeid inters)) (groupbib-list 'ls_obj (geombib-raccordmax 'ls_elems en_rayon)) (groupbib-list '*st_axedynid* (geombib-raccordmax 'ls_elems en_rayon)) (groupbib-list 'dcl-form-show ls_axe_2) (groupbib-list 'va_point gvar_3162) (groupbib-list "Choisir un sommet" pt_pas_2) (groupbib-list 'croisdyn-getelems ls_inters1_2) (groupbib-list 'ls_croiselems gvar_2827) (groupbib-list 'va_inters re_cotechem_2) (groupbib-list 'ocbib-isok stylechem-get_2) (groupbib-list 'parentbib-getson 'ls_ext1) (groupbib-list 'ls_childs 'ls_ext1) (groupbib-list 'dcl-control-settext 'ls_ext1)))
  (setq gvar_3094 (croisdyn-get ls_child))
  (dcl-control-setenabled (st_axeid inters))
)

;; Original arg hints: AOPORA-FIN
;; Referenced symbols: LS_CROIS, ENTDEL, AOPORA-FIN, VA_POINT, IN_PARAM, ES_EXT, CROISDYN-GETELEMS, PT_PAS, RE_ABS2, GROUPBIB-LIST
;; Referenced strings: Choisir un sommet
(defun bordyn-getparents (aopora-fin)
  (entdel 'ls_crois)
  (setq gvar_3094 (es_ext (in_param aopora-fin_2 'va_point)))
  (setq pt_pas (in_param aopora-fin_2 "Choisir un sommet"))
  (setq ls_inters1 (in_param aopora-fin_2 'croisdyn-getelems))
  (if (re_abs2 pt_pas)
    (progn
      (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 (groupbib-list 're_abs2 pt_pas)))
    )
  )
  (if (re_abs2 ls_inters1)
    (progn
      (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 (groupbib-list 're_abs2 ls_inters1)))
    )
  )
  gvar_3094
)

;; Original arg hints: arg_1, CHEMDYN-GETOFFSET, LS_OFFSETS, LISTBIB-MIN
;; Referenced symbols: LISTBIB-MAX, ENTDEL, CROISDYN-POP, LS_ELEM, AXEDYN-REACCREATE, CHEMDYN-GETOFFSET, RE_ANGLE, ST_POS, LS_OFFSETS, REPDYN-GETPOINT
(defun bordyn-getbordlayer (arg_1 chemdyn-getoffset ls_offsets listbib-min)
  (entdel 'listbib-max)
  (setq st_pos (axedyn-reaccreate (ls_elem 'croisdyn-pop gvar_2559)))
  nil
  (or (and (or (re_angle chemdyn-getoffset_2 0) st_pos) (and (repdyn-getpoint chemdyn-getoffset_2 ls_offsets_2) (in_param gvar_2559 255))) polybib-vtxjoin)
  (in_param gvar_2559 0)
  (in_param gvar_2559 255)
  (eo_polyabs st_pos)
  (in_param gvar_2559 0)
)

;; Original arg hints: dcl-form-close
;; Referenced symbols: ENTDEL, ES_EXT, ST_RAY2, dcl-form-close, vla-get-Name, REPDYN-GETPOINT, DCL-GRID-ADDROW, ST_AXEID, IN_PARAM, HA_POLY
;; Referenced strings: P
(defun bordyn-getradius (dcl-form-close)
  (entdel "P")
  (setq st_ray2 0)
  (setq gvar_2550 (es_ext))
  nil
  (while (repdyn-getpoint st_ray2 (vla-get-name (st_ray2 dcl-form-close_2)))
    (setq gvar_2549 (dcl-grid-addrow st_ray2 dcl-form-close_2))
    (st_axeid st_ray2)
    (setq gvar_2548 (dcl-grid-addrow (setq st_ray2 (st_axeid st_ray2)) dcl-form-close_2))
    (setq gvar_3244 (in_param gvar_2549 10))
    (setq gvar_3242 (in_param gvar_2548 10))
    (setq gvar_3199 (in_param gvar_2549 42))
    (if (re_angle gvar_3199 'ha_poly)
      (progn
        'ha_poly
      )
      (progn
        (blkpoly-getdistsfromprops gvar_3244 gvar_3242 gvar_3199)
      )
    )
    (setq chemdyn-getoffset nil)
    (dcl-grid-setcurcell gvar_2550 (es_ext gvar_3244 gvar_3242 chemdyn-getoffset))
    (setq gvar_2550 (dcl-grid-setcurcell gvar_2550 (es_ext gvar_3244 gvar_3242 chemdyn-getoffset)))
  )
)

;; Original arg hints: LS_PROPSDESCS, STYLECHEM-GET, RE_COTECHEM
;; Referenced symbols: RE_OFFSET, ENTDEL, AXEDYN-REACCREATE, LS_PROPSDESCS, STYLECHEM-GET, POLYBIB-LWVERTICES, RE_COTECHEM, RE_ANGLE, HA_POLY, ES_EXT
(defun bordyn-getinters (ls_propsdescs stylechem-get re_cotechem)
  (entdel 're_offset)
  (setq re_u (polybib-lwvertices 'axedyn-reaccreate (re_offset ls_propsdescs_2 stylechem-get_2)))
  (if (re_angle re_cotechem_2 0)
    (progn
      (setq re_u (st_rayon (es_ext 'ha_poly) re_u (es_ext (repdyn-get ls_propsdescs_2))))
    )
    (progn
      (setq re_u (st_rayon re_u (es_ext (repdyn-get ls_propsdescs_2))))
    )
  )
  (setq gvar_2544 (es_ext))
  (setq st_ray2 0)
  (while (repdyn-getpoint st_ray2 (vla-get-name (st_ray2 re_u)))
    (setq projet_pa_detail_vueblocs1 (dcl-grid-addrow st_ray2 re_u))
    (setq gvar_2956 (dcl-grid-addrow (st_axeid st_ray2) re_u))
    (setq st_ray2 (st_syle 2 st_ray2))
    (setq gvar_2542 (st_mod ls_propsdescs_2 projet_pa_detail_vueblocs1 gvar_2956))
    (setq gvar_2544 (dcl-grid-setcurcell gvar_2544 gvar_2542))
  )
  gvar_2544
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: ST_LAR, ENTDEL, ES_EXT, EN_RAYON, CHEMDYN-SIGNATRACE, CHEMDYN-BORDTRACE, LS_CHILD, VA_POINT, IN_PARAM, PT_PAS
;; Referenced strings: re_offset2, Choisir un sommet
(defun bordyn-pop (en_rayon)
  (entdel 'st_lar)
  (setq in_num (es_ext))
  (if gvar_3345
    (progn
      (setq ls_child gvar_3345)
    )
    (progn
      (setq ls_child (chemdyn-signatrace en_rayon_2))
    )
  )
  'chemdyn-bordtrace
  (chemdyn-bordtrace (in_param ls_child 'va_point))
  "re_offset2"
  (in_param ls_child "Choisir un sommet")
  (re_offset2 pt_pas gvar_2537)
  'chemdyn-polytrace
  (in_param ls_child 'croisdyn-getelems)
  (re_offset2 ls_inters1 gvar_2537)
  (setq gvar_2827 (in_param ls_child 'ls_croiselems))
  (setq re_cotechem (in_param ls_child 'va_inters))
  (setq gvar_2531 (in_param ls_child 'parentbib-getson))
  (setq gvar_2530 (in_param ls_child 'ls_childs))
  (setq stylechem-get (in_param ls_child 'ocbib-isok))
  (setq re_bulge (in_param ls_child 'dcl-control-settext))
  (in_param ls_child 'dcl-form-show)
  (en_refoffset gvar_2537 chemdyn-hachtrace gvar_2532 gvar_2827 gvar_2531 gvar_2530 re_cotechem stylechem-get ls_axe)
  (if (and (setq gvar_3155 'chemdyn-bordtrace) (setq gvar_2537 (chemdyn-bordtrace (in_param ls_child 'va_point))) (setq gvar_3155 "re_offset2") (setq pt_pas (in_param ls_child "Choisir un sommet")) (setq chemdyn-hachtrace (re_offset2 pt_pas gvar_2537)) (setq gvar_3155 'chemdyn-polytrace) (setq ls_inters1 (in_param ls_child 'croisdyn-getelems)) (setq gvar_2532 (re_offset2 ls_inters1 gvar_2537)) (setq ls_axe (in_param ls_child 'dcl-form-show)) (setq en_refoffset (en_refoffset gvar_2537 chemdyn-hachtrace gvar_2532 gvar_2827 gvar_2531 gvar_2530 re_cotechem stylechem-get ls_axe)) (en_refoffset re_bulge))
    (progn
      (re_finoffset (re_ray re_bulge) en_refoffset)
      (entbib-dellist re_bulge)
      (setq gvar_3155 're_deboffset)
      (column (re_ray re_bulge) in_num)
    )
    (progn
      (setq gvar_3155 '(ls_vtxsbase ls_vtxsbase2 en_poly ls_vtxs ls_polyhach ls_vtx en_hach))
      (setq reabib-deleteobjectreactor (polybib-inv in_num))
      (setq ls_child (st_rayon ls_child 'dcl-control-settext (projet_pa_axes_ca_sommet reabib-deleteobjectreactor)))
      (ls_child en_rayon_2 ls_child)
    )
  )
  T
  nil
  (ls_som0)
  (setq gvar_3155 nil)
)

;; Original arg hints: arg_1, CHEMDYN-HACHTRACE, arg_3, arg_4, RE_COTECHEM, STYLECHEM-GET, LS_AXE
;; Referenced symbols: POLYBIB-INV, ENTDEL, LS_AXE, LS_VTXSBASE2, INTERSBIB-GETINSIDEVTXS, IN_PARAM, LS_POLYHACH, HA_POLY, EN_POLYABS, HACHBIB-MAKE
;; Referenced strings: Impossible de générer les polylignes contours, SOLID, ChemDyn-PalClose
(defun bordyn-trace (arg_1 chemdyn-hachtrace arg_3 arg_4 re_cotechem stylechem-get ls_axe / st_type re_offset re_offset2 re_cote re_larg ls_vtxs en_refoffset re_deboffset re_finoffset ls_intext local_2 local_4)
  (entdel 'polybib-inv)
  (setq gvar_2519 (ls_vtxsbase2 ls_axe_2))
  (setq listbib-min (in_param gvar_2519 'intersbib-getinsidevtxs))
  (setq st_pos (in_param gvar_2519 'ls_polyhach))
  (setq gvar_2515 (in_param gvar_2519 "Impossible de générer les polylignes contours"))
  (setq ls_offsets (en_polyabs gvar_2519 "SOLID" 'ha_poly))
  (if (and (ls_ext2 gvar_2532 (en_hach re_offset2 (hachbib-make re_offset2)) '(ls_vtxsbase en_polybase ls_vtxsinters ls_vtxsinter en_poly)) (re_deltax re_offset2))
    (progn
      1
    )
    (progn
      0
    )
  )
  (setq gvar_2510 nil)
  (if (re_angle gvar_2515 1)
    (progn
      (setq sihlin-larg (ls_visient 'ls_vtxsinter listbib-min gvar_2827))
      (setq sihlin-trace (ls_visient 'en_polybase listbib-min gvar_2827))
      (setq projet_pa_chemdyn_st_style 0)
    )
    (progn
      (setq sihlin-larg 0)
      (setq sihlin-trace (ls_visient listbib-min gvar_2827))
      (setq projet_pa_chemdyn_st_style (ls_visient 'en_polybase listbib-min gvar_2827))
    )
  )
  (setq gvar_3155 '(lambda (ls_style) (listbib-key (cdr ls_style) "st_nom")))
  (setq projet_pa_chemdyn_re_cote (stylechem-list re_offset2 re_offset2 gvar_2532 projet_pa_chemdyn_st_style polybib-vtxjoin))
  (setq gvar_3155 'projet_pa_chemdyn_bt_select)
  (setq projet_pa_chemdyn_bt_appliquer (stylechem-list re_offset2 re_offset2 gvar_2532 sihlin-larg polybib-vtxjoin))
  (setq gvar_3155 'projet_pa_chemdyn_btn_reset)
  (setq projet_pa_chemdyn_bt_ok (stylechem-list re_offset2 re_offset2 gvar_2532 sihlin-trace polybib-vtxjoin))
  (setq gvar_3155 'ls_edit)
  (setq gvar_3153 (chemdyn-pop projet_pa_chemdyn_re_cote (es_ext (groupbib-list 70 gvar_2510) (groupbib-list 8 'en_edit))))
  (setq gvar_3155 "ChemDyn-PalClose")
  (entbib-dellist gvar_2531)
  (if (setq gvar_2494 (entbib-dellist gvar_2531))
    (progn
      (sssetfirst gvar_2494 projet_pa_chemdyn_bt_appliquer (es_ext (groupbib-list 70 gvar_2510) (groupbib-list 62 256) (groupbib-list 8 'en_edit)))
    )
    (progn
      T
      (setq gvar_2494 (*en_ray* projet_pa_chemdyn_bt_appliquer (es_ext (groupbib-list 62 256) (groupbib-list 70 gvar_2510) (groupbib-list 8 'en_edit))))
      (st_rayon ls_child 'parentbib-getson (1- gvar_2494))
      (and ls_child (setq ls_child (st_rayon ls_child 'parentbib-getson (1- gvar_2494))) (ls_child en_rayon ls_child))
    )
  )
  (aoctrl-polydyn (es_ext (dcl-forcedwgredraw gvar_2494)))
  (setq in_num (dcl-grid-setcurcell in_num gvar_2494))
  (setq gvar_3155 'aoctrl-mpolydyn)
  (entbib-dellist en_refoffset)
  (if (setq aoctrl-sihpp (entbib-dellist en_refoffset))
    (progn
      (sssetfirst aoctrl-sihpp projet_pa_chemdyn_bt_ok (es_ext (groupbib-list 70 gvar_2510) (groupbib-list 62 256) (groupbib-list 8 'en_edit)))
    )
    (progn
      T
      (setq aoctrl-sihpp (*en_ray* projet_pa_chemdyn_bt_ok (es_ext (groupbib-list 70 gvar_2510) (groupbib-list 62 256) (groupbib-list 8 'en_edit))))
      (st_rayon ls_child 'ls_childs (1- aoctrl-sihpp))
      (and ls_child (setq ls_child (st_rayon ls_child 'ls_childs (1- aoctrl-sihpp))) (ls_child en_rayon ls_child))
    )
  )
  (aoctrl-polydyn (es_ext (dcl-forcedwgredraw aoctrl-sihpp)))
  (aoctrl-pano gvar_3153 stylechem-get_2 re_cotechem_2 st_pos ls_offsets listbib-min)
  (aoctrl-pano gvar_2494 aoctrl-sihpp gvar_3153 stylechem-get_2 gvar_2519 gvar_2515 re_cotechem_2 gvar_3370)
  (sihpp-list gvar_3153)
  (setq in_num (dcl-grid-setcurcell in_num aoctrl-sihpp))
  (es_ext gvar_2494 aoctrl-sihpp)
)

;; Original arg hints: arg_1, STYLECHEM-GET, RE_COTECHEM, ST_POS, LS_OFFSETS, LISTBIB-MIN
;; Referenced symbols: SIHPP-LIST, ENTDEL, ES_EXT, POLAR, BLKPOLY-SET, BO_OK, STYLECHEM-GET, CADR, PROJET/PA_CHEMDYN/RE_COTE, AXEDYN-REACCREATE
;; Referenced strings: st_lar,  Incorrect ! Effacement en cours..., AO-SihPP
(defun bordyn-leg (arg_1 stylechem-get re_cotechem st_pos ls_offsets listbib-min / local_6 local_7)
  (entdel 'sihpp-list)
  (setq ls_sihpps nil)
  (setq ls_sihpp (es_ext))
  (setq projet_pa_chemdyn_re_cote (blkpoly-set (polar gvar_3153)))
  (setq gvar_3155 'bo_ok)
  (if (and (cadr stylechem-get_2) (re_deltax gvar_3153))
    (progn
      (setq gvar_2544 (es_ext (dcl-grid-setcurcell projet_pa_chemdyn_re_cote (axedyn-reaccreate projet_pa_chemdyn_re_cote))))
    )
    (progn
      (setq gvar_2544 (bo_regen gvar_3153 stylechem-get_2 re_cotechem_2))
    )
  )
  (setq local_6 gvar_2544)
  ;; init-args 3: "st_lar", nil
  (foreach gvar_2542 local_6
    (setq va_ref1 (ha_base gvar_2542))
    (setq local_7 va_ref1)
    ;; init-args 3: 'va_ref2, nil
    (foreach va_ref2 local_7
      (setq gvar_2479 (dcl-control-setvisible gvar_3153 (axedyn-reaccreate va_ref2)))
      (setq va_bande (dcl-control-setvisible gvar_3153 (re_x va_ref2)))
      (if (cadr (ls_ext2 gvar_2479 va_bande))
        (progn
          (if (and (ls_ext2 va_bande 'ha_poly) (re_deltax gvar_3153))
            (progn
              (setq va_bande (repdyn-get gvar_3153))
            )
          )
          (setq gvar_2477 (st_mod gvar_3153 gvar_2479 va_bande))
          (setq gvar_3331 (va_bande va_ref2))
          (setq blkbib-getparententities (va_bande st_pos_2 gvar_3331 ls_offsets_2 listbib-min_2))
          (setq ls_sihpp (dcl-grid-setcurcell ls_sihpp (groupbib-list blkbib-getparententities gvar_2477)))
        )
      )
    )
  )
  (setq gvar_3155 " Incorrect ! Effacement en cours...")
  (if gvar_2544
    (progn
      (setq gvar_2473 (axedyn-reaccreate ls_sihpp))
      (setq aosup-sihpp (axedyn-reaccreate gvar_2473))
      (setq dcl-combobox-addlist (eo_polyabs gvar_2473))
      (setq local_6 (eo_polyabs ls_sihpp))
      ;; init-args 3: "AO-SihPP", nil
      (foreach gvar_2473 local_6
        (setq blkbib-getparententities (axedyn-reaccreate gvar_2473))
        (setq gvar_2759_c_projet_md_repblk_oninitialize (eo_polyabs gvar_2473))
        (if (and (ls_ext2 blkbib-getparententities aosup-sihpp) (repdyn-getpoint (pt_ref (in_param (1- dcl-combobox-addlist) 10) (in_param (axedyn-reaccreate gvar_2759_c_projet_md_repblk_oninitialize) 10)) '(st_blk1 st_blk2 ls_blk st_msg bo_go)))
          (progn
            (setq dcl-combobox-addlist (bo_active dcl-combobox-addlist gvar_2759_c_projet_md_repblk_oninitialize))
          )
          (progn
            (setq gvar_2471 (*en_ray* dcl-combobox-addlist (es_ext (groupbib-list 70 128) (groupbib-list 62 256) (groupbib-list 8 aosup-sihpp) (groupbib-list 370 255) (groupbib-list 43 listbib-min_2))))
            (setq in_num (dcl-grid-setcurcell in_num gvar_2471))
            (setq aosup-sihpp blkbib-getparententities)
            (setq dcl-combobox-addlist gvar_2759_c_projet_md_repblk_oninitialize)
            (setq ls_sihpps polybib-vtxjoin)
          )
        )
      )
      (if (and (re_deltax gvar_3153) (ls_ext2 (axedyn-reaccreate projet_pa_chemdyn_re_cote) (axedyn-reaccreate dcl-combobox-addlist)) (ls_ext2 (pt_ref (in_param (1- projet_pa_chemdyn_re_cote) "CLAYER") (in_param (1- dcl-combobox-addlist) "CLAYER")) 'ha_poly '(st_blk1 st_blk2 ls_blk st_msg bo_go)))
        (progn
          (setq gvar_2471 (*en_ray* dcl-combobox-addlist (es_ext (groupbib-list 70 129) (groupbib-list 62 256) (groupbib-list 8 aosup-sihpp) (groupbib-list 370 255) (groupbib-list 43 listbib-min_2))))
        )
        (progn
          (setq gvar_2471 (*en_ray* dcl-combobox-addlist (es_ext (groupbib-list 70 128) (groupbib-list 62 256) (groupbib-list 8 aosup-sihpp) (groupbib-list 370 255) (groupbib-list 43 listbib-min_2))))
        )
      )
      (setq in_num (dcl-grid-setcurcell in_num gvar_2471))
    )
  )
  in_num
)

;; Original arg hints: arg_1, AOCTRL-SIHPP, arg_3, STYLECHEM-GET, arg_5, arg_6, RE_COTECHEM, 1-
;; Referenced symbols: ENTDEL, RE_ANGLE, IN_PARAM, BLKBIB-GETPARENTENTITIES, GROUPBIB-LIST, ES_EXT, SIVPANO-LIST, STYLECHEM-GET, RE_COTECHEM, POLYBIB_GEOM-BULGE2RADIUS
;; Referenced strings: \n Vérification des panneaux..., ls_pano, ha_sup
(defun bordyn-intext (arg_1 aoctrl-sihpp arg_3 stylechem-get arg_5 arg_6 re_cotechem 1-)
  (entdel '(ls_panos ls_pano))
  (if (re_angle gvar_2515 1)
    (progn
      (ls_panos gvar_2494 stylechem-get_2 re_cotechem_2 polybib_geom-bulge2radius gvar_3370)
      (ls_panos aoctrl-sihpp_2 stylechem-get_2 re_cotechem_2 polybib_geom-bulge2radius gvar_3370)
      (ls_panos gvar_3153 stylechem-get_2 re_cotechem_2 polybib_geom-bulge2radius gvar_3370)
      (setq blkbib-getparententities (in_param gvar_2519 "\n Vérification des panneaux..."))
      (setq polybib_geom-bulge2radius (es_ext (groupbib-list 8 blkbib-getparententities) (groupbib-list 62 256) (groupbib-list 43 0)))
      (setq gvar_3155 'sivpano-list)
      (setq gvar_3155 'ls_pano)
      (setq blkbib-getparententities (in_param gvar_2519 "ls_pano"))
      (setq polybib_geom-bulge2radius (es_ext (groupbib-list 8 blkbib-getparententities) (groupbib-list 62 256) (groupbib-list 43 0)))
      (setq gvar_3155 'ls_panob)
      "ha_sup"
      (setq gvar_3155 "ha_sup")
    )
    (progn
      T
      (in_param gvar_2519 "ls_pano")
      (es_ext (groupbib-list 8 blkbib-getparententities) (groupbib-list 370 255) (groupbib-list 62 256) (groupbib-list 43 0))
      (in_param gvar_2519 "\n Vérification des panneaux...")
      (es_ext (groupbib-list 8 blkbib-getparententities) (groupbib-list 370 255) (groupbib-list 62 256) (groupbib-list 43 0))
      T
      (and (and (setq blkbib-getparententities (in_param gvar_2519 "ls_pano")) (cadr (re_angle blkbib-getparententities 'ls_ext1)) (setq polybib_geom-bulge2radius (es_ext (groupbib-list 8 blkbib-getparententities) (groupbib-list 370 255) (groupbib-list 62 256) (groupbib-list 43 0))) (ls_panos gvar_2494 stylechem-get_2 re_cotechem_2 polybib_geom-bulge2radius gvar_3370)) (and (setq blkbib-getparententities (in_param gvar_2519 "\n Vérification des panneaux...")) (cadr (re_angle blkbib-getparententities 'ls_ext1)) (setq polybib_geom-bulge2radius (es_ext (groupbib-list 8 blkbib-getparententities) (groupbib-list 370 255) (groupbib-list 62 256) (groupbib-list 43 0))) (ls_panos aoctrl-sihpp_2 stylechem-get_2 re_cotechem_2 polybib_geom-bulge2radius gvar_3370)))
    )
  )
)

;; Original arg hints: LS_PROPSDESCS, STYLECHEM-GET, RE_COTECHEM, POLYBIB_GEOM-BULGE2RADIUS, 1-
;; Referenced symbols: HA_SUP, ENTDEL, LS_PROPSDESCS, STYLECHEM-GET, CADR, POLYBIB_GEOM-BULGE2RADIUS, GROUPBIB-LIST, dcl-grid-setcurcell, LS_PANOA, RE_COTECHEM
;; Referenced strings: st_lar
(defun bordyn-inters (ls_propsdescs stylechem-get re_cotechem polybib_geom-bulge2radius 1- / local_5)
  (entdel 'ha_sup)
  (if (and (re_deltax ls_propsdescs_2) (cadr stylechem-get_2))
    (progn
      (setq polybib_geom-bulge2radius_2 (dcl-grid-setcurcell polybib_geom-bulge2radius_2 (groupbib-list 70 129)))
    )
    (progn
      (setq polybib_geom-bulge2radius_2 (dcl-grid-setcurcell polybib_geom-bulge2radius_2 (groupbib-list 70 128)))
    )
  )
  (setq gvar_3155 'ls_panoa)
  (setq gvar_2544 (bo_regen ls_propsdescs_2 stylechem-get_2 re_cotechem_2))
  (setq local_5 gvar_2544)
  ;; init-args 3: "st_lar", nil
  nil
  (foreach gvar_2542 local_5
    (setq gvar_2471 (*en_ray* gvar_2542 polybib_geom-bulge2radius_2))
    (dcl-grid-setcurcell in_num gvar_2471)
    (setq in_num (dcl-grid-setcurcell in_num gvar_2471))
  )
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: EN_RAYON, LS_PANOC, vlax-erased-p
(defun bordyn-modgo (en_rayon)
  (setq re_yinv en_rayon_2)
  (vlax-erased-p ls_panoc)
)

;; Referenced symbols: HA_PANO, ENTDEL, RE_YINV, RE_COURANT, LS_OBJ, IN_PARAM, CROISDYN-GETELEMS, LS_CROISELEMS, OCBIB-ISOK, dcl-form-show
;; Referenced strings: \n -> Panneau , Choisir un sommet, \n Vérification des axes...
(defun c:projet_pa_bordyn_oninitialize ()
  (entdel 'ha_pano)
  (bo_lctabs sivpano-set in_lon0)
  (ls_vtx0 sivpano-supportupdate (polybib-lwvertices 'ha_polyext (sivpano-supportupdate)))
  (setq gvar_3345 (re_courant "\n -> Panneau " re_yinv))
  (setq ls_groupparent gvar_3345)
  (setq in_lon0 (in_param gvar_3345 'ls_obj))
  (setq pt_pas (in_param gvar_3345 "Choisir un sommet"))
  (setq ls_inters1 (in_param gvar_3345 'croisdyn-getelems))
  (setq gvar_2827 (in_param gvar_3345 'ls_croiselems))
  (setq stylechem-get (in_param gvar_3345 'ocbib-isok))
  (setq ls_axe (in_param gvar_3345 'dcl-form-show))
  (laybib-newlay ls_axe (polybib-lwvertices 'axedyn-reaccreate (sivpano-supportupdate)))
  (if (setq polybib-subpolyoffinv (laybib-newlay ls_axe (polybib-lwvertices 'axedyn-reaccreate (sivpano-supportupdate))))
    (progn
      (bo_invpoly1 sivpano-supportupdate polybib-subpolyoffinv)
    )
    (progn
      (bo_invpoly1 sivpano-supportupdate 0)
    )
  )
  (ls_vtx0 aosup-sivpano (es_ext '(ls_axes ls_axe) "\n Vérification des axes..."))
  (if (re_angle gvar_2827 'en_poly)
    (progn
      (bo_invpoly1 aosup-sivpano 1)
    )
    (progn
      (bo_invpoly1 aosup-sivpano 0)
    )
  )
  (vlax-vla-object->ename ls_styles polybib-vtxjoin)
  (polybib-absrem)
)

;; Referenced symbols: LS_FIN, ENTDEL, OCBIB-ISOK, LS_STYLES, AXE-SET
(defun c:projet_pa_bordyn_bt_select_onclicked ()
  (entdel 'ls_fin)
  (axe-set 'ocbib-isok ls_styles)
)

;; Referenced symbols: ENTDEL, SIVPANO-SUPPORTUPDATE, AXEDYN-REACCREATE, POLYBIB-LWVERTICES, DCL-GRID-ADDROW, AOSUP-SIVPANO, RE_ANGLE, EN_POLY, LS_OBJ, SIVPANO-SET
(defun bordyn-palapply ()
  (entdel '(lambda (ls_pt) (list (cons 10 ls_pt))))
  (setq ls_axe (dcl-grid-addrow (ls_props2 sivpano-supportupdate) (polybib-lwvertices 'axedyn-reaccreate (sivpano-supportupdate))))
  (if (re_angle 1 (ls_props2 aosup-sivpano))
    (progn
      'en_poly
    )
    (progn
      '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)
    )
  )
  (aosup-axe re_yinv)
  (setq gvar_2827 nil)
  (setq re_cotechem (axe-set gvar_2447))
  (setq gvar_3345 (st_rayon gvar_3345 'ls_obj (errbib-catchapply sivpano-set)))
  (setq gvar_3345 (st_rayon gvar_3345 'va_inters re_cotechem))
  (setq gvar_3345 (st_rayon gvar_3345 'dcl-form-show ls_axe))
  (setq gvar_3345 (st_rayon gvar_3345 'ls_croiselems gvar_2827))
  (ls_som0)
)

;; Referenced symbols: ENTDEL, CROISDYN-GET, CHEMDYN-GET, RE_YINV, GROUPBIB-LIST, LS_PANOC
;; Referenced strings: PatternAngle
(defun bordyn-palsave ()
  (entdel "PatternAngle")
  (re_abs2 (groupbib-list 'chemdyn-get re_yinv) gvar_3094)
  (ls_child re_yinv gvar_3345)
  (setq gvar_3094 (croisdyn-get gvar_3345))
  (re_abs1 ls_panoc 1)
)

;; Referenced symbols: LS_SOM0
(defun bordyn-palclose ()
  (eo_poly)
  (setq gvar_3345 nil)
  (setq ls_groupparent nil)
  (setq re_yinv nil)
  (ls_som0)
)

;; Referenced symbols: AXEDYN-SETRAYEXT
;; Referenced strings:  Incorrecte ! Effacement en cours...
(defun chemdyn-list ()
  (axedyn-setrayext " Incorrecte ! Effacement en cours...")
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: DCL-GRID-CLEAR, AOSUP-AXE, EN_RAYON, LS_AXES, IN_PARAM, dcl-control-setenabled, LS_EXT2, RE_COURANT
;; Referenced strings:  Incorrecte ! Effacement en cours...
(defun chemdyn-get (en_rayon)
  (if (and (aosup-axe dcl-grid-clear) (dcl-grid-clear gvar_2442) gvar_3345 (ls_ext2 en_rayon_2 (dcl-control-setenabled (in_param gvar_3345 'ls_axes))))
    (progn
      gvar_3345
    )
    (progn
      (re_courant " Incorrecte ! Effacement en cours..." en_rayon_2)
    )
  )
)

;; Original arg hints: EN_RAYON, arg_2
;; Referenced symbols: EN_RAYON, RTOS
;; Referenced strings:  Incorrecte ! Effacement en cours...
(defun chemdyn-set (en_rayon arg_2)
  (rtos " Incorrecte ! Effacement en cours..." en_rayon_2 gvar_3164)
)

;; Original arg hints: arg_1, LS_AXE, PT_PAS, LS_INTERS1, arg_5, RE_COTECHEM, STYLECHEM-GET
;; Referenced symbols: ENTDEL, /, INTERS, ST_AXEID, dcl-control-setenabled, LS_AXES, GROUPBIB-LIST, LS_OBJ, EN_RAYON, GEOMBIB-RACCORDMAX
;; Referenced strings: ls_elems,  Incorrecte ! Effacement en cours..., \n Vérification des mPolyDyns...
(defun chemdyn-create (arg_1 ls_axe pt_pas ls_inters1 arg_5 re_cotechem stylechem-get)
  (entdel "ls_elems")
  (mpolydyn-list en_rayon ls_child)
  (re_abs2 (groupbib-list " Incorrecte ! Effacement en cours..." en_rayon) gvar_3094)
  (setq inters (/ " Incorrecte ! Effacement en cours..."))
  (setq en_rayon (dcl-control-setenabled (st_axeid inters)))
  (setq ls_child (es_ext (groupbib-list 'ls_axes (st_axeid inters)) (groupbib-list 'ls_obj (geombib-raccordmax "\n Vérification des mPolyDyns..." en_rayon)) (groupbib-list '*st_axedynid* (geombib-raccordmax "\n Vérification des mPolyDyns..." en_rayon)) (groupbib-list 'dcl-form-show ls_axe_2) (groupbib-list 'va_point gvar_3162) (groupbib-list "Choisir un sommet" pt_pas_2) (groupbib-list 'croisdyn-getelems ls_inters1_2) (groupbib-list 'ls_croiselems gvar_2827) (groupbib-list 'va_inters re_cotechem_2) (groupbib-list 'ocbib-isok stylechem-get_2) (groupbib-list 'parentbib-getson 'ls_ext1) (groupbib-list 'ls_childs 'ls_ext1) (groupbib-list 'dcl-control-settext 'ls_ext1)))
  (setq gvar_3094 (ls_mpolydyns ls_child))
  (dcl-control-setenabled (st_axeid inters))
)

;; Original arg hints: AOPORA-FIN
;; Referenced symbols: LS_CROIS, ENTDEL, AOPORA-FIN, VA_POINT, IN_PARAM, ES_EXT, CROISDYN-GETELEMS, PT_PAS, RE_ABS2, GROUPBIB-LIST
;; Referenced strings: Choisir un sommet
(defun chemdyn-getparents (aopora-fin)
  (entdel 'ls_crois)
  (setq gvar_3094 (es_ext (in_param aopora-fin_2 'va_point)))
  (setq pt_pas (in_param aopora-fin_2 "Choisir un sommet"))
  (setq ls_inters1 (in_param aopora-fin_2 'croisdyn-getelems))
  (if (re_abs2 pt_pas)
    (progn
      (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 (groupbib-list 're_abs2 pt_pas)))
    )
  )
  (if (re_abs2 ls_inters1)
    (progn
      (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 (groupbib-list 're_abs2 ls_inters1)))
    )
  )
  gvar_3094
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: LS_MPOLYDYN, ENTDEL, EN_RAYON, ES_EXT, CHEMDYN-BORDTRACE, VA_POINT, IN_PARAM, PT_PAS, RE_OFFSET2, CHEMDYN-POLYTRACE
;; Referenced strings: re_offset2, Choisir un sommet,  Incorrecte ! Effacement en cours...
(defun chemdyn-pop (en_rayon / local_1)
  (entdel 'ls_mpolydyn)
  (if gvar_3345
    (progn
      (setq gvar_2437 gvar_3345)
    )
    (progn
      (setq gvar_2437 (ls_deb en_rayon_2))
    )
  )
  (setq in_num (es_ext))
  'chemdyn-bordtrace
  (chemdyn-bordtrace (in_param gvar_2437 'va_point))
  "re_offset2"
  (in_param gvar_2437 "Choisir un sommet")
  (re_offset2 pt_pas gvar_2537)
  'chemdyn-polytrace
  (in_param gvar_2437 'croisdyn-getelems)
  (re_offset2 ls_inters1 gvar_2537)
  (setq stylechem-get (in_param gvar_2437 'ocbib-isok))
  (setq ls_deb (es_ext))
  (setq gvar_2434 (in_param gvar_2437 'ls_croiselems))
  (setq ls_axe (in_param gvar_2437 'dcl-form-show))
  (setq stylechem-get (in_param gvar_2437 'ocbib-isok))
  (setq re_cotechem (in_param gvar_2437 'va_inters))
  (setq gvar_2531 (in_param gvar_2437 'parentbib-getson))
  (setq gvar_2530 (in_param gvar_2437 'ls_childs))
  (setq re_bulge (in_param gvar_2437 'dcl-control-settext))
  (setq gvar_2519 (va_ent (in_param gvar_2437 'dcl-form-show)))
  (setq gvar_2431 (in_param gvar_2519 'mpolydyn-set))
  (mpolydyn-popgo (in_param gvar_2437 'dcl-form-show))
  (setq local_1 stylechem-get)
  (and (setq gvar_3155 'chemdyn-bordtrace) (setq gvar_2537 (chemdyn-bordtrace (in_param gvar_2437 'va_point))) (setq gvar_3155 "re_offset2") (setq pt_pas (in_param gvar_2437 "Choisir un sommet")) (setq chemdyn-hachtrace (re_offset2 pt_pas gvar_2537)) (setq gvar_3155 'chemdyn-polytrace) (setq ls_inters1 (in_param gvar_2437 'croisdyn-getelems)) (setq gvar_2532 (re_offset2 ls_inters1 gvar_2537)) (setq gvar_2429 (mpolydyn-popgo (in_param gvar_2437 'dcl-form-show))))
  ;; init-args 3: 'aosup-mpolydyn, nil
  (foreach aosup-mpolydyn local_1
    (if (cadr (aosup-mpolydyn aosup-mpolydyn))
      (progn
        (setq stylechem-get (blkpolydial-getpoint aosup-mpolydyn stylechem-get))
      )
    )
  )
  (setq polydyn-list (polydyn-list (groupbib-list " Incorrecte ! Effacement en cours..." en_rayon_2)))
  (setq local_1 polydyn-list)
  ;; init-args 3: 'ls_polydyns, nil
  (foreach ls_polydyns local_1
    (ls_polydyn (eo_polyabs ls_polydyns))
    nil
    (or (or (and (odclbib-fillcombo (axedyn-reaccreate ls_polydyns) 'ls_polydyn) (setq polydyn-set (ls_polydyn (eo_polyabs ls_polydyns)))) (odclbib-fillcombo en_rayon_2 (eo_polyabs (in_param polydyn-set "Origine")))) (odclbib-fillcombo en_rayon_2 (eo_polyabs (in_param polydyn-set "\n -> PolyDyn "))))
    (dcl-grid-setcurcell ls_deb ls_polydyns)
    (setq ls_deb (dcl-grid-setcurcell ls_deb ls_polydyns))
    T
    (dcl-grid-setcurcell stylechem-get ls_polydyns)
    (setq stylechem-get (dcl-grid-setcurcell stylechem-get ls_polydyns))
  )
  (setq gvar_2531 (in_param gvar_2437 'parentbib-getson))
  (setq gvar_2530 (in_param gvar_2437 'ls_childs))
  (setq gvar_2418 (polydyn-popgo gvar_2431))
  (setq sihlin-larg (aosup-polydyn gvar_2418))
  (setq sihlin-trace (projet_pa_croisdyn gvar_2418))
  (setq projet_pa_chemdyn_bt_appliquer (stylechem-list gvar_2537 chemdyn-hachtrace gvar_2532 sihlin-larg polybib-vtxjoin))
  (setq projet_pa_chemdyn_bt_ok (stylechem-list gvar_2537 chemdyn-hachtrace gvar_2532 sihlin-trace polybib-vtxjoin))
  (en_refoffset gvar_2531)
  (if (setq gvar_2494 (en_refoffset gvar_2531))
    (progn
      (sssetfirst gvar_2494 projet_pa_chemdyn_bt_appliquer (es_ext (groupbib-list 62 256) (groupbib-list 8 'en_edit)))
    )
    (progn
      (setq gvar_2494 (*en_ray* projet_pa_chemdyn_bt_appliquer (es_ext (groupbib-list 62 256) (groupbib-list 8 'en_edit))))
      (setq gvar_2494 (undobib-stop))
      (setq gvar_2437 (st_rayon gvar_2437 'parentbib-getson (1- gvar_2494)))
    )
  )
  (aoctrl-polydyn (es_ext (dcl-forcedwgredraw gvar_2494)))
  (setq in_num (dcl-grid-setcurcell in_num gvar_2494))
  (setq gvar_3155 'aoctrl-mpolydyn)
  (en_refoffset gvar_2530)
  (if (setq aoctrl-sihpp (en_refoffset gvar_2530))
    (progn
      (sssetfirst aoctrl-sihpp projet_pa_chemdyn_bt_ok (es_ext (groupbib-list 62 256) (groupbib-list 8 'en_edit)))
    )
    (progn
      (setq aoctrl-sihpp (*en_ray* projet_pa_chemdyn_bt_ok (es_ext (groupbib-list 62 256) (groupbib-list 8 'en_edit))))
      (setq gvar_2437 (st_rayon gvar_2437 'ls_childs (1- aoctrl-sihpp)))
    )
  )
  (aoctrl-polydyn (es_ext (dcl-forcedwgredraw aoctrl-sihpp)))
  (setq in_num (dcl-grid-setcurcell in_num aoctrl-sihpp))
  (setq local_1 (st_rayon stylechem-get ls_deb))
  ;; init-args 3: 'aosup-mpolydyn, nil
  (foreach aosup-mpolydyn local_1
    T
    (and (odclbib-fillcombo (undobib-start aosup-mpolydyn) 'es_ext) (odclbib-fillcombo (axedyn-reaccreate aosup-mpolydyn) 'ls_polydyn) (ls_polydyn (eo_polyabs aosup-mpolydyn)) (re_rayee (eo_polyabs aosup-mpolydyn)))
  )
  (setq local_1 gvar_2431)
  ;; init-args 3: 're_rayei, nil
  (foreach re_rayei local_1
    (setq re_rayie nil)
    (setq polybib-subpolybisinv (in_param re_rayei 'st_type))
    (or (or (or (odclbib-fillcombo polybib-subpolybisinv 're_rayii) (odclbib-fillcombo polybib-subpolybisinv '(st_id ld_crois))) (odclbib-fillcombo polybib-subpolybisinv "Croisée ")) (odclbib-fillcombo polybib-subpolybisinv "TEXTE"))
    (croisdyn-getparents gvar_2537 chemdyn-hachtrace gvar_2532 gvar_2408 gvar_2827 re_cotechem gvar_2406 ld_crois croisdyn-getparents stylechem-get blkbib-getparententities)
    (setq gvar_2408 (ls_visient gvar_2434 (in_param re_rayei "re_rayee")))
    (setq gvar_2827 (ls_visient gvar_2434 (in_param re_rayei 'ls_croiselems)))
    (setq gvar_2406 (in_param re_rayei "re_rayie"))
    (setq ld_crois (in_param re_rayei "ha_contour"))
    (setq croisdyn-getparents (in_param re_rayei 'croisdyn-set))
    (setq blkbib-getparententities (in_param re_rayei "Repère"))
    (setq ls_axe (in_param re_rayei 'dcl-form-show))
    (setq gvar_2408 (ls_visient gvar_2434 (in_param re_rayei "re_rayee")))
    (setq gvar_2827 (ls_visient gvar_2434 (in_param re_rayei 'ls_croiselems)))
    (setq ls_axe (in_param re_rayei 'dcl-form-show))
    (setq gvar_2519 (ls_vtxsbase2 ls_axe))
    (setq listbib-min (in_param gvar_2519 'intersbib-getinsidevtxs))
    (or (or (ls_ext2 re_rayei (vl-acad-defun (dcl-grid-addrow 1 gvar_2429))) (ls_ext2 re_rayei (vl-acad-defun (dcl-grid-addrow 2 gvar_2429)))) polybib-vtxjoin)
    (st_syleid gvar_2537 chemdyn-hachtrace gvar_2532 gvar_2408 gvar_2827 re_cotechem stylechem-get ls_axe)
    (setq re_rayie nil)
    (st_syleid gvar_2537 chemdyn-hachtrace gvar_2532 gvar_2408 gvar_2827 re_cotechem (st_rayon stylechem-get ls_deb) ls_axe)
    (setq re_rayie '(ls_style ls_elems ls_elem ls_hach ls_bords ls_bordi ls_borde))
    (st_syleid gvar_2537 chemdyn-hachtrace gvar_2532 gvar_2408 gvar_2827 re_cotechem (st_rayon stylechem-get ls_deb) ls_axe)
    (setq re_rayie '(lambda (ls_elem) (= "H" (listbib-key ls_elem "st_type"))))
    (setq gvar_2408 (st_syle gvar_2408 (ls_visient gvar_2827 listbib-min)))
    (listbib-sortkey gvar_2537 chemdyn-hachtrace gvar_2532 gvar_2408 ls_bords re_cotechem stylechem-get blkbib-getparententities)
    (setq gvar_2408 (ls_visient gvar_2434 (in_param re_rayei "re_rayee")))
    (setq gvar_2418 (dcl-grid-setcurcell gvar_2418 gvar_2408))
    (setq ls_bords (ls_visient gvar_2434 (in_param re_rayei '(lambda (ls_elem) (= "B" (listbib-key ls_elem "st_type"))))))
    (setq blkbib-getparententities (in_param re_rayei "Repère"))
    (ls_bordi gvar_2537 chemdyn-hachtrace gvar_2532 gvar_2408 re_cotechem stylechem-get blkbib-getparententities)
    (setq gvar_2408 (ls_visient gvar_2434 (in_param re_rayei "re_rayee")))
    (setq blkbib-getparententities (in_param re_rayei "Repère"))
  )
  (if (en_refoffset re_bulge)
    (progn
      (re_finoffset (re_ray re_bulge) (es_ext aoctrl-sihpp gvar_2494))
      (entbib-dellist re_bulge)
      (setq gvar_3155 're_deboffset)
      (column (re_ray re_bulge) in_num)
    )
    (progn
      (setq gvar_3155 '(ls_vtxsbase ls_vtxsbase2 en_poly ls_vtxs ls_polyhach ls_vtx en_hach))
      (setq reabib-deleteobjectreactor (polybib-inv in_num))
      (setq gvar_3370 nil)
      (setq gvar_2437 (st_rayon gvar_2437 'dcl-control-settext (projet_pa_axes_ca_sommet reabib-deleteobjectreactor)))
      (mpolydyn-list en_rayon_2 gvar_2437)
    )
  )
  T
  nil
  (ls_som0)
  (and (dcl-forcedwgredraw (es_ext (dcl-forcedwgredraw gvar_2537))) (setq gvar_3155 nil))
)

;; Original arg hints: arg_1
;; Referenced symbols: LS_SYTLEBORD, ENTDEL, ES_EXT, RE_RAYEI, ST_TYPE, IN_PARAM, POLYBIB-SUBPOLYBISINV, RE_RAYII, ODCLBIB-FILLCOMBO, LS_VISIENT
;; Referenced strings: Croisée , TEXTE, re_rayee
(defun chemdyn-getoffset (arg_1 / local_1)
  (entdel 'ls_sytlebord)
  (setq gvar_2418 (es_ext))
  (setq local_1 gvar_2431)
  ;; init-args 3: 're_rayei, nil
  (foreach re_rayei local_1
    (setq polybib-subpolybisinv (in_param re_rayei 'st_type))
    (or (or (or (odclbib-fillcombo polybib-subpolybisinv 're_rayii) (odclbib-fillcombo polybib-subpolybisinv '(st_id ld_crois))) (odclbib-fillcombo polybib-subpolybisinv "Croisée ")) (odclbib-fillcombo polybib-subpolybisinv "TEXTE"))
    (setq gvar_2408 (ls_visient gvar_2434 (in_param re_rayei "re_rayee")))
    (setq gvar_2827 (ls_visient gvar_2434 (in_param re_rayei 'ls_croiselems)))
    (setq gvar_2418 (dcl-grid-setcurcell gvar_2418 gvar_2408))
    (setq gvar_2408 (ls_visient gvar_2434 (in_param re_rayei "re_rayee")))
    (setq gvar_2827 (ls_visient gvar_2434 (in_param re_rayei 'ls_croiselems)))
    (setq gvar_2418 (dcl-grid-setcurcell gvar_2418 gvar_2408))
    (setq ls_axe (in_param re_rayei 'dcl-form-show))
    (setq gvar_2519 (ls_vtxsbase2 ls_axe))
    (setq listbib-min (in_param gvar_2519 'intersbib-getinsidevtxs))
    (setq gvar_2408 (st_syle gvar_2408 (ls_visient gvar_2827 listbib-min)))
    (setq gvar_2418 (dcl-grid-setcurcell gvar_2418 gvar_2408))
    (setq gvar_2408 (ls_visient gvar_2434 (in_param re_rayei "re_rayee")))
    (setq gvar_2418 (dcl-grid-setcurcell gvar_2418 gvar_2408))
    (setq ls_bords (ls_visient gvar_2434 (in_param re_rayei '(lambda (ls_elem) (= "B" (listbib-key ls_elem "st_type"))))))
    (setq gvar_2418 (dcl-grid-setcurcell gvar_2418 ls_bords))
    (setq gvar_2408 (ls_visient gvar_2434 (in_param re_rayei "re_rayee")))
    (setq gvar_2418 (dcl-grid-setcurcell gvar_2418 gvar_2408))
  )
  gvar_2418
)

;; Original arg hints: arg_1, CHEMDYN-HACHTRACE, arg_3, arg_4, RE_COTECHEM, STYLECHEM-GET, LS_AXE
;; Referenced symbols: LS_BORDE, ENTDEL, CHEMDYN-HACHTRACE, POLYBIB-VTXJOIN, STYLECHEM-LIST, LS_ABS2, dcl-form-close, EN_EDIT, GROUPBIB-LIST, ES_EXT
(defun chemdyn-bordtrace (arg_1 chemdyn-hachtrace arg_3 arg_4 re_cotechem stylechem-get ls_axe / st_type re_offset re_offset2 re_cote re_larg local_2)
  (entdel 'ls_borde)
  (setq gvar_3155 '(ld_crois ls_group ha_group))
  (setq dcl-form-close (stylechem-list re_offset2 re_offset2 gvar_2532 gvar_2408 polybib-vtxjoin))
  (setq gvar_3155 'ls_abs2)
  (setq en_base (*en_ray* dcl-form-close (es_ext (groupbib-list 8 'en_edit))))
  (setq gvar_3155 'eo_base)
  (setq entbib-key (palbib-init en_base (ls_param re_offset2 re_offset2)))
  (setq ha_contour (palbib-init en_base (ls_param re_offset2 gvar_2532)))
  (setq en_refoffset (en_refoffset en_base entbib-key ha_contour gvar_2827 nil nil re_cotechem_2 stylechem-get_2 ls_axe_2))
  (en_ref1 (st_rayon en_refoffset (es_ext en_base)))
)

;; Original arg hints: arg_1, CHEMDYN-HACHTRACE, arg_3, LS_BORDS, RE_COTECHEM, STYLECHEM-GET, BLKBIB-GETPARENTENTITIES
;; Referenced symbols: EN_REF2, ENTDEL, LS_CHEM1, CHEMDYN-HACHTRACE, POLYBIB-VTXJOIN, STYLECHEM-LIST, LS_BORDS, LS_CHEM2, PROJET/PA_CHEMDYN/RE_COTE, vl-ACAD-defun
;; Referenced strings: Appliquer
(defun chemdyn-hachtrace (arg_1 chemdyn-hachtrace arg_3 ls_bords re_cotechem stylechem-get blkbib-getparententities / st_type re_offset re_offset2 re_cote re_larg local_2 local_8)
  (entdel 'en_ref2)
  (column ls_propsdescs)
  (setq gvar_3155 'ls_chem1)
  (setq projet_pa_chemdyn_re_cote (stylechem-list re_offset2 re_offset2 gvar_2532 gvar_2408 polybib-vtxjoin))
  (setq ha_int1 (ls_chem2 (stylechem-list re_offset2 re_offset2 gvar_2532 ls_bords_2 polybib-vtxjoin)))
  (setq projet_pa_chemdyn_re_cote (st_rayon (vl-acad-defun projet_pa_chemdyn_re_cote) (es_ext (es_ext (re_angle0 10 (1- projet_pa_chemdyn_re_cote)) (groupbib-list 40 'ha_poly) (groupbib-list 41 'ha_poly) (groupbib-list 42 'ha_poly))) ha_int1))
  (setq gvar_3155 'ha_int2)
  (setq ls_propsdescs (chemdyn-pop projet_pa_chemdyn_re_cote (es_ext (groupbib-list 70 1) (groupbib-list 8 blkbib-getparententities_2))))
  (setq dcl-form-close (ha_ext1 ls_propsdescs stylechem-get_2 re_cotechem_2))
  (setq ha_ext2 (es_ext))
  (setq gvar_3155 'en_int1)
  (setq local_8 dcl-form-close)
  ;; init-args 3: 'c:projet_md_repblk_oninitialize, nil
  (foreach gvar_2759_c_projet_md_repblk_oninitialize local_8
    (setq ls_propsdescs (*en_ray* gvar_2759_c_projet_md_repblk_oninitialize (es_ext (groupbib-list 70 1) (groupbib-list 62 256) (groupbib-list "Appliquer" blkbib-getparententities_2))))
    (setq ha_ext2 (dcl-grid-setcurcell ha_ext2 ls_propsdescs))
    (setq in_num (dcl-grid-setcurcell in_num ls_propsdescs))
  )
  (setq gvar_3155 'en_int2)
  (en_ext2 ha_ext2 nil 'en_ext1 'ha_poly 'en_poly nil (es_ext (groupbib-list 62 256) (groupbib-list "Appliquer" blkbib-getparententities_2)))
  (rem gvar_2991)
  (dcl-grid-setcurcell in_num ls_elems1)
  T
  (and (setq gvar_2991 (en_ext2 ha_ext2 nil 'en_ext1 'ha_poly 'en_poly nil (es_ext (groupbib-list 62 256) (groupbib-list "Appliquer" blkbib-getparententities_2)))) (setq ls_elems1 (rem gvar_2991)) (setq in_num (dcl-grid-setcurcell in_num ls_elems1)))
)

;; Original arg hints: arg_1, CHEMDYN-HACHTRACE, arg_3, RE_COTECHEM, STYLECHEM-GET, BLKBIB-GETPARENTENTITIES
;; Referenced symbols: LS_ELEMS2, ENTDEL, CHEMDYN-HACHTRACE, POLYBIB-VTXJOIN, STYLECHEM-LIST, PROJET/PA_CHEMDYN/RE_COTE, EN_EDIT, GROUPBIB-LIST, ES_EXT, CHEMDYN-POP
(defun chemdyn-polytrace (arg_1 chemdyn-hachtrace arg_3 re_cotechem stylechem-get blkbib-getparententities / st_type re_offset re_offset2 re_cote re_larg local_2 local_7)
  (entdel 'ls_elems2)
  (setq projet_pa_chemdyn_re_cote (stylechem-list re_offset2 re_offset2 gvar_2532 gvar_2408 polybib-vtxjoin))
  (setq gvar_3153 (chemdyn-pop projet_pa_chemdyn_re_cote (es_ext (groupbib-list 8 'en_edit))))
  (setq gvar_3155 're_cote2)
  (setq gvar_2544 (bo_regen gvar_3153 stylechem-get_2 re_cotechem_2))
  (setq local_7 gvar_2544)
  ;; init-args 3: 're_cote1, nil
  (foreach re_cote1 local_7
    (setq ls_propsdescs (*en_ray* re_cote1 (es_ext (groupbib-list 62 256) (groupbib-list 8 blkbib-getparententities_2))))
    (setq in_num (dcl-grid-setcurcell in_num ls_propsdescs))
  )
  (column gvar_3153)
)

;; Original arg hints: arg_1, CHEMDYN-HACHTRACE, arg_3, arg_4, RE_COTECHEM, arg_6, LD_CROIS, CROISDYN-GETPARENTS, STYLECHEM-GET, BLKBIB-GETPARENTENTITIES
;; Referenced symbols: LS_ELEMS2, ENTDEL, GROUPBIB-LIST, CROISDYN-SET, CROISDYN-GETPARENTS, ES_EXT, ENTBIB-OFFSETTEMP, CHEMDYN-HACHTRACE, POLYBIB-VTXJOIN, STYLECHEM-LIST
;; Referenced strings: re_rayie
(defun chemdyn-signatrace (arg_1 chemdyn-hachtrace arg_3 arg_4 re_cotechem arg_6 ld_crois croisdyn-getparents stylechem-get blkbib-getparententities / st_type re_offset re_offset2 re_cote re_larg local_2 local_11)
  (entdel 'ls_elems2)
  (column gvar_3153)
  (setq listbib-min (entbib-offsettemp (es_ext (groupbib-list "re_rayie" gvar_2406) (groupbib-list 'croisdyn-set croisdyn-getparents_2))))
  (setq projet_pa_chemdyn_re_cote (stylechem-list re_offset2 re_offset2 gvar_2532 gvar_2408 polybib-vtxjoin))
  (setq gvar_3153 (chemdyn-pop projet_pa_chemdyn_re_cote (es_ext (groupbib-list 8 'en_edit))))
  (setq gvar_3155 're_cote2)
  (setq gvar_2544 (bo_regen gvar_3153 stylechem-get_2 re_cotechem_2))
  (setq local_11 gvar_2544)
  ;; init-args 3: 're_cote1, nil
  nil
  (foreach re_cote1 local_11
    (en_int1dc gvar_3153 'ha_poly (repdyn-get gvar_3153) 0 gvar_2827 ld_crois_2 listbib-min blkbib-getparententities_2)
    (setq gvar_3153 (*en_ray* re_cote1 (es_ext (groupbib-list 8 blkbib-getparententities_2))))
    (column gvar_3153)
  )
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: EN_RAYON, vlax-erased-p
(defun chemdyn-modgo (en_rayon)
  (setq re_yinv en_rayon_2)
  (vlax-erased-p gvar_2442)
)

;; Referenced symbols: HA_PANO, ENTDEL, RE_YINV, LS_OBJ, IN_PARAM, CROISDYN-GETELEMS, LS_CROISELEMS, OCBIB-ISOK, dcl-form-show, SIVPANO-SET
;; Referenced strings: Choisir un sommet, \n Vérification des axes...
(defun c:projet_pa_chemdyn_oninitialize ()
  (entdel 'ha_pano)
  (bo_lctabs sivpano-set in_lon0)
  (ls_vtx0 en_ext1dc (polybib-lwvertices 'en_int2dc (en_ext2dc)))
  (setq gvar_3345 (ls_deb re_yinv))
  (setq ls_groupparent gvar_3345)
  (setq in_lon0 (in_param gvar_3345 'ls_obj))
  (setq pt_pas (in_param gvar_3345 "Choisir un sommet"))
  (setq ls_inters1 (in_param gvar_3345 'croisdyn-getelems))
  (setq gvar_2827 (in_param gvar_3345 'ls_croiselems))
  (setq stylechem-get (in_param gvar_3345 'ocbib-isok))
  (setq ls_axe (in_param gvar_3345 'dcl-form-show))
  (laybib-newlay ls_axe (polybib-lwvertices 'axedyn-reaccreate (en_ext2dc)))
  (if (setq polybib-subpolyoffinv (laybib-newlay ls_axe (polybib-lwvertices 'axedyn-reaccreate (en_ext2dc))))
    (progn
      (bo_invpoly1 en_ext1dc polybib-subpolyoffinv)
    )
    (progn
      (bo_invpoly1 en_ext1dc 0)
    )
  )
  (ls_vtx0 ls_pt1 (es_ext '(ls_axes ls_axe) "\n Vérification des axes..."))
  (if (re_angle gvar_2827 'en_poly)
    (progn
      (bo_invpoly1 ls_pt1 1)
    )
    (progn
      (bo_invpoly1 ls_pt1 0)
    )
  )
  (vlax-vla-object->ename ls_dcs polybib-vtxjoin)
  (polybib-absrem)
)

;; Referenced symbols: LS_FIN, ENTDEL, EN_EXT1DC, LS_PT1, CROISDYN-TRACEDEMIEXT, LS_PT1E, LS_DCS, ES_EXT, LS_ABS1E, OCBIB-ISOK
;; Referenced strings: Impossible de tracer le demi intérieur
(defun c:projet_pa_chemdyn_bt_select_onclicked ( / local_0)
  (entdel 'ls_fin)
  (setq ls_abs1e (es_ext en_ext1dc ls_pt1 gvar_2362 croisdyn-tracedemiext ls_pt1e ls_dcs))
  (setq local_0 ls_abs1e)
  ;; init-args 3: "Impossible de tracer le demi intérieur", nil
  (foreach gvar_2358 local_0
    (vlax-vla-object->ename gvar_2358 nil)
  )
  (axe-set 'ocbib-isok ls_dcs)
  (setq local_0 ls_abs1e)
  ;; init-args 3: "Impossible de tracer le demi intérieur", nil
  (foreach gvar_2358 local_0
    (vlax-vla-object->ename gvar_2358 polybib-vtxjoin)
  )
  (ls_som0)
)

;; Referenced symbols: ENTDEL, EN_EXT1DC, AXEDYN-REACCREATE, EN_EXT2DC, POLYBIB-LWVERTICES, DCL-GRID-ADDROW, LS_PT1, RE_ANGLE, EN_POLY, LS_OBJ
(defun chemdyn-palapply ()
  (entdel '(lambda (ls_pt) (list (cons 10 ls_pt))))
  (setq ls_axe (dcl-grid-addrow (ls_props2 en_ext1dc) (polybib-lwvertices 'axedyn-reaccreate (en_ext2dc))))
  (if (re_angle 1 (ls_props2 ls_pt1))
    (progn
      'en_poly
    )
    (progn
      '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)
    )
  )
  (croisdyn-tracedemiint re_yinv)
  (setq gvar_2827 nil)
  (setq re_cotechem (axe-set gvar_2447))
  (setq gvar_3345 (st_rayon gvar_3345 'ls_obj (errbib-catchapply sivpano-set)))
  (setq gvar_3345 (st_rayon gvar_3345 'va_inters re_cotechem))
  (setq gvar_3345 (st_rayon gvar_3345 'dcl-form-show ls_axe))
  (setq gvar_3345 (st_rayon gvar_3345 'ls_croiselems gvar_2827))
  (ls_som0)
)

;; Referenced symbols: ENTDEL, LS_MPOLYDYNS, RE_YINV, GROUPBIB-LIST, MPOLYDYN-LIST
;; Referenced strings: PatternAngle,  Incorrecte ! Effacement en cours...
(defun chemdyn-palsave ()
  (entdel "PatternAngle")
  (re_abs2 (groupbib-list " Incorrecte ! Effacement en cours..." re_yinv) gvar_3094)
  (mpolydyn-list re_yinv gvar_3345)
  (setq gvar_3094 (ls_mpolydyns gvar_3345))
  (re_abs1 gvar_2442 1)
)

;; Referenced symbols: LS_PT1I, vlax-curve-getEndParam, LS_SOM0
(defun chemdyn-palclose ()
  (eo_poly)
  (vlax-curve-getendparam 'ls_pt1i)
  (setq gvar_3345 nil)
  (setq ls_groupparent nil)
  (setq re_yinv nil)
  (ls_som0)
)

;; Referenced symbols: LS_ABS1I, LS_SOM0, PTBIB-PTBARY, OCBIB-ID2ENTBASE, EN_HACHCONTOUR
(defun aoctrl-go ()
  (ls_som0 'ls_abs1i)
  (ptbib-ptbary)
  (ocbib-id2entbase)
  (ocbib-id2entbase)
  (en_hachcontour)
  (ls_som0)
)

;; Referenced symbols: ENTDEL, RE_INV, LS_SOM0, LS_PT2, LS_DC, POLYBIB-VTXJOIN, AXEDYN-REACCREATE, EO_POLYABS, GETPOINT, IN_PARAM
;; Referenced strings: ls_abs,  [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :, \n -> PolyDyn 
(defun aoctrl-sihpp ( / local_0)
  (entdel "ls_abs")
  (ls_som0 're_inv)
  (setq ls_pt2 (re_inv))
  (setq local_0 ls_pt2)
  ;; init-args 3: 'ls_dc, nil
  (foreach ls_dc local_0
    (setq racdyn-calcvtx polybib-vtxjoin)
    (setq ls_bulge nil)
    (setq en_rayon (axedyn-reaccreate ls_dc))
    (setq ls_dc (eo_polyabs ls_dc))
    (setq gvar_3160 (in_param ls_dc 'getpoint))
    (setq in_sens (in_param ls_dc " [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :"))
    (setq in_cote (in_param ls_dc "\n -> PolyDyn "))
    (setq ls_vtxi (in_param ls_dc "Origine"))
    (setq ls_vtxs1 (in_param ls_dc 'ls_vtxe))
    (setq re_bulge (in_param ls_dc 'dcl-control-settext))
    (setq racdyn-calcvtx T)
    (if (and gvar_3160 in_sens in_cote ls_vtxi ls_vtxs1 (hachbib-vtxs2hach in_cote) (hachbib-vtxs2hach ls_vtxi) (hachbib-vtxs2hach ls_vtxs1) racdyn-calcvtx)
      (progn
        (if ls_bulge
          (progn
            (ls_som0 (geombib-raccordmax 'croisdyn-tracebordhach2 en_rayon '(ls_pt1 ls_pt2 ls_vtxs ls_vtxe ls_vtxi ls_dc ls_bulge)))
            (ls_som0 'blkbib-get_visiname)
          )
        )
      )
      (progn
        (ls_som0 (geombib-raccordmax '(bo_meme en_bordi en_borde ls_vtxshach en_hachcontour st_layer st_style re_cote) en_rayon 'bo_meme))
        (en_borde (groupbib-list 'en_bordi en_rayon) polybib-vtxjoin)
        (ls_som0 'blkbib-get_visiname)
      )
    )
  )
  (ls_som0 'poly-vtxjoinauto)
)

;; Referenced symbols: LS_VTXSHACH, ENTDEL, LS_SOM0, acByLayer, ENTBIB-OFFSET, EN_BORDT, POLYBIB-VTXJOIN, AXEDYN-REACCREATE, EO_POLYABS, IN_PARAM
;; Referenced strings: Color
(defun aoctrl-pano ( / local_0 local_1)
  (entdel 'ls_vtxshach)
  (ls_som0 "Color")
  (setq entbib-offset (acbylayer))
  (setq local_0 entbib-offset)
  ;; init-args 3: 'en_bordt, nil
  (foreach en_bordt local_0
    (setq racdyn-calcvtx polybib-vtxjoin)
    (setq ls_bulge nil)
    (setq en_rayon (axedyn-reaccreate en_bordt))
    (setq en_bordt (eo_polyabs en_bordt))
    (setq projet_pa_croisdyn_st_nom (in_param en_bordt '(st_nom re_rayee re_rayei re_rayie re_rayii)))
    (setq projet_pa_croisdyn_re_rayei (in_param en_bordt 'projet_pa_croisdyn_re_rayee))
    (setq re_bulge (in_param en_bordt 'dcl-control-settext))
    (if (and projet_pa_croisdyn_re_rayei (re_ray projet_pa_croisdyn_re_rayei) (polar (re_ray projet_pa_croisdyn_re_rayei)) (cadr T))
      (progn
        (setq racdyn-calcvtx nil)
      )
    )
    (setq projet_pa_croisdyn_re_rayie projet_pa_croisdyn_st_nom)
    (setq local_1 projet_pa_croisdyn_re_rayie)
    ;; init-args 3: 'projet_pa_croisdyn_re_rayii, nil
    (foreach projet_pa_croisdyn_re_rayii local_1
      (setq ls_rays (in_param projet_pa_croisdyn_re_rayii 5))
      (if (and ls_rays (re_ray ls_rays) (polar (re_ray ls_rays)) (cadr T))
        (progn
          (setq projet_pa_croisdyn_re_rayie (blkpolydial-getpoint projet_pa_croisdyn_re_rayii projet_pa_croisdyn_re_rayie))
          (setq ls_bulge polybib-vtxjoin)
        )
      )
    )
    (if racdyn-calcvtx
      (progn
        (if ls_bulge
          (progn
            (ls_som0 (geombib-raccordmax 'st_poly1 en_rayon '(ls_pt1 ls_pt2 ls_vtxs ls_vtxe ls_vtxi ls_dc ls_bulge)))
            (st_poly2 en_rayon en_bordt)
            (in_cote1 (dcl-forcedwgredraw (re_ray projet_pa_croisdyn_re_rayei)) nil nil)
            (ls_som0 'blkbib-get_visiname)
            (setq en_bordt (st_rayon en_bordt '(st_nom re_rayee re_rayei re_rayie re_rayii) projet_pa_croisdyn_re_rayie))
          )
        )
      )
      (progn
        (ls_som0 (geombib-raccordmax 'st_poly1 en_rayon 'bo_meme))
        (in_cote2 (groupbib-list 'in_cote2 en_rayon) polybib-vtxjoin)
        (ls_som0 'blkbib-get_visiname)
      )
    )
  )
  (ls_som0 'poly-vtxjoinauto)
)

;; Referenced symbols: *EN_CROISHIGHLIGTH*, ENTDEL, HA_POLY1, LS_SOM0, BLKPOLY-REACCREATE, AXEDYN-REACCREATE, LS_DIST, POLYBIB-LWVERTICES, LS_XY, POLYBIB-VTXJOIN
;; Referenced strings: va_ins
(defun aoctrl-axedyn ( / local_0)
  (entdel '*en_croishighligth*)
  (ls_som0 'ha_poly1)
  (setq ls_xy (blkpoly-reaccreate))
  (setq ha_poly2 (polybib-lwvertices 'axedyn-reaccreate (ls_dist)))
  (setq local_0 ls_xy)
  ;; init-args 3: "va_ins", nil
  (foreach gvar_3251 local_0
    T
    (setq racdyn-calcvtx polybib-vtxjoin)
    (setq ls_bulge nil)
    (setq en_rayon (axedyn-reaccreate gvar_3251))
    (setq gvar_3251 (eo_polyabs gvar_3251))
    (setq gvar_3374 (in_param gvar_3251 '(st_nom st_style)))
    (setq axedyn-list (in_param gvar_3251 'listbib-keydefault))
    (setq gvar_3385 (in_param gvar_3251 'st_desc))
    (setq axedyn-set (in_param gvar_3251 'projet_pa_axes_st_style))
    (setq aopora-fin (in_param gvar_3251 'stylepoly-fillcombo))
    (setq pt_2 (in_param gvar_3251 'projet_pa_axes_st_nom))
    (setq re_bulge (in_param gvar_3251 'dcl-control-settext))
    (setq ls_axe (in_param gvar_3251 'dcl-form-show))
    T
    T
    (if (and (or (and (and gvar_3385 axedyn-set poly-vlatrace) (setq racdyn-calcvtx T)) (or (re_angle (st_ray2 gvar_3385) (st_ray2 axedyn-set) (st_ray2 aopora-fin)) (re_angle (st_ray2 gvar_3385) (st_ray2 axedyn-set) (st_axeid (st_ray2 aopora-fin))))) (and (setq racdyn-calcvtx T) racdyn-calcvtx))
      (progn
        (if (cadr (laybib-newlay ls_axe ha_poly2))
          (progn
            (vla-put-lineweight en_rayon gvar_3251)
            (setq gvar_3251 (st_rayon gvar_3251 'dcl-form-show (axedyn-reaccreate ha_poly2)))
            (setq ls_bulge polybib-vtxjoin)
          )
        )
        (if (and pt_2 (re_ray pt_2) (polar (re_ray pt_2)) (cadr T))
          (progn
            (column (re_ray re_bulge) (es_ext getreal))
            (blkpoly-popgo (dcl-forcedwgredraw getreal))
            (blkbib-set_dynprops en_rayon gvar_3251)
            (setq dcl-form-close (polybib-lwvertices 'vla-put-linetype gvar_3385))
            (setq getreal (*en_ray* dcl-form-close (es_ext (groupbib-list 8 'vla-put-color))))
            (setq pt_2 (1- getreal))
            (setq gvar_3251 (st_rayon gvar_3251 'projet_pa_axes_st_nom pt_2))
            (setq ls_bulge polybib-vtxjoin)
          )
        )
        (if (and gvar_3374 (re_ray gvar_3374) (polar (re_ray gvar_3374)) (cadr T))
          (progn
            (setq ls_bulge polybib-vtxjoin)
          )
        )
        (ls_som0 (geombib-raccordmax 'redraw en_rayon 'croisdyn-selray))
        (blkbib-blk_ins en_rayon)
        T
        (and ls_bulge (ls_som0 'blkbib-get_visiname))
      )
      (progn
        (ls_som0 (geombib-raccordmax 'redraw en_rayon '(st_nom ls_rays ls_ray st_ray re_ray)))
        (in_add (groupbib-list 'vl-position en_rayon) polybib-vtxjoin)
        (ls_som0 'blkbib-get_visiname)
      )
    )
  )
  (ls_som0 'poly-vtxjoinauto)
)

;; Referenced symbols: IN_ADD, ENTDEL, IN_MOD, LS_SOM0, IN_DEL, AXEDYN-REACCREATE, LS_DIST, POLYBIB-LWVERTICES, IMPORTBIB-GETFILTER, POLYBIB-VTXJOIN
;; Referenced strings: \nBoucle sur les sources, st_filename
(defun aoctrl-mpolydyn ( / local_0 local_1)
  (entdel 'in_add)
  (ls_som0 'in_mod)
  (setq gvar_2300 (in_del))
  (setq ha_poly2 (polybib-lwvertices 'axedyn-reaccreate (ls_dist)))
  (setq local_0 gvar_2300)
  ;; init-args 3: 'importbib-getfilter, nil
  (foreach importbib-getfilter local_0
    (setq racdyn-calcvtx polybib-vtxjoin)
    (setq ls_bulge nil)
    (setq en_rayon (axedyn-reaccreate importbib-getfilter))
    (setq importbib-getfilter (eo_polyabs importbib-getfilter))
    (setq gvar_3265 (in_param importbib-getfilter 'ls_importfilters))
    (setq aopora-fin (in_param importbib-getfilter 'stylepoly-fillcombo))
    (setq ls_importsources (in_param importbib-getfilter "\nBoucle sur les sources"))
    (setq poly-vlatrace (in_param importbib-getfilter 'ls_importsource))
    (setq ls_axe (in_param importbib-getfilter 'dcl-form-show))
    T
    (setq local_1 aopora-fin)
    (and (and aopora-fin ls_importsources poly-vlatrace (axedyn-reaccreate aopora-fin) (axedyn-reaccreate ls_importsources) (axedyn-reaccreate poly-vlatrace) (re_angle (st_ray2 aopora-fin) (st_ray2 ls_importsources) (st_ray2 poly-vlatrace))) (setq racdyn-calcvtx T))
    ;; init-args 3: 'st_sourceid, nil
    nil
    (foreach st_sourceid local_1
      (if (odclbib-fillcombo (undobib-start st_sourceid) 'es_ext)
        (progn
          T
          (and racdyn-calcvtx (re_courant (axedyn-reaccreate st_sourceid) (eo_polyabs st_sourceid)))
        )
        (progn
          T
          (and racdyn-calcvtx st_sourceid (re_ray st_sourceid) (polar (re_ray st_sourceid)))
        )
      )
      (setq racdyn-calcvtx nil)
    )
    T
    (if racdyn-calcvtx
      (progn
        (if (cadr (laybib-newlay ls_axe ha_poly2))
          (progn
            (st_sourceid en_rayon importbib-getfilter)
            (setq importbib-getfilter (st_rayon importbib-getfilter 'dcl-form-show (axedyn-reaccreate ha_poly2)))
            (setq ls_bulge polybib-vtxjoin)
          )
        )
        (if (and gvar_3265 (re_ray gvar_3265) (polar (re_ray gvar_3265)) (cadr T))
          (progn
            (setq ls_bulge polybib-vtxjoin)
          )
        )
        (ls_som0 (geombib-raccordmax "st_filename" en_rayon 'croisdyn-selray))
        (st_linkpath en_rayon)
        T
        (and ls_bulge (ls_som0 'blkbib-get_visiname))
      )
      (progn
        (ls_som0 (geombib-raccordmax "st_filename" en_rayon '(st_nom ls_rays ls_ray st_ray re_ray)))
        (ls_importconfs (groupbib-list '(lambda (ls_importconf) (= st_sourceid (listbib-key (cdr ls_importconf) "st_SourceId"))) en_rayon) polybib-vtxjoin)
        (ls_som0 'blkbib-get_visiname)
      )
    )
  )
  (ls_som0 'poly-vtxjoinauto)
)

;; Referenced symbols: LS_FILTERS, ENTDEL, LS_SOM0, AXEDYN-REACCREATE, LS_DIST, POLYBIB-LWVERTICES, FILEBIB-ODBX, POLYBIB-VTXJOIN, EO_POLYABS, LS_IMPORTFILTERS
;; Referenced strings: \nLecture des entités du ficher source : , \nEntités trouvées   : , st_filename
(defun aoctrl-polydyn ( / local_0)
  (entdel 'ls_filters)
  (ls_som0 "\nLecture des entités du ficher source : ")
  (setq filebib-odbx (filebib-odbx))
  (setq ha_poly2 (polybib-lwvertices 'axedyn-reaccreate (ls_dist)))
  (setq local_0 filebib-odbx)
  ;; init-args 3: "\nEntités trouvées   : ", nil
  (foreach gvar_2284 local_0
    (setq racdyn-calcvtx polybib-vtxjoin)
    (setq ls_bulge nil)
    (setq en_rayon (axedyn-reaccreate gvar_2284))
    (setq gvar_2284 (eo_polyabs gvar_2284))
    (setq gvar_3265 (in_param gvar_2284 'ls_importfilters))
    (setq gvar_3162 (in_param gvar_2284 'va_point))
    (setq blkbib-getvisinames (in_param gvar_2284 '(lambda (ls_ent) (listbib-key ls_ent "st_layer"))))
    (setq poly-vlatrace (in_param gvar_2284 'ls_importsource))
    (setq ls_axe (in_param gvar_2284 'dcl-form-show))
    (if racdyn-calcvtx
      (progn
        (if (cadr (laybib-newlay ls_axe ha_poly2))
          (progn
            (ls_layers en_rayon gvar_2284)
            (setq gvar_2284 (st_rayon gvar_2284 'dcl-form-show (axedyn-reaccreate ha_poly2)))
            (setq ls_bulge polybib-vtxjoin)
          )
        )
        (if (and gvar_3265 (re_ray gvar_3265) (polar (re_ray gvar_3265)) (cadr T))
          (progn
            (setq ls_bulge polybib-vtxjoin)
          )
        )
        (ls_som0 (geombib-raccordmax 'listbib-remove_doubles en_rayon 'croisdyn-selray))
        (listbib-remove_doubles en_rayon)
        T
        (and ls_bulge (ls_som0 'blkbib-get_visiname))
      )
      (progn
        (ls_som0 (geombib-raccordmax "st_filename" en_rayon '(st_nom ls_rays ls_ray st_ray re_ray)))
        (ls_blks (groupbib-list 'ls_blks en_rayon) polybib-vtxjoin)
        (ls_som0 'blkbib-get_visiname)
      )
    )
  )
  (ls_som0 'poly-vtxjoinauto)
)

;; Referenced symbols: LS_POLYDYN, AXEDYN-SETRAYEXT
(defun croisdyn-list ()
  (axedyn-setrayext 'ls_polydyn)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: DCL-GRID-CLEAR, AOSUP-AXE, EN_RAYON, LS_AXES, IN_PARAM, dcl-control-setenabled, LS_EXT2, LS_POLYDYN, RE_COURANT
(defun croisdyn-get (en_rayon)
  (if (and (aosup-axe dcl-grid-clear) (dcl-grid-clear gvar_2277) gvar_3345 (ls_ext2 en_rayon_2 (dcl-control-setenabled (in_param gvar_3345 'ls_axes))))
    (progn
      gvar_3345
    )
    (progn
      (re_courant 'ls_polydyn en_rayon_2)
    )
  )
)

;; Original arg hints: EN_RAYON, arg_2
;; Referenced symbols: LS_POLYDYN, EN_RAYON, RTOS
(defun croisdyn-set (en_rayon arg_2)
  (rtos 'ls_polydyn en_rayon_2 gvar_3396)
)

;; Original arg hints: IN_SENS, IN_LON0, IN_COTE, LS_VTXI, arg_5, arg_6, STEALBIB-GO, arg_8
;; Referenced symbols: IMPORTBIB-TRACE, ENTDEL, LS_POLYDYN, /, INTERS, ST_AXEID, dcl-control-setenabled, LS_AXES, GROUPBIB-LIST, LS_OBJ
;; Referenced strings: \nEntités ajoutées   : ,  [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :, \n -> PolyDyn 
(defun croisdyn-create (in_sens in_lon0 in_cote ls_vtxi arg_5 arg_6 stealbib-go arg_8)
  (entdel 'importbib-trace)
  (bo_filteredit en_rayon gvar_2265)
  (re_abs2 (groupbib-list 'ls_polydyn en_rayon) gvar_3094)
  (setq inters (/ 'ls_polydyn))
  (setq en_rayon (dcl-control-setenabled (st_axeid inters)))
  (setq gvar_2265 (es_ext (groupbib-list 'ls_axes (st_axeid inters)) (groupbib-list 'ls_obj (geombib-raccordmax "\nEntités ajoutées   : " en_rayon)) (groupbib-list '*st_axedynid* (geombib-raccordmax "\nEntités ajoutées   : " en_rayon)) (groupbib-list " [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :" in_sens_2) (groupbib-list "\n -> PolyDyn " in_cote_2) (groupbib-list "Origine" ls_vtxi_2) (groupbib-list "\nEntités modifiées  : " gvar_2276) (groupbib-list "\nEntités supprimées : " gvar_2275) (groupbib-list "AO-ImportSources" stealbib-go_2) (groupbib-list "AO-ImportConfs" gvar_2273) (groupbib-list 'bo_filteredit 'ls_ext1) (groupbib-list 'dcl-control-settext 'ls_ext1)))
  (setq gvar_3094 (ls_resstatus gvar_2265))
  (dcl-control-setenabled (st_axeid inters))
)

;; Original arg hints: AOPORA-FIN
;; Referenced symbols: ENTDEL, AOPORA-FIN, IN_PARAM, IN_COTE, LS_VTXI, ES_EXT
;; Referenced strings: Projeté, \n -> PolyDyn , Origine
(defun croisdyn-getparents (aopora-fin)
  (entdel "Projeté")
  (setq in_cote (in_param aopora-fin_2 "\n -> PolyDyn "))
  (setq ls_vtxi (in_param aopora-fin_2 "Origine"))
  (setq gvar_3094 (es_ext in_cote ls_vtxi))
  gvar_3094
)

;; Original arg hints: LS_RESSTATUS
;; Referenced symbols: ENTDEL, LS_RESSTATUS, VA_ENT, MPOLYDYN-SET, IN_PARAM, LS_ELEM, AXEDYN-REACCREATE, LS_RESTRACES, dcl-form-show, LS_VTXSBASE2
;; Referenced strings: Emprise, Axe, re_rayee
(defun croisdyn-getelems (ls_resstatus)
  (entdel "Emprise")
  (setq gvar_2519 (va_ent ls_resstatus_2))
  (setq gvar_2431 (in_param gvar_2519 'mpolydyn-set))
  (setq dcl-grid-setcelltext (axedyn-reaccreate (ls_elem "Axe" gvar_2431)))
  (setq gvar_2257 (ls_elem 'ls_restraces gvar_2431))
  (setq gvar_2257 (ls_restraces gvar_2257 "re_rayee"))
  (setq gvar_2255 (axedyn-reaccreate gvar_2257))
  (setq gvar_2254 (ls_vtxsbase2 (in_param gvar_2255 'dcl-form-show)))
  (if (odclbib-fillcombo (in_param gvar_2254 "Impossible de générer les polylignes contours") 1)
    (progn
      (ls_visient (in_param gvar_2254 'intersbib-getinsidevtxs) 'en_polybase)
    )
    (progn
      (in_param gvar_2254 'intersbib-getinsidevtxs)
    )
  )
  (setq listbib-min nil)
  (setq gvar_2255 (dcl-grid-setcurcell gvar_2255 (groupbib-list 'intersbib-getinsidevtxs listbib-min)))
  (setq gvar_2253 (1- gvar_2257))
  (setq gvar_2254 (ls_vtxsbase2 (in_param gvar_2253 'dcl-form-show)))
  (if (odclbib-fillcombo (in_param gvar_2254 "Impossible de générer les polylignes contours") 1)
    (progn
      (ls_visient (in_param gvar_2254 'intersbib-getinsidevtxs) 'en_polybase)
    )
    (progn
      (in_param gvar_2254 'intersbib-getinsidevtxs)
    )
  )
  (setq listbib-min nil)
  (setq gvar_2253 (dcl-grid-setcurcell gvar_2253 (groupbib-list 'intersbib-getinsidevtxs listbib-min)))
  (es_ext dcl-grid-setcelltext gvar_2255 gvar_2253)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: ENTDEL, EN_RAYON, ES_EXT, IN_PARAM, IN_SENS, RE_RAY, dcl-forcedwgredraw, BO_FILTEREDIT, dcl-control-settext, IN_COTE
;; Referenced strings: Nom du bloc,  [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :, \n -> PolyDyn 
(defun croisdyn-pop (en_rayon)
  (entdel "Nom du bloc")
  (setq gvar_2265 (ls_polydyn en_rayon_2))
  (setq in_num (es_ext))
  (setq gvar_2251 (es_ext))
  (setq in_sens (in_param gvar_2265 " [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :"))
  (setq gvar_2250 (re_ray in_sens))
  (setq gvar_2249 (dcl-forcedwgredraw gvar_2250))
  (setq entlast (ls_restraces gvar_2250 10))
  (setq in_cote (in_param gvar_2265 "\n -> PolyDyn "))
  (setq ls_vtxi (in_param gvar_2265 "Origine"))
  (setq gvar_2276 (in_param gvar_2265 "\nEntités modifiées  : "))
  (setq gvar_2275 (in_param gvar_2265 "\nEntités supprimées : "))
  (setq stealbib-go (in_param gvar_2265 "AO-ImportSources"))
  (setq gvar_2273 (in_param gvar_2265 "AO-ImportConfs"))
  (setq gvar_2247 (in_param gvar_2265 'bo_filteredit))
  (setq re_bulge (in_param gvar_2265 'dcl-control-settext))
  (setq gvar_2246 (chemdyn-bordtrace (hachbib-vtxs2hach in_cote)))
  (setq gvar_2245 (chemdyn-bordtrace (hachbib-vtxs2hach ls_vtxi)))
  (setq gvar_2244 (ls_deb (eo_polyabs in_cote)))
  (setq gvar_2243 (ls_deb (eo_polyabs ls_vtxi)))
  (setq gvar_2242 (in_param gvar_2244 'parentbib-getson))
  (setq gvar_2241 (in_param gvar_2243 'parentbib-getson))
  (setq gvar_2240 (in_param gvar_2244 'ls_childs))
  (setq gvar_2239 (in_param gvar_2243 'ls_childs))
  (setq gvar_2238 (re_ray gvar_2242))
  (setq ls_colummtypes (re_ray gvar_2241))
  (setq gvar_2236 (re_ray gvar_2240))
  (setq gvar_2235 (re_ray gvar_2239))
  (setq gvar_2234 (mpolydyn-popgo (in_param gvar_2244 'dcl-form-show)))
  (setq gvar_2233 (mpolydyn-popgo (in_param gvar_2243 'dcl-form-show)))
  (setq gvar_2232 (in_param gvar_2243 'ls_croiselems))
  (setq gvar_2231 (in_param gvar_2244 'ls_croiselems))
  (if (ls_ext2 gvar_2231 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2))
    (progn
      (setq gvar_2234 (es_ext (dcl-grid-addrow 0 gvar_2234) (dcl-grid-addrow 2 gvar_2234) (dcl-grid-addrow 1 gvar_2234)))
    )
  )
  (if (ls_ext2 gvar_2232 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2))
    (progn
      (setq gvar_2233 (es_ext (dcl-grid-addrow 0 gvar_2233) (dcl-grid-addrow 2 gvar_2233) (dcl-grid-addrow 1 gvar_2233)))
    )
  )
  (setq gvar_2229 (ls_colummtypes gvar_2238 (ls_visient 1 (in_param (dcl-grid-addrow 1 gvar_2234) 'intersbib-getinsidevtxs))))
  (setq gvar_2228 (ls_colummtypes gvar_2236 (ls_visient 255 (in_param (dcl-grid-addrow 2 gvar_2234) 'intersbib-getinsidevtxs))))
  (setq gvar_2227 (ls_colummtypes ls_colummtypes (ls_visient 1 (in_param (dcl-grid-addrow 1 gvar_2233) 'intersbib-getinsidevtxs))))
  (setq gvar_2226 (ls_colummtypes gvar_2235 (ls_visient 255 (in_param (dcl-grid-addrow 2 gvar_2233) 'intersbib-getinsidevtxs))))
  (setq gvar_2225 (es_ext))
  (setq gvar_2224 (es_ext (es_ext gvar_2227 gvar_2228 255 1 gvar_2275) (es_ext gvar_2226 gvar_2228 1 1 gvar_2276)))
  (setq gvar_3155 "Chambre")
  (ls_linktypes gvar_2232)
  (if (setq gvar_2221 (ls_linktypes gvar_2232))
    (progn
      (setq gvar_2251 (dcl-grid-setcurcell gvar_2251 gvar_3388))
      (setq gvar_2225 (st_rayon gvar_2225 gvar_2221))
      (if (ls_ext2 gvar_2231 1)
        (progn
          (setq ls_linktypes (es_ext (palbib-init gvar_2236 (axedyn-reaccreate gvar_2221)) (palbib-init gvar_2236 (re_x gvar_2221))))
        )
        (progn
          (setq ls_linktypes (es_ext (palbib-init gvar_2238 (axedyn-reaccreate gvar_2221)) (palbib-init gvar_2238 (re_x gvar_2221))))
        )
      )
    )
    (progn
      (setq ls_linktypes nil)
    )
  )
  (setq gvar_2224 (es_ext (es_ext gvar_2229 gvar_2227 255 255 gvar_2273) (es_ext gvar_2229 gvar_2226 255 1 stealbib-go)))
  (setq gvar_3155 'projet_md_link)
  (dcl-form-center gvar_2232)
  (if (setq projet_md_link_gr_filter (dcl-form-center gvar_2232))
    (progn
      (setq gvar_2251 (dcl-grid-setcurcell gvar_2251 gvar_3388))
      (setq gvar_2225 (st_rayon gvar_2225 projet_md_link_gr_filter))
      (if (ls_ext2 gvar_2231 1)
        (progn
          (setq dcl-grid-getcolumncount (es_ext (palbib-init gvar_2238 (axedyn-reaccreate projet_md_link_gr_filter)) (palbib-init gvar_2238 (re_x projet_md_link_gr_filter))))
        )
        (progn
          (setq dcl-grid-getcolumncount (es_ext (palbib-init gvar_2236 (axedyn-reaccreate projet_md_link_gr_filter)) (palbib-init gvar_2236 (re_x projet_md_link_gr_filter))))
        )
      )
    )
    (progn
      (setq dcl-grid-getcolumncount nil)
    )
  )
  (if gvar_2225
    (progn
      (*ha_blkbase* gvar_2249 (rtos (dcl-grid-deletecolumn gvar_2225)))
      (dcl-forcedwgredraw (es_ext gvar_2249 (dcl-forcedwgredraw (re_ray (projet_md_link_bt_save (hachbib-vtxs2hach in_cote)))) (dcl-forcedwgredraw (re_ray (projet_md_link_bt_save (hachbib-vtxs2hach ls_vtxi))))))
    )
    (progn
      (ls_som0 'projet_md_link_bt_entdel)
    )
  )
  (en_ref1 (es_ext gvar_2228 gvar_2226 gvar_2229 gvar_2227 projet_md_link_bt_entadd))
  (if (ls_ext2 gvar_2231 1)
    (progn
      (setq gvar_2265 (st_rayon gvar_2265 'projet_md_link_bt_fileadd (es_ext dcl-grid-getcolumncount ls_linktypes gvar_2251)))
    )
    (progn
      (setq gvar_2265 (st_rayon gvar_2265 'projet_md_link_bt_fileadd (es_ext ls_linktypes dcl-grid-getcolumncount gvar_2251)))
    )
  )
  (if (en_refoffset re_bulge)
    (progn
      (entbib-dellist re_bulge)
      (column (re_ray re_bulge) in_num)
      (setq gvar_3155 're_deboffset)
    )
    (progn
      (setq gvar_3155 '(ls_vtxsbase ls_vtxsbase2 en_poly ls_vtxs ls_polyhach ls_vtx en_hach))
      (setq reabib-deleteobjectreactor (polybib-inv in_num))
      (setq gvar_2265 (st_rayon gvar_2265 'dcl-control-settext (projet_pa_axes_ca_sommet reabib-deleteobjectreactor)))
    )
  )
  (bo_filteredit en_rayon_2 gvar_2265)
  (setq gvar_3155 nil)
  (ls_som0)
)

;; Original arg hints: PROJET/MD_LINK/BT_FILEEDIT
;; Referenced symbols: PROJET/MD_LINK/BT_FILEDEL, ENTDEL, ES_EXT, DCL-GRID-ADDROW, ENTLAST, PROJET/MD_LINK/BT_OK, PROJET/MD_LINK/TV_FILE, PROJET/MD_LINK/BT_LINEADD, AXEDYN-REACCREATE, dcl-grid-setcurcell
;; Referenced strings: Editer filtre
(defun croisdyn-tracedemiext (projet_md_link_bt_fileedit / local_1)
  (entdel 'projet_md_link_bt_filedel)
  (setq gvar_2225 (es_ext))
  (setq projet_md_link_tv_file (es_ext))
  (setq dcl-form-close (es_ext))
  (setq local_1 gvar_2224)
  ;; init-args 3: "Editer filtre", nil
  (foreach gvar_2207 local_1
    T
    (projet_md_link_bt_ok (dcl-grid-addrow 0 gvar_2207) (dcl-grid-addrow 1 gvar_2207) (dcl-grid-addrow 2 gvar_2207) (dcl-grid-addrow 3 gvar_2207) (dcl-grid-addrow 4 gvar_2207) entlast)
    (dcl-grid-setcurcell projet_md_link_tv_file (axedyn-reaccreate projet_md_link_bt_lineadd))
    (dcl-grid-setcurcell gvar_2225 (va_bande projet_md_link_bt_lineadd))
    (st_rayon (es_ext (es_ext (groupbib-list 10 (axedyn-reaccreate projet_md_link_bt_lineadd)) (groupbib-list 42 (re_x projet_md_link_bt_lineadd)))) (es_ext (es_ext (groupbib-list 10 (va_bande projet_md_link_bt_lineadd)) (groupbib-list 42 'ha_poly))))
    (dcl-grid-setcurcell dcl-form-close gvar_2759_c_projet_md_repblk_oninitialize)
    (and (setq projet_md_link_bt_lineadd (projet_md_link_bt_ok (dcl-grid-addrow 0 gvar_2207) (dcl-grid-addrow 1 gvar_2207) (dcl-grid-addrow 2 gvar_2207) (dcl-grid-addrow 3 gvar_2207) (dcl-grid-addrow 4 gvar_2207) entlast)) (setq projet_md_link_tv_file (dcl-grid-setcurcell projet_md_link_tv_file (axedyn-reaccreate projet_md_link_bt_lineadd))) (setq gvar_2225 (dcl-grid-setcurcell gvar_2225 (va_bande projet_md_link_bt_lineadd))) (setq gvar_2759_c_projet_md_repblk_oninitialize (st_rayon (es_ext (es_ext (groupbib-list 10 (axedyn-reaccreate projet_md_link_bt_lineadd)) (groupbib-list 42 (re_x projet_md_link_bt_lineadd)))) (es_ext (es_ext (groupbib-list 10 (va_bande projet_md_link_bt_lineadd)) (groupbib-list 42 'ha_poly))))) (setq dcl-form-close (dcl-grid-setcurcell dcl-form-close gvar_2759_c_projet_md_repblk_oninitialize)))
  )
  (if (st_blkbase (st_ray2 gvar_2225) 1)
    (progn
      (if (st_blkbase (palbib-init gvar_2245 (axedyn-reaccreate gvar_2225)) (palbib-init gvar_2245 (axedyn-reaccreate projet_md_link_tv_file)))
        (progn
          (setq projet_md_link_bt_linedel 1)
        )
        (progn
          (setq projet_md_link_bt_linedel 255)
        )
      )
      (if (repdyn-getpoint (palbib-init gvar_2245 (axedyn-reaccreate projet_md_link_tv_file)) (palbib-init gvar_2245 (re_x projet_md_link_tv_file)))
        (progn
          (setq ls_fileupdate 1)
        )
        (progn
          (setq ls_fileupdate 255)
        )
      )
      (or (and (and (and (and (re_angle projet_md_link_bt_linedel 1) (re_angle ls_fileupdate 255)) (and (re_angle projet_md_link_bt_linedel 255) (re_angle ls_fileupdate 1))) (and (re_angle projet_md_link_bt_linedel 1) (re_angle ls_fileupdate 1))) (and (re_angle projet_md_link_bt_linedel 255) (re_angle ls_fileupdate 255))) polybib-vtxjoin)
      (setq bo_edit (axedyn-reaccreate dcl-form-close))
      (setq gvar_3388 (palbib-init gvar_2226 (axedyn-reaccreate projet_md_link_tv_file)))
      (setq projet_md_link_bt_import (st_mod gvar_2226 gvar_3388 (re_x projet_md_link_tv_file)))
      (setq projet_md_link_bt_import (bo_active projet_md_link_bt_import (re_x dcl-form-close)))
      (setq gvar_3388 (palbib-init gvar_2245 (axedyn-reaccreate projet_md_link_tv_file)))
      (dcl-tree-clear 1)
      (setq projet_md_link_bt_import (re_x dcl-form-close))
      (setq gvar_3388 (palbib-init gvar_2227 (re_x projet_md_link_tv_file)))
      (setq bo_edit (st_mod gvar_2227 gvar_3388 (axedyn-reaccreate projet_md_link_tv_file)))
      (setq bo_edit (bo_active bo_edit (axedyn-reaccreate dcl-form-close)))
      (setq gvar_3388 (palbib-init gvar_2245 (re_x projet_md_link_tv_file)))
      (setq gvar_2200 (st_mod gvar_2228 (axedyn-reaccreate gvar_2225) (re_x gvar_2225)))
      gvar_2225
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: PROJET/MD_LINK/BT_FILEEDIT
;; Referenced symbols: dcl-tree-addparent, ENTDEL, ES_EXT, DCL-GRID-ADDROW, ENTLAST, PROJET/MD_LINK/BT_OK, PROJET/MD_LINK/TV_FILE, PROJET/MD_LINK/BT_LINEADD, dcl-grid-setcurcell, AXEDYN-REACCREATE
;; Referenced strings: Editer filtre
(defun croisdyn-tracedemiint (projet_md_link_bt_fileedit / local_1)
  (entdel 'dcl-tree-addparent)
  (setq gvar_2225 (es_ext))
  (setq projet_md_link_tv_file (es_ext))
  (setq dcl-form-close (es_ext))
  (setq local_1 gvar_2224)
  ;; init-args 3: "Editer filtre", nil
  (foreach gvar_2207 local_1
    T
    (projet_md_link_bt_ok (dcl-grid-addrow 0 gvar_2207) (dcl-grid-addrow 1 gvar_2207) (dcl-grid-addrow 2 gvar_2207) (dcl-grid-addrow 3 gvar_2207) (dcl-grid-addrow 4 gvar_2207) entlast)
    (dcl-grid-setcurcell projet_md_link_tv_file (va_bande projet_md_link_bt_lineadd))
    (dcl-grid-setcurcell gvar_2225 (axedyn-reaccreate projet_md_link_bt_lineadd))
    (st_rayon (es_ext (es_ext (groupbib-list 10 (va_bande projet_md_link_bt_lineadd)) (groupbib-list 42 (dcl-grid-addrow (re_x projet_md_link_bt_lineadd))))) (es_ext (es_ext (groupbib-list 10 (axedyn-reaccreate projet_md_link_bt_lineadd)) (groupbib-list 42 'ha_poly))))
    (dcl-grid-setcurcell dcl-form-close gvar_2759_c_projet_md_repblk_oninitialize)
    (and (setq projet_md_link_bt_lineadd (projet_md_link_bt_ok (dcl-grid-addrow 0 gvar_2207) (dcl-grid-addrow 1 gvar_2207) (dcl-grid-addrow 2 gvar_2207) (dcl-grid-addrow 3 gvar_2207) (dcl-grid-addrow 4 gvar_2207) entlast)) (setq projet_md_link_tv_file (dcl-grid-setcurcell projet_md_link_tv_file (va_bande projet_md_link_bt_lineadd))) (setq gvar_2225 (dcl-grid-setcurcell gvar_2225 (axedyn-reaccreate projet_md_link_bt_lineadd))) (setq gvar_2759_c_projet_md_repblk_oninitialize (st_rayon (es_ext (es_ext (groupbib-list 10 (va_bande projet_md_link_bt_lineadd)) (groupbib-list 42 (dcl-grid-addrow (re_x projet_md_link_bt_lineadd))))) (es_ext (es_ext (groupbib-list 10 (axedyn-reaccreate projet_md_link_bt_lineadd)) (groupbib-list 42 'ha_poly))))) (setq dcl-form-close (dcl-grid-setcurcell dcl-form-close gvar_2759_c_projet_md_repblk_oninitialize)))
  )
  (if (st_blkbase (st_ray2 gvar_2225) 1)
    (progn
      (if (st_blkbase (palbib-init gvar_2245 (axedyn-reaccreate gvar_2225)) (palbib-init gvar_2245 (axedyn-reaccreate projet_md_link_tv_file)))
        (progn
          (setq projet_md_link_bt_linedel 1)
        )
        (progn
          (setq projet_md_link_bt_linedel 255)
        )
      )
      (if (repdyn-getpoint (palbib-init gvar_2245 (axedyn-reaccreate projet_md_link_tv_file)) (palbib-init gvar_2245 (re_x projet_md_link_tv_file)))
        (progn
          (setq ls_fileupdate 1)
        )
        (progn
          (setq ls_fileupdate 255)
        )
      )
      (or (and (and (and (and (re_angle projet_md_link_bt_linedel 1) (re_angle ls_fileupdate 255)) (and (re_angle projet_md_link_bt_linedel 255) (re_angle ls_fileupdate 1))) (and (re_angle projet_md_link_bt_linedel 1) (re_angle ls_fileupdate 1))) (and (re_angle projet_md_link_bt_linedel 255) (re_angle ls_fileupdate 255))) polybib-vtxjoin)
      (setq bo_edit (axedyn-reaccreate dcl-form-close))
      (setq gvar_3388 (palbib-init gvar_2226 (axedyn-reaccreate projet_md_link_tv_file)))
      (setq projet_md_link_bt_import (st_mod gvar_2226 gvar_3388 (re_x projet_md_link_tv_file)))
      (setq projet_md_link_bt_import (bo_active projet_md_link_bt_import (re_x dcl-form-close)))
      (setq gvar_3388 (palbib-init gvar_2245 (axedyn-reaccreate projet_md_link_tv_file)))
      (dcl-tree-clear 255)
      (setq projet_md_link_bt_import (re_x dcl-form-close))
      (setq gvar_3388 (palbib-init gvar_2227 (re_x projet_md_link_tv_file)))
      (setq bo_edit (st_mod gvar_2227 gvar_3388 (axedyn-reaccreate projet_md_link_tv_file)))
      (setq bo_edit (bo_active bo_edit (axedyn-reaccreate dcl-form-close)))
      (setq gvar_3388 (palbib-init gvar_2245 (re_x projet_md_link_tv_file)))
      (setq gvar_2200 (st_mod gvar_2229 (axedyn-reaccreate gvar_2225) (re_x gvar_2225)))
      gvar_2225
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: PROJET/MD_LINK/BT_FILEEDIT
;; Referenced symbols: LS_IMPORTCONF, ENTDEL, BO_EDIT, IN_PARAM, PALBIB-INIT, AXEDYN-REACCREATE, REPDYN-GETPOINT, *EN_RAY*, PROJET/MD_LINK/BT_IMPORT, ES_EXT
;; Referenced strings: Repère, Choix d'un fichier source, Appliquer
(defun croisdyn-tracebordhach2 (projet_md_link_bt_fileedit)
  (entdel 'ls_importconf)
  (setq gvar_2196 (repdyn-getpoint (palbib-init gvar_2245 (in_param (1- bo_edit) 10)) (palbib-init gvar_2245 (in_param (axedyn-reaccreate bo_edit) 10))))
  (setq gvar_2195 (*en_ray* bo_edit nil))
  (setq gvar_2194 (*en_ray* projet_md_link_bt_import nil))
  (setq gvar_2192 (axedyn-reaccreate (dcl-tree-addchild (es_ext gvar_2200 projet_md_link_bt_import bo_edit) '(st_blk1 st_blk2 ls_blk st_msg bo_go))))
  (setq projet_md_link_bt_entadd (*en_ray* gvar_2192 (es_ext (groupbib-list 70 1))))
  (setq in_num (dcl-grid-setcurcell in_num projet_md_link_bt_entadd))
  (setq blkbib-getparententities (in_param (dcl-grid-addrow 0 gvar_2233) "Repère"))
  (setq ls_elems1 (rem (en_ext2 (es_ext projet_md_link_bt_entadd) nil 'en_ext1 'ha_poly 1 nil (es_ext (groupbib-list "Choix d'un fichier source" gvar_2190) (groupbib-list "Appliquer" blkbib-getparententities)))))
  (setq in_num (dcl-grid-setcurcell in_num ls_elems1))
  (setq ls_axe (in_param (dcl-grid-addrow 1 gvar_2233) 'dcl-form-show))
  (setq gvar_2827 (ls_visient 255 gvar_2232 (in_param (dcl-grid-addrow 1 gvar_2233) 'ls_croiselems)))
  (setq gvar_2408 (ls_visient 255 gvar_2232 (in_param (dcl-grid-addrow 1 gvar_2233) "re_rayee")))
  (if (repdyn-getpoint gvar_2827 'ha_poly)
    (progn
      (column gvar_2195)
      (setq listbib-min (in_param (dcl-grid-addrow 1 gvar_2233) 'intersbib-getinsidevtxs))
      (setq listbib-min (ls_visient projet_md_link_bt_fileedit_2 listbib-min))
      (setq ls_in (axedyn-reaccreate (st_path gvar_2195 listbib-min)))
      (setq gvar_2195 (rem ls_in))
    )
  )
  gvar_2195
  'ha_poly
  (repdyn-get gvar_2195)
  255
  gvar_2827
  (if gvar_2196
    (progn
      255
    )
    (progn
      1
    )
  )
  (en_refoffset (ls_visient) 'ls_ext1 'ls_ext1 1 nil ls_axe)
  (setq ls_axe (in_param (dcl-grid-addrow 2 gvar_2233) 'dcl-form-show))
  (setq gvar_2827 (ls_visient gvar_2232 (in_param (dcl-grid-addrow 2 gvar_2233) 'ls_croiselems)))
  (setq gvar_2408 (ls_visient gvar_2232 (in_param (dcl-grid-addrow 2 gvar_2233) "re_rayee")))
  (if (repdyn-getpoint gvar_2827 'ha_poly)
    (progn
      (column gvar_2194)
      (setq listbib-min (in_param (dcl-grid-addrow 1 gvar_2233) 'intersbib-getinsidevtxs))
      (setq listbib-min (ls_visient 255 projet_md_link_bt_fileedit_2 listbib-min))
      (setq ls_in (axedyn-reaccreate (st_path gvar_2194 listbib-min)))
      (setq gvar_2194 (rem ls_in))
    )
  )
  gvar_2194
  'ha_poly
  (repdyn-get gvar_2194)
  gvar_2827
  (if gvar_2196
    (progn
      255
    )
    (progn
      1
    )
  )
  (en_refoffset (ls_visient) 'ls_ext1 'ls_ext1 1 nil ls_axe)
  (en_ref1 (es_ext gvar_2195 gvar_2194 projet_md_link_bt_entadd))
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: EN_RAYON, vlax-erased-p
(defun croisdyn-modgo (en_rayon)
  (setq re_yinv en_rayon_2)
  (vlax-erased-p gvar_2277)
)

;; Referenced symbols: ATOI, ENTDEL, RE_YINV, LS_OBJ, IN_PARAM, IN_LON0, BO_LCTABS, LINKBIB-CONFDEL, GROUPBIB-LIST, ST_CONFID
;; Referenced strings: \nEntités modifiées  : , \nEntités supprimées : , AO-ImportSources
(defun c:projet_pa_croisdyn_oninitialize ( / local_0)
  (entdel 'atoi)
  (bo_lctabs gvar_2186 in_lon0)
  (setq gvar_3345 (ls_polydyn re_yinv))
  (setq ls_groupparent gvar_3345)
  (setq in_lon0 (in_param gvar_3345 'ls_obj))
  (setq gvar_2276 (in_param gvar_3345 "\nEntités modifiées  : "))
  (setq gvar_2275 (in_param gvar_3345 "\nEntités supprimées : "))
  (setq stealbib-go (in_param gvar_3345 "AO-ImportSources"))
  (setq gvar_2273 (in_param gvar_3345 "AO-ImportConfs"))
  (setq vlax-ldata-delete (es_ext (groupbib-list linkbib-confdel gvar_2276) (groupbib-list st_confid gvar_2275) (groupbib-list bo_ents stealbib-go) (groupbib-list gvar_2182 gvar_2273)))
  (setq local_0 vlax-ldata-delete)
  ;; init-args 3: 'axedyn-set, nil
  nil
  (foreach axedyn-set local_0
    (bo_lctabs (axedyn-reaccreate axedyn-set) (eo_blkbase (eo_polyabs axedyn-set) 2 3))
  )
)

;; Original arg hints: LS_PARENT, LS_IMPORTSOURCE0, SUBST, LABEL
;; Referenced symbols: KEY, ENTDEL, VL-STRING-SEARCH, IN_PARAM, IN_COTE, EO_POLYABS, LS_VTXI, RE_RAY, POLAR, LS_PARENT
;; Referenced strings: \n -> PolyDyn , Origine,  [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :
(defun croisdyn-selray (ls_parent ls_importsource0 subst label / st_syle st_nom st_axedynid ld_axedyn local_4)
  (entdel 'key)
  (sihpp-list vl-string-search)
  (setq gvar_2265 gvar_3345)
  (setq in_cote (in_param gvar_2265 "\n -> PolyDyn "))
  (setq ls_vtxi (in_param gvar_2265 "Origine"))
  (setq gvar_2244 (ls_deb (eo_polyabs in_cote)))
  (setq gvar_2243 (ls_deb (eo_polyabs ls_vtxi)))
  (setq blkpoly-get (in_param (polar (re_ray (in_param gvar_2265 " [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :"))) 10))
  (setq stringbib-str2lst (in_param gvar_2244 ls_parent_2))
  (setq gr_filterupdate (in_param gvar_2243 ls_importsource0_2))
  (setq projet_md_link_bt_lineadd (projet_md_link_bt_ok (re_ray stringbib-str2lst) (re_ray gr_filterupdate) subst_2 label_2 gvar_3331 blkpoly-get))
  (if projet_md_link_bt_lineadd
    (progn
      (ls_options (dcl-forcedwgredraw vl-string-search) 80)
      (ls_options (dcl-forcedwgredraw vl-string-search) 're_long)
      (ls_options (dcl-forcedwgredraw vl-string-search) 4)
      (setq st_axedynid (st_rayon (es_ext (es_ext (groupbib-list 10 (va_bande projet_md_link_bt_lineadd)) (groupbib-list 40 'ha_poly) (groupbib-list 41 'ha_poly) (groupbib-list 42 (dcl-grid-addrow (re_x projet_md_link_bt_lineadd))))) (es_ext (es_ext (groupbib-list 10 (axedyn-reaccreate projet_md_link_bt_lineadd)) (groupbib-list 40 'ha_poly) (groupbib-list 41 'ha_poly) (groupbib-list 42 'ha_poly)))))
      (setq vl-string-search (gr_filterupdate st_axedynid nil))
      (boxlib-optionbox vl-string-search 4)
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: LINKBIB-CONFDEL, LS_ENTNEW, LS_CHILDS, IN_PARAM, BOXLIB-OPTIONBOX
;; Referenced strings: \nEntités modifiées  : 
(defun c:projet_pa_croisdyn_re_rayee_onsetfocus ()
  (ls_entnew linkbib-confdel 0 255)
  (boxlib-optionbox 'ls_childs 'ls_childs 1 1 (in_param gvar_3345 "\nEntités modifiées  : "))
)

;; Referenced symbols: ST_CONFID, LS_ENTNEW, LS_CHILDS, PARENTBIB-GETSON, IN_PARAM, BOXLIB-OPTIONBOX
;; Referenced strings: \nEntités supprimées : 
(defun c:projet_pa_croisdyn_re_rayei_onsetfocus ()
  (ls_entnew st_confid 0 255)
  (boxlib-optionbox 'ls_childs 'parentbib-getson 1 255 (in_param gvar_3345 "\nEntités supprimées : "))
)

;; Referenced symbols: BO_ENTS, LS_ENTNEW, PARENTBIB-GETSON, LS_CHILDS, IN_PARAM, BOXLIB-OPTIONBOX
;; Referenced strings: AO-ImportSources
(defun c:projet_pa_croisdyn_re_rayie_onsetfocus ()
  (ls_entnew bo_ents 0 255)
  (boxlib-optionbox 'parentbib-getson 'ls_childs 255 1 (in_param gvar_3345 "AO-ImportSources"))
)

;; Referenced symbols: LS_ENTNEW, PARENTBIB-GETSON, IN_PARAM, BOXLIB-OPTIONBOX
;; Referenced strings: AO-ImportConfs
(defun c:projet_pa_croisdyn_re_rayii_onsetfocus ()
  (ls_entnew gvar_2182 0 255)
  (boxlib-optionbox 'parentbib-getson 'parentbib-getson 255 255 (in_param gvar_3345 "AO-ImportConfs"))
)

;; Referenced symbols: ST_OPTION, ENTDEL, LINKBIB-CONFDEL, GROUPBIB-LIST, ST_CONFID, BO_ENTS, ES_EXT, LS_OBJ, IN_LON0, vlax-ldata-delete
;; Referenced strings: \nEntités modifiées  : , \nEntités supprimées : , AO-ImportSources
(defun croisdyn-palapply ( / local_0)
  (entdel 'st_option)
  (setq in_lon0 (errbib-catchapply gvar_2186))
  (setq vlax-ldata-delete (es_ext (groupbib-list linkbib-confdel "\nEntités modifiées  : ") (groupbib-list st_confid "\nEntités supprimées : ") (groupbib-list bo_ents "AO-ImportSources") (groupbib-list gvar_2182 "AO-ImportConfs")))
  (setq gvar_3345 (st_rayon gvar_3345 'ls_obj in_lon0))
  (setq local_0 vlax-ldata-delete)
  ;; init-args 3: 'axedyn-set, nil
  (foreach axedyn-set local_0
    T
    (errbib-catchapply (axedyn-reaccreate axedyn-set))
    (groupbib-listobj ls_dists)
    (st_rayon gvar_3345 (eo_polyabs axedyn-set) pt_ins)
    (and (setq ls_dists (errbib-catchapply (axedyn-reaccreate axedyn-set))) (setq pt_ins (groupbib-listobj ls_dists)) (setq gvar_3345 (st_rayon gvar_3345 (eo_polyabs axedyn-set) pt_ins)))
  )
  (re_rayee re_yinv)
  (ls_som0)
)

;; Referenced symbols: ENTDEL, RE_YINV
;; Referenced strings: PatternAngle
(defun croisdyn-palsave ()
  (entdel "PatternAngle")
  (bo_filteredit re_yinv gvar_3345)
  (re_abs1 gvar_2277 1)
)

;; Referenced symbols: VL-STRING-SEARCH, LS_SOM0
(defun croisdyn-palclose ()
  (eo_poly)
  (sihpp-list vl-string-search)
  (setq vl-string-search nil)
  (setq gvar_3345 nil)
  (setq ls_groupparent nil)
  (setq re_yinv nil)
  (ls_som0)
)

;; Referenced symbols: ENTDEL, dcl-messagebox, AXEDYN-SETRAYEXT, LS_LINKTYPE, LS_SOM0, LS_COLUMNS, LS_COLUMNTYPES, AXEDYN-REACCREATE, EO_POLYABS, IN_PARAM
;; Referenced strings: ls_filters, #, 15.0
(defun aoimport-go ( / local_0)
  (entdel "ls_filters")
  (ls_som0 'ls_linktype)
  (setq gvar_2164 0)
  (setq gvar_2163 0)
  (setq gvar_2162 0)
  (setq gvar_3094 (axedyn-setrayext 'dcl-messagebox))
  (setq gvar_3094 nil)
  (setq gr_filterheaders (dcl-messagebox))
  (setq local_0 ls_columns)
  ;; init-args 3: 'ls_columntypes, nil
  (foreach ls_columntypes local_0
    (ls_som0 (geombib-raccordmax "#" (in_param ls_columntypes 'st_columntype) 'st_flag))
    (ls_som0 (geombib-raccordmax 'ls_column (dcl-control-setenabled (st_ray2 (es_poly st_2)))))
    (ls_som0 "Choisir le style de tracé")
    (st_status st_label (es_ext (es_ext '(lambda (ls_restrace) (cons (itoa (car ls_restrace)) (cdr ls_restrace))) (es_ext "Choisir le type de réseau")) (es_ext '(lambda (ls_resstatu) (cons (itoa (car ls_resstatu)) (cdr ls_resstatu))) dcl-control-setcolumnstylelist)))
    (ls_som0 'blkbib-get_visiname)
    (ls_som0 'getbib-blk)
    (dcl-grid-getcelltext (es_poly st_2))
    (setq gr_filteraddline (axedyn-reaccreate ls_columntypes))
    (setq ls_columntypes (eo_polyabs ls_columntypes))
    (setq st_label (geombib-raccordmax (in_param ls_columntypes '(column row st_columntype st_label)) '(en_poly ha_poly ld_poly ha_axe ha_ext ls_ray ls_ent in_node re_courant st_txt) (in_param ls_columntypes 'st_columntype) 'st_flag))
    (setq gvar_2149 (ls_elem 'dcl-grid-setitemstyle dcl-grid-setitemdroplist))
    (setq st_2 (dcl-grid-addcolumns "15.0" (es_ext st_label) nil))
    (setq dcl-control-setcolumnstylelist (polybib-lwvertices 'cadddr (es_poly st_2)))
    (setq dcl-control-setcolumnstylelist (ls_headertype dcl-control-setcolumnstylelist))
    (setq gvar_2140 (polybib-lwvertices 'st_headertype (es_poly st_2)))
    (setq gvar_2140 (blkpolydial-getpoint nil gvar_2140))
    (setq gvar_2140 (ls_headertype gvar_2140))
  )
  (ls_som0 'blkbib-get_visiname)
  (ls_som0 (geombib-raccordmax 'picklayer (dcl-control-setenabled gvar_2164)))
  (ls_som0 (geombib-raccordmax '(ls_importsource ls_importconf st_file st_option) (dcl-control-setenabled gvar_2163)))
  (ls_som0 (geombib-raccordmax '(lambda (doc) (importbib-getinsertstyles doc)) (dcl-control-setenabled gvar_2162)))
)

;; Referenced symbols: AXEDYN-SETRAYEXT
(defun importbib-getfilter ()
  (setq ls_columns (ssget (axedyn-setrayext '(lambda (doc) (importbib-getpipesstyles doc)))))
  (ssget (axedyn-setrayext '(lambda (doc) (importbib-getmanholestyles doc))))
  (setq dcl-grid-setitemdroplist (ssget (axedyn-setrayext '(lambda (doc) (importbib-getmanholestyles doc)))))
)

;; Referenced symbols: GROUPBIB-LIST, ES_EXT, LS_FILTER, ST_CELL, LS_ROWCOL, ST_BTN, dcl-grid-deleterow, DOC, LS_EXT1, LS_OBJS
;; Referenced strings: Sauver filtre, Choisir le type de réseau, ha_handle
(defun c:projet_md_link_oninitialize ( / local_0)
  (re_haut re_haut)
  (setq gvar_2127 nil)
  (setq dcl-grid-getrowcount (es_ext (groupbib-list 4 '(lambda (doc) (importbib-getfoustyles doc))) (groupbib-list 0 '(lambda (doc) (importbib-getpolystyles doc))) (groupbib-list 1 '(ls_filterent)) (groupbib-list 2 '(inc ls_filters ls_filter))))
  (setq ls_importconfnew (es_ext (groupbib-list 1 'ls_filter) (groupbib-list 2 'st_cell)))
  (setq ls_common (es_ext (es_ext "Sauver filtre" '(ls_importconf st_option ls_linktype) '(lambda (ls_columntype va_style) (cons ls_columntype va_style)) 6 "Choisir le type de réseau") (es_ext 'ls_rowcol '(ls_importconf st_option ls_linktype) '(lambda (ls_columntype va_style) (cons ls_columntype va_style)) 0 'st_btn) (es_ext 'dcl-grid-deleterow '(ls_importsource ld_ldata) '(lambda (ls_columntype va_style) (cons ls_columntype va_style)) 6 "Choisir le type de réseau") (es_ext 'doc '(ls_importsource ld_ldata) '(ls_objs obj eg_obj st_type ls_common) 0 'ls_ext1) (es_ext 'ls_objs 'cvport 'paperspace 6 "Choisir le type de réseau") (es_ext 'modelspace 'collect-init 'obj 0 4) (es_ext 'collect-next 'eg_obj '(lambda (ls_columntype va_style) (cons ls_columntype va_style)) 6 "Choisir le type de réseau") (es_ext 'dcl-form-show "ha_handle" 'obj 0 1) (es_ext 'vla-get-linetype 'vla-get-linetypescale 'vla-get-truecolor 9 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)) (es_ext 'intersbib-getinsidevtxs 'vla-get-linetypescale 'vla-get-truecolor 9 'ha_poly)))
  (setq in_status (es_ext (es_ext "Fin BlKPoly-XY2WCS" 'st_filtertype (es_ext (re_angle0 "Sauver filtre" ls_common) (re_angle0 'vla-get-linetype ls_common) (re_angle0 'ls_rowcol ls_common) (re_angle0 'intersbib-getinsidevtxs ls_common))) (es_ext 'blkpoly-mod-paramupdate 'importbib-getcovacablechamber (es_ext (re_angle0 "Sauver filtre" ls_common) (re_angle0 'ls_rowcol ls_common))) (es_ext 'projet_pa_detail_btn_param 'importbib-getcovamanhole (es_ext (re_angle0 "Sauver filtre" ls_common) (re_angle0 'dcl-grid-deleterow ls_common) (re_angle0 'ls_rowcol ls_common) (re_angle0 'doc ls_common))) (es_ext 'importbib-getcovapipe 'importbib-getcovagrad (es_ext (re_angle0 'collect-next ls_common) (re_angle0 'modelspace ls_common) (re_angle0 'ls_rowcol ls_common) (re_angle0 'dcl-form-show ls_common))) (es_ext 'importbib-getcovaduct 'importbib-gethatch (es_ext (es_ext 'importbib-getinsert "AO-ChemDyn" '(lambda (ls_columntype va_style) (cons ls_columntype va_style)) 6) (es_ext 'st_type 'importbib-getpoly '(lambda (ls_columntype va_style) (cons ls_columntype va_style)) 6) (es_ext "Appliquer" "st_ConfId" '(lambda (ls_columntype va_style) (cons ls_columntype va_style)) 6))) (es_ext 'collect-release '(ls_vtxs ls_specs ls_props) (es_ext (re_angle0 'ls_objs ls_common) (re_angle0 'modelspace ls_common) (re_angle0 'collect-next ls_common) (re_angle0 'ls_rowcol ls_common) (re_angle0 'doc ls_common))) (es_ext 'foubib-getvtxs 'foubib-getspecs (es_ext (re_angle0 'collect-next ls_common) (re_angle0 'modelspace ls_common) (re_angle0 "Sauver filtre" ls_common) (re_angle0 'doc ls_common) (re_angle0 'ls_rowcol ls_common))) (es_ext 'ls_specs 'st_model (es_ext (re_angle0 'ls_objs ls_common) (re_angle0 'modelspace ls_common) (re_angle0 'collect-next ls_common) (re_angle0 'ls_rowcol ls_common) (re_angle0 'intersbib-getinsidevtxs ls_common) (re_angle0 'dcl-form-show ls_common)))))
  (setq local_0 (eo_plf gvar_2078))
  (while (<= local_0 0)
    (eo_plf gvar_2078 0)
    (setq local_0 (1- local_0))
  )
  (vlax-vla-object->ename covplf-getvtxs nil)
  (vlax-vla-object->ename covplf-getprops nil)
  (vlax-vla-object->ename ls_protype nil)
  (vlax-vla-object->ename gvar_2072 polybib-vtxjoin)
  (vlax-vla-object->ename vla-get-closed nil)
  (vlax-vla-object->ename vla-get-linetypegeneration nil)
  (vlax-vla-object->ename gvar_2069 polybib-vtxjoin)
  (vlax-invoke covplf-getvtxs 'vla-get-effectivename)
  (vlax-vla-object->ename vla-get-layer polybib-vtxjoin)
  (vlax-vla-object->ename gvar_2078 nil)
  (vlax-vla-object->ename vla-get-rotation nil)
  (vlax-vla-object->ename gvar_2065 nil)
  (covfou-getchambspecs)
)

;; Original arg hints: COVASSBIB-GETMANHOLE
;; Referenced symbols: vla-get-Rotation, COVASSBIB-GETMANHOLE, ST_NETWORK
(defun linkdial-linkedit (covassbib-getmanhole)
  (vlax-vla-object->ename vla-get-rotation covassbib-getmanhole_2)
  (vlax-vla-object->ename gvar_2065 covassbib-getmanhole_2)
  (vlax-vla-object->ename st_network covassbib-getmanhole_2)
)

;; Referenced symbols: COVASSBIB-GETPIPE, ENTDEL, COVASSBIB-GETPIPEVTXS, LS_COLUMNS, LS_COLUMNTYPES, EO_POLYABS, ST_COLUMNTYPE, IN_PARAM, DCL-GRID-ADDROW, dcl-grid-setitemdroplist
(defun ls_fileupdate ( / local_0)
  (entdel 'covassbib-getpipe)
  (covassbib-getpipevtxs gvar_2069)
  (setq local_0 ls_columns)
  ;; init-args 3: 'ls_columntypes, nil
  (foreach ls_columntypes local_0
    (covassbib-getpipevtxs gvar_2069 (in_param (eo_polyabs ls_columntypes) 'st_columntype) (dcl-grid-addrow 0 ls_columntypes))
  )
  (setq local_0 dcl-grid-setitemdroplist)
  ;; init-args 3: 'vla-get-patternname, nil
  nil
  (foreach vla-get-patternname local_0
    (vla-get-backgroundcolor gvar_2069 (es_ext (es_ext (in_param (eo_polyabs vla-get-patternname) 'vla-get-patternscale) (in_param (eo_polyabs vla-get-patternname) 'vla-get-patternangle) (geombib-raccordmax (in_param (eo_polyabs vla-get-patternname) 'vla-get-patternscale) 'vla-get-backgroundcolor (dcl-grid-addrow 0 vla-get-patternname)))))
  )
)

;; Referenced symbols: LISTBIB-ADDONCE, ENTDEL, PATH, TRANS, vlax-property-available-p, PROJET/PA_BORDYN/ST_STYLE, LS_COLUMNS, AXEDYN-REACCREATE, POLYBIB-LWVERTICES, HA_HANDLE
;; Referenced strings: OC-Bordyn
(defun c:projet_md_link_bt_fileadd_onclicked ()
  (entdel 'listbib-addonce)
  (setq blkbib-blkeffname (projet_pa_bordyn_st_style 'path (trans "OC-Bordyn") 'vlax-property-available-p 16))
  (if ls_columns
    (progn
      (setq gvar_2049 (polybib-lwvertices 'axedyn-reaccreate ls_columns))
      (setq gvar_2049 (polybib-lwvertices 'ha_handle gvar_2049))
      (setq vl-remove (projet_pa_croisdyn gvar_2049))
    )
    (progn
      (setq vl-remove 0)
    )
  )
  (setq ls_columns (dcl-grid-setcurcell ls_columns (es_ext (dcl-control-setenabled (st_axeid vl-remove)) (groupbib-list 'st_columntype (vlax-curve-getclosestpointto blkbib-blkeffname)) (groupbib-list '(column row st_columntype st_label) (re_param blkbib-blkeffname)))))
  (covfou-getchambspecs)
)

;; Referenced symbols: IMPORTBIB-TRACECOVAGRAD, ENTDEL, GR_FILTERADDLINE, LS_COLUMNS, RE_ANGLE0, LS_COLUMNTYPES, BLKPOLYDIAL-GETPOINT, dcl-grid-setitemdroplist, vla-get-PatternName, vla-get-PatternScale
(defun c:projet_md_link_bt_filedel_onclicked ( / local_0)
  (entdel 'importbib-tracecovagrad)
  (re_angle0 gr_filteraddline ls_columns)
  (blkpolydial-getpoint ls_columntypes ls_columns)
  (setq local_0 dcl-grid-setitemdroplist)
  (and gr_filteraddline (setq ls_columntypes (re_angle0 gr_filteraddline ls_columns)) (setq ls_columns (blkpolydial-getpoint ls_columntypes ls_columns)))
  ;; init-args 3: 'vla-get-patternname, nil
  nil
  (foreach vla-get-patternname local_0
    (if (re_angle (re_angle0 'vla-get-patternscale vla-get-patternname) gr_filteraddline)
      (progn
        (importbib-tracehach (dcl-grid-addrow 0 vla-get-patternname) nil)
      )
      (progn
        nil
      )
    )
  )
  T
  T
)

;; Original arg hints: IMPORTBIB-TRACECOVAMANHOLE, IMPORTBIB-TRACEPOLY
;; Referenced symbols: ENTDEL, IMPORTBIB-TRACECOVAMANHOLE, dcl-grid-setitemdroplist, RE_ANGLE0, vla-get-PatternName, BLKPOLYDIAL-GETPOINT, dcl-messagebox, RE_COURANT, LS_PARENTCONF, IMPORTBIB-TRACEPOLY
(defun linkbib-confdel (importbib-tracecovamanhole importbib-tracepoly / local_2)
  (entdel '(ls_parentconf en_ent))
  (ls_parentconf 'dcl-messagebox importbib-tracecovamanhole_2)
  (setq vla-get-patternname (re_angle0 importbib-tracecovamanhole_2 dcl-grid-setitemdroplist))
  (setq dcl-grid-setitemdroplist (blkpolydial-getpoint vla-get-patternname dcl-grid-setitemdroplist))
  (setq gvar_3094 (re_courant 'dcl-messagebox importbib-tracecovamanhole_2))
  (if importbib-tracepoly_2
    (progn
      (setq local_2 gvar_3094)
      ;; init-args 3: 'st_bloc, nil
      nil
      (foreach st_bloc local_2
        (sihpp-list (re_ray (eo_polyabs st_bloc)))
      )
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: GR_FILTERADDLINE, PATH, TRANS, vlax-property-available-p, PROJET/PA_BORDYN/ST_STYLE, LS_COLUMNS, RE_ANGLE0, BLKBIB-BLK_MOD, DCL-GRID-ADDROW, ST_COLUMNTYPE
;; Referenced strings: OC-Bordyn
(defun c:projet_md_link_bt_fileedit_onclicked ()
  (projet_pa_bordyn_st_style 'path (trans "OC-Bordyn") 'vlax-property-available-p 16)
  (re_angle0 gr_filteraddline ls_columns)
  (es_ext (dcl-grid-addrow 0 blkbib-blk_mod) (groupbib-list 'st_columntype (vlax-curve-getclosestpointto blkbib-blkeffname)) (groupbib-list '(column row st_columntype st_label) (re_param blkbib-blkeffname)))
  (ha_handle2 ls_columntypes blkbib-blk_mod ls_columns)
  T
  (and gr_filteraddline (setq blkbib-blkeffname (projet_pa_bordyn_st_style 'path (trans "OC-Bordyn") 'vlax-property-available-p 16)) (setq blkbib-blk_mod (re_angle0 gr_filteraddline ls_columns)) (setq ls_columntypes (es_ext (dcl-grid-addrow 0 blkbib-blk_mod) (groupbib-list 'st_columntype (vlax-curve-getclosestpointto blkbib-blkeffname)) (groupbib-list '(column row st_columntype st_label) (re_param blkbib-blkeffname)))) (setq ls_columns (ha_handle2 ls_columntypes blkbib-blk_mod ls_columns)))
)

;; Original arg hints: IMPORTBIB-ISVALID
;; Referenced symbols: vla-get-BackgroundColor, IMPORTBIB-ISVALID, RE_X, AXEDYN-REACCREATE, IMPORTBIB-TRACECOVAMANHOLE, HA_IMPORT, LS_PROTYPE, POLYBIB-VTXJOIN, COVPLF-GETPROPS, COVPLF-GETVTXS
(defun c:projet_md_link_tv_file_onselchanged (importbib-isvalid / ls_conf ls_filter ls_props en_ent local_0)
  (if (importbib-isvalid 'vla-get-backgroundcolor importbib-isvalid_2)
    (progn
      (ha_import importbib-tracecovamanhole)
      (setq importbib-tracecovamanhole (re_x (ha_import importbib-isvalid_2 'vla-get-backgroundcolor)))
      (setq gr_filteraddline (axedyn-reaccreate (ha_import importbib-isvalid_2 'vla-get-backgroundcolor)))
    )
    (progn
      (setq gr_filteraddline importbib-isvalid_2)
      (setq importbib-tracecovamanhole nil)
    )
  )
  (vlax-vla-object->ename ls_protype polybib-vtxjoin)
  (vlax-vla-object->ename covplf-getprops T)
  (vlax-vla-object->ename covplf-getvtxs T)
  (vlax-vla-object->ename st_network nil)
  (vlax-vla-object->ename vla-get-closed (cadr importbib-tracecovamanhole))
  (vlax-vla-object->ename vla-get-linetypegeneration (cadr importbib-tracecovamanhole))
  (vlax-vla-object->ename gvar_2072 polybib-vtxjoin)
  (and importbib-tracecovamanhole importbib-tracecovamanhole)
)

;; Referenced symbols: EN_IMPORT, ENTDEL, EG_IMPORT, IN_STATUS, POLYBIB-LWVERTICES, LS_INTERSENT, LS_ABSS, BO_INV0, dcl-grid-setitemdroplist, AXEDYN-REACCREATE
(defun c:projet_md_link_bt_entadd_onclicked ()
  (entdel 'en_import)
  (setq gvar_2031 (polybib-lwvertices 'eg_import in_status))
  (setq intersbib-getent (bo_inv0 'ls_intersent 'ls_abss gvar_2031 nil))
  (if dcl-grid-setitemdroplist
    (progn
      (setq gvar_2049 (polybib-lwvertices 'axedyn-reaccreate dcl-grid-setitemdroplist))
      (setq gvar_2049 (polybib-lwvertices 'ha_handle gvar_2049))
      (setq vl-remove (projet_pa_croisdyn gvar_2049))
    )
    (progn
      (setq vl-remove 0)
    )
  )
  (setq dcl-grid-setitemdroplist (dcl-grid-setcurcell dcl-grid-setitemdroplist (es_ext (dcl-control-setenabled (st_axeid vl-remove)) (groupbib-list 'vla-get-patternscale gr_filteraddline) (groupbib-list 'vla-get-patternangle intersbib-getent) (groupbib-list 'ha_inters nil))))
  (covfou-getchambspecs)
)

;; Referenced symbols: LS_ABSCROIS, ENTDEL, LS_PTININT, RE_ANGLE, IMPORTBIB-TRACECOVAMANHOLE, POLYBIB-VTXJOIN, IMPORTBIB-TRACEHACH
(defun c:projet_md_link_bt_entdel_onclicked ()
  (entdel 'ls_abscrois)
  T
  (and (re_angle 6 (ls_ptinint '(lambda (x) (polybib-absproj en_poly (vlax-curve-getpointatdist en_ref2 x))) '(lambda (x) (cons x (list x x "CR"))) 15)) (importbib-tracehach importbib-tracecovamanhole polybib-vtxjoin))
)

;; Original arg hints: IMPORTBIB-TRACECOVAMANHOLE
;; Referenced symbols: LS_PTINTEXT, ENTDEL, dcl-grid-setitemdroplist, IMPORTBIB-TRACECOVAMANHOLE, IN_PARAM, vla-get-PatternName, vla-get-PatternAngle, HA_INTERS, INTERSBIB-GETENT, IN_STATUS
;; Referenced strings: Impossible de générer la polyligne contour
(defun gr_filterupdate (importbib-tracecovamanhole / local_1)
  (entdel 'ls_ptintext)
  (ls_ptintext intersbib-getent)
  (*en_ins* gvar_2078)
  (setq vla-get-patternname (in_param dcl-grid-setitemdroplist importbib-tracecovamanhole_2))
  (setq intersbib-getent (in_param vla-get-patternname 'vla-get-patternangle))
  (setq ha_poly2 (in_param vla-get-patternname 'ha_inters))
  (setq ls_absint (re_angle0 intersbib-getent in_status))
  (setq ls_absext (dcl-grid-addrow 2 ls_absint))
  (setq ls_ptint (polybib-lwvertices 'axedyn-reaccreate ls_absext))
  (setq eq 0)
  (setq local_1 ha_poly2)
  ;; init-args 3: "Impossible de générer la polyligne contour", nil
  nil
  (foreach gvar_2519 local_1
    (ls_ptint gvar_2519 ls_ptint)
    (st_axeid eq)
    (setq eq (st_axeid eq))
  )
)

;; Original arg hints: arg_1, LS_PTINT
;; Referenced symbols: LISTBIB-SORT, ENTDEL, LS_EXT1, EO_BLKPOP, LS_PTINT, LS_ABSS2, IN_PARAM, MODELSPACE, RE_ANGLE, dcl-form-show
(defun gr_filteraddline (arg_1 ls_ptint / local_2)
  (entdel 'listbib-sort)
  (setq netbib-purgeblock 0)
  (setq eq (eo_blkpop gvar_2078 'ls_ext1))
  (setq local_2 ls_ptint_2)
  ;; init-args 3: 'ls_abss2, nil
  nil
  (foreach ls_abss2 local_2
    (setq listbib-groupbynum (in_param gvar_2519 ls_abss2))
    (or (or (or (re_angle 'modelspace ls_abss2) (re_angle 'dcl-form-show ls_abss2)) (re_angle 'intersbib-getinsidevtxs ls_abss2)) (re_angle 'vla-get-linetype ls_abss2))
    (setq listbib-groupbynum (eo_blkbase listbib-groupbynum 2 3))
    (setq listbib-groupbynum (eo_blkbase listbib-groupbynum 2 3))
    (ls_ab gvar_2078 eq (st_axeid netbib-purgeblock) 18)
    (ls_chem gvar_2078 eq (st_axeid netbib-purgeblock) (polybib-lwvertices 'eo_polyabs ls_importconfnew))
    (setq listbib-groupbynum (en_polyabs ls_importconfnew listbib-groupbynum 'ls_filter))
    (ls_ab gvar_2078 eq (st_axeid netbib-purgeblock) 18)
    (ls_chem gvar_2078 eq (st_axeid netbib-purgeblock) (polybib-lwvertices 'eo_polyabs dcl-grid-getrowcount))
    (en_blk gvar_2078 eq (st_axeid netbib-purgeblock) listbib-groupbynum)
    (setq listbib-groupbynum (en_polyabs dcl-grid-getrowcount listbib-groupbynum '(inc ls_filters ls_filter)))
    (st_axeid netbib-purgeblock)
    (setq netbib-purgeblock (st_axeid netbib-purgeblock))
  )
)

;; Original arg hints: INTERSBIB-GETENT
;; Referenced symbols: RE_ANGLE1, ENTDEL, EO_PLF, INTERSBIB-GETENT, IN_STATUS, RE_ANGLE0, LS_ABSINT, DCL-GRID-ADDROW, PT_12, ES_EXT
;; Referenced strings: 1.1
(defun gr_filterheaders (intersbib-getent / local_1)
  (entdel 're_angle1)
  (setq local_1 (eo_plf gvar_2078))
  (while (<= local_1 0)
    (eo_plf gvar_2078 0)
    (setq local_1 (1- local_1))
  )
  (en_poly1 gvar_2078 (es_ext (es_ext "1.1" 1 'pt_12)))
  (setq ls_absint (re_angle0 intersbib-getent_2 in_status))
  (setq ls_absext (dcl-grid-addrow 2 ls_absint))
  (setq local_1 ls_absext)
  ;; init-args 3: 'ls_ptint1, nil
  (foreach ls_ptint1 local_1
    (en_poly1 gvar_2078 (es_ext (es_ext (dcl-grid-addrow 1 ls_ptint1) 1 (dcl-grid-addrow 2 ls_ptint1))))
  )
  (ls_absint1 gvar_2078 (st_rayon (es_ext 0) (polybib-lwvertices '(lambda (x) (cons (car x) (list (car x) en_poly1 (car x) en_poly1))) ls_absext)))
)

;; Original arg hints: EQ, NETBIB-PURGEBLOCK
;; Referenced symbols: dcl-grid-setitemdroplist, IMPORTBIB-TRACECOVAMANHOLE, IN_PARAM, vla-get-PatternName, vla-get-PatternAngle, INTERSBIB-GETENT, IN_STATUS, RE_ANGLE0, AXEDYN-REACCREATE, LS_ABSINT
(defun c:projet_md_link_gr_filter_ondblclicked (eq netbib-purgeblock)
  (setq vla-get-patternname (in_param dcl-grid-setitemdroplist importbib-tracecovamanhole))
  (setq intersbib-getent (in_param vla-get-patternname 'vla-get-patternangle))
  (setq ls_absint (re_angle0 intersbib-getent in_status))
  (setq re_angle2 (polybib-lwvertices 'axedyn-reaccreate (dcl-grid-addrow 2 ls_absint)))
  (setq pt_21 (dcl-grid-addrow (vla-get-name netbib-purgeblock_2) re_angle2))
  nil
  (or (or (or (re_angle pt_21 'ls_rowcol) (re_angle pt_21 'doc)) (re_angle pt_21 'modelspace)) (re_angle pt_21 'dcl-form-show))
  (bo_inv0 'pt_22 'en_poly2 (polybib-lwvertices 'ls_ptint2 ls_importconfnew) nil)
  (if (setq ls_axe (bo_inv0 'pt_22 'en_poly2 (polybib-lwvertices 'ls_ptint2 ls_importconfnew) nil))
    (progn
      (en_blk gvar_2078 eq_2 netbib-purgeblock_2 (in_param ls_importconfnew (ha_handle ls_axe)))
    )
    (progn
      nil
    )
  )
  (bo_inv0 'pt_22 '(lambda (x) (cons (car x) (list (car x) en_poly2 (car x) en_poly2))) (polybib-lwvertices 'ls_absint2 dcl-grid-getrowcount) nil)
  (if (setq gvar_1996 (bo_inv0 'pt_22 '(lambda (x) (cons (car x) (list (car x) en_poly2 (car x) en_poly2))) (polybib-lwvertices 'ls_absint2 dcl-grid-getrowcount) nil))
    (progn
      (en_blk gvar_2078 eq_2 netbib-purgeblock_2 (in_param dcl-grid-getrowcount (ha_handle gvar_1996)))
    )
    (progn
      nil
    )
  )
  (ls_absint2 'ls_ext1 nil nil)
  (if (setq dcl-listbox-clear (ls_absint2 'ls_ext1 nil nil))
    (progn
      (en_blk gvar_2078 eq_2 netbib-purgeblock_2 dcl-listbox-clear)
    )
    (progn
      nil
    )
  )
  (vlax-curve-getstartpoint (ls_absint2 gvar_2078 eq_2 netbib-purgeblock_2))
  (if (setq blkbib-getparententities (vlax-curve-getstartpoint (ls_absint2 gvar_2078 eq_2 netbib-purgeblock_2)))
    (progn
      (en_blk gvar_2078 eq_2 netbib-purgeblock_2 blkbib-getparententities)
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: ENTDEL, LS_COLUMNS, GR_FILTERADDLINE, IN_PARAM, dcl-grid-setitemdroplist, IMPORTBIB-TRACECOVAMANHOLE, EO_POLYABS, LS_COLUMNTYPES, ST_COLUMNTYPE, ST_FLAG
;; Referenced strings: Fin BlKPoly-XY2WCS, Impossible de générer la polyligne contour
(defun c:projet_md_link_bt_import_onclicked ( / local_0)
  (entdel '(lambda (x) (list (cdr x) (polybib-absatpoint en_ent (vlax-curve-getpointatdist en_poly (cdr x))))))
  (setq ha_poly2 nil)
  (setq ls_columntypes (in_param ls_columns gr_filteraddline))
  (setq vla-get-patternname (eo_polyabs (in_param dcl-grid-setitemdroplist importbib-tracecovamanhole)))
  (setq stylebord-list (geombib-raccordmax (in_param ls_columntypes '(column row st_columntype st_label)) '(en_poly ha_poly ld_poly ha_axe ha_ext ls_ray ls_ent in_node re_courant st_txt) (in_param ls_columntypes 'st_columntype) 'st_flag))
  (setq intersbib-getent (in_param vla-get-patternname 'vla-get-patternangle))
  (or (or (or (or (or (re_angle intersbib-getent "Fin BlKPoly-XY2WCS") (re_angle intersbib-getent 'importbib-getcovapipe)) (re_angle intersbib-getent 'foubib-getvtxs)) (re_angle intersbib-getent 'collect-release)) (re_angle intersbib-getent 'ls_specs)) (re_angle intersbib-getent 'projet_pa_detail_btn_param))
  (setq ha_poly2 (es_poly (dcl-grid-addcolumns 'vlax-curve-getstartpoint (es_ext stylebord-list) nil)))
  (setq ha_poly2 (es_poly (dcl-grid-addcolumns 'poly-polyinside (es_ext stylebord-list) nil)))
  (setq ha_poly2 (es_poly (dcl-grid-addcolumns '(lambda (x) (eq (caar ls_abs) (car x))) (es_ext stylebord-list) nil)))
  (setq ha_poly2 (es_poly (dcl-grid-addcolumns 'vl-remove-if (es_ext stylebord-list) nil)))
  (setq ha_poly2 (es_poly (dcl-grid-addcolumns 'vlax-curve-getendpoint (es_ext stylebord-list) nil)))
  (setq ha_poly2 (es_poly (dcl-grid-addcolumns '(lambda (x) (eq (car (last ls_abs)) (car x))) (es_ext stylebord-list) nil)))
  (if ha_poly2
    (progn
      (ha_import importbib-tracecovamanhole)
      (setq ls_absint (re_angle0 intersbib-getent in_status))
      (setq ls_absext (dcl-grid-addrow 2 ls_absint))
      (setq ls_ptint (polybib-lwvertices 'axedyn-reaccreate ls_absext))
      (setq local_0 ha_poly2)
      ;; init-args 3: "Impossible de générer la polyligne contour", nil
      (foreach gvar_2519 local_0
        (ls_ptint gvar_2519 ls_ptint)
      )
    )
  )
  (ls_som0)
)

;; Original arg hints: EQ, NETBIB-PURGEBLOCK
;; Referenced symbols: ENTDEL, LS_SOM0
(defun c:projet_md_link_gr_filter_onselchanged (eq netbib-purgeblock)
  (entdel '(ha_ref ls_ref))
  (ls_som0)
)

;; Referenced symbols: ENAME, ENTDEL, dcl-grid-setitemdroplist, IMPORTBIB-TRACECOVAMANHOLE, IN_PARAM, vla-get-PatternName, vla-get-PatternAngle, INTERSBIB-GETENT, IN_STATUS, RE_ANGLE0
(defun c:projet_md_link_bt_save_onclicked ( / local_0 local_1)
  (entdel 'ename)
  (if gvar_2127
    (progn
      (setq eq 0)
      (setq vla-get-patternname (in_param dcl-grid-setitemdroplist importbib-tracecovamanhole))
      (setq intersbib-getent (in_param vla-get-patternname 'vla-get-patternangle))
      (setq ls_absint (re_angle0 intersbib-getent in_status))
      (setq re_angle2 (polybib-lwvertices 'axedyn-reaccreate (dcl-grid-addrow 2 ls_absint)))
      (setq gvar_2149 (es_ext))
      (setq local_0 (ename gvar_2078))
      (while (<= local_0 0)
        (setq local_0 (1- local_0))
        (setq ls_ref (es_ext))
        (setq netbib-purgeblock 0)
        (setq local_1 (vla-get-name (eo_plf gvar_2078)))
        (while (<= local_1 0)
          (setq local_1 (1- local_1))
          (setq ha_ref (ls_absint2 gvar_2078 eq (st_axeid netbib-purgeblock)))
          (or (or (or (re_angle (dcl-grid-addrow netbib-purgeblock re_angle2) 'modelspace) (re_angle (dcl-grid-addrow netbib-purgeblock re_angle2) 'intersbib-getinsidevtxs)) (re_angle (dcl-grid-addrow netbib-purgeblock re_angle2) 'vla-get-linetype)) (re_angle (dcl-grid-addrow netbib-purgeblock re_angle2) 'dcl-form-show))
          (setq ha_ref (axedyn-reaccreate (dcl-grid-addrow (laybib-newlay ha_ref (polybib-lwvertices 'eo_polyabs ls_importconfnew)) ls_importconfnew)))
          (setq ha_ref (groupbib-listobj ha_ref))
          (setq ha_ref (groupbib-listobj ha_ref))
          (setq ha_ref (axedyn-reaccreate (dcl-grid-addrow (laybib-newlay ha_ref (polybib-lwvertices 'eo_polyabs dcl-grid-getrowcount)) dcl-grid-getrowcount)))
          (setq ls_ref (dcl-grid-setcurcell ls_ref (groupbib-list (dcl-grid-addrow netbib-purgeblock re_angle2) ha_ref)))
          (setq netbib-purgeblock (st_axeid netbib-purgeblock))
        )
        (setq gvar_2149 (dcl-grid-setcurcell gvar_2149 ls_ref))
        (setq eq (st_axeid eq))
      )
      (vlax-vla-object->ename gvar_2069 polybib-vtxjoin)
      (vlax-invoke covplf-getvtxs 'vla-get-effectivename)
      (vlax-vla-object->ename covplf-getprops nil)
      (vlax-vla-object->ename ls_protype nil)
      (vlax-vla-object->ename gvar_2072 nil)
      (vlax-vla-object->ename vla-get-closed nil)
      (vlax-vla-object->ename vla-get-linetypegeneration nil)
      (vlax-vla-object->ename st_network nil)
      (vlax-vla-object->ename vla-get-layer polybib-vtxjoin)
      (vlax-vla-object->ename gvar_2078 nil)
      (vlax-vla-object->ename vla-get-rotation nil)
      (vlax-vla-object->ename gvar_2065 nil)
      (setq mpolydyn-get (groupbib-list importbib-tracecovamanhole (st_rayon vla-get-patternname 'ha_inters gvar_2149)))
      (setq dcl-grid-setitemdroplist (ha_handle2 mpolydyn-get (re_angle0 importbib-tracecovamanhole dcl-grid-setitemdroplist) dcl-grid-setitemdroplist))
      nil
      (setq gvar_2127 nil)
    )
    (progn
      (vlax-vla-object->ename gvar_2069 nil)
      (vlax-invoke covplf-getvtxs 'racdyn-get)
      (vlax-vla-object->ename covplf-getprops nil)
      (vlax-vla-object->ename ls_protype nil)
      (vlax-vla-object->ename gvar_2072 nil)
      (vlax-vla-object->ename vla-get-closed nil)
      (vlax-vla-object->ename vla-get-linetypegeneration nil)
      (vlax-vla-object->ename st_network polybib-vtxjoin)
      (vlax-vla-object->ename vla-get-layer nil)
      (vlax-vla-object->ename gvar_2078 polybib-vtxjoin)
      (vlax-vla-object->ename vla-get-rotation polybib-vtxjoin)
      (vlax-vla-object->ename gvar_2065 polybib-vtxjoin)
      polybib-vtxjoin
      (setq gvar_2127 polybib-vtxjoin)
    )
  )
)

;; Referenced symbols: ENTDEL, dcl-grid-setitemdroplist, IMPORTBIB-TRACECOVAMANHOLE, IN_PARAM, vla-get-PatternName, vla-get-PatternAngle, INTERSBIB-GETENT, IN_STATUS, RE_ANGLE0, LS_ABSINT
;; Referenced strings: ha_rac
(defun c:projet_md_link_bt_lineadd_onclicked ()
  (entdel "ha_rac")
  (ls_ptint gvar_2519 ls_ptint)
  (setq vla-get-patternname (in_param dcl-grid-setitemdroplist importbib-tracecovamanhole))
  (setq intersbib-getent (in_param vla-get-patternname 'vla-get-patternangle))
  (setq ls_absint (re_angle0 intersbib-getent in_status))
  (setq ls_absext (dcl-grid-addrow 2 ls_absint))
  (setq ls_ptint (polybib-lwvertices 'axedyn-reaccreate ls_absext))
  (setq gvar_2519 (polybib-lwvertices '(ls_axes ls_axe st_axeid ha_group ls_obj) ls_absext))
  (setq gvar_2519 (polybib-lwvertices 'polydyn-get ls_ptint gvar_2519))
  (ls_som0)
)

;; Referenced symbols: BLKPOLY-LS_ENTSNEW, AXEDYN-REACCREATE, ST_BLKBASE
(defun c:projet_md_link_bt_linedel_onclicked ()
  (blkpoly-ls_entsnew gvar_2078)
  (if (and (setq gvar_1976 (blkpoly-ls_entsnew gvar_2078)) (st_blkbase (axedyn-reaccreate gvar_1976) 255))
    (progn
      (polydyn-get gvar_2078 (axedyn-reaccreate gvar_1976))
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: ENTDEL, RE_HAUT, AXEDYN-SETRAYEXT, AXEDYN-REACCREATE, LS_PARENTCONF, LS_COLUMNS, LS_COLUMNTYPES, EO_POLYABS, RTOS, dcl-grid-setitemdroplist
;; Referenced strings: \nEntité non prise en charge, bo_visble
(defun c:projet_md_link_bt_ok_onclicked ( / local_0)
  (entdel "\nEntité non prise en charge")
  (re_abs1 re_haut 1)
  (setq local_0 (axedyn-setrayext '(lambda (doc) (importbib-getpipesstyles doc))))
  ;; init-args 3: "bo_visble", nil
  (foreach gvar_3164 local_0
    (ls_parentconf '(lambda (doc) (importbib-getpipesstyles doc)) (axedyn-reaccreate gvar_3164))
  )
  (setq local_0 ls_columns)
  ;; init-args 3: 'ls_columntypes, nil
  (foreach ls_columntypes local_0
    (rtos '(lambda (doc) (importbib-getpipesstyles doc)) (axedyn-reaccreate ls_columntypes) (eo_polyabs ls_columntypes))
  )
  (setq local_0 (axedyn-setrayext '(lambda (doc) (importbib-getmanholestyles doc))))
  ;; init-args 3: "bo_visble", nil
  (foreach gvar_3164 local_0
    (ls_parentconf '(lambda (doc) (importbib-getmanholestyles doc)) (axedyn-reaccreate gvar_3164))
  )
  (setq local_0 dcl-grid-setitemdroplist)
  ;; init-args 3: 'vla-get-patternname, nil
  (foreach vla-get-patternname local_0
    (rtos '(lambda (doc) (importbib-getmanholestyles doc)) (axedyn-reaccreate vla-get-patternname) (eo_polyabs vla-get-patternname))
  )
  (ls_som0)
)

;; Referenced symbols: RE_HAUT
(defun c:projet_md_link_bt_cancel_onclicked ()
  (re_abs1 re_haut 2)
)

;; Original arg hints: AOLEG-SIHLIN, dcl-grid-setitemdroplist
;; Referenced symbols: ENTDEL, ES_EXT, AOLEG-SIHLIN, LS_SIHLIN, TRANS, ODCLBIB-FILLCOMBO, LS_COTE, AOLEG-POLY, POLAR, IN_PARAM
;; Referenced strings:  - , Repère, Projet
(defun importbib-getents (aoleg-sihlin dcl-grid-setitemdroplist / local_2 local_3)
  (entdel '(ls_sihlin va_ref re_u st_lar re_cote st_mod st_txt ls_cote))
  (setq sihlin-get (es_ext))
  aoleg-sihlin_2
  (if (odclbib-fillcombo (trans 'ls_sihlin) 1)
    (progn
      " - "
    )
    (progn
      'ls_cote
    )
  )
  (setq local_2 (aoleg-poly (=)))
  ;; init-args 3: '(en_leg eo_leg pt_dyn pt_ins re_angle re_side1 re_side2 re_dist), nil
  (aoleg-poly local_2)
  (while (setq gvar_1966 (aoleg-poly local_2))
    (setq gvar_1964 (polar (rem gvar_1966)))
    (setq polybib-subpolybisinv (in_param gvar_1964 0))
    (setq gvar_1959 (es_ext (groupbib-list 'st_type polybib-subpolybisinv) (groupbib-list 'en_leg (in_param gvar_1964 5)) (groupbib-list "Repère" (in_param gvar_1964 8)) (groupbib-list 'polybib-absatpoint (es_ext (re_angle0 8 gvar_1964) (groupbib-list '(st_blk ls_repblk) (eo_leg gvar_1966)) (groupbib-list "Projet" (eo_leg gvar_1966)) (groupbib-list '(st_file ls_reps ls_repblks) (blkbib-set_att gvar_1966))))))
    (setq st_blk nil)
    (setq local_3 dcl-grid-setitemdroplist_2)
    ;; init-args 3: 'vla-get-patternname, nil
    (foreach vla-get-patternname local_3
      (setq pt_dyn (in_param (eo_polyabs vla-get-patternname) 'vla-get-patternangle))
      (setq gvar_2149 (in_param (eo_polyabs vla-get-patternname) 'ha_inters))
      (or (or (or (or (or (or (or (or (re_angle polybib-subpolybisinv pt_dyn "Fin BlKPoly-XY2WCS") (re_angle polybib-subpolybisinv pt_dyn 'projet_pa_detail_btn_param)) (re_angle polybib-subpolybisinv pt_dyn 'blkpoly-mod-paramupdate)) (re_angle polybib-subpolybisinv pt_dyn 'importbib-getcovapipe)) (re_angle polybib-subpolybisinv pt_dyn 'importbib-getcovaduct)) (re_angle polybib-subpolybisinv pt_dyn 'ls_specs)) (re_angle polybib-subpolybisinv pt_dyn 'collect-release)) (re_angle polybib-subpolybisinv pt_dyn 'foubib-getvtxs)) polybib-vtxjoin)
      (setq st_blk nil)
      (setq st_blk (legbib-leginv gvar_1966 gvar_1959 gvar_2149))
      (setq st_blk (legbib-leginv gvar_1966 gvar_1959 gvar_2149))
      (setq st_blk (re_side1 gvar_1966 gvar_1959 gvar_2149))
      (setq st_blk (re_side1 gvar_1966 gvar_1959))
      (setq st_blk (re_side2 gvar_1966 gvar_1959 gvar_2149))
      (setq st_blk (blkbib-set_visi gvar_1966 gvar_1959 gvar_2149))
      (setq st_blk (blkbib-set_visi gvar_1966 gvar_1959 gvar_2149))
      (setq st_blk (va_prop gvar_1966 gvar_1959 gvar_2149))
      (if st_blk
        (progn
          (setq sihlin-get (dcl-grid-setcurcell sihlin-get (st_rayon (es_ext (groupbib-list 're_coef (axedyn-reaccreate vla-get-patternname))) st_blk)))
        )
      )
    )
  )
  (bo_select local_2)
  sihlin-get
)

;; Original arg hints: arg_1
;; Referenced symbols: ENTDEL, PROJET/MD_METZON/TB_LARG, C:PROJET/MD_METZON/TB_LARG#ONSETFOCUS, PROJET/MD_METZON/TB_COEF, DCL-GRID-ADDROW, CADR, AXEDYN-REACCREATE, LS_REF, MODELSPACE, IN_PARAM
;; Referenced strings: Choisir le type de réseau
(defun importbib-getcovaduct (arg_1 / en_leg eo_leg pt_dyn pt_ins re_angle re_side1 re_side2 re_dist ls_linktype ls_columns local_0 local_2)
  (entdel '(el_ent projet_md_metzon_oninitialize projet_md_metzon_bt_ok_onclicked projet_md_metzon_bt_annuler_onclicked))
  (setq dcl-form-close (projet_md_metzon_tb_larg gvar_1966))
  (setq projet_md_metzon_tb_coef (c:projet_md_metzon_tb_larg_onsetfocus gvar_1966))
  (setq gvar_1943_c_projet_md_metzon_tb_coef_onsetfocus (dcl-grid-addrow 0 projet_md_metzon_tb_coef))
  (setq in_lon0 (dcl-grid-addrow 1 projet_md_metzon_tb_coef))
  (setq projet_md_metzon (dcl-grid-addrow 2 projet_md_metzon_tb_coef))
  (setq listbib-min (dcl-grid-addrow 3 projet_md_metzon_tb_coef))
  (setq gvar_1941_c_projet_md_metzon_bt_pick_onclicked (dcl-grid-addrow 4 projet_md_metzon_tb_coef))
  (setq gvar_2607 nil)
  (while (and (cadr gvar_2607) gvar_2149)
    T
    (setq ls_ref (axedyn-reaccreate gvar_2149))
    polybib-vtxjoin
    (setq gvar_2149 (eo_polyabs gvar_2149))
    (and (or (or (re_angle (in_param ls_ref 'modelspace) 4) (re_angle (in_param ls_ref 'modelspace) projet_md_metzon)) (or (re_angle (in_param ls_ref 'collect-next) "Choisir le type de réseau") (re_angle (in_param ls_ref 'collect-next) gvar_1943_c_projet_md_metzon_tb_coef_onsetfocus))) (setq gvar_2607 polybib-vtxjoin))
  )
  (if gvar_2607
    (progn
      (setq polybib_geom-bulge2radius (in_param pt_dyn 'polybib-absatpoint))
      (setq polybib_geom-bulge2radius (st_rayon polybib_geom-bulge2radius 8 (in_param ls_ref 'ls_rowcol)))
      (setq pt_dyn (st_rayon pt_dyn 'polybib-absatpoint polybib_geom-bulge2radius))
      (setq polybib_geom-bulge2radius (st_rayon polybib_geom-bulge2radius (es_ext (groupbib-list 'dcl-project-load listbib-min))))
      (setq pt_dyn (st_rayon pt_dyn 'polybib-absatpoint polybib_geom-bulge2radius))
      (setq st_blk (st_rayon pt_dyn (es_ext (groupbib-list 'collect-next gvar_1943_c_projet_md_metzon_tb_coef_onsetfocus) (groupbib-list 'ls_obj in_lon0) (groupbib-list 'projet_md_metzon_cb_prop projet_md_metzon) (groupbib-list 'intersbib-getinsidevtxs listbib-min) (groupbib-list 'dcl-combobox-clear gvar_1941_c_projet_md_metzon_bt_pick_onclicked) (groupbib-list 'blkpolydial-getrep dcl-form-close))))
    )
    (progn
      (setq st_blk nil)
    )
  )
  st_blk
)

;; Original arg hints: EL_ENT, arg_2
;; Referenced symbols: EO_ENT, ENTDEL, EL_ENT, PROJET/MD_METZON/CO_LTYPE, POLYBIB-ABSATPOINT, IN_PARAM, ST_LTYPE, POLYBIB_GEOM-BULGE2RADIUS, PROJET/MD_METZON/CB_LAYER, dcl-combobox-selectstring
(defun importbib-getcovagrad (el_ent arg_2)
  (entdel 'eo_ent)
  (setq dcl-form-close (projet_md_metzon_co_ltype el_ent_2))
  (setq polybib_geom-bulge2radius (in_param gvar_1959 'polybib-absatpoint))
  (setq dcl-combobox-selectstring (st_ltype el_ent_2))
  (setq gvar_1959 (st_rayon gvar_1959 'polybib-absatpoint polybib_geom-bulge2radius))
  (setq st_blk (st_rayon gvar_1959 (es_ext (groupbib-list 'projet_md_metzon_cb_layer (axedyn-reaccreate dcl-combobox-selectstring)) (groupbib-list 'st_type (re_x dcl-combobox-selectstring)) (groupbib-list 'blkpolydial-getrep dcl-form-close))))
  st_blk
)

;; Original arg hints: arg_1
;; Referenced symbols: EO_ENT, ENTDEL, POLAR, IN_PARAM, HA_POLY, EN_POLYABS, CADR, AXEDYN-REACCREATE, LS_REF, RE_ANGLE
;; Referenced strings: Sauver filtre, Choisir le type de réseau
(defun importbib-getpoly (arg_1 / en_leg eo_leg pt_dyn pt_ins re_angle re_side1 re_side2 re_dist ls_linktype ls_columns local_0 local_2)
  (entdel 'eo_ent)
  (setq en_leg (polar (rem gvar_1966)))
  (setq blkbib-getparententities (in_param en_leg 8))
  (setq listbib-min (en_polyabs en_leg 43 'ha_poly))
  (setq gvar_2607 nil)
  (while (and (cadr gvar_2607) gvar_2149)
    T
    (setq ls_ref (axedyn-reaccreate gvar_2149))
    polybib-vtxjoin
    (setq gvar_2149 (eo_polyabs gvar_2149))
    (and (or (or (re_angle (in_param ls_ref "Sauver filtre") "Choisir le type de réseau") (re_angle (in_param ls_ref "Sauver filtre") blkbib-getparententities)) (or (re_angle (in_param ls_ref 'vla-get-linetype) "Choisir le type de réseau") (re_angle (in_param ls_ref 'vla-get-linetype) listbib-min))) (setq gvar_2607 polybib-vtxjoin))
  )
  (if gvar_2607
    (progn
      (setq dcl-form-close (blkpoly-set (polar (rem gvar_1966))))
      (setq polybib_geom-bulge2radius (in_param pt_dyn 'polybib-absatpoint))
      (setq polybib_geom-bulge2radius (st_rayon polybib_geom-bulge2radius 8 (in_param ls_ref 'ls_rowcol)))
      (setq polybib_geom-bulge2radius (st_rayon polybib_geom-bulge2radius 'dcl-project-load (in_param ls_ref 'intersbib-getinsidevtxs)))
      (setq polybib_geom-bulge2radius (st_rayon polybib_geom-bulge2radius (es_ext (groupbib-list '(ss_blk ls_blk) (dcl-control-setvalue gvar_1966)) (groupbib-list 'c:projet_md_repblk_bt_ok_onclicked (projet_md_metzon_co_layer gvar_1966)))))
      (setq pt_dyn (st_rayon pt_dyn 'polybib-absatpoint polybib_geom-bulge2radius))
      (setq st_blk (st_rayon pt_dyn (es_ext (groupbib-list 'blkpolydial-getrep dcl-form-close))))
    )
    (progn
      (setq st_blk nil)
    )
  )
  st_blk
)

;; Original arg hints: arg_1
;; Referenced symbols: ENTDEL, POLAR, IN_PARAM, TBLSEARCH, IN_COLOR, PROJET/MD_METZON/RECTANGLE1, CADR, AXEDYN-REACCREATE, LS_REF, dcl-grid-deleterow
;; Referenced strings: LAYER, Choisir le type de réseau, Sauver filtre
(defun importbib-getinsert (arg_1 / en_leg eo_leg pt_dyn pt_ins re_angle re_side1 re_side2 re_dist ls_linktype ls_columns local_0 local_2)
  (entdel "LAYER")
  (setq en_leg (polar (rem gvar_1966)))
  (setq gvar_3137 (id_group gvar_1966))
  (setq cos (princl gvar_1966))
  (setq blkpoly-get (in_param en_leg 10))
  (setq dcl-listbox-clear (tblsearch gvar_1966))
  (setq blkbib-getparententities (in_color gvar_1966))
  (setq ls_prop (projet_md_metzon_rectangle1 gvar_1966))
  (setq gvar_2607 nil)
  (while (and (cadr gvar_2607) gvar_2149)
    T
    (setq ls_ref (axedyn-reaccreate gvar_2149))
    polybib-vtxjoin
    (setq gvar_2149 (eo_polyabs gvar_2149))
    (and (or (or (re_angle (in_param ls_ref 'dcl-grid-deleterow) "Choisir le type de réseau") (re_angle (in_param ls_ref 'dcl-grid-deleterow) dcl-listbox-clear)) (or (re_angle (in_param ls_ref "Sauver filtre") "Choisir le type de réseau") (re_angle (in_param ls_ref "Sauver filtre") blkbib-getparententities))) (setq gvar_2607 polybib-vtxjoin))
  )
  (if gvar_2607
    (progn
      (setq polybib_geom-bulge2radius (in_param pt_dyn 'polybib-absatpoint))
      (setq polybib_geom-bulge2radius (st_rayon polybib_geom-bulge2radius 8 (in_param ls_ref 'ls_rowcol)))
      (setq pt_dyn (st_rayon pt_dyn 'polybib-absatpoint polybib_geom-bulge2radius))
      (setq pt_dyn (st_rayon pt_dyn 'itemindexorcount (in_param ls_ref 'doc)))
      (setq st_blk (st_rayon pt_dyn (es_ext (groupbib-list 'itemindexorcount dcl-listbox-clear) (groupbib-list 'eo_paramreact blkpoly-get) (groupbib-list '(ls_parents ls_props ls_prop) ls_prop) (groupbib-list 'blkpolydial-modrefbouton gvar_3137) (groupbib-list 'dcl-control-setbackcolor cos))))
    )
    (progn
      (setq st_blk nil)
    )
  )
  st_blk
)

;; Original arg hints: arg_1
;; Referenced symbols: POLAR, NULL, PROJET/MD_METZON/TB_COEF, DCL-GRID-ADDROW, CADR, AXEDYN-REACCREATE, LS_REF, collect-next, IN_PARAM, RE_ANGLE
;; Referenced strings: Choisir le type de réseau, Sauver filtre
(defun importbib-getcovacablechamber (arg_1 / en_leg eo_leg pt_dyn pt_ins re_angle re_side1 re_side2 re_dist ls_linktype ls_columns local_0 local_2)
  (setq en_leg (polar (rem gvar_1966)))
  (setq projet_md_metzon_tb_coef (null gvar_1966))
  (setq gvar_1943_c_projet_md_metzon_tb_coef_onsetfocus (dcl-grid-addrow 0 projet_md_metzon_tb_coef))
  (setq projet_md_metzon (dcl-grid-addrow 1 projet_md_metzon_tb_coef))
  (setq dcl-listbox-clear (dcl-grid-addrow 1 projet_md_metzon_tb_coef))
  (setq blkpoly-get (dcl-grid-addrow 4 projet_md_metzon_tb_coef))
  (setq ls_prop (dcl-grid-addrow 5 projet_md_metzon_tb_coef))
  (setq blkbib-getparententities (dcl-grid-addrow 3 projet_md_metzon_tb_coef))
  (setq gvar_2607 nil)
  (while (and (cadr gvar_2607) gvar_2149)
    T
    (setq ls_ref (axedyn-reaccreate gvar_2149))
    polybib-vtxjoin
    (setq gvar_2149 (eo_polyabs gvar_2149))
    (and (or (or (or (re_angle (in_param ls_ref 'collect-next) "Choisir le type de réseau") (re_angle (in_param ls_ref 'collect-next) gvar_1943_c_projet_md_metzon_tb_coef_onsetfocus)) (or (re_angle (in_param ls_ref 'modelspace) 4) (re_angle (in_param ls_ref 'modelspace) projet_md_metzon))) (or (re_angle (in_param ls_ref "Sauver filtre") "Choisir le type de réseau") (re_angle (in_param ls_ref "Sauver filtre") blkbib-getparententities))) (setq gvar_2607 polybib-vtxjoin))
  )
  (if gvar_2607
    (progn
      (setq polybib_geom-bulge2radius (in_param pt_dyn 'polybib-absatpoint))
      (setq polybib_geom-bulge2radius (st_rayon polybib_geom-bulge2radius 8 (in_param ls_ref 'ls_rowcol)))
      (setq pt_dyn (st_rayon pt_dyn 'polybib-absatpoint polybib_geom-bulge2radius))
      (setq pt_dyn (st_rayon pt_dyn 'itemindexorcount (in_param ls_ref 'doc)))
      (setq st_blk (st_rayon pt_dyn (es_ext (groupbib-list 'collect-next gvar_1943_c_projet_md_metzon_tb_coef_onsetfocus) (groupbib-list 'projet_md_metzon_cb_prop projet_md_metzon) (groupbib-list 'eo_paramreact blkpoly-get) (groupbib-list '(ls_parents ls_props ls_prop) ls_prop))))
    )
    (progn
      (setq st_blk nil)
    )
  )
  st_blk
)

;; Original arg hints: arg_1
;; Referenced symbols: POLAR, STRCASE, PROJET/MD_METZON/TB_COEF, DCL-GRID-ADDROW, CADR, AXEDYN-REACCREATE, LS_REF, LS_OBJS, IN_PARAM, RE_ANGLE
;; Referenced strings: Choisir le type de réseau
(defun importbib-getcovamanhole (arg_1 / en_leg eo_leg pt_dyn pt_ins re_angle re_side1 re_side2 re_dist ls_linktype ls_columns local_0 local_2)
  (setq en_leg (polar (rem gvar_1966)))
  (setq projet_md_metzon_tb_coef (strcase gvar_1966))
  (setq gvar_1923 (dcl-grid-addrow 0 projet_md_metzon_tb_coef))
  (setq gvar_1943_c_projet_md_metzon_tb_coef_onsetfocus (dcl-grid-addrow 1 projet_md_metzon_tb_coef))
  (setq projet_md_metzon (dcl-grid-addrow 2 projet_md_metzon_tb_coef))
  (setq dcl-listbox-clear (dcl-grid-addrow 1 projet_md_metzon_tb_coef))
  (setq blkpoly-get (dcl-grid-addrow 5 projet_md_metzon_tb_coef))
  (setq ls_prop (dcl-grid-addrow 6 projet_md_metzon_tb_coef))
  (setq gvar_2607 nil)
  (while (and (cadr gvar_2607) gvar_2149)
    T
    (setq ls_ref (axedyn-reaccreate gvar_2149))
    polybib-vtxjoin
    (setq gvar_2149 (eo_polyabs gvar_2149))
    (and (or (or (or (re_angle (in_param ls_ref 'ls_objs) "Choisir le type de réseau") (re_angle (in_param ls_ref 'ls_objs) gvar_1923)) (or (re_angle (in_param ls_ref 'modelspace) 4) (re_angle (in_param ls_ref 'modelspace) projet_md_metzon))) (or (re_angle (in_param ls_ref 'collect-next) "Choisir le type de réseau") (re_angle (in_param ls_ref 'collect-next) gvar_1943_c_projet_md_metzon_tb_coef_onsetfocus))) (setq gvar_2607 polybib-vtxjoin))
  )
  (if gvar_2607
    (progn
      (setq polybib_geom-bulge2radius (in_param pt_dyn 'polybib-absatpoint))
      (setq polybib_geom-bulge2radius (st_rayon polybib_geom-bulge2radius 8 (in_param ls_ref 'ls_rowcol)))
      (setq pt_dyn (st_rayon pt_dyn 'polybib-absatpoint polybib_geom-bulge2radius))
      (setq pt_dyn (st_rayon pt_dyn 'itemindexorcount (in_param ls_ref 'doc)))
      (setq st_blk (st_rayon pt_dyn (es_ext (groupbib-list 'ls_objs (dcl-grid-addrow 0 projet_md_metzon_tb_coef)) (groupbib-list 'collect-next (dcl-grid-addrow 1 projet_md_metzon_tb_coef)) (groupbib-list 'projet_md_metzon_cb_prop (dcl-grid-addrow 2 projet_md_metzon_tb_coef)) (groupbib-list 'eo_paramreact (dcl-grid-addrow 5 projet_md_metzon_tb_coef)) (groupbib-list '(ls_parents ls_props ls_prop) (dcl-grid-addrow 6 projet_md_metzon_tb_coef)))))
    )
    (progn
      (setq st_blk nil)
    )
  )
  st_blk
)

;; Original arg hints: arg_1
;; Referenced symbols: POLAR, PROJET/MD_METZON/CB_LTYPE, PROJET/MD_METZON/TB_COEF, DCL-GRID-ADDROW, CADR, AXEDYN-REACCREATE, LS_REF, LS_OBJS, IN_PARAM, RE_ANGLE
;; Referenced strings: Choisir le type de réseau
(defun importbib-getcovapipe (arg_1 / en_leg eo_leg pt_dyn pt_ins re_angle re_side1 re_side2 re_dist ls_linktype ls_columns local_0 local_2)
  (setq en_leg (polar (rem gvar_1966)))
  (setq projet_md_metzon_tb_coef (projet_md_metzon_cb_ltype gvar_1966))
  (setq dcl-form-close (projet_md_metzon_cb_ltype gvar_1966))
  (setq gvar_1923 (dcl-grid-addrow 0 projet_md_metzon_tb_coef))
  (setq gvar_1943_c_projet_md_metzon_tb_coef_onsetfocus (dcl-grid-addrow 2 projet_md_metzon_tb_coef))
  (setq projet_md_metzon (dcl-grid-addrow 1 projet_md_metzon_tb_coef))
  (setq gvar_2607 nil)
  (while (and (cadr gvar_2607) gvar_2149)
    T
    (setq ls_ref (axedyn-reaccreate gvar_2149))
    polybib-vtxjoin
    (setq gvar_2149 (eo_polyabs gvar_2149))
    (and (or (or (or (re_angle (in_param ls_ref 'ls_objs) "Choisir le type de réseau") (re_angle (in_param ls_ref 'ls_objs) gvar_1923)) (or (re_angle (in_param ls_ref 'modelspace) 4) (re_angle (in_param ls_ref 'modelspace) projet_md_metzon))) (or (re_angle (in_param ls_ref 'collect-next) "Choisir le type de réseau") (re_angle (in_param ls_ref 'collect-next) gvar_1943_c_projet_md_metzon_tb_coef_onsetfocus))) (setq gvar_2607 polybib-vtxjoin))
  )
  (if gvar_2607
    (progn
      (setq polybib_geom-bulge2radius (in_param pt_dyn 'polybib-absatpoint))
      (setq polybib_geom-bulge2radius (st_rayon polybib_geom-bulge2radius 8 (in_param ls_ref 'ls_rowcol)))
      (setq polybib_geom-bulge2radius (st_rayon polybib_geom-bulge2radius 'dcl-project-load (in_param ls_ref 'intersbib-getinsidevtxs)))
      (setq pt_dyn (st_rayon pt_dyn 'polybib-absatpoint polybib_geom-bulge2radius))
      (setq st_blk (st_rayon pt_dyn (es_ext (groupbib-list 'blkpolydial-getrep dcl-form-close) (groupbib-list 'ls_objs (dcl-grid-addrow 0 projet_md_metzon_tb_coef)) (groupbib-list 'collect-next (dcl-grid-addrow 1 projet_md_metzon_tb_coef)) (groupbib-list 'projet_md_metzon_cb_prop (dcl-grid-addrow 2 projet_md_metzon_tb_coef)))))
    )
    (progn
      (setq st_blk nil)
    )
  )
  st_blk
)

;; Original arg hints: arg_1
;; Referenced symbols: ENTDEL, POLYBIB-ABSATPOINT, IN_PARAM, POLYBIB_GEOM-BULGE2RADIUS, LD_DETAIL, GROUPBIB-LIST, dcl-control-settitlebartext, BLKPOLY-GETPARENTS, PROJET/MD_METZON/BV_BLOC, BLKPOLYMOD-CLOSE
;; Referenced strings: DuBloc
(defun importbib-gethatch (arg_1 / en_leg eo_leg pt_dyn pt_ins re_angle re_side1 re_side2 re_dist local_0)
  (entdel "DuBloc")
  (setq gvar_2735 (getfiled (rem gvar_1966)))
  (setq polybib_geom-bulge2radius (in_param pt_dyn 'polybib-absatpoint))
  (setq pt_dyn (st_rayon pt_dyn 'polybib-absatpoint polybib_geom-bulge2radius))
  (setq st_blk (st_rayon pt_dyn (es_ext (groupbib-list 'ld_detail (projet_md_metzon_cb_ltype gvar_1966)) (groupbib-list '(ls_parents) (dcl-control-settitlebartext gvar_1966)) (groupbib-list '(ls_parents ls_props ls_prop) (dcl-control-settitlebartext gvar_1966)) (groupbib-list 'blkpoly-getparents (projet_md_metzon_bv_bloc gvar_1966)) (groupbib-list 'blkpolymod-close (axedyn-reaccreate gvar_2735)) (groupbib-list '(st_file ls_temp) (re_x gvar_2735)))))
  st_blk
)

;; Original arg hints: AOLEG-SIHLIN
;; Referenced symbols: PROJET/MD_METZON/HACHURES1, ENTDEL, ES_EXT, AOLEG-SIHLIN, LS_SIHLIN, TRANS, ODCLBIB-FILLCOMBO, LS_COTE, AOLEG-POLY, POLAR
;; Referenced strings:  - 
(defun importbib-getfoustyles (aoleg-sihlin / local_1)
  (entdel 'projet_md_metzon_hachures1)
  (setq ha_poly2 (es_ext))
  aoleg-sihlin_2
  (if (odclbib-fillcombo (trans 'ls_sihlin) 1)
    (progn
      " - "
    )
    (progn
      'ls_cote
    )
  )
  (setq local_1 (aoleg-poly (=)))
  ;; init-args 3: '(en_leg eo_leg pt_dyn pt_ins re_angle re_side1 re_side2 re_dist), nil
  (aoleg-poly local_1)
  (while (setq gvar_1966 (aoleg-poly local_1))
    (setq gvar_1964 (polar (rem gvar_1966)))
    (setq polybib-subpolybisinv (in_param gvar_1964 0))
    (if (re_angle polybib-subpolybisinv 'importbib-getcovapipe)
      (progn
        (setq gvar_2519 (c:projet_md_metzon_tb_larg_onsetfocus gvar_1966))
        (setq ha_poly2 (projet_md_metzon_hachures1 ha_poly2 (es_ext (groupbib-list 'collect-next (dcl-grid-addrow 0 gvar_2519)) (groupbib-list 'modelspace (dcl-grid-addrow 2 gvar_2519)) (groupbib-list 'vla-get-linetype (dcl-grid-addrow 3 gvar_2519)) (groupbib-list 'ls_rowcol (dcl-grid-addrow 5 gvar_2519)))))
      )
    )
  )
  (bo_select local_1)
  ha_poly2
)

;; Original arg hints: AOLEG-SIHLIN
;; Referenced symbols: PROJET/MD_METZON/HACHURES1, ENTDEL, ES_EXT, AOLEG-SIHLIN, LS_SIHLIN, TRANS, ODCLBIB-FILLCOMBO, LS_COTE, AOLEG-POLY, POLAR
;; Referenced strings:  - , Sauver filtre
(defun importbib-getchambstyles (aoleg-sihlin / local_1)
  (entdel 'projet_md_metzon_hachures1)
  (setq ha_poly2 (es_ext))
  aoleg-sihlin_2
  (if (odclbib-fillcombo (trans 'ls_sihlin) 1)
    (progn
      " - "
    )
    (progn
      'ls_cote
    )
  )
  (setq local_1 (aoleg-poly (=)))
  ;; init-args 3: '(en_leg eo_leg pt_dyn pt_ins re_angle re_side1 re_side2 re_dist), nil
  (aoleg-poly local_1)
  (while (setq gvar_1966 (aoleg-poly local_1))
    (setq gvar_1964 (polar (rem gvar_1966)))
    (setq polybib-subpolybisinv (in_param gvar_1964 0))
    (if (re_angle polybib-subpolybisinv 'foubib-getvtxs)
      (progn
        (setq gvar_2519 (null gvar_1966))
        (setq ha_poly2 (projet_md_metzon_hachures1 ha_poly2 (es_ext (groupbib-list 'collect-next (dcl-grid-addrow 0 gvar_2519)) (groupbib-list 'modelspace (dcl-grid-addrow 1 gvar_2519)) (groupbib-list "Sauver filtre" (dcl-grid-addrow 3 gvar_2519)) (groupbib-list 'doc (dcl-grid-addrow 0 gvar_2519)) (groupbib-list 'ls_rowcol (dcl-grid-addrow 3 gvar_2519)))))
      )
    )
  )
  (bo_select local_1)
  ha_poly2
)

;; Original arg hints: AOLEG-SIHLIN
;; Referenced symbols: PROJET/MD_METZON/HACHURES1, ENTDEL, ES_EXT, AOLEG-SIHLIN, LS_SIHLIN, TRANS, ODCLBIB-FILLCOMBO, LS_COTE, AOLEG-POLY, POLAR
;; Referenced strings:  - 
(defun importbib-getpipesstyles (aoleg-sihlin / local_1)
  (entdel 'projet_md_metzon_hachures1)
  (setq ha_poly2 (es_ext))
  aoleg-sihlin_2
  (if (odclbib-fillcombo (trans 'ls_sihlin) 1)
    (progn
      " - "
    )
    (progn
      'ls_cote
    )
  )
  (setq local_1 (aoleg-poly (=)))
  ;; init-args 3: '(en_leg eo_leg pt_dyn pt_ins re_angle re_side1 re_side2 re_dist), nil
  (aoleg-poly local_1)
  (while (setq gvar_1966 (aoleg-poly local_1))
    (setq gvar_1964 (polar (rem gvar_1966)))
    (setq polybib-subpolybisinv (in_param gvar_1964 0))
    (if (re_angle polybib-subpolybisinv 'ls_specs)
      (progn
        (setq gvar_2519 (projet_md_metzon_cb_ltype gvar_1966))
        (setq ha_poly2 (projet_md_metzon_hachures1 ha_poly2 (es_ext (groupbib-list 'ls_objs (dcl-grid-addrow 0 gvar_2519)) (groupbib-list 'modelspace (dcl-grid-addrow 1 gvar_2519)) (groupbib-list 'collect-next (dcl-grid-addrow 2 gvar_2519)) (groupbib-list 'ls_rowcol (dcl-grid-addrow 4 gvar_2519)) (groupbib-list 'intersbib-getinsidevtxs (dcl-grid-addrow 5 gvar_2519)))))
      )
    )
  )
  (bo_select local_1)
  ha_poly2
)

;; Original arg hints: AOLEG-SIHLIN
;; Referenced symbols: PROJET/MD_METZON/HACHURES1, ENTDEL, ES_EXT, AOLEG-SIHLIN, LS_SIHLIN, TRANS, ODCLBIB-FILLCOMBO, LS_COTE, AOLEG-POLY, POLAR
;; Referenced strings:  - 
(defun importbib-getmanholestyles (aoleg-sihlin / local_1)
  (entdel 'projet_md_metzon_hachures1)
  (setq ha_poly2 (es_ext))
  aoleg-sihlin_2
  (if (odclbib-fillcombo (trans 'ls_sihlin) 1)
    (progn
      " - "
    )
    (progn
      'ls_cote
    )
  )
  (setq local_1 (aoleg-poly (=)))
  ;; init-args 3: '(en_leg eo_leg pt_dyn pt_ins re_angle re_side1 re_side2 re_dist), nil
  (aoleg-poly local_1)
  (while (setq gvar_1966 (aoleg-poly local_1))
    (setq gvar_1964 (polar (rem gvar_1966)))
    (setq polybib-subpolybisinv (in_param gvar_1964 0))
    (if (re_angle polybib-subpolybisinv 'collect-release)
      (progn
        (setq gvar_2519 (strcase gvar_1966))
        (setq ha_poly2 (projet_md_metzon_hachures1 ha_poly2 (es_ext (groupbib-list 'ls_objs (dcl-grid-addrow 0 gvar_2519)) (groupbib-list 'collect-next (dcl-grid-addrow 1 gvar_2519)) (groupbib-list 'modelspace (dcl-grid-addrow 2 gvar_2519)) (groupbib-list 'ls_rowcol (dcl-grid-addrow 4 gvar_2519)) (groupbib-list 'doc (dcl-grid-addrow 1 gvar_2519)))))
      )
    )
  )
  (bo_select local_1)
  ha_poly2
)

;; Original arg hints: AOLEG-SIHLIN
;; Referenced symbols: PROJET/MD_METZON/HACHURES1, ENTDEL, ES_EXT, AOLEG-SIHLIN, LS_SIHLIN, TRANS, ODCLBIB-FILLCOMBO, LS_COTE, AOLEG-POLY, POLAR
;; Referenced strings:  - 
(defun importbib-getplfstyles (aoleg-sihlin / local_1)
  (entdel 'projet_md_metzon_hachures1)
  (setq ha_poly2 (es_ext))
  aoleg-sihlin_2
  (if (odclbib-fillcombo (trans 'ls_sihlin) 1)
    (progn
      " - "
    )
    (progn
      'ls_cote
    )
  )
  (setq local_1 (aoleg-poly (=)))
  ;; init-args 3: '(en_leg eo_leg pt_dyn pt_ins re_angle re_side1 re_side2 re_dist), nil
  (aoleg-poly local_1)
  (while (setq gvar_1966 (aoleg-poly local_1))
    (setq gvar_1964 (polar (rem gvar_1966)))
    (setq polybib-subpolybisinv (in_param gvar_1964 0))
    (if (re_angle polybib-subpolybisinv 'importbib-getcovaduct)
      (progn
        (setq ha_poly2 (projet_md_metzon_hachures1 ha_poly2 (st_ltype gvar_1966)))
      )
    )
  )
  (bo_select local_1)
  ha_poly2
)

;; Original arg hints: AOLEG-SIHLIN
;; Referenced symbols: PROJET/MD_METZON/HACHURES1, ENTDEL, ES_EXT, AOLEG-SIHLIN, LS_SIHLIN, TRANS, ODCLBIB-FILLCOMBO, LS_COTE, AOLEG-POLY, POLAR
;; Referenced strings:  - , Fin BlKPoly-XY2WCS, Sauver filtre
(defun importbib-getpolystyles (aoleg-sihlin / local_1)
  (entdel 'projet_md_metzon_hachures1)
  (setq ha_poly2 (es_ext))
  aoleg-sihlin_2
  (if (odclbib-fillcombo (trans 'ls_sihlin) 1)
    (progn
      " - "
    )
    (progn
      'ls_cote
    )
  )
  (setq local_1 (aoleg-poly (=)))
  ;; init-args 3: '(en_leg eo_leg pt_dyn pt_ins re_angle re_side1 re_side2 re_dist), nil
  (aoleg-poly local_1)
  (while (setq gvar_1966 (aoleg-poly local_1))
    (setq gvar_1964 (polar (rem gvar_1966)))
    (setq polybib-subpolybisinv (in_param gvar_1964 0))
    (if (re_angle polybib-subpolybisinv "Fin BlKPoly-XY2WCS")
      (progn
        (setq ha_poly2 (projet_md_metzon_hachures1 ha_poly2 (es_ext (groupbib-list "Sauver filtre" (in_param gvar_1964 8)) (groupbib-list 'vla-get-linetype (en_polyabs gvar_1964 43 'ha_poly)) (groupbib-list 'ls_rowcol (in_param gvar_1964 8)) (groupbib-list 'intersbib-getinsidevtxs (en_polyabs gvar_1964 43 'ha_poly)))))
      )
    )
  )
  (bo_select local_1)
  ha_poly2
)

;; Original arg hints: AOLEG-SIHLIN
;; Referenced symbols: PROJET/MD_METZON/HACHURES1, ENTDEL, ES_EXT, AOLEG-SIHLIN, LS_SIHLIN, TRANS, ODCLBIB-FILLCOMBO, LS_COTE, AOLEG-POLY, POLAR
;; Referenced strings:  - , Largeur globale, Sauver filtre
(defun importbib-getinsertstyles (aoleg-sihlin / local_1)
  (entdel 'projet_md_metzon_hachures1)
  (setq ha_poly2 (es_ext))
  aoleg-sihlin_2
  (if (odclbib-fillcombo (trans 'ls_sihlin) 1)
    (progn
      " - "
    )
    (progn
      'ls_cote
    )
  )
  (setq local_1 (aoleg-poly (=)))
  ;; init-args 3: '(en_leg eo_leg pt_dyn pt_ins re_angle re_side1 re_side2 re_dist), nil
  (aoleg-poly local_1)
  (while (setq gvar_1966 (aoleg-poly local_1))
    (setq gvar_1964 (polar (rem gvar_1966)))
    (setq polybib-subpolybisinv (in_param gvar_1964 0))
    (if (and (re_angle polybib-subpolybisinv 'projet_pa_detail_btn_param) (cadr (projet_md_metzon_co_special gvar_1966 "Largeur globale")))
      (progn
        (setq ha_poly2 (projet_md_metzon_hachures1 ha_poly2 (es_ext (groupbib-list "Sauver filtre" (in_param gvar_1964 8)) (groupbib-list 'dcl-grid-deleterow (projet_md_metzon_la_special (rem gvar_1966))) (groupbib-list 'ls_rowcol (in_param gvar_1964 8)) (groupbib-list 'doc (projet_md_metzon_la_special (rem gvar_1966))))))
      )
    )
  )
  (bo_select local_1)
  ha_poly2
)

;; Original arg hints: ST_2
;; Referenced symbols: ENTDEL, ST_2, AOPORA-FIN, RE_COEF, IN_PARAM, ST_TYPE, EN_LEG, POLYBIB-SUBPOLYBISINV, PROJET/PA_DETAIL/BTN_PARAM, RE_ANGLE
;; Referenced strings: Métré d'une Hachure, Fin BlKPoly-XY2WCS
(defun importbib-trace (st_2 / local_1)
  (entdel "Métré d'une Hachure")
  (setq local_1 st_2_2)
  ;; init-args 3: 'aopora-fin, nil
  nil
  (foreach aopora-fin local_1
    (setq importbib-tracecovamanhole (in_param aopora-fin 're_coef))
    (setq polybib-subpolybisinv (in_param aopora-fin 'st_type))
    (setq gvar_1909 (in_param aopora-fin 'en_leg))
    nil
    (or (or (or (or (or (or (or (re_angle polybib-subpolybisinv 'projet_pa_detail_btn_param) (re_angle polybib-subpolybisinv "Fin BlKPoly-XY2WCS")) (re_angle polybib-subpolybisinv 'importbib-getcovapipe)) (re_angle polybib-subpolybisinv 'ls_specs)) (re_angle polybib-subpolybisinv 'collect-release)) (re_angle polybib-subpolybisinv 'foubib-getvtxs)) (re_angle polybib-subpolybisinv 'blkpoly-mod-paramupdate)) (re_angle polybib-subpolybisinv 'importbib-getcovaduct))
    (st_hach aopora-fin gvar_1909)
    (dcl-hatch-setpattern aopora-fin gvar_1909)
    (dcl-hatch-setpattern aopora-fin gvar_1909)
    (dcl-hatch-setpattern aopora-fin gvar_1909)
    (ls_dynprops aopora-fin gvar_1909)
    (ls_dynprops aopora-fin gvar_1909)
    (ls_dynprops aopora-fin gvar_1909)
    (dcl-hatch-setpattern aopora-fin gvar_1909)
  )
)

;; Original arg hints: IMPORTBIB-TRACECOVAMANHOLE, arg_2
;; Referenced symbols: LS_DYNPROPS, ENTDEL, dcl-messagebox, IMPORTBIB-TRACECOVAMANHOLE, RE_COURANT, IN_PARAM, RE_RAY, vla-put-InsertionPoint, POLAR
(defun importbib-isvalid (importbib-tracecovamanhole arg_2)
  (entdel 'ls_dynprops)
  (re_courant 'dcl-messagebox importbib-tracecovamanhole_2)
  (re_ray (in_param gvar_1903 gvar_1909))
  (if (and (setq gvar_1903 (re_courant 'dcl-messagebox importbib-tracecovamanhole_2)) (in_param gvar_1903 gvar_1909) (setq vla-put-insertionpoint (re_ray (in_param gvar_1903 gvar_1909))) (polar vla-put-insertionpoint))
    (progn
      vla-put-insertionpoint
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: AOPORA-FIN, arg_2
;; Referenced symbols: AOPORA-FIN, ITEMINDEXORCOUNT, IN_PARAM, EO_PARAMREACT, EN_POLY, BLKPOLYDIAL-MODREFBOUTON, dcl-control-setbackcolor, POLYBIB-ABSATPOINT, RE_RAY, POLAR
(defun importbib-traceinsert (aopora-fin arg_2)
  (setq ls_dynprop (in_param aopora-fin_2 'itemindexorcount))
  (setq blkpoly-get (in_param aopora-fin_2 'eo_paramreact))
  (setq blkbib-blkname 'en_poly)
  (setq ls_prop (in_param aopora-fin_2 '(ls_parents ls_props ls_prop)))
  (setq gvar_3137 (in_param aopora-fin_2 'blkpolydial-modrefbouton))
  (setq cos (in_param aopora-fin_2 'dcl-control-setbackcolor))
  (setq polybib_geom-bulge2radius (in_param aopora-fin_2 'polybib-absatpoint))
  (if (and (in_param gvar_3094 gvar_1909) (re_ray (in_param gvar_3094 gvar_1909)) (polar (re_ray (in_param gvar_3094 gvar_1909))))
    (progn
      (real (re_ray (in_param gvar_3094 gvar_1909)) ls_dynprop blkpoly-get blkbib-blkname ls_prop gvar_3137 cos polybib_geom-bulge2radius)
      (setq gvar_2163 (st_axeid gvar_2163))
      (blkpolydial-getpoint (re_angle0 gvar_1909 gvar_3094) gvar_3094)
      (setq gvar_3094 (blkpolydial-getpoint (re_angle0 gvar_1909 gvar_3094) gvar_3094))
    )
    (progn
      (setq ss_blk (_vlax-true ls_dynprop blkpoly-get blkbib-blkname ls_prop gvar_3137 cos polybib_geom-bulge2radius))
      (setq dcl-combobox-addstring (1- ss_blk))
      (if (in_param gvar_3094 gvar_1909)
        (progn
          (setq gvar_3094 (blkpolydial-getpoint (re_angle0 gvar_1909 gvar_3094) gvar_3094))
        )
      )
      (rtos 'dcl-messagebox gvar_1909 dcl-combobox-addstring)
      (st_axeid gvar_2164)
      (setq gvar_2164 (st_axeid gvar_2164))
    )
  )
)

;; Original arg hints: AOPORA-FIN, arg_2
;; Referenced symbols: PROJET/MD_METZON/INTITULE1, ENTDEL, AOPORA-FIN, RE_COEF, IN_PARAM, dcl-messagebox, IMPORTBIB-TRACECOVAMANHOLE, RE_COURANT, EN_LEG, C:PROJET/MD_METZON#ONINITIALIZE
(defun importbib-tracepoly (aopora-fin arg_2)
  (entdel 'projet_md_metzon_intitule1)
  (setq importbib-tracecovamanhole (in_param aopora-fin_2 're_coef))
  (setq gvar_3094 (re_courant 'dcl-messagebox importbib-tracecovamanhole))
  (setq gvar_1909 (in_param aopora-fin_2 'en_leg))
  (c:projet_md_metzon_oninitialize importbib-tracecovamanhole gvar_1909)
  (if (setq vla-put-insertionpoint (c:projet_md_metzon_oninitialize importbib-tracecovamanhole gvar_1909))
    (progn
      (sssetfirst vla-put-insertionpoint (in_param aopora-fin_2 'blkpolydial-getrep) (in_param aopora-fin_2 'polybib-absatpoint))
      (setq gvar_2163 (st_axeid gvar_2163))
    )
    (progn
      (setq vla-put-insertionpoint (*en_ray* (in_param aopora-fin_2 'blkpolydial-getrep) (in_param aopora-fin_2 'polybib-absatpoint)))
      (setq gvar_3094 (st_rayon gvar_3094 (es_ext (groupbib-list gvar_1909 (1- vla-put-insertionpoint)))))
      (setq gvar_2164 (st_axeid gvar_2164))
    )
  )
  (rtos 'dcl-messagebox importbib-tracecovamanhole gvar_3094)
)

;; Original arg hints: AOPORA-FIN, arg_2
;; Referenced symbols: C:PROJET/MD_METZON/CO_SPECIAL#ONCLICKED, ENTDEL, AOPORA-FIN, RE_COEF, IN_PARAM, dcl-messagebox, IMPORTBIB-TRACECOVAMANHOLE, RE_COURANT, EN_LEG, ITEMINDEXORCOUNT
(defun importbib-tracecovamanhole (aopora-fin arg_2)
  (entdel 'c:projet_md_metzon_co_special_onclicked)
  (setq importbib-tracecovamanhole (in_param aopora-fin_2 're_coef))
  (setq gvar_3094 (re_courant 'dcl-messagebox importbib-tracecovamanhole))
  (setq gvar_1909 (in_param aopora-fin_2 'en_leg))
  (setq ls_dynprop (in_param aopora-fin_2 'itemindexorcount))
  (setq blkpoly-get (in_param aopora-fin_2 'eo_paramreact))
  (setq blkbib-blkname 'en_poly)
  (setq ls_prop (in_param aopora-fin_2 '(ls_parents ls_props ls_prop)))
  (setq gvar_3137 (in_param aopora-fin_2 'blkpolydial-modrefbouton))
  (setq cos (in_param aopora-fin_2 'dcl-control-setbackcolor))
  (setq polybib_geom-bulge2radius (in_param aopora-fin_2 'polybib-absatpoint))
  (c:projet_md_metzon_oninitialize importbib-tracecovamanhole gvar_1909)
  (if (setq vla-put-insertionpoint (c:projet_md_metzon_oninitialize importbib-tracecovamanhole gvar_1909))
    (progn
      (real vla-put-insertionpoint ls_dynprop blkpoly-get blkbib-blkname ls_prop gvar_3137 cos polybib_geom-bulge2radius)
      (setq gvar_2163 (st_axeid gvar_2163))
    )
    (progn
      (setq ss_blk (_vlax-true ls_dynprop blkpoly-get blkbib-blkname ls_prop gvar_3137 cos polybib_geom-bulge2radius))
      (setq dcl-combobox-addstring (1- ss_blk))
      (setq gvar_3094 (st_rayon gvar_3094 (es_ext (groupbib-list gvar_1909 dcl-combobox-addstring))))
      (setq gvar_2164 (st_axeid gvar_2164))
    )
  )
  (rtos 'dcl-messagebox importbib-tracecovamanhole gvar_3094)
)

;; Original arg hints: AOPORA-FIN, arg_2
;; Referenced symbols: C:PROJET/MD_METZON/CB_LAYER#ONCLICKED, ENTDEL, IN_PARAM, C:PROJET/MD_METZON/CB_LTYPE#ONCLICKED, RE_RAY, PROJET/MD_METZON/CB_COLOR, POLAR, POLYBIB-VTXJOIN, ST_AXEID, dcl-messagebox
(defun importbib-tracehach (aopora-fin arg_2)
  (entdel 'c:projet_md_metzon_cb_layer_onclicked)
  (in_param gvar_3094 gvar_1909)
  (re_ray gvar_1895_c_projet_md_metzon_cb_ltype_onclicked)
  (polar projet_md_metzon_cb_color)
  (or (or (and (setq gvar_1895_c_projet_md_metzon_cb_ltype_onclicked (in_param gvar_3094 gvar_1909)) (setq projet_md_metzon_cb_color (re_ray gvar_1895_c_projet_md_metzon_cb_ltype_onclicked)) (setq va_quant (polar projet_md_metzon_cb_color))) gvar_1895_c_projet_md_metzon_cb_ltype_onclicked) polybib-vtxjoin)
  (setq gvar_2164 (st_axeid gvar_2164))
  (ls_parentconf 'dcl-messagebox gvar_1909)
  (setq gvar_3094 (blkpolydial-getpoint (re_angle0 gvar_1909 gvar_3094) gvar_3094))
  (setq gvar_2163 (st_axeid gvar_2163))
  (sihpp-list projet_md_metzon_cb_color)
  (ls_parentconf 'dcl-messagebox gvar_1909)
  (setq gvar_3094 (blkpolydial-getpoint (re_angle0 gvar_1909 gvar_3094) gvar_3094))
  (setq gvar_2163 (st_axeid gvar_2163))
  (setq vla-put-insertionpoint (blkpoly-getparents (in_param aopora-fin_2 'blkpolymod-close) (in_param aopora-fin_2 '(st_file ls_temp)) (in_param aopora-fin_2 'ld_detail) (in_param aopora-fin_2 '(ls_parents ls_props ls_prop)) (in_param aopora-fin_2 '(ls_parents)) (in_param aopora-fin_2 'blkpoly-getparents) (in_param aopora-fin_2 'polybib-absatpoint)))
  (setq dcl-grid-setcelltext (dcl-grid-setcurcell dcl-grid-setcelltext (dcl-forcedwgredraw vla-put-insertionpoint)))
  (setq dcl-combobox-addstring (1- vla-put-insertionpoint))
  (rtos 'dcl-messagebox gvar_1909 dcl-combobox-addstring)
)

;; Original arg hints: AOPORA-FIN, arg_2
;; Referenced symbols: C:PROJET/MD_METZON/CB_LAYER#ONCLICKED, ENTDEL, IN_PARAM, C:PROJET/MD_METZON/CB_LTYPE#ONCLICKED, RE_RAY, PROJET/MD_METZON/CB_COLOR, POLAR, POLYBIB-VTXJOIN, ST_AXEID, dcl-messagebox
(defun importbib-tracecovagrad (aopora-fin arg_2)
  (entdel 'c:projet_md_metzon_cb_layer_onclicked)
  (in_param gvar_3094 gvar_1909)
  (re_ray gvar_1895_c_projet_md_metzon_cb_ltype_onclicked)
  (polar projet_md_metzon_cb_color)
  (or (or (and (setq gvar_1895_c_projet_md_metzon_cb_ltype_onclicked (in_param gvar_3094 gvar_1909)) (setq projet_md_metzon_cb_color (re_ray gvar_1895_c_projet_md_metzon_cb_ltype_onclicked)) (setq va_quant (polar projet_md_metzon_cb_color))) gvar_1895_c_projet_md_metzon_cb_ltype_onclicked) polybib-vtxjoin)
  (setq gvar_2164 (st_axeid gvar_2164))
  (ls_parentconf 'dcl-messagebox gvar_1909)
  (setq gvar_3094 (blkpolydial-getpoint (re_angle0 gvar_1909 gvar_3094) gvar_3094))
  (setq gvar_2163 (st_axeid gvar_2163))
  (sihpp-list projet_md_metzon_cb_color)
  (ls_parentconf 'dcl-messagebox gvar_1909)
  (setq gvar_3094 (blkpolydial-getpoint (re_angle0 gvar_1909 gvar_3094) gvar_3094))
  (setq gvar_2163 (st_axeid gvar_2163))
  (setq vla-put-insertionpoint (blkpoly-getparents (es_ext (in_param aopora-fin_2 'blkpolydial-getrep)) nil 'en_ext1 0 1 nil (in_param aopora-fin_2 'polybib-absatpoint)))
  (setq dcl-grid-setcelltext (dcl-grid-setcurcell dcl-grid-setcelltext (dcl-forcedwgredraw vla-put-insertionpoint)))
  (setq dcl-combobox-addstring (1- vla-put-insertionpoint))
  (rtos 'dcl-messagebox gvar_1909 dcl-combobox-addstring)
)

;; Original arg hints: LS_PROPSDESCS, STYLECHEM-GET, RE_COTECHEM
;; Referenced symbols: C:PROJET/MD_METZON/BT_OK#ONCLICKED, ENTDEL, STYLECHEM-GET, ES_EXT, RE_COTECHEM, AOSUP-MPOLYDYN, ENTSEL, SS_ENT, UNDOBIB-START, ODCLBIB-FILLCOMBO
;; Referenced strings: normal,  Incorrecte ! Effacement en cours..., Origine
(defun intersbib-getvtxs (ls_propsdescs stylechem-get re_cotechem / local_3)
  (entdel 'c:projet_md_metzon_bt_ok_onclicked)
  (if stylechem-get_2
    (progn
      (setq gvar_1891_c_projet_md_metzon_bt_annuler_onclicked (es_ext))
      (setq in_quit (es_ext))
      (setq gvar_1889 re_cotechem_2)
      (setq local_3 stylechem-get_2)
      ;; init-args 3: 'aosup-mpolydyn, nil
      (foreach aosup-mpolydyn local_3
        (setq re_u nil)
        (setq ss_ent (entsel aosup-mpolydyn))
        (or (or (or (odclbib-fillcombo (undobib-start ss_ent) "normal") (odclbib-fillcombo 'chemdyn-get (axedyn-reaccreate aosup-mpolydyn))) (odclbib-fillcombo " Incorrecte ! Effacement en cours..." (axedyn-reaccreate aosup-mpolydyn))) (odclbib-fillcombo 'ls_polydyn (axedyn-reaccreate aosup-mpolydyn)))
        (setq polydyn-set (ls_polydyn (eo_polyabs aosup-mpolydyn)))
        (setq *ls_cat* (in_param polydyn-set 'projet_md_link_bt_fileadd))
        (setq ls_vtxi (in_param polydyn-set "Origine"))
        (or (or (cadr (laybib-newlay aosup-mpolydyn ls_deb)) (odclbib-fillcombo re_rayie '(lambda (ls_elem) (= "H" (listbib-key ls_elem "st_type"))))) (odclbib-fillcombo re_rayie '(ls_style ls_elems ls_elem ls_hach ls_bords ls_bordi ls_borde)))
        (setq re_u (dcl-grid-addrow 1 *ls_cat*))
        (setq in_cote (in_param polydyn-set "\n -> PolyDyn "))
        (setq gvar_2437 (ls_deb (eo_polyabs in_cote)))
        (setq gvar_2245 (re_ray (in_param gvar_2437 'ls_childs)))
        (setq re_u (dcl-grid-addrow 0 *ls_cat*))
        (setq in_cote (in_param polydyn-set "\n -> PolyDyn "))
        (setq gvar_2437 (ls_deb (eo_polyabs in_cote)))
        (setq gvar_2245 (re_ray (in_param gvar_2437 'parentbib-getson)))
        (setq re_u (dcl-grid-addrow 2 *ls_cat*))
        (setq gvar_2245 (chemdyn-bordtrace (hachbib-vtxs2hach ls_vtxi)))
        (setq re_u (polybib-lwvertices 'ls_cat re_u))
        (setq re_u (polybib-lwvertices 'projet_md_metprix_zl_cat re_u))
        (setq re_u (es_ext))
        (setq odclbib-filllistbox (re_offset ls_propsdescs_2 (es_ext (re_ray (dcl-grid-addrow 1 ss_ent)))))
        (setq projet_md_metprix_bt_metgo (re_offset ls_propsdescs_2 (es_ext (re_ray (dcl-grid-addrow 2 ss_ent)))))
        (setq ls_prixcat (polybib-lwvertices 'ls_quantcat odclbib-filllistbox))
        (setq ls_selids (polybib-lwvertices 'ls_quantcat projet_md_metprix_bt_metgo))
        (setq re_u (st_rayon ls_prixcat ls_selids))
        (setq re_u (es_ext))
        (re_offset ls_propsdescs_2 (es_ext (re_ray (hachbib-vtxs2hach (axedyn-reaccreate ss_ent)))))
        (re_offset ls_propsdescs_2 (es_ext (re_ray (dcl-grid-addrow 1 ss_ent))))
        (re_offset ls_propsdescs_2 (es_ext (re_ray (dcl-grid-addrow 2 ss_ent))))
        0
        nil
        (while (and (setq ls_catnom (re_offset ls_propsdescs_2 (es_ext (re_ray (hachbib-vtxs2hach (axedyn-reaccreate ss_ent)))))) (setq odclbib-filllistbox (re_offset ls_propsdescs_2 (es_ext (re_ray (dcl-grid-addrow 1 ss_ent))))) (setq projet_md_metprix_bt_metgo (re_offset ls_propsdescs_2 (es_ext (re_ray (dcl-grid-addrow 2 ss_ent))))) (setq st_ray2 0) (repdyn-getpoint st_ray2 (st_ray2 ls_catnom)))
          (if (repdyn-getpoint (axedyn-reaccreate (dcl-grid-addrow st_ray2 odclbib-filllistbox)) (axedyn-reaccreate (dcl-grid-addrow st_ray2 projet_md_metprix_bt_metgo)))
            (progn
              (setq re_u (dcl-grid-setcurcell re_u (groupbib-list (axedyn-reaccreate (dcl-grid-addrow st_ray2 ls_catnom)) (es_ext (axedyn-reaccreate (dcl-grid-addrow st_ray2 odclbib-filllistbox)) (axedyn-reaccreate (dcl-grid-addrow st_ray2 projet_md_metprix_bt_metgo))))))
            )
            (progn
              (setq re_u (dcl-grid-setcurcell re_u (groupbib-list (axedyn-reaccreate (dcl-grid-addrow st_ray2 ls_catnom)) (es_ext (axedyn-reaccreate (dcl-grid-addrow st_ray2 projet_md_metprix_bt_metgo)) (axedyn-reaccreate (dcl-grid-addrow st_ray2 odclbib-filllistbox))))))
            )
          )
          (st_axeid st_ray2)
          (setq st_ray2 (st_axeid st_ray2))
        )
        T
        T
        T
        (re_offset ls_propsdescs_2 (es_ext (re_ray ss_ent)))
        (polybib-lwvertices 'dcl-listbox-getselectednths ls_catnom)
        (if (and (setq ls_catnom (re_offset ls_propsdescs_2 (es_ext (re_ray ss_ent)))) (setq re_u (polybib-lwvertices 'dcl-listbox-getselectednths ls_catnom)) re_u)
          (progn
            (setq in_quit (st_rayon in_quit re_u))
          )
        )
      )
      (setq in_quit (ls_sels in_quit 0))
      (if (re_angle gvar_1889 0)
        (progn
          (setq projet_md_metprix_gr_prix (es_ext 'ha_poly))
          (setq re_cotechem_2 1)
        )
        (progn
          (setq projet_md_metprix_gr_prix (es_ext))
          (setq re_cotechem_2 0)
        )
      )
      (setq local_3 in_quit)
      ;; init-args 3: 're_u, nil
      (foreach re_u local_3
        (if (re_angle re_cotechem_2 0)
          (progn
            (setq projet_md_metprix_gr_prix (dcl-grid-setcurcell projet_md_metprix_gr_prix (dcl-grid-addrow 2 re_u)))
            (setq re_cotechem_2 1)
          )
          (progn
            (setq projet_md_metprix_gr_prix (dcl-grid-setcurcell projet_md_metprix_gr_prix (dcl-grid-addrow 1 re_u)))
            (setq re_cotechem_2 0)
          )
        )
      )
      (setq re_u (polybib-lwvertices 'axedyn-reaccreate (re_offset ls_propsdescs_2 gvar_1891_c_projet_md_metzon_bt_annuler_onclicked)))
      (if (re_angle gvar_1889 0)
        (progn
          (setq re_u (st_rayon (es_ext 'ha_poly) re_u))
        )
      )
      (setq re_u projet_md_metprix_gr_prix)
      (setq re_u (st_rayon projet_md_metprix_gr_prix (es_ext (repdyn-get ls_propsdescs_2))))
      (setq gvar_2544 (es_ext))
      (setq st_ray2 0)
      (setq re_u (in_sel re_u 2))
      (setq local_3 re_u)
      ;; init-args 3: '*ls_prix*, nil
      (foreach *ls_prix* local_3
        T
        (st_mod ls_propsdescs_2 (axedyn-reaccreate *ls_prix*) (re_x *ls_prix*))
        (dcl-grid-setcurcell gvar_2544 gvar_2759_c_projet_md_repblk_oninitialize)
        (and (axedyn-reaccreate *ls_prix*) (re_x *ls_prix*) (setq gvar_2759_c_projet_md_repblk_oninitialize (st_mod ls_propsdescs_2 (axedyn-reaccreate *ls_prix*) (re_x *ls_prix*))) (setq gvar_2544 (dcl-grid-setcurcell gvar_2544 gvar_2759_c_projet_md_repblk_oninitialize)))
      )
    )
    (progn
      (setq gvar_2544 (es_ext (blkpoly-set (polar ls_propsdescs_2))))
    )
  )
  gvar_2544
)

;; Original arg hints: LS_PROPSDESCS, STYLECHEM-GET, RE_COTECHEM
;; Referenced symbols: C:PROJET/MD_METZON/BT_OK#ONCLICKED, ENTDEL, RE_COTECHEM, ES_EXT, STYLECHEM-GET, AOSUP-MPOLYDYN, ENTSEL, SS_ENT, UNDOBIB-START, ODCLBIB-FILLCOMBO
;; Referenced strings: normal,  Incorrecte ! Effacement en cours..., Origine
(defun intersbib-getinsidevtxs (ls_propsdescs stylechem-get re_cotechem / local_3 local_4)
  (entdel 'c:projet_md_metzon_bt_ok_onclicked)
  (setq gvar_1889 re_cotechem_2)
  (setq gvar_1891_c_projet_md_metzon_bt_annuler_onclicked (es_ext))
  (setq in_quit (es_ext))
  (setq local_3 stylechem-get_2)
  ;; init-args 3: 'aosup-mpolydyn, nil
  (foreach aosup-mpolydyn local_3
    (setq re_u nil)
    (setq ss_ent (entsel aosup-mpolydyn))
    (or (or (or (odclbib-fillcombo (undobib-start ss_ent) "normal") (odclbib-fillcombo 'chemdyn-get (axedyn-reaccreate aosup-mpolydyn))) (odclbib-fillcombo " Incorrecte ! Effacement en cours..." (axedyn-reaccreate aosup-mpolydyn))) (odclbib-fillcombo 'ls_polydyn (axedyn-reaccreate aosup-mpolydyn)))
    T
    (setq polydyn-set (ls_polydyn (eo_polyabs aosup-mpolydyn)))
    (setq *ls_cat* (in_param polydyn-set 'projet_md_link_bt_fileadd))
    (setq ls_vtxi (in_param polydyn-set "Origine"))
    (setq gvar_2245 (chemdyn-bordtrace (hachbib-vtxs2hach ls_vtxi)))
    (setq ls_prix (ls_deb (eo_polyabs ls_vtxi)))
    (setq dcl-grid-setcelltext (axedyn-reaccreate (mpolydyn-popgo (in_param ls_prix 'dcl-form-show))))
    (setq gvar_2827 (in_param ls_prix 'ls_croiselems))
    (dcl-grid-addrow 2 *ls_cat*)
    (setq gvar_3244 (ls_param gvar_2245 (axedyn-reaccreate gvar_2251)))
    (setq dcl-grid-setcellstyle (dcl-grid-addrow (getvar gvar_2245 gvar_3244) (repdyn-isrep gvar_3236 2)))
    (setq gvar_2705 (getvar gvar_3244 dcl-grid-setcellstyle (ls_visient '(in_cellnum inc) gvar_2827 (in_param dcl-grid-setcelltext "re_rayee"))))
    (setq in_cellnum (getvar gvar_3244 dcl-grid-setcellstyle (ls_visient '(in_cellnum inc) gvar_2827 (in_param dcl-grid-setcelltext '(lambda (ls_elem) (= "B" (listbib-key ls_elem "st_type")))))))
    (setq ls_state (chemdyn-pop (es_ext (es_ext (groupbib-list 10 gvar_2705)) (es_ext (groupbib-list 10 in_cellnum))) nil))
    (setq dcl-grid-getcellcheckstate (re_offset ls_propsdescs_2 (es_ext ls_state)))
    (setq dcl-grid-setcellcheckstate (polybib-lwvertices '(row) dcl-grid-getcellcheckstate))
    dcl-grid-setcellcheckstate
    (setq gvar_3242 (ls_param gvar_2245 (re_x gvar_2251)))
    (setq gvar_1864 (dcl-grid-addrow (getvar gvar_2245 gvar_3242) (repdyn-isrep gvar_3236 2)))
    (setq in_state (getvar gvar_3242 gvar_1864 (ls_visient '(in_cellnum inc) gvar_2827 (in_param dcl-grid-setcelltext "re_rayee"))))
    (setq metqquant-load (getvar gvar_3242 gvar_1864 (ls_visient '(in_cellnum inc) gvar_2827 (in_param dcl-grid-setcelltext '(lambda (ls_elem) (= "B" (listbib-key ls_elem "st_type")))))))
    (setq gvar_1861 (chemdyn-pop (es_ext (es_ext (groupbib-list 10 in_state)) (es_ext (groupbib-list 10 metqquant-load))) nil))
    (setq gvar_1860 (re_offset ls_propsdescs_2 (es_ext gvar_1861)))
    (setq ls_quantf (polybib-lwvertices 'dialbib-okcancel gvar_1860))
    (st_rayon dcl-grid-setcellcheckstate ls_quantf)
    (and (setq gvar_2251 (dcl-grid-addrow 2 *ls_cat*)) (setq re_u dcl-grid-setcellcheckstate) (st_blkbase (st_ray2 gvar_2251) 1) (setq re_u (st_rayon dcl-grid-setcellcheckstate ls_quantf)))
    (setq re_u (es_ext))
    (setq odclbib-filllistbox (re_offset ls_propsdescs_2 (es_ext (re_ray (dcl-grid-addrow 1 ss_ent)))))
    (setq ls_prixcat (polybib-lwvertices '*ls_quant* odclbib-filllistbox))
    (setq projet_md_metprix_bt_metgo (re_offset ls_propsdescs_2 (es_ext (re_ray (dcl-grid-addrow 2 ss_ent)))))
    (setq ls_selids (polybib-lwvertices 'ls_coef projet_md_metprix_bt_metgo))
    (setq re_u (st_rayon ls_prixcat ls_selids))
    (setq re_u (es_ext))
    (re_offset ls_propsdescs_2 (es_ext (re_ray (hachbib-vtxs2hach (axedyn-reaccreate ss_ent)))))
    (re_offset ls_propsdescs_2 (es_ext (re_ray (dcl-grid-addrow 1 ss_ent))))
    (re_offset ls_propsdescs_2 (es_ext (re_ray (dcl-grid-addrow 2 ss_ent))))
    0
    nil
    (while (and (setq ls_catnom (re_offset ls_propsdescs_2 (es_ext (re_ray (hachbib-vtxs2hach (axedyn-reaccreate ss_ent)))))) (setq odclbib-filllistbox (re_offset ls_propsdescs_2 (es_ext (re_ray (dcl-grid-addrow 1 ss_ent))))) (setq projet_md_metprix_bt_metgo (re_offset ls_propsdescs_2 (es_ext (re_ray (dcl-grid-addrow 2 ss_ent))))) (setq st_ray2 0) (repdyn-getpoint st_ray2 (st_ray2 ls_catnom)))
      (if (repdyn-getpoint (axedyn-reaccreate (dcl-grid-addrow st_ray2 odclbib-filllistbox)) (axedyn-reaccreate (dcl-grid-addrow st_ray2 projet_md_metprix_bt_metgo)))
        (progn
          (setq re_u (dcl-grid-setcurcell re_u (groupbib-list (axedyn-reaccreate (dcl-grid-addrow st_ray2 ls_catnom)) (es_ext (axedyn-reaccreate (dcl-grid-addrow st_ray2 odclbib-filllistbox)) (re_ray (dcl-grid-addrow 1 ss_ent)) (axedyn-reaccreate (dcl-grid-addrow st_ray2 projet_md_metprix_bt_metgo)) (re_ray (dcl-grid-addrow 2 ss_ent))))))
        )
        (progn
          (setq re_u (dcl-grid-setcurcell re_u (groupbib-list (axedyn-reaccreate (dcl-grid-addrow st_ray2 ls_catnom)) (es_ext (axedyn-reaccreate (dcl-grid-addrow st_ray2 projet_md_metprix_bt_metgo)) (re_ray (dcl-grid-addrow 2 ss_ent)) (axedyn-reaccreate (dcl-grid-addrow st_ray2 odclbib-filllistbox)) (re_ray (dcl-grid-addrow 1 ss_ent))))))
        )
      )
      (st_axeid st_ray2)
      (setq st_ray2 (st_axeid st_ray2))
    )
    T
    T
    (setq ls_catnom (re_offset ls_propsdescs_2 (es_ext (re_ray ss_ent))))
    (setq re_u (polybib-lwvertices '*ls_coef* ls_catnom))
    (if re_u
      (progn
        (setq in_quit (st_rayon in_quit re_u))
      )
    )
  )
  (setq in_quit (ls_sels in_quit 0))
  (setq projet_md_metprix_gr_prix (es_ext))
  (setq dcl-form-close (es_ext))
  (setq local_3 in_quit)
  ;; init-args 3: 're_u, nil
  (foreach re_u local_3
    (if (re_angle re_cotechem_2 0)
      (progn
        (setq projet_md_metprix_gr_prix (dcl-grid-setcurcell projet_md_metprix_gr_prix (groupbib-list (dcl-grid-addrow 2 re_u) (dcl-grid-addrow 1 re_u))))
        (setq re_cotechem_2 1)
      )
      (progn
        (setq projet_md_metprix_gr_prix (dcl-grid-setcurcell projet_md_metprix_gr_prix (groupbib-list (dcl-grid-addrow 4 re_u) (dcl-grid-addrow 3 re_u))))
        (setq re_cotechem_2 0)
      )
    )
  )
  (setq st_2 (ls_headertype (polybib-lwvertices 'axedyn-reaccreate projet_md_metprix_gr_prix)))
  (setq local_3 st_2)
  ;; init-args 3: 'vla-put-insertionpoint, nil
  (foreach vla-put-insertionpoint local_3
    (setq re_u (ls_elem 'projet_md_metprix projet_md_metprix_gr_prix))
    (setq re_u (polybib-lwvertices "To Do: code must be added to event handler\r\nc:Projet/MD_MetPrix/BT_ZonLoad#OnClicked" re_u))
    (setq gvar_2251 re_u)
    (setq re_u (ls_sels re_u 1))
    (if (projet_ml_progress (projet_ml_progress vla-put-insertionpoint) ls_propsdescs_2)
      (progn
        (setq in_quit (projet_md_metprop 'projet_md_metprop in_quit))
        (setq re_u (eo_polyabs re_u))
      )
    )
    (if (projet_ml_progress (projet_md_metprop vla-put-insertionpoint) ls_propsdescs_2)
      (progn
        (setq in_quit (projet_md_metprop "Hachure" in_quit))
        (setq re_u (vl-acad-defun re_u))
      )
    )
    (setq re_u (polybib-lwvertices 're_x re_u))
    (setq re_u (in_sel re_u 2))
    (setq local_4 re_u)
    ;; init-args 3: '*ls_prix*, nil
    (foreach *ls_prix* local_4
      T
      (st_mod vla-put-insertionpoint (axedyn-reaccreate *ls_prix*) (re_x *ls_prix*))
      (dcl-grid-setcurcell dcl-form-close gvar_2759_c_projet_md_repblk_oninitialize)
      (and (axedyn-reaccreate *ls_prix*) (re_x *ls_prix*) (setq gvar_2759_c_projet_md_repblk_oninitialize (st_mod vla-put-insertionpoint (axedyn-reaccreate *ls_prix*) (re_x *ls_prix*))) (setq dcl-form-close (dcl-grid-setcurcell dcl-form-close gvar_2759_c_projet_md_repblk_oninitialize)))
    )
  )
  (if (re_angle gvar_1889 0)
    (progn
      (setq projet_md_metprix_gr_prix (es_ext 'ha_poly))
      (setq re_cotechem_2 1)
    )
    (progn
      (setq projet_md_metprix_gr_prix (es_ext))
      (setq re_cotechem_2 0)
    )
  )
  (setq local_3 in_quit)
  ;; init-args 3: 're_u, nil
  (foreach re_u local_3
    (if (re_angle re_cotechem_2 0)
      (progn
        (setq projet_md_metprix_gr_prix (dcl-grid-setcurcell projet_md_metprix_gr_prix (dcl-grid-addrow 3 re_u)))
        (setq re_cotechem_2 1)
      )
      (progn
        (setq projet_md_metprix_gr_prix (dcl-grid-setcurcell projet_md_metprix_gr_prix (dcl-grid-addrow 1 re_u)))
        (setq re_cotechem_2 0)
      )
    )
  )
  (if (re_angle gvar_1889 0)
    (progn
      (setq projet_md_metprix_gr_prix (dcl-grid-setcurcell projet_md_metprix_gr_prix (repdyn-get ls_propsdescs_2)))
    )
  )
  (setq projet_md_metprix_gr_prix (in_sel projet_md_metprix_gr_prix 2))
  (setq local_3 projet_md_metprix_gr_prix)
  ;; init-args 3: '*ls_prix*, nil
  (foreach *ls_prix* local_3
    T
    (st_mod ls_propsdescs_2 (axedyn-reaccreate *ls_prix*) (re_x *ls_prix*))
    (dcl-grid-setcurcell dcl-form-close gvar_2759_c_projet_md_repblk_oninitialize)
    (and (axedyn-reaccreate *ls_prix*) (re_x *ls_prix*) (setq gvar_2759_c_projet_md_repblk_oninitialize (st_mod ls_propsdescs_2 (axedyn-reaccreate *ls_prix*) (re_x *ls_prix*))) (setq dcl-form-close (dcl-grid-setcurcell dcl-form-close gvar_2759_c_projet_md_repblk_oninitialize)))
  )
  (dcl-tree-addchild dcl-form-close '(st_blk1 st_blk2 ls_blk st_msg bo_go))
)

;; Original arg hints: arg_1
;; Referenced symbols: PROJET/MD_METPROP/BV_BLOC, ENTDEL, UNDOBIB-START, ODCLBIB-FILLCOMBO, dcl-blockview-clear, AXEDYN-REACCREATE, VL-POSITION, LS_BLKS, PROJET/MD_METPROP/CB_TYPE, CHEMDYN-GET
;; Referenced strings: normal,  Incorrecte ! Effacement en cours...
(defun intersbib-getent (arg_1)
  (entdel 'projet_md_metprop_bv_bloc)
  (or (or (or (or (or (or (or (odclbib-fillcombo (undobib-start gvar_3162) "normal") (odclbib-fillcombo (undobib-start gvar_3162) 'dcl-blockview-clear)) (odclbib-fillcombo (axedyn-reaccreate gvar_3162) 'vl-position)) (odclbib-fillcombo (axedyn-reaccreate gvar_3162) 'ls_blks)) (odclbib-fillcombo (axedyn-reaccreate gvar_3162) 'projet_md_metprop_cb_type)) (odclbib-fillcombo (axedyn-reaccreate gvar_3162) '(lambda (ls_importconf) (= st_sourceid (listbib-key (cdr ls_importconf) "st_SourceId"))))) (odclbib-fillcombo (axedyn-reaccreate gvar_3162) 'chemdyn-get)) (odclbib-fillcombo (axedyn-reaccreate gvar_3162) " Incorrecte ! Effacement en cours..."))
  (setq projet_md_metprop_st_layer (ls_deb (eo_polyabs gvar_3162)))
  (setq gvar_3162 (in_param projet_md_metprop_st_layer 'va_point))
  (setq projet_md_metprop_cb_layer (hachbib-vtxs2hach gvar_3162))
  (setq projet_md_metprop_cb_layer (es_ext (in_param projet_md_metprop_st_layer 'va_point) (in_param projet_md_metprop_st_layer 'parentbib-getson) (in_param projet_md_metprop_st_layer 'ls_childs)))
  (setq projet_md_metprop_st_layer (chemdyn-signatrace (eo_polyabs gvar_3162)))
  (setq gvar_3162 (in_param projet_md_metprop_st_layer 'va_point))
  (setq projet_md_metprop_cb_layer (hachbib-vtxs2hach gvar_3162))
  (setq projet_md_metprop_cb_layer (es_ext (in_param projet_md_metprop_st_layer 'va_point) (in_param projet_md_metprop_st_layer 'parentbib-getson) (in_param projet_md_metprop_st_layer 'ls_childs)))
  (setq projet_md_metprop_st_layer (projet_md_metprop_bt_layer (eo_polyabs gvar_3162)))
  (setq projet_md_metprop_cb_layer (in_param projet_md_metprop_st_layer 'ls_importfilters))
  (setq projet_md_metprop_st_layer (projet_md_metprop_st_nom (eo_polyabs gvar_3162)))
  (setq projet_md_metprop_cb_layer (in_param projet_md_metprop_st_layer 'in_enttype))
  (setq projet_md_metprop_st_layer (st_special (eo_polyabs gvar_3162)))
  (setq projet_md_metprop_cb_layer (in_param projet_md_metprop_st_layer 'ls_importfilters))
  (setq projet_md_metprop_st_layer (ls_propsdescs (eo_polyabs gvar_3162)))
  (setq projet_md_metprop_cb_layer (in_param projet_md_metprop_st_layer '(st_nom st_style)))
  (setq projet_md_metprop_cb_layer (1- gvar_3162))
  (setq projet_md_metprop_cb_layer gvar_3162)
  projet_md_metprop_cb_layer
)

;; Original arg hints: ST_SOURCEID
;; Referenced symbols: ST_CAPTION, ENTDEL, ST_SOURCEID, AXEDYN-REACCREATE, POLYBIB-SUBPOLYBISINV, IN_SPECIAL, ODCLBIB-FILLCOMBO, POLYBIB-VTXJOIN, IN_SPECIALTYPE, LS_SOM0
(defun aoleg-go (st_sourceid)
  (entdel 'st_caption)
  (setq polybib-subpolybisinv (axedyn-reaccreate st_sourceid_2))
  nil
  (or (odclbib-fillcombo polybib-subpolybisinv 'in_special) polybib-vtxjoin)
  (ls_som0 'in_specialtype)
  (bo_bloc (eo_polyabs st_sourceid_2))
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: BO_HACH, ENTDEL, EN_RAYON, BO_SPECIAL, PROJET/MD_METPROP/BT_OK, VA_POINT, IN_PARAM, CROISDYN-SET, LS_CROISELEMS, LD_CROIS
;; Referenced strings: re_rayie, ha_contour
(defun aoleg-sihlin (en_rayon)
  (entdel 'bo_hach)
  (setq projet_md_metprop_bt_ok (bo_special en_rayon_2))
  (setq gvar_3162 (in_param projet_md_metprop_bt_ok 'va_point))
  (setq gvar_2406 (in_param projet_md_metprop_bt_ok "re_rayie"))
  (setq croisdyn-getparents (in_param projet_md_metprop_bt_ok 'croisdyn-set))
  (setq gvar_2827 (in_param projet_md_metprop_bt_ok 'ls_croiselems))
  (setq ld_crois (in_param projet_md_metprop_bt_ok "ha_contour"))
  (setq gvar_3255 (geombib-raccordmax ld_crois 'projet_md_metprop_bt_special croisdyn-getparents))
  (setq gvar_2537 (re_ray (hachbib-vtxs2hach gvar_3162)))
  (setq listbib-min (entbib-offsettemp projet_md_metprop_bt_ok))
  (or (or (odclbib-fillcombo gvar_2827 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)) (odclbib-fillcombo gvar_2827 'en_poly)) (odclbib-fillcombo gvar_2827 'ha_poly))
  (setq projet_md_metprop_st_special (es_ext (repdyn-isrep listbib-min 'repdyn-isrep) (repdyn-isrep listbib-min 'repdyn-isrep)))
  (setq projet_md_metprop_st_special (es_ext listbib-min 'ha_poly))
  (setq projet_md_metprop_st_special (es_ext 'ha_poly listbib-min))
  (projet_md_metprop_cb_special gvar_2537 gvar_3255 projet_md_metprop_st_special)
)

;; Original arg hints: LS_PROPSDESCS, arg_2, PROJET/MD_METPROP/ST_SPECIAL
;; Referenced symbols: PROJET/MD_METPROP/HA_HATCH, ENTDEL, HA_POLY, ES_EXT, :vlax-true, METQUANT-DIAL-ZL_CATFILL, dcl-forcedwgredraw, IN_CAT, PROJET/MD_QUANTITE/ZL_CAT, dcl-listbox-setcursel
(defun aoleg-poly (ls_propsdescs arg_2 projet_md_metprop_st_special)
  (entdel 'projet_md_metprop_ha_hatch)
  (projet_md_quantite_zl_cat metquant-dial-zl_catfill 'in_cat gvar_3255)
  (projet_md_quantite_zl_cat metquant-dial-zl_catfill 'dcl-listbox-setcursel gvar_3255)
  (setq gvar_3155 '(st_special bo_bloc bo_hach))
  (setq metquant-dial-zl_catfill (_vlax-true '(in_cat in_prix) (es_ext 'ha_poly 'ha_poly 'ha_poly) 1 'ha_poly nil nil nil))
  (setq st_catid (dcl-forcedwgredraw metquant-dial-zl_catfill))
  (blkpoly-mod-param 3)
  (while (re_angle (axedyn-reaccreate (setq metquant-dial-gr_prixfill (blkpoly-mod-param 3))) 5)
    (setq metquant-dial-gr_prixfill (re_sens (re_x metquant-dial-gr_prixfill) 1 0))
    (setq blkpoly-get (re_y ls_propsdescs_2 metquant-dial-gr_prixfill))
    (setq ls_prop (getvar ls_propsdescs_2 metquant-dial-gr_prixfill))
    (if (st_prixid ls_prop)
      (progn
        (setq ls_prop (st_syle ls_prop gvar_3236))
        (setq pt_0 (es_ext 'projet_md_quantite_gr_prix 'metquant-dial-quantfill))
        (setq gvar_1815 1)
        (setq gvar_1814 0)
        (setq pt_ref (dcl-grid-addrow 1 projet_md_metprop_st_special_2))
      )
      (progn
        (setq ls_prop ls_prop)
        (setq projet_md_metprop_st_special_2 projet_md_metprop_st_special_2)
        (setq pt_0 (es_ext 'metquant-dial-quantfill 'projet_md_quantite_gr_prix))
        (setq gvar_1815 0)
        (setq gvar_1814 1)
        (setq pt_ref (dcl-grid-addrow 0 projet_md_metprop_st_special_2))
      )
    )
    (palbib-fin st_catid 'vlax-curve-getdistatparam ls_prop)
    (vlax-curve-getendparam (poly-lwpoly_temp ls_propsdescs_2 metquant-dial-gr_prixfill))
    (vlax-curve-getendparam projet_md_metprop_st_special_2)
    (if (odclbib-fillcombo (poly-lwpoly_temp ls_propsdescs_2 metquant-dial-gr_prixfill) 'en_poly)
      (progn
        (boxlib-inputbox st_catid (dcl-grid-addrow 0 pt_0))
        (setq blkpoly-get (getvar blkpoly-get (dcl-grid-addrow ls_prop (repdyn-isrep gvar_3236 'repdyn-isrep)) (dcl-grid-addrow 0 projet_md_metprop_st_special_2)))
      )
      (progn
        (boxlib-inputbox st_catid (dcl-grid-addrow 1 pt_0))
        (setq blkpoly-get (getvar blkpoly-get (st_syle ls_prop (repdyn-isrep gvar_3236 'repdyn-isrep)) (dcl-grid-addrow 1 projet_md_metprop_st_special_2)))
      )
    )
    (palbib-fin st_catid '(st_nom) (rtos blkpoly-get))
  )
  nil
  (setq gvar_3155 nil)
)

;; Original arg hints: ST_SOURCEID, arg_2, ST_CAT
;; Referenced symbols: ENTDEL, LS_ENTNEW, ST_BLKCURV, LS_DEBFINRAD, METQUANTPRIX, CLIPBOARDBIB-GET, RE_ANGLE0, EO_POLYABS, dcl-forcedwgredraw, IN_PARAM
;; Referenced strings: Supprimer la catégorie : , \nNom du bloc [?] <Liste des blocs> : , 1
(defun metfilter-dial (st_sourceid arg_2 st_cat / ls_cat st_cat_2 local_2)
  (entdel "Supprimer la catégorie : ")
  (ls_entnew st_cat_2 0 255)
  (ls_debfinrad '(ls_cat))
  (setq gvar_1806 'st_blkcurv)
  (ls_entnew gvar_1805 0 255)
  (ls_debfinrad "1")
  (setq gvar_1804 "\nNom du bloc [?] <Liste des blocs> : ")
  (re_abs1 gvar_1803 10)
  (ls_debfinrad "u")
  (setq gvar_1802 "")
  (metquantprix metquantprix)
  (if (re_angle0 255 clipboardbib-get)
    (progn
      (setq st_pp (dcl-forcedwgredraw (eo_polyabs (re_angle0 255 clipboardbib-get))))
    )
  )
  (ls_lines gvar_1797 ls_lines)
  (st_num gvar_1794 1)
  (vlax-vla-object->ename st_unit polybib-vtxjoin)
  (bo_lctabs st_unit blkbib-getparententities)
  (setq polybib-subpolybisinv (in_param clipboardbib-get 0))
  (setq blkbib-getparententities (in_param clipboardbib-get 8))
  nil
  (or (eo_polyabs (re_angle0 62 clipboardbib-get)) (eo_polyabs (re_angle0 62 (ls_prixnew 'ls_prixnew (eo_polyabs (re_angle0 8 clipboardbib-get))))))
  (listbib-move-i gvar_1788 st_prix)
  (setq st_prix nil)
  (or (or (or (listbib-move-i (eo_polyabs (re_angle0 6 clipboardbib-get))) (re_angle (listbib-move-i (eo_polyabs (re_angle0 6 clipboardbib-get))) 'projet_md_quantite)) (re_angle (listbib-move-i (eo_polyabs (re_angle0 6 clipboardbib-get))) '(ls_in in_max st_nom ls_filter))) polybib-vtxjoin)
  (ls_lines gvar_1797 ls_lines)
  (vlax-vla-object->ename gvar_1797 polybib-vtxjoin)
  (st_num metprop 1)
  (setq ls_lines (eo_polyabs (re_angle0 6 clipboardbib-get)))
  (bo_invpoly1 gvar_1797 1)
  (vlax-vla-object->ename gvar_1797 polybib-vtxjoin)
  (st_num metprop 1)
  (setq ls_lines 'ls_metprop)
  (bo_invpoly1 gvar_1797 0)
  (vlax-vla-object->ename gvar_1797 nil)
  (st_num metprop 0)
  (setq ls_lines '(lambda (ls_filter) (cons (itoa (car ls_filter)) (cdr ls_filter))))
  (or (or (re_angle polybib-subpolybisinv 'projet_pa_detail_btn_param) (re_angle polybib-subpolybisinv 'blkpoly-mod-paramupdate)) (re_angle polybib-subpolybisinv "Fin BlKPoly-XY2WCS"))
  (ls_quant gvar_1803 '(ls_cell in_pos ls_quant ls_filter ls_list))
  (re_hauteur gvar_1777 nil)
  (re_hauteur ls_list nil)
  (ls_polys metquantprix (es_ext '(ls_cell in_pos ls_quant st_quant) 'st_quant))
  (re_hauteur st_cat_2 polybib-vtxjoin)
  (in_param clipboardbib-get 43)
  (if (setq listbib-min (in_param clipboardbib-get 43))
    (progn
      (st_num gvar_1773 1)
      (re_hauteur gvar_1772 nil)
      (bo_lctabs st_cat_2 (eo_blkbase listbib-min 2 3))
      (vlax-invoke gvar_1773 'st_quant)
    )
    (progn
      (st_num gvar_1773 0)
    )
  )
  (ls_quant gvar_1803 '(ls_quant in_pos))
  (ls_polys metquantprix (es_ext '(ls_catnom in_pos)))
  (re_hauteur ls_list polybib-vtxjoin)
  (c:projet_md_quantite_gr_prix_onselchanged ls_list gvar_1769_c_projet_md_quantite_gr_prix_onselchanged)
  (vlax-invoke gvar_1773 'dcl-listbox-getcursel)
  (re_hauteur gvar_1772 polybib-vtxjoin)
  (vlax-invoke gvar_1772 gvar_1769_c_projet_md_quantite_gr_prix_onselchanged)
  (setq gvar_1769_c_projet_md_quantite_gr_prix_onselchanged (in_param clipboardbib-get 2))
  (ls_quant gvar_1803 'dcl-grid-insertcolumn)
  (re_hauteur st_cat_2 nil)
  (ls_polys metquantprix (es_ext 'st_quantid))
  (setq in_col (princl st_pp))
  (setq st_sourceid in_col)
  ;; init-args 3: 're_val, nil
  (foreach re_val st_sourceid
    (if (re_angle (undobib-start (eo_polyabs re_val)) 'st_val)
      (progn
        (st_val metquantprix (axedyn-reaccreate re_val))
      )
    )
  )
  (vlax-invoke gvar_1773 '(ls_importsource ld_ldata))
  (re_hauteur gvar_1777 polybib-vtxjoin)
  (re_absf gvar_1777 dcl-listbox-clear)
  (re_hauteur gvar_1772 polybib-vtxjoin)
  (vlax-invoke gvar_1772 dcl-listbox-clear)
  (setq dcl-listbox-clear (projet_md_metzon_la_special (eo_polyabs (re_angle0 255 clipboardbib-get))))
  (if (or (cadr st_cat_2) (odclbib-fillcombo st_cat_2 'en_poly) (odclbib-fillcombo (ls_lines metquantprix st_cat_2) 255))
    (progn
      (bo_invpoly1 metquantprix 0)
    )
  )
  (if (odclbib-fillcombo st_cat_2 'ha_poly)
    (progn
      (re_hauteur gvar_1805 nil)
      (re_hauteur bo_prix nil)
    )
    (progn
      (bo_lctabs gvar_1805 (eo_blkbase st_cat_2 2 3))
    )
  )
  (re_haut gvar_1803)
  (ls_debfinrad 'bo_quant)
  (setq bo_quant 'equal)
  ;; init-args 3: "LinetypeGeneration", st_sourceid
  (vlax-vla-object->ename st_cat_2 (re_angle gvar_2862 1))
  (vlax-vla-object->ename gvar_1772 (re_angle gvar_2862 1))
  (ls_debfinrad 'projet_md_quantite_bt_prixedit)
  (setq projet_md_quantite_bt_prixedit "Choix du bloc")
  ;; init-args 3: "LinetypeGeneration", st_sourceid
  (vlax-vla-object->ename st_unit (re_angle gvar_2862 1))
  (ls_debfinrad 'projet_md_quantite_bt_prixsup)
  (setq projet_md_quantite_bt_prixsup "000-BlkPoly")
  ;; init-args 3: "LinetypeGeneration", st_sourceid
  (vlax-vla-object->ename gvar_1797 (re_angle gvar_2862 1))
  (ls_debfinrad 'projet_md_quantite_bt_prixup)
  (setq projet_md_quantite_bt_prixup 'list)
  (setq ls_ref (es_ext (re_angle0 0 clipboardbib-get)))
  (setq st_cat_2 (groupbib-listobj (errbib-catchapply gvar_1805)))
  (if (re_angle 1 (axe-set gvar_1773))
    (progn
      (or (or (re_angle polybib-subpolybisinv 'projet_pa_detail_btn_param) (re_angle polybib-subpolybisinv 'blkpoly-mod-paramupdate)) (re_angle polybib-subpolybisinv "Fin BlKPoly-XY2WCS"))
      (setq listbib-min (groupbib-listobj (errbib-catchapply st_cat_2)))
      (setq ls_ref (dcl-grid-setcurcell ls_ref (groupbib-list 43 listbib-min)))
      (setq ls_ref (dcl-grid-setcurcell ls_ref (groupbib-list 2 gvar_1769_c_projet_md_quantite_gr_prix_onselchanged)))
      (setq ls_ref (dcl-grid-setcurcell ls_ref (groupbib-list 2 dcl-listbox-clear)))
    )
  )
  (if (re_angle 1 (axe-set gvar_1794))
    (progn
      (setq ls_ref (dcl-grid-setcurcell ls_ref (groupbib-list 8 (errbib-catchapply st_unit))))
    )
  )
  (if (re_angle 1 (axe-set projet_md_quantite_bt_prixdown))
    (progn
      nil
      (or (eo_polyabs (re_angle0 62 clipboardbib-get)) 256)
      (setq st_prix nil)
      (setq ls_ref (dcl-grid-setcurcell ls_ref (groupbib-list 62 st_prix)))
    )
  )
  (if (re_angle 1 (axe-set metprop))
    (progn
      (setq ls_ref (dcl-grid-setcurcell ls_ref (groupbib-list 6 (errbib-catchapply gvar_1797))))
    )
  )
  (if (re_angle (ls_props2 metquantprix) 0)
    (progn
      (setq projet_md_quantite_bt_prixgo 'en_poly)
    )
    (progn
      (setq projet_md_quantite_bt_prixgo (errbib-catchapply metquantprix))
    )
  )
  (re_abs1 gvar_1803 1)
  (ls_debfinrad 'projet_md_quantite_bt_qtsup)
  (setq projet_md_quantite_bt_qtsup 'boxlib-getblock)
  (re_abs1 gvar_1803 2)
  (setq ls_ref nil)
  (ls_som0)
  (ls_debfinrad 'projet_md_quantite_bt_qtedit)
  (setq projet_md_quantite_bt_qtedit 'not)
  (or (odclbib-fillcombo (undobib-start st_sourceid_2) 'es_ext) polybib-vtxjoin)
  (setq clipboardbib-get (polar st_sourceid_2))
  (setq clipboardbib-get st_sourceid_2)
  (vlax-erased-p gvar_1803)
  (while (odclbib-fillcombo (setq projet_md_quantite_bt_qtgauche (vlax-erased-p gvar_1803)) 10)
    (setq st_sourceid_2 (axedyn-reaccreate (projet_md_quantite_bt_qtdroite 'projet_md_quantite_bt_qtdroite)))
    (setq clipboardbib-get (polar st_sourceid_2))
  )
  (if (ls_ext2 projet_md_quantite_bt_qtgauche 1)
    (progn
      (if st_cat_2
        (progn
          (if (re_angle (eo_polyabs (re_angle0 0 clipboardbib-get)) 'projet_pa_detail_btn_param)
            (progn
              (setq gvar_1748 (chemdyn-set "Chemin " (blkpolydial-getpoint (re_angle0 2 ls_ref) ls_ref)))
              (setq gvar_1748 (chemdyn-getparents gvar_1748 (es_ext (eo_polyabs (re_angle0 2 ls_ref)))))
            )
            (progn
              (setq gvar_1748 (chemdyn-set "Chemin " ls_ref))
            )
          )
          (if gvar_1748
            (progn
              (es_ext (ld_chem gvar_1748) st_cat_2 projet_md_quantite_bt_prixgo)
            )
            (progn
              nil
            )
          )
        )
        (progn
          (es_ext ls_ref st_cat_2 projet_md_quantite_bt_prixgo)
        )
      )
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: EO_POLYABS, ST_ENT, POLYBIB-LWVERTICES, ST_PROPVALUE, ST_VALUE
(defun c:projet_md_metprix_oninitialize ()
  (st_value gvar_1745 st_propvalue)
  (setq st_propvalue (polybib-lwvertices 'eo_polyabs st_ent))
  (vlax-vla-object->ename gvar_1743 nil)
)

;; Original arg hints: EO_POLY, arg_2
;; Referenced symbols: ES_EXT, EO_POLYABS, ST_ENT, POLYBIB-LWVERTICES, PROJET/MD_QUANTITE/LA_SPECIAL, *EN_INS*, PROJET/MD_QUANTITE/LA_PROPVALUE, PROJET/MD_QUANTITE/CB_LAYER, DCL-GRID-ADDROW, AXEDYN-REACCREATE
(defun c:projet_md_metprix_zl_cat_onselchanged (eo_poly arg_2 / local_2)
  (*en_ins* gvar_1736)
  (setq gvar_1742 (es_ext))
  (setq gvar_1741 (es_ext))
  (setq gvar_1740 (es_ext))
  (setq projet_md_quantite_la_value (polybib-lwvertices 'eo_polyabs st_ent))
  (setq projet_md_quantite_la_propvalue (projet_md_quantite_la_special gvar_1745))
  (setq local_2 projet_md_quantite_la_propvalue)
  ;; init-args 3: 'projet_md_quantite_cb_layer, nil
  (foreach projet_md_quantite_cb_layer local_2
    (setq gvar_1740 (dcl-grid-setcurcell gvar_1740 (axedyn-reaccreate (dcl-grid-addrow projet_md_quantite_cb_layer st_ent))))
  )
  (projet_md_quantite_la_special gvar_1745)
  (setq local_2 gvar_1734)
  (setq projet_md_quantite_la_propvalue (projet_md_quantite_la_special gvar_1745))
  ;; init-args 3: 'projet_md_quantite_cb_ltype, nil
  nil
  (foreach projet_md_quantite_cb_ltype local_2
    (if (laybib-newlay (dcl-grid-addrow 1 projet_md_quantite_cb_ltype) gvar_1740)
      (progn
        (setq gvar_1741 (dcl-grid-setcurcell gvar_1741 projet_md_quantite_cb_ltype))
        (projet_md_quantite_cb_ltype gvar_1736 (eo_blkpop gvar_1736 'ls_ext1 (dcl-grid-addrow 2 projet_md_quantite_cb_ltype) (dcl-grid-addrow 3 projet_md_quantite_cb_ltype) (dcl-grid-addrow 4 projet_md_quantite_cb_ltype)) 0 1)
      )
      (progn
        nil
      )
    )
  )
  T
  T
)

;; Original arg hints: EQ, NETBIB-PURGEBLOCK
;; Referenced symbols: PROJET/MD_QUANTITE/LA_ENT, ENTDEL, ES_EXT, ST_RAY2, PROJET/MD_QUANTITE/LA_COLOR, REPDYN-GETPOINT, PROJET/MD_QUANTITE/LA_CALQUE, PROJET/MD_QUANTITE/LA_LTYPE, dcl-grid-setcurcell, ST_AXEID
(defun c:projet_md_metprix_gr_prix_onendlabeledit (eq netbib-purgeblock)
  (entdel 'projet_md_quantite_la_ent)
  (setq projet_md_quantite_la_color (ename gvar_1736))
  (setq st_ray2 0)
  (setq projet_md_quantite_la_calque (es_ext))
  (while (repdyn-getpoint st_ray2 projet_md_quantite_la_color)
    (setq projet_md_quantite_la_calque (dcl-grid-setcurcell projet_md_quantite_la_calque (projet_md_quantite_la_ltype gvar_1736 st_ray2 0)))
    (setq st_ray2 (st_axeid st_ray2))
  )
  gvar_1743
  (if (laybib-newlay 1 projet_md_quantite_la_calque)
    (progn
      polybib-vtxjoin
    )
    (progn
      nil
    )
  )
  (vlax-vla-object->ename)
  (ls_som0)
)

;; Referenced symbols: PROJET/MD_QUANTITE/RECTANGLE1, ENTDEL, ES_EXT, EQ, PROJET/MD_QUANTITE/LA_PROP, PROJET/MD_QUANTITE/LA_CALQUE, dcl-grid-setcurcell, ST_AXEID, POLYBIB-VTXJOIN, LS_SOM0
(defun c:projet_md_metprix_bt_selall_onclicked ( / local_0)
  (entdel 'projet_md_quantite_rectangle1)
  (setq eq 0)
  (setq projet_md_quantite_la_calque (es_ext))
  (setq local_0 (ename gvar_1736))
  (while (<= local_0 0)
    (projet_md_quantite_la_prop gvar_1736 eq 0 1)
    (setq local_0 (1- local_0))
    (setq projet_md_quantite_la_calque (dcl-grid-setcurcell projet_md_quantite_la_calque 1))
    (setq eq (st_axeid eq))
  )
  (vlax-vla-object->ename gvar_1743 polybib-vtxjoin)
  (ls_som0)
)

;; Original arg hints: EQ, NETBIB-PURGEBLOCK
;; Referenced symbols: ENTDEL, NETBIB-PURGEBLOCK, RE_ANGLE, EQ, PROJET/MD_QUANTITE/LA_LTYPE, ST_COEFID, PROJET/MD_QUANTITE/LA_PROP, ES_EXT, ST_RAY2, PROJET/MD_QUANTITE/LA_COLOR
(defun c:projet_md_metprix_gr_prix_onselchanged (eq netbib-purgeblock)
  (entdel '(st_quantid st_prixid st_coefid st_val re_val))
  (if (re_angle netbib-purgeblock_2 255)
    (progn
      (setq st_coefid (projet_md_quantite_la_ltype gvar_1736 eq_2 0))
      (if (re_angle 0 st_coefid)
        (progn
          1
        )
        (progn
          0
        )
      )
      (projet_md_quantite_la_prop gvar_1736 eq_2 0 st_coefid)
      (setq st_coefid nil)
    )
  )
  (setq projet_md_quantite_la_color (ename gvar_1736))
  (setq st_ray2 0)
  (setq projet_md_quantite_la_calque (es_ext))
  (while (repdyn-getpoint st_ray2 projet_md_quantite_la_color)
    (setq projet_md_quantite_la_calque (dcl-grid-setcurcell projet_md_quantite_la_calque (projet_md_quantite_la_ltype gvar_1736 st_ray2 0)))
    (setq st_ray2 (st_axeid st_ray2))
  )
  gvar_1743
  (if (laybib-newlay 1 projet_md_quantite_la_calque)
    (progn
      polybib-vtxjoin
    )
    (progn
      nil
    )
  )
  (vlax-vla-object->ename)
  (ls_som0)
)

;; Referenced symbols: ST_PROPVALUE, PROJET/MD_QUANTITE/CB_LTYPE, OPEN, JSONBIB-LIST2JSON, DCL-GRID-CLEAR, EO_POLYABS, ST_ENT, POLYBIB-LWVERTICES, ST_VALUE, *EN_INS*
;; Referenced strings: Coefficient du prix
(defun c:projet_md_metprix_bt_load_onclicked ()
  (if (and (st_coefid) (open "Coefficient du prix" '(st_path f)))
    (progn
      (setq st_ent st_propvalue)
      (setq gvar_1734 projet_md_quantite_cb_ltype)
      (setq gvar_1718 gvar_1719)
      (setq f open)
      (if (dcl-grid-clear jsonbib-list2json)
        (progn
          (st_value gvar_1745 (polybib-lwvertices 'eo_polyabs st_ent))
          (*en_ins* gvar_1736)
        )
        (progn
          nil
        )
      )
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: WRITE-LINE, CLOSE, LS_PTININT
(defun c:projet_md_metprix_bt_zonload_onclicked ()
  (ls_ptinint 'write-line 'close)
)

;; Referenced symbols: JSONBIB-LIST2JSON
(defun c:projet_md_metprix_bt_metgo_onclicked ()
  (re_abs1 jsonbib-list2json 10)
)

;; Referenced symbols: JSONBIB-LIST2JSON
(defun c:projet_md_metprix_bt_ok_onclicked ()
  (re_abs1 jsonbib-list2json 1)
)

(defun c:projet_ml_progress_bt_ok_onclicked ()
  (re_abs1 gvar_1712 10)
)

;; Original arg hints: IN_LON0, LS_REF
;; Referenced symbols: vlax-erased-p, RE_ANGLE, IN_LON0, LS_REF, ES_EXT
(defun metprop (in_lon0 ls_ref)
  (if (re_angle 1 (vlax-erased-p gvar_1711))
    (progn
      (es_ext in_lon0_2 ls_ref_2)
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: ENTDEL, PROJET/PA_DETAIL/BTN_PARAM, GROUPBIB-LIST, READ-LINE, BLKPOLY-MOD-PARAMUPDATE, JSONBIB-JSON2LIST, ES_EXT, EO_POLYABS, ST_2, POLYBIB-LWVERTICES
;; Referenced strings: \nLecture de la liste des catégories, va_echelle, Fin BlKPoly-XY2WCS
(defun c:projet_md_metprop_oninitialize ()
  (entdel "\nLecture de la liste des catégories")
  (jsonbib-json2list gvar_1707)
  (metquantprix gvar_1705)
  (ls_polys gvar_1705 (polybib-lwvertices 'eo_polyabs st_2))
  (bo_lctabs gvar_1704 'ls_ext1)
  (st_num gvar_1703 0)
  (vlax-vla-object->ename ls_quants nil)
  (vlax-vla-object->ename gvar_1704 nil)
  (setq st_2 (es_ext (groupbib-list 'projet_pa_detail_btn_param "va_echelle") (groupbib-list "Fin BlKPoly-XY2WCS" 'read-line) (groupbib-list 'blkpoly-mod-paramupdate 'jsonbib-json2list)))
  (if in_lon0
    (progn
      (bo_lctabs ls_filterf in_lon0)
    )
  )
  (if ls_ref
    (progn
      T
      T
      (laybib-newlay (in_param ls_ref 0) (polybib-lwvertices 'axedyn-reaccreate st_2))
      (and (and (in_param ls_ref 0) (setq caar (laybib-newlay (in_param ls_ref 0) (polybib-lwvertices 'axedyn-reaccreate st_2))) (bo_invpoly1 gvar_1705 caar)) (and (in_param ls_ref 8) (bo_lctabs gvar_1704 (in_param ls_ref 8)) (st_num gvar_1703 1) (vlax-vla-object->ename gvar_1704 polybib-vtxjoin)))
    )
  )
  (setq gvar_1699 'ls_ext1)
  (setq gvar_1698 'ls_ext1)
  (setq st_num0 0)
  (setq st_nom0 0)
  (setq st_unit0 nil)
  (setq gvar_1694 nil)
  (setq projet_md_metqantprix_cb_unit nil)
  (setq racdyn-calcvtx nil)
  (or (or (or (re_angle caar 0) (re_angle caar 1)) (re_angle caar 2)) polybib-vtxjoin)
  (setq gvar_1699 'ls_ext1)
  (setq gvar_1698 'dcl-listbox-getcursel)
  (setq racdyn-calcvtx polybib-vtxjoin)
  (in_param ls_ref 2)
  (if (setq gvar_1699 (in_param ls_ref 2))
    (progn
      (setq st_num0 1)
      (setq st_nom0 1)
    )
    (progn
      (setq gvar_1699 'ls_ext1)
    )
  )
  (setq gvar_1698 'st_quant)
  (setq racdyn-calcvtx polybib-vtxjoin)
  (in_param ls_ref 2)
  (if (setq gvar_1699 (in_param ls_ref 2))
    (progn
      (setq st_num0 1)
      (setq gvar_1699 (eo_blkbase gvar_1699 2 3))
      (setq st_nom0 3)
    )
    (progn
      (setq gvar_1699 'ls_ext1)
      (setq gvar_1694 polybib-vtxjoin)
    )
  )
  (setq gvar_1698 '(ls_importsource ld_ldata))
  (setq st_unit0 polybib-vtxjoin)
  (setq racdyn-calcvtx polybib-vtxjoin)
  (in_param ls_ref 2)
  (if (setq gvar_1699 (in_param ls_ref 2))
    (progn
      (setq st_num0 1)
      (setq st_nom0 0)
      (setq projet_md_metqantprix_cb_unit polybib-vtxjoin)
    )
    (progn
      (setq gvar_1699 'ls_ext1)
    )
  )
  (vlax-vla-object->ename ls_unit racdyn-calcvtx)
  (vlax-vla-object->ename projet_md_metqantprix_st_num projet_md_metqantprix_cb_unit)
  (vlax-vla-object->ename projet_md_metqantprix_st_nom projet_md_metqantprix_cb_unit)
  (vlax-invoke projet_md_metqantprix_st_unit gvar_1698)
  (bo_lctabs projet_md_metqantprix_st_nom gvar_1699)
  (re_hauteur gvar_1707 st_unit0)
  (re_hauteur gvar_1688_c_projet_md_metqantprix_oninitialize gvar_1694)
  (st_num projet_md_metqantprix_st_unit st_num0)
)

;; Original arg hints: EO_POLY, arg_2
;; Referenced symbols: C:PROJET/MD_METQANTPRIX/ST_NOM#ONSETFOCUS, ENTDEL, EO_POLY, RE_ANGLE, dcl-listbox-getcursel, POLYBIB-VTXJOIN, ST_QUANT, PROJET/MD_METQANTPRIX/ST_UNIT, vlax-invoke, ST_UNIT0
(defun c:projet_md_metprop_cb_type_onselchanged (eo_poly arg_2)
  (entdel 'c:projet_md_metqantprix_st_nom_onsetfocus)
  (or (or (re_angle eo_poly_2 0) (re_angle eo_poly_2 1)) (re_angle eo_poly_2 2))
  (setq gvar_1699 'dcl-listbox-getcursel)
  (setq gvar_1694 polybib-vtxjoin)
  (setq gvar_1699 'st_quant)
  (vlax-invoke projet_md_metqantprix_st_unit gvar_1699)
  (re_hauteur gvar_1707 st_unit0)
  (re_hauteur gvar_1688_c_projet_md_metqantprix_oninitialize gvar_1694)
  (setq gvar_1699 '(ls_importsource ld_ldata))
  (setq st_unit0 polybib-vtxjoin)
  (vlax-vla-object->ename ls_unit polybib-vtxjoin)
)

;; Original arg hints: arg_1
;; Referenced symbols: LS_QUANTS, RE_ANGLE
(defun c:projet_md_metprop_cb_layer_onclicked (arg_1)
  (vlax-vla-object->ename ls_quants (re_angle gvar_2862 1))
  (vlax-vla-object->ename gvar_1704 (re_angle gvar_2862 1))
)

;; Original arg hints: arg_1
;; Referenced symbols: PROJET/MD_METQANTPRIX/ST_NUM, RE_ANGLE, PROJET/MD_METQANTPRIX/ST_NOM
(defun c:projet_md_metprop_cb_special_onclicked (arg_1)
  (vlax-vla-object->ename projet_md_metqantprix_st_num (re_angle gvar_2862 1))
  (vlax-vla-object->ename projet_md_metqantprix_st_nom (re_angle gvar_2862 1))
)

;; Referenced symbols: BLKBIB-GETPARENTENTITIES, BO_LCTABS
(defun c:projet_md_metprop_bt_layer_onclicked ()
  (vlax-curve-getstartpoint (errbib-catchapply gvar_1704))
  (if (setq blkbib-getparententities (vlax-curve-getstartpoint (errbib-catchapply gvar_1704)))
    (progn
      (bo_lctabs gvar_1704 blkbib-getparententities)
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: CAAR, RE_ANGLE, LS_EXT1, PROJET/MD_METQANTPRIX/ST_NOM, dcl-listbox-clear, BO_LCTABS, PT_POLY
(defun c:projet_md_metprop_bt_special_onclicked ()
  (setq caar (ls_props2 gvar_1705))
  nil
  (re_angle caar 0)
  (ls_absint2 'ls_ext1 nil nil)
  T
  (and (setq dcl-listbox-clear (ls_absint2 'ls_ext1 nil nil)) (bo_lctabs projet_md_metqantprix_st_nom dcl-listbox-clear) (laybib-newlay dcl-listbox-clear (*reactor2*)) (pt_poly gvar_1707 dcl-listbox-clear))
)

(defun c:projet_md_metprop_bt_cancel_onclicked ()
  (re_abs1 gvar_1711 2)
)

;; Referenced symbols: ENTDEL, CAAR, ST_2, DCL-GRID-ADDROW, AXEDYN-REACCREATE, POLYBIB-SUBPOLYBISINV, GROUPBIB-LIST, ES_EXT, RE_ANGLE, LS_REF
;; Referenced strings: \nLecture de la liste des catégories
(defun c:projet_md_metprop_bt_ok_onclicked ()
  (entdel "\nLecture de la liste des catégories")
  (setq caar (ls_props2 gvar_1705))
  (setq polybib-subpolybisinv (axedyn-reaccreate (dcl-grid-addrow caar st_2)))
  (setq ls_ref (es_ext (groupbib-list 0 polybib-subpolybisinv)))
  (if (re_angle (axe-set gvar_1703) 1)
    (progn
      (setq ls_ref (dcl-grid-setcurcell ls_ref (groupbib-list 8 (errbib-catchapply gvar_1704))))
    )
  )
  (setq in_lon0 (errbib-catchapply ls_filterf))
  (setq gvar_1699 (errbib-catchapply projet_md_metqantprix_st_nom))
  (if (re_angle (axe-set projet_md_metqantprix_st_unit) 1)
    (progn
      (or (or (re_angle caar 0) (re_angle caar 1)) (re_angle caar 2))
      (setq ls_ref (dcl-grid-setcurcell ls_ref (groupbib-list 2 gvar_1699)))
      (setq ls_ref (dcl-grid-setcurcell ls_ref (groupbib-list 43 (groupbib-listobj gvar_1699))))
      (setq ls_ref (dcl-grid-setcurcell ls_ref (groupbib-list 2 gvar_1699)))
    )
  )
  (re_abs1 gvar_1711 1)
)

;; Referenced symbols: C:PROJET/MD_METQANTPRIX/ST_UNIT#ONSETFOCUS, ENTDEL, Projet/MD_MetQantPrix, C:PROJET/MD_METQANTPRIX/BT_ANNULER#ONCLICKED, AXEDYN-REACCREATE, ST_ENT, POLYBIB-LWVERTICES, C:PROJET/MD_METQANTPRIX/CB_UNIT#ONSELCHANGED, C:PROJET/MD_METQANTPRIX/BT_OK#ONCLICKED, LS_GROUP
(defun c:projet_md_quantite_oninitialize ()
  (entdel 'c:projet_md_metqantprix_st_unit_onsetfocus)
  (projet_md_metqantprix)
  (laybib-newlay gvar_1684_c_projet_md_metqantprix_bt_annuler_onclicked (polybib-lwvertices 'axedyn-reaccreate st_ent))
  (if (setq gvar_1683 (laybib-newlay gvar_1684_c_projet_md_metqantprix_bt_annuler_onclicked (polybib-lwvertices 'axedyn-reaccreate st_ent)))
    (progn
      (c:projet_md_metqantprix_bt_ok_onclicked gvar_1682_c_projet_md_metqantprix_cb_unit_onselchanged gvar_1683)
      (c:projet_md_metqantprix_bt_ok_onclicked)
    )
  )
  (if gvar_1679
    (progn
      (ls_group gvar_1678 1 0)
    )
  )
  (in_retour nil nil)
)

;; Referenced symbols: ST_ENT, AXEDYN-REACCREATE, POLYBIB-LWVERTICES, HA_HANDLE, Projet/PA_CroisDyn, IN_RETOUR, VL-REMOVE, ST_AXEID, dcl-control-setenabled, IN_LON0
;; Referenced strings: Coefficient du prix, t, kg
(defun c:projet_md_quantite_bt_catnouv_onclicked ()
  (if st_ent
    (progn
      (setq gvar_2049 (polybib-lwvertices 'axedyn-reaccreate st_ent))
      (setq gvar_2049 (polybib-lwvertices 'ha_handle gvar_2049))
      (setq vl-remove (projet_pa_croisdyn gvar_2049))
    )
    (progn
      (setq vl-remove 0)
    )
  )
  (setq in_lon0 (in_retour "Coefficient du prix" "t" "kg"))
  (setq st_ent (dcl-grid-setcurcell st_ent (groupbib-list (dcl-control-setenabled (st_axeid vl-remove)) in_lon0)))
  (projet_md_metqantprix)
)

;; Referenced symbols: LS_ZONS, ENTDEL, ST_ENT, C:PROJET/MD_METQANTPRIX/BT_ANNULER#ONCLICKED, IN_PARAM, LS_ENTMET, IN_LON0, IN_RETOUR, Projet/MD_MetQantPrix
;; Referenced strings: Coefficient du prix
(defun c:projet_md_quantite_bt_catedit_onclicked ()
  (entdel 'ls_zons)
  (setq in_lon0 (in_param st_ent gvar_1684_c_projet_md_metqantprix_bt_annuler_onclicked))
  (setq in_lon0 (in_retour "Coefficient du prix" 'ls_entmet in_lon0))
  (setq st_ent (st_rayon st_ent gvar_1684_c_projet_md_metqantprix_bt_annuler_onclicked in_lon0))
  (projet_md_metqantprix)
)

;; Referenced symbols: ENTDEL, C:PROJET/MD_METQANTPRIX/BT_ANNULER#ONCLICKED, ST_ENT, RE_ANGLE0, ST_PROPVALUE, EO_POLYABS, EG_ENTMET, TEXTPAGE, ST_UNITE, GEOMBIB-RACCORDMAX
;; Referenced strings: Coefficient du prix
(defun c:projet_md_quantite_bt_catsup_onclicked ()
  (entdel '(bo_go eg_entmet st_unite st_blkname ls_sum))
  (re_angle0 gvar_1684_c_projet_md_metqantprix_bt_annuler_onclicked st_ent)
  (eo_polyabs st_propvalue)
  (re_angle0 gvar_1684_c_projet_md_metqantprix_bt_annuler_onclicked st_ent)
  (blkpolydial-getpoint st_propvalue st_ent)
  T
  (and (setq st_propvalue (re_angle0 gvar_1684_c_projet_md_metqantprix_bt_annuler_onclicked st_ent)) (setq textpage (eo_polyabs st_propvalue)) (open "Coefficient du prix" (geombib-raccordmax 'eg_entmet textpage 'st_unite)) (setq st_ent (blkpolydial-getpoint st_propvalue st_ent)) (projet_md_metqantprix))
)

;; Referenced symbols: ENTDEL, C:PROJET/MD_METQANTPRIX/CB_UNIT#ONSELCHANGED, *REACTOR2*, EO_POLYABS, ST_ENT, POLYBIB-LWVERTICES, ST_PROPVALUE, VLR-Command-Reactor
;; Referenced strings: \nNombre d'objets trouvés : 
(defun metquant-dial-zl_catfill ()
  (entdel "\nNombre d'objets trouvés : ")
  (*reactor2* gvar_1682_c_projet_md_metqantprix_cb_unit_onselchanged)
  (setq st_propvalue (polybib-lwvertices 'eo_polyabs st_ent))
  (vlr-command-reactor gvar_1682_c_projet_md_metqantprix_cb_unit_onselchanged st_propvalue)
)

;; Referenced symbols: ENTDEL, AXEDYN-REACCREATE, POLYBIB-LWVERTICES, HA_HANDLE, Projet/PA_CroisDyn, C:PROJET/MD_METQANTPRIX/BT_ANNULER#ONCLICKED, METBIB-METZGO, LS_SUM, *ST_SORTIE*, VL-REMOVE
;; Referenced strings: \nQuantité metrée : , \nCopie dans le presse papier en cours...
(defun c:projet_md_quantite_bt_prixnouv_onclicked ()
  (entdel "\nQuantité metrée : ")
  (if gvar_1734
    (progn
      (setq gvar_2049 (polybib-lwvertices 'axedyn-reaccreate gvar_1734))
      (setq gvar_2049 (polybib-lwvertices 'ha_handle gvar_2049))
      (setq vl-remove (projet_pa_croisdyn gvar_2049))
    )
    (progn
      (setq vl-remove 0)
    )
  )
  (if gvar_1684_c_projet_md_metqantprix_bt_annuler_onclicked
    (progn
      (setq projet_md_quantite_cb_ltype (*st_sortie* 'metbib-metzgo 'ls_sum "\nCopie dans le presse papier en cours..."))
      (setq gvar_1734 (dcl-grid-setcurcell gvar_1734 (groupbib-list (dcl-control-setenabled (st_axeid vl-remove)) (es_ext gvar_1684_c_projet_md_metqantprix_bt_annuler_onclicked (dcl-grid-addrow 0 projet_md_quantite_cb_ltype) (dcl-grid-addrow 1 projet_md_quantite_cb_ltype) (dcl-grid-addrow 2 projet_md_quantite_cb_ltype) 'en_poly))))
      (c:projet_md_metqantprix_bt_ok_onclicked)
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: *IN_DEC*, ENTDEL, AXEDYN-REACCREATE, POLYBIB-LWVERTICES, HA_HANDLE, Projet/PA_CroisDyn, METZ-2CLIPBOARD, CLIPBOARDBIB-SET, METZ-2WINDOW, vl-ACAD-defun
(defun c:projet_md_quantite_bt_pp_onclicked ( / local_0)
  (entdel '*in_dec*)
  (if gvar_1734
    (progn
      (setq gvar_2049 (polybib-lwvertices 'axedyn-reaccreate gvar_1734))
      (setq gvar_2049 (polybib-lwvertices 'ha_handle gvar_2049))
      (setq vl-remove (projet_pa_croisdyn gvar_2049))
    )
    (progn
      (setq vl-remove 0)
    )
  )
  (setq clipboardbib-set (metz-2clipboard))
  (setq gvar_1657 (vl-acad-defun (ha_import clipboardbib-set 'metz-2window)))
  (if gvar_1684_c_projet_md_metqantprix_bt_annuler_onclicked
    (progn
      (setq local_0 gvar_1657)
      ;; init-args 3: 'projet_md_quantite_cb_ltype, nil
      (foreach projet_md_quantite_cb_ltype local_0
        (setq vl-remove (st_axeid vl-remove))
        (setq projet_md_quantite_cb_ltype (ha_import projet_md_quantite_cb_ltype '(bo_ok en_hach eo_hach)))
        (setq gvar_1734 (dcl-grid-setcurcell gvar_1734 (groupbib-list (dcl-control-setenabled vl-remove) (es_ext gvar_1684_c_projet_md_metqantprix_bt_annuler_onclicked (dcl-grid-addrow 0 projet_md_quantite_cb_ltype) (dcl-grid-addrow 1 projet_md_quantite_cb_ltype) (dcl-grid-addrow 2 projet_md_quantite_cb_ltype) 'en_poly))))
      )
    )
  )
  (c:projet_md_metqantprix_bt_ok_onclicked)
)

;; Referenced symbols: METBIB-AIRE, ENTDEL, IN_PARAM, DCL-GRID-ADDROW, vla-get-Elevation, IN_LON0, *ST_SORTIE*, PROJET/MD_QUANTITE/CB_LTYPE, ROW
(defun c:projet_md_quantite_bt_prixedit_onclicked ()
  (entdel 'metbib-aire)
  (setq vla-get-elevation (dcl-grid-addrow 1 (in_param gvar_1734 gvar_1679)))
  (setq in_lon0 (dcl-grid-addrow 2 (in_param gvar_1734 gvar_1679)))
  (setq gvar_1653 (dcl-grid-addrow 3 (in_param gvar_1734 gvar_1679)))
  (*st_sortie* vla-get-elevation in_lon0 gvar_1653)
  (if (setq gvar_1652 (*st_sortie* vla-get-elevation in_lon0 gvar_1653))
    (progn
      (setq projet_md_quantite_cb_ltype (in_param gvar_1734 gvar_1679))
      (setq projet_md_quantite_cb_ltype (row (dcl-grid-addrow 0 gvar_1652) 1 projet_md_quantite_cb_ltype))
      (setq projet_md_quantite_cb_ltype (row (dcl-grid-addrow 1 gvar_1652) 2 projet_md_quantite_cb_ltype))
      (setq projet_md_quantite_cb_ltype (row (dcl-grid-addrow 2 gvar_1652) 3 projet_md_quantite_cb_ltype))
      (setq gvar_1734 (st_rayon gvar_1734 gvar_1679 projet_md_quantite_cb_ltype))
      (c:projet_md_metqantprix_bt_ok_onclicked)
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: LS_INDEX, ENTDEL, RE_ANGLE0, PROJET/MD_QUANTITE/CB_LTYPE, LS_ZON, ST_UNITE, GEOMBIB-RACCORDMAX, BLKPOLYDIAL-GETPOINT
;; Referenced strings: Coefficient du prix
(defun c:projet_md_quantite_bt_prixsup_onclicked ()
  (entdel 'ls_index)
  (re_angle0 gvar_1679 gvar_1734)
  (va_bande projet_md_quantite_cb_ltype)
  (blkpolydial-getpoint projet_md_quantite_cb_ltype gvar_1734)
  T
  (and (setq projet_md_quantite_cb_ltype (re_angle0 gvar_1679 gvar_1734)) (setq ls_zon (va_bande projet_md_quantite_cb_ltype)) (open "Coefficient du prix" (geombib-raccordmax '(inc ls_zonsum st_out) ls_zon 'st_unite)) (setq gvar_1734 (blkpolydial-getpoint projet_md_quantite_cb_ltype gvar_1734)) (c:projet_md_metqantprix_bt_ok_onclicked))
)

;; Referenced symbols: ST_OUT, ENTDEL, RE_ANGLE0, PROJET/MD_QUANTITE/CB_LTYPE, POLYBIB-SUBPOLYOFFINV, ST_BLKBASE, vla-get-Name, LS_GROUP, LS_SOM0
(defun c:projet_md_quantite_bt_prixup_onclicked ()
  (entdel 'st_out)
  T
  (setq projet_md_quantite_cb_ltype (re_angle0 gvar_1679 gvar_1734))
  (setq polybib-subpolyoffinv (laybib-newlay projet_md_quantite_cb_ltype gvar_1734))
  (st_out gvar_1734 polybib-subpolyoffinv (vla-get-name polybib-subpolyoffinv))
  (ls_som0)
  (and (st_blkbase polybib-subpolyoffinv 0) (setq gvar_1734 (st_out gvar_1734 polybib-subpolyoffinv (vla-get-name polybib-subpolyoffinv))) (c:projet_md_metqantprix_bt_ok_onclicked) (ls_group gvar_1678 (laybib-newlay projet_md_quantite_cb_ltype gvar_1741) 255))
)

;; Referenced symbols: ST_OUT, ENTDEL, RE_ANGLE0, PROJET/MD_QUANTITE/CB_LTYPE, vla-get-Name, REPDYN-GETPOINT, POLYBIB-SUBPOLYOFFINV, ST_AXEID, LS_GROUP, LS_SOM0
(defun c:projet_md_quantite_bt_prixdown_onclicked ()
  (entdel 'st_out)
  T
  (setq projet_md_quantite_cb_ltype (re_angle0 gvar_1679 gvar_1734))
  (setq polybib-subpolyoffinv (laybib-newlay projet_md_quantite_cb_ltype gvar_1734))
  (st_out gvar_1734 polybib-subpolyoffinv (st_axeid polybib-subpolyoffinv))
  (ls_som0)
  (and (repdyn-getpoint (laybib-newlay projet_md_quantite_cb_ltype gvar_1741) (vla-get-name (st_ray2 gvar_1741))) (setq gvar_1734 (st_out gvar_1734 polybib-subpolyoffinv (st_axeid polybib-subpolyoffinv))) (c:projet_md_metqantprix_bt_ok_onclicked) (ls_group gvar_1678 (laybib-newlay projet_md_quantite_cb_ltype gvar_1741) 255))
)

;; Referenced symbols: IN_PARAM, PROJET/MD_QUANTITE/CB_LTYPE, DCL-GRID-ADDROW, LS_ZON, ST_UNITE, GEOMBIB-RACCORDMAX
;; Referenced strings: Coefficient du prix,  
(defun c:projet_md_quantite_bt_prixgo_onclicked ()
  (in_param gvar_1734 gvar_1679)
  (dcl-grid-addrow 2 projet_md_quantite_cb_ltype)
  T
  (and (setq projet_md_quantite_cb_ltype (in_param gvar_1734 gvar_1679)) (setq ls_zon (dcl-grid-addrow 2 projet_md_quantite_cb_ltype)) (open "Coefficient du prix" (geombib-raccordmax " " ls_zon 'st_unite)) (re_abs1 gvar_1645 12))
)

;; Referenced symbols: ENTDEL, AXEDYN-REACCREATE, POLYBIB-LWVERTICES, HA_HANDLE, Projet/PA_CroisDyn, RE_RAYII, VL-REMOVE, ST_AXEID, dcl-control-setenabled, GEOMBIB-RACCORDMAX
;; Referenced strings: \nHors zone : 
(defun c:projet_md_quantite_bt_qtnouv_onclicked ()
  (entdel "\nHors zone : ")
  (if gvar_1718
    (progn
      (setq gvar_2049 (polybib-lwvertices 'axedyn-reaccreate gvar_1718))
      (setq gvar_2049 (polybib-lwvertices 'ha_handle gvar_2049))
      (setq vl-remove (projet_pa_croisdyn gvar_2049))
    )
    (progn
      (setq vl-remove 0)
    )
  )
  (setq in_lon0 (geombib-raccordmax 're_rayii (dcl-control-setenabled (st_axeid vl-remove))))
  (cddr in_lon0 nil)
  (if (setq cddr (cddr in_lon0 nil))
    (progn
      (setq ls_ref (polybib-lwvertices 'ls_zonsum (re_x cddr)))
      (setq gvar_1718 (dcl-grid-setcurcell gvar_1718 (groupbib-list (dcl-control-setenabled (st_axeid vl-remove)) (es_ext gvar_1684_c_projet_md_metqantprix_bt_annuler_onclicked ls_ref (axedyn-reaccreate cddr)))))
      (c:projet_md_metqantprix_bt_ok_onclicked)
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: ENTDEL, BLKPOLY-LS_ENTSNEW, LS_ENTSNEW, RE_X, POLYBIB-SUBPOLYOFFINV, DCL-GRID-ADDROW, *LS_ZONS*, POLYBIB-LWVERTICES, LS_REF, LS_ZONSUM
;; Referenced strings: -
(defun c:projet_md_quantite_bt_qtedit_onclicked ()
  (entdel "-")
  (blkpoly-ls_entsnew gvar_1678)
  (dcl-grid-addrow (re_x ls_entsnew) 4)
  (dcl-grid-addrow polybib-subpolyoffinv gvar_1742)
  (polybib-lwvertices '*ls_zons* (dcl-grid-addrow 2 gvar_1639))
  (cddr (dcl-grid-addrow 3 gvar_1639) ls_ref)
  (polybib-lwvertices 'ls_zonsum (re_x gvar_1637))
  (st_rayon gvar_1718 (axedyn-reaccreate gvar_1639) (es_ext gvar_1684_c_projet_md_metqantprix_bt_annuler_onclicked ls_ref (axedyn-reaccreate gvar_1637)))
  T
  (and (setq ls_entsnew (blkpoly-ls_entsnew gvar_1678)) (setq polybib-subpolyoffinv (dcl-grid-addrow (re_x ls_entsnew) 4)) (setq gvar_1639 (dcl-grid-addrow polybib-subpolyoffinv gvar_1742)) (setq ls_ref (polybib-lwvertices '*ls_zons* (dcl-grid-addrow 2 gvar_1639))) (setq gvar_1637 (cddr (dcl-grid-addrow 3 gvar_1639) ls_ref)) (setq ls_ref (polybib-lwvertices 'ls_zonsum (re_x gvar_1637))) (setq gvar_1718 (st_rayon gvar_1718 (axedyn-reaccreate gvar_1639) (es_ext gvar_1684_c_projet_md_metqantprix_bt_annuler_onclicked ls_ref (axedyn-reaccreate gvar_1637)))) (c:projet_md_metqantprix_bt_ok_onclicked))
)

;; Referenced symbols: IN_DEC, ENTDEL, BLKPOLY-LS_ENTSNEW, LS_ENTSNEW, RE_X, POLYBIB-SUBPOLYOFFINV, ST_BLKBASE, DCL-GRID-ADDROW, ST_CLIP, ST_UNITE
;; Referenced strings: Coefficient du prix
(defun c:projet_md_quantite_bt_qtsup_onclicked ()
  (entdel 'in_dec)
  (setq ls_entsnew (blkpoly-ls_entsnew gvar_1678))
  (setq polybib-subpolyoffinv (dcl-grid-addrow (re_x ls_entsnew) 4))
  (dcl-grid-addrow polybib-subpolyoffinv gvar_1718)
  (dcl-grid-addrow 3 gvar_1639)
  (blkpolydial-getpoint gvar_1639 gvar_1718)
  T
  (and (st_blkbase polybib-subpolyoffinv 0) (setq gvar_1639 (dcl-grid-addrow polybib-subpolyoffinv gvar_1718)) (setq gvar_1635 (dcl-grid-addrow 3 gvar_1639)) (open "Coefficient du prix" (geombib-raccordmax 'st_clip gvar_1635 'st_unite)) (setq gvar_1718 (blkpolydial-getpoint gvar_1639 gvar_1718)) (c:projet_md_metqantprix_bt_ok_onclicked))
)

;; Referenced symbols: ENTDEL, BLKPOLY-LS_ENTSNEW, LS_ENTSNEW, RE_X, POLYBIB-SUBPOLYOFFINV, ST_BLKBASE, vla-get-Name, AXEDYN-REACCREATE, LS_GROUP, LS_SOM0
;; Referenced strings: ,
(defun c:projet_md_quantite_bt_qtgauche_onclicked ()
  (entdel ",")
  T
  (setq ls_entsnew (blkpoly-ls_entsnew gvar_1678))
  (setq polybib-subpolyoffinv (dcl-grid-addrow (re_x ls_entsnew) 4))
  (st_out gvar_1718 polybib-subpolyoffinv (vla-get-name polybib-subpolyoffinv))
  (ls_som0)
  (and (st_blkbase polybib-subpolyoffinv 0) (setq gvar_1718 (st_out gvar_1718 polybib-subpolyoffinv (vla-get-name polybib-subpolyoffinv))) (c:projet_md_metqantprix_bt_ok_onclicked) (ls_group gvar_1678 (axedyn-reaccreate ls_entsnew) (dcl-grid-addrow (re_x ls_entsnew) 1)))
)

;; Referenced symbols: ENTDEL, BLKPOLY-LS_ENTSNEW, LS_ENTSNEW, RE_X, POLYBIB-SUBPOLYOFFINV, vla-get-Name, REPDYN-GETPOINT, ST_AXEID, AXEDYN-REACCREATE, ST_SYLE
;; Referenced strings: .
(defun c:projet_md_quantite_bt_qtdroite_onclicked ()
  (entdel ".")
  T
  (setq ls_entsnew (blkpoly-ls_entsnew gvar_1678))
  (setq polybib-subpolyoffinv (dcl-grid-addrow (re_x ls_entsnew) 4))
  (st_out gvar_1718 polybib-subpolyoffinv (st_axeid polybib-subpolyoffinv))
  (ls_som0)
  (and (repdyn-getpoint polybib-subpolyoffinv (vla-get-name (st_ray2 gvar_1718))) (setq gvar_1718 (st_out gvar_1718 polybib-subpolyoffinv (st_axeid polybib-subpolyoffinv))) (c:projet_md_metqantprix_bt_ok_onclicked) (ls_group gvar_1678 (axedyn-reaccreate ls_entsnew) (st_syle (re_x ls_entsnew) 1)))
)

;; Original arg hints: EO_POLY, arg_2
;; Referenced symbols: VL-STRING-SUBST, ENTDEL, EO_POLY
(defun c:projet_md_quantite_zl_cat_onselchanged (eo_poly arg_2)
  (entdel 'vl-string-subst)
  (if eo_poly_2
    (progn
      (c:projet_md_metqantprix_bt_ok_onclicked)
      (vl-string-subst 254 254)
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: ENTDEL, ES_EXT, EO_POLYABS, ST_ENT, POLYBIB-LWVERTICES, *EN_INS*, EO_PLF, ST_BLKBASE, C:PROJET/MD_METQANTPRIX/CB_UNIT#ONSELCHANGED, POLYBIB-SUBPOLYOFFINV
;; Referenced strings: =LC4*LC(-1), \n- 
(defun metquant-dial-gr_prixfill ( / local_0 local_1)
  (entdel "=LC4*LC(-1)")
  (*en_ins* gvar_1678)
  (setq gvar_1742 (es_ext))
  (setq gvar_1741 (es_ext))
  (setq projet_md_quantite_la_value (polybib-lwvertices 'eo_polyabs st_ent))
  (while (st_blkbase (eo_plf gvar_1678) 4)
    (eo_plf gvar_1678 4)
  )
  (eg_entmet0 gvar_1682_c_projet_md_metqantprix_cb_unit_onselchanged)
  (axedyn-reaccreate (dcl-grid-addrow polybib-subpolyoffinv st_ent))
  (setq local_0 gvar_1734)
  (and (setq polybib-subpolyoffinv (eg_entmet0 gvar_1682_c_projet_md_metqantprix_cb_unit_onselchanged)) (st_blkbase polybib-subpolyoffinv 255) (setq gvar_1684_c_projet_md_metqantprix_bt_annuler_onclicked (axedyn-reaccreate (dcl-grid-addrow polybib-subpolyoffinv st_ent))))
  ;; init-args 3: 'projet_md_quantite_cb_ltype, nil
  (foreach projet_md_quantite_cb_ltype local_0
    (if (ls_ext2 gvar_1684_c_projet_md_metqantprix_bt_annuler_onclicked (dcl-grid-addrow 1 projet_md_quantite_cb_ltype))
      (progn
        (eo_blkpop gvar_1678 (dcl-grid-addrow 2 projet_md_quantite_cb_ltype) (dcl-grid-addrow 3 projet_md_quantite_cb_ltype) (dcl-grid-addrow 4 projet_md_quantite_cb_ltype) (eo_blkbase (dcl-grid-addrow 5 projet_md_quantite_cb_ltype) 2 3))
        (setq gvar_1741 (dcl-grid-setcurcell gvar_1741 projet_md_quantite_cb_ltype))
      )
    )
  )
  (setq local_0 gvar_1718)
  ;; init-args 3: "\n- ", nil
  (foreach gvar_1639 local_0
    (if (ls_ext2 gvar_1684_c_projet_md_metqantprix_bt_annuler_onclicked (dcl-grid-addrow 1 gvar_1639))
      (progn
        (eg_entmet0 gvar_1678 (eo_plf gvar_1678) (es_ext (dcl-grid-addrow 3 gvar_1639) 1 45))
        (setq gvar_1742 (dcl-grid-setcurcell gvar_1742 gvar_1639))
        (setq ls_ref (dcl-grid-addrow 2 gvar_1639))
      )
    )
  )
  (setq gvar_3169 0)
  (setq local_0 gvar_1741)
  ;; init-args 3: 'projet_md_quantite_cb_ltype, nil
  nil
  (foreach projet_md_quantite_cb_ltype local_0
    (setq gvar_1679 (axedyn-reaccreate projet_md_quantite_cb_ltype))
    (setq st_type0 4)
    (setq local_1 gvar_1742)
    ;; init-args 3: "\n- ", nil
    (foreach gvar_1639 local_1
      (setq en_entmet (axedyn-reaccreate gvar_1639))
      (eo_polyabs (re_angle0 (geombib-raccordmax gvar_1679 'vla-get-backgroundcolor en_entmet) f))
      (if (setq gvar_1624 (eo_polyabs (re_angle0 (geombib-raccordmax gvar_1679 'vla-get-backgroundcolor en_entmet) f)))
        (progn
          (en_blk gvar_1678 gvar_3169 st_type0 gvar_1623)
          (setq gvar_1623 (eo_blkbase gvar_1624 2 3))
        )
      )
      (setq st_type0 (st_axeid st_type0))
    )
    (st_axeid gvar_3169)
    (setq gvar_3169 (st_axeid gvar_3169))
  )
  T
  T
)

;; Original arg hints: EQ, NETBIB-PURGEBLOCK
;; Referenced symbols: vla-put-Elevation, ENTDEL, EQ, DCL-GRID-ADDROW, PROJET/MD_QUANTITE/CB_LTYPE, AXEDYN-REACCREATE, POLYBIB-VTXJOIN, NETBIB-PURGEBLOCK, ST_BLKBASE, LS_REF
(defun c:projet_md_quantite_gr_prix_onselchanged (eq netbib-purgeblock)
  (entdel 'vla-put-elevation)
  (if (re_deltax eq_2 0)
    (progn
      (setq projet_md_quantite_cb_ltype (dcl-grid-addrow eq_2 gvar_1741))
      (setq gvar_1679 (axedyn-reaccreate projet_md_quantite_cb_ltype))
      (setq gvar_1621 polybib-vtxjoin)
    )
  )
  (if (st_blkbase netbib-purgeblock_2 3)
    (progn
      (in_retour ls_ref (dcl-grid-addrow 4 gvar_1639))
      (setq gvar_1639 (dcl-grid-addrow (dcl-grid-addrow netbib-purgeblock_2 4) gvar_1742))
      (setq en_entmet (axedyn-reaccreate gvar_1639))
      (setq ls_handle polybib-vtxjoin)
      (setq gvar_1621 nil)
      (setq ls_ref (dcl-grid-addrow 2 gvar_1639))
    )
    (progn
      (in_retour nil nil)
      (setq gvar_1621 polybib-vtxjoin)
      (setq gvar_1639 nil)
      (setq en_entmet nil)
      (setq ls_handle nil)
      (setq ls_ref nil)
    )
  )
  (if (re_angle netbib-purgeblock_2 254)
    (progn
      (setq gvar_1621 nil)
    )
  )
  (vlax-vla-object->ename gvar_1619 gvar_1621)
  (vlax-vla-object->ename bo_visi gvar_1621)
  (vlax-vla-object->ename bo_hili gvar_1621)
  (vlax-vla-object->ename gvar_1616 gvar_1621)
  (vlax-vla-object->ename ls_szon gvar_1621)
  (vlax-vla-object->ename en_szon ls_handle)
  (vlax-vla-object->ename vla-highlight ls_handle)
  (vlax-vla-object->ename gvar_1612 ls_handle)
  (vlax-vla-object->ename gvar_1611 ls_handle)
)

;; Original arg hints: NETBIB-PURGEBLOCK
;; Referenced symbols: LS_ZONHAND, CLOSE, LS_PTININT
(defun c:projet_md_quantite_gr_prix_oncolumnclick (netbib-purgeblock)
  (ls_ptinint 'ls_zonhand 'close)
)

;; Original arg hints: LS_REF, arg_2
;; Referenced symbols: BO_ERROR, ENTDEL, LS_REF, ST_BTN, IN_PARAM, POLYBIB-SUBPOLYBISINV, PROJET/PA_DETAIL/BTN_PARAM, RE_ANGLE, BLKPOLY-MOD-PARAMUPDATE, READ-LINE
;; Referenced strings: Fin BlKPoly-XY2WCS, va_echelle
(defun metquant-dial-quantfill (ls_ref arg_2)
  (entdel 'bo_error)
  (if ls_ref_2
    (progn
      (setq polybib-subpolybisinv (in_param ls_ref_2 'st_btn))
      (or (or (re_angle polybib-subpolybisinv 'projet_pa_detail_btn_param) (re_angle polybib-subpolybisinv 'blkpoly-mod-paramupdate)) (re_angle polybib-subpolybisinv "Fin BlKPoly-XY2WCS"))
      (setq re_inc 'read-line)
      (setq gvar_1699 'st_quant)
      (setq st_zon '(ls_cell in_pos ls_quant st_quant))
      (in_param ls_ref_2 'ls_pts)
      (if (setq listbib-min (in_param ls_ref_2 'ls_pts))
        (progn
          (setq ls_pt (eo_blkbase listbib-min 2 3))
        )
        (progn
          (setq ls_pt '(lambda (x) (= 10 (car x))))
        )
      )
      (setq re_inc 'jsonbib-json2list)
      (setq gvar_1699 'dcl-listbox-getcursel)
      (setq st_zon '(ls_catnom in_pos))
      (in_param ls_ref_2 '*ls_temp*)
      (if (setq in_lon0 (in_param ls_ref_2 '*ls_temp*))
        (progn
          (setq ls_pt in_lon0)
        )
        (progn
          (setq ls_pt 'metz-entdel)
        )
      )
      (setq re_inc "va_echelle")
      (setq gvar_1699 '(ls_importsource ld_ldata))
      (setq st_zon 'st_quantid)
      (in_param ls_ref_2 '*ls_temp*)
      (if (setq in_lon0 (in_param ls_ref_2 '*ls_temp*))
        (progn
          (setq ls_pt in_lon0)
        )
        (progn
          (setq ls_pt 'ls_zonent)
        )
      )
      (vlax-invoke gvar_1600 ls_pt)
      (vlax-invoke ssbib-matchboxdial gvar_1699)
      (vlax-invoke gvar_1598 st_zon)
      (in_param ls_ref_2 'ls_propvals)
      (if (setq blkbib-getparententities (in_param ls_ref_2 'ls_propvals))
        (progn
          (bo_lctabs entbib-gettype blkbib-getparententities)
        )
        (progn
          (bo_invpoly1 entbib-gettype 255)
        )
      )
      (in_param ls_ref_2 'ls_propval)
      (if (setq ls_lines (in_param ls_ref_2 'ls_propval))
        (progn
          (bo_lctabs blkbib-get_dynprop ls_lines)
        )
        (progn
          (bo_invpoly1 blkbib-get_dynprop 255)
        )
      )
      (setq ls_paramwcs polybib-vtxjoin)
    )
    (progn
      (setq re_inc 'poly-largglob)
      (setq ls_paramwcs nil)
    )
  )
  (if (and gvar_1811 (cadr (odclbib-fillcombo gvar_1811 'en_poly)))
    (progn
      (setq st_zon gvar_1811)
    )
  )
  (vlax-invoke gvar_1592 re_inc)
  (re_hauteur ssbib-matchboxdial ls_paramwcs)
  (re_hauteur gvar_1600 ls_paramwcs)
  (re_hauteur gvar_1591 ls_paramwcs)
  (re_hauteur ls_inv ls_paramwcs)
  (re_hauteur gvar_1589 ls_paramwcs)
  (re_hauteur gvar_1588 ls_paramwcs)
  (re_hauteur entbib-gettype ls_paramwcs)
  (re_hauteur blkbib-get_dynprop ls_paramwcs)
  (re_hauteur ef_ref2 ls_paramwcs)
  (re_hauteur gvar_1598 ls_paramwcs)
)

;; Original arg hints: EQ, NETBIB-PURGEBLOCK
;; Referenced symbols: ENTDEL, EQ, DCL-GRID-ADDROW, PROJET/MD_QUANTITE/CB_LTYPE, AXEDYN-REACCREATE, NETBIB-PURGEBLOCK, RE_ANGLE, vla-get-BackgroundColor, EN_ENTMET, GEOMBIB-RACCORDMAX
;; Referenced strings: Coefficient du prix, pt_1d
(defun c:projet_md_quantite_gr_prix_ondblclicked (eq netbib-purgeblock)
  (entdel '(en_poly2 pt_2 pt_2d pt_2f ls_exts ls_ext ls_offset))
  (setq projet_md_quantite_cb_ltype (dcl-grid-addrow eq_2 gvar_1741))
  (setq gvar_1679 (axedyn-reaccreate projet_md_quantite_cb_ltype))
  nil
  (or (re_angle netbib-purgeblock_2 3) (re_deltax netbib-purgeblock_2 4))
  (vlax-curve-getendparam pt_2d)
  (setq gvar_1639 (dcl-grid-addrow (dcl-grid-addrow netbib-purgeblock_2 4) gvar_1742))
  (setq en_entmet (axedyn-reaccreate gvar_1639))
  (setq pt_2d (geombib-raccordmax gvar_1679 'vla-get-backgroundcolor en_entmet))
  (if (re_angle0 pt_2d f)
    (progn
      (setq gvar_1623 (eo_blkbase (in_param f pt_2d) 2 3))
    )
    (progn
      (setq gvar_1623 'pt_2f)
    )
  )
  (setq gvar_1623 (in_retour "Coefficient du prix" pt_2d gvar_1623))
  (if (cadr (ls_ext2 gvar_1623 'ls_ext1))
    (progn
      (setq gvar_1624 (groupbib-listobj gvar_1623))
      (if (re_angle gvar_1624 'ha_poly)
        (progn
          (setq f (blkpolydial-getpoint (re_angle0 pt_2d f) f))
          (setq gvar_1623 'ls_ext1)
        )
        (progn
          (setq f (st_rayon f pt_2d gvar_1624))
          (setq gvar_1623 (eo_blkbase gvar_1624 2 3))
        )
      )
      (en_blk gvar_1678 eq_2 netbib-purgeblock_2 gvar_1623)
    )
    (progn
      nil
    )
  )
  (setq gvar_1623 (eo_blkbase (dcl-grid-addrow 5 projet_md_quantite_cb_ltype) 2 3))
  (setq gvar_1623 (in_retour "Coefficient du prix" "pt_1d" gvar_1623))
  (setq gvar_1624 (groupbib-listobj gvar_1623))
  (if (projet_pa_axes_st_desc gvar_1624 'ha_poly)
    (progn
      (setq projet_md_quantite_cb_ltype (row gvar_1624 5 projet_md_quantite_cb_ltype))
      (setq gvar_1741 (st_rayon gvar_1741 gvar_1679 (eo_polyabs projet_md_quantite_cb_ltype)))
      (setq gvar_1734 (st_rayon gvar_1734 gvar_1679 (eo_polyabs projet_md_quantite_cb_ltype)))
      (setq gvar_1623 (eo_blkbase gvar_1624 2 3))
      (en_blk gvar_1678 eq_2 netbib-purgeblock_2 gvar_1623)
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: PT_1D, ENTDEL, POLYBIB-DISTPROJ, TRANS, PROJET/PA_BORDYN/ST_STYLE, BLKBIB-BLKEFFNAME, PT_1F, ST_ENT, LS_EXTS, MPOLYDYN-EXT
;; Referenced strings: OC-Bordyn, pt_1f
(defun c:projet_md_quantite_bt_sauv_onclicked ()
  (entdel 'pt_1d)
  (mpolydyn-ext (ls_exts nil st_ent) gvar_1577)
  (mpolydyn-ext (ls_exts nil gvar_1734) gvar_1577)
  (mpolydyn-ext (ls_exts nil gvar_1718) gvar_1577)
  (mpolydyn-ext (ls_exts nil f) gvar_1577)
  (setq blkbib-blkeffname (projet_pa_bordyn_st_style 'polybib-distproj (trans "OC-Bordyn") "pt_1f" 1))
  (setq gvar_1577 (pt_1f blkbib-blkeffname 'pt_1f))
  (ef_ref1 gvar_1577)
)

;; Referenced symbols: VA_ABS1, ENTDEL, POLYBIB-DISTPROJ, TRANS, PROJET/PA_BORDYN/ST_STYLE, BLKBIB-BLKEFFNAME, VA_ABS1F, LS_SOM0, VA_ABS2D, RE_ABS1F
;; Referenced strings: OC-Bordyn, pt_1f, \n- 
(defun metqquant-load ( / local_0 local_1)
  (entdel 'va_abs1)
  (projet_pa_bordyn_st_style 'polybib-distproj (trans "OC-Bordyn") "pt_1f" 0)
  (if (setq blkbib-blkeffname (projet_pa_bordyn_st_style 'polybib-distproj (trans "OC-Bordyn") "pt_1f" 0))
    (progn
      (ls_som0 'va_abs1f)
      (ls_som0 'va_abs1d)
      (ls_som0 '(va_abs2 va_abs en_poly re_abs1))
      (ls_som0 'va_abs2)
      (ef_ref1 gvar_1577)
      (setq gvar_1577 (pt_1f blkbib-blkeffname '(re_abs0 en_poly1 en_poly2 va_abs1d va_abs1f va_abs2d)))
      (setq st_propvalue (re_abs1f (va_abs2d gvar_1577)))
      (setq projet_md_quantite_cb_ltype (re_abs1f (va_abs2d gvar_1577)))
      (setq gvar_1639 (re_abs1f (va_abs2d gvar_1577)))
      (setq open (re_abs1f (va_abs2d gvar_1577)))
      (setq st_propvalue st_propvalue)
      (setq st_propvalue (polybib-lwvertices 'st_stylepoly st_propvalue))
      (setq projet_md_quantite_cb_ltype (polybib-lwvertices '(in_id st_id ld_mpolydyn ha_poly va_ent) projet_md_quantite_cb_ltype))
      (setq gvar_1719 (es_ext))
      (setq gvar_1563 gvar_1639)
      (setq local_0 gvar_1563)
      ;; init-args 3: "\n- ", nil
      (foreach gvar_1639 local_0
        (setq gvar_1639 (axedyn-reaccreate gvar_1639))
        (setq gvar_2149 (dcl-grid-addrow 2 gvar_1639))
        (setq ld_mpolydyn (es_ext))
        (setq local_1 (axedyn-reaccreate gvar_2149))
        ;; init-args 3: 'ls_ref, nil
        (foreach ls_ref local_1
          (setq ls_ref (ld_mpolydyn ls_ref))
          (setq ld_mpolydyn (dcl-grid-setcurcell ld_mpolydyn (groupbib-list (axedyn-reaccreate ls_ref) (re_x ls_ref))))
        )
        (setq gvar_1719 (dcl-grid-setcurcell gvar_1719 (es_ext (axedyn-reaccreate (dcl-grid-addrow 0 gvar_1639)) (axedyn-reaccreate (dcl-grid-addrow 1 gvar_1639)) ld_mpolydyn (axedyn-reaccreate (dcl-grid-addrow 3 gvar_1639)))))
      )
      (polybib-lwvertices "Impossible d'ajouter les parents" open)
      (setq open (polybib-lwvertices "Impossible d'ajouter les parents" open))
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: MPOLYDYN-GETPARENTS, ENTDEL, ST_PROPVALUE, PROJET/MD_QUANTITE/CB_LTYPE, OPEN, DCL-GRID-CLEAR, Projet/MD_MetQantPrix, JSONBIB-LIST2JSON, EO_POLYABS, ST_ENT
;; Referenced strings: Coefficient du prix
(defun c:projet_md_quantite_bt_load_onclicked ()
  (entdel 'mpolydyn-getparents)
  (if (and (st_coefid) (open "Coefficient du prix" '(st_path f)))
    (progn
      (setq st_ent st_propvalue)
      (setq gvar_1734 projet_md_quantite_cb_ltype)
      (setq gvar_1718 gvar_1719)
      (setq f open)
      (if (dcl-grid-clear gvar_1645)
        (progn
          (projet_md_metqantprix)
          (c:projet_md_metqantprix_bt_ok_onclicked)
        )
      )
      (if (dcl-grid-clear jsonbib-list2json)
        (progn
          (st_value gvar_1745 (polybib-lwvertices 'eo_polyabs st_ent))
        )
      )
    )
  )
  (ls_som0)
)

(defun c:projet_md_quantite_boutonimage1_onclicked ()
  (re_abs1 gvar_1645 2)
)

;; Original arg hints: Projet/PA_MpolyDyn
;; Referenced symbols: BO_CLOSED, ENTDEL, MPOLYDYN-GETVTXS, STYLEPOLY-GET, BO_LCTABS, Projet/PA_MpolyDyn, *LS_RACTYPES*, BO_INVPOLY1, ODCLBIB-FILLCOMBO, CADR
;; Referenced strings: LinetypeGeneration, Nom, Non
(defun metquantprix (projet_pa_mpolydyn / ls_parents ls_deb ls_ent ls_fin va_ent ld_mpolydyn ls_ent_2 ls_deb_2 ls_fin_2 ls_inv ha_poly bo_closed ls_vtxs ha_polyls_style ls_props en_poly local_0 local_1)
  (entdel 'bo_closed)
  (ls_polys bo_closed bo_closed)
  (if bo_closed
    (progn
      (bo_lctabs gvar_1552 gvar_1558)
    )
  )
  (if gvar_1558
    (progn
      (bo_lctabs gvar_1551 bo_closed)
    )
  )
  T
  (and bo_closed (bo_lctabs *ls_ractypes* bo_closed) (bo_invpoly1 bo_closed 0) (cadr (odclbib-fillcombo (ls_lines bo_closed bo_closed) 255)) (re_hauteur *ls_ractypes* nil))
  (ls_debfinrad '*en_highligth*)
  (setq *en_highligth* 'findfile)
  (ls_entnew gvar_1551 0 255)
  (ls_debfinrad 'projet_pa_mpolydyn_st_amont)
  (setq projet_pa_mpolydyn_st_amont 'vl-filename-base)
  (ls_entnew *ls_ractypes* 0 255)
  (ls_debfinrad 'projet_pa_mpolydyn_st_aval)
  (setq projet_pa_mpolydyn_st_aval 'st_blkname)
  (re_abs1 projet_pa_mpolydyn_st_style 2)
  (ls_debfinrad 'projet_pa_mpolydyn_st_nom)
  (setq projet_pa_mpolydyn_st_nom 'vl-filename-directory)
  ;; init-args 5: 'eo_poly, local_0, "LinetypeGeneration", local_1
  (entdel "Nom")
  (if (odclbib-fillcombo eo_poly 0)
    (progn
      (setq ls_paramwcs polybib-vtxjoin)
      (setq gvar_2862 'ls_ext1)
    )
    (progn
      (setq ls_paramwcs nil)
    )
  )
  (bo_lctabs *ls_ractypes* gvar_2862)
  (re_hauteur *ls_ractypes* (odclbib-fillcombo eo_poly 0))
  (ls_debfinrad 'projet_pa_mpolydyn_cb_ferme)
  (setq projet_pa_mpolydyn_cb_ferme 'st_blkpath)
  (setq vla-get-elevation (errbib-catchapply gvar_1552))
  (setq in_lon0 (errbib-catchapply gvar_1551))
  (setq gvar_1653 (errbib-catchapply *ls_ractypes*))
  (re_abs1 projet_pa_mpolydyn_st_style 1)
  (ls_debfinrad "Non")
  (setq gvar_1542 'blkbib-blk_redef)
  (setq bo_closed (es_ext "Oui" "\nCopie dans le presse papier en cours..." 'projet_pa_mpolydyn_bo_inv 'gr_elements-fill 'va_pos '(ls_deb ls_ent ls_fin ls_inv re_absdeb re_absfin ls_vtxs) '*en_subhighligth*))
  (setq entbib-surligne (vlax-erased-p projet_pa_mpolydyn_st_style))
  nil
  (or (odclbib-fillcombo entbib-surligne 1) (odclbib-fillcombo entbib-surligne 2))
  nil
  (es_ext vla-get-elevation in_lon0 gvar_1653)
)

;; Original arg hints: *IN_ELE*, IN_INV, arg_3
;; Referenced symbols: MPOLYDYNDIAL-GETPOS, ENTDEL, ST_RAC, IN_INV, AXEDYN-REACCREATE, POLAR, LS_EXT1, PROJET/PA_MPOLYDYN/BT_AVAL, GEOMBIB-RACCORDMAX, LS_SOM0
;; Referenced strings: normal, Fin BlKPoly-XY2WCS, \nCopie dans le presse papier en cours...
(defun metz-go (*in_ele* in_inv arg_3 / ls_cat st_cat local_2)
  (entdel 'mpolydyndial-getpos)
  (st_rac)
  (ls_som0 (geombib-raccordmax 'projet_pa_mpolydyn_bt_aval (eo_blkbase (st_ray2 in_inv_2) 2 0)))
  (setq projet_pa_mpolydyn_bt_amont (polar (axedyn-reaccreate in_inv_2)))
  (setq mpolydyndial-changeamontaval 'ls_ext1)
  (if (odclbib-fillcombo (undobib-start st_cat) "normal")
    (progn
      (ls_som0 (geombib-raccordmax 'mpolydyn-getabs st_cat))
    )
  )
  (or (or (re_angle (eo_polyabs (re_angle0 0 projet_pa_mpolydyn_bt_amont)) 'projet_pa_detail_btn_param) (re_angle (eo_polyabs (re_angle0 0 projet_pa_mpolydyn_bt_amont)) "Fin BlKPoly-XY2WCS")) (re_angle (eo_polyabs (re_angle0 0 projet_pa_mpolydyn_bt_amont)) 'blkpoly-mod-paramupdate))
  (setq gvar_2607 polybib-vtxjoin)
  (if (odclbib-fillcombo st_cat 'en_poly)
    (progn
      (setq mpolydyndial-changeamontaval 'gr_elements-fill)
    )
  )
  (setq gvar_2607 polybib-vtxjoin)
  (if (odclbib-fillcombo st_cat 'en_poly)
    (progn
      (setq mpolydyndial-changeamontaval 'projet_pa_mpolydyn_bo_inv)
    )
  )
  (setq gvar_2607 polybib-vtxjoin)
  (if (odclbib-fillcombo st_cat 'en_poly)
    (progn
      (setq mpolydyndial-changeamontaval "\nCopie dans le presse papier en cours...")
    )
  )
  (if gvar_2607
    (progn
      (ls_som0 'polybib-subverticesinv)
      (aobib-refsel (entbib-zoom re_absfin gvar_1523 entbib-zoom))
      (ls_som0 'blkbib-get_visiname)
      (ls_som0 (aobib-refsel re_absfin mpolydyndial-changeamontaval))
      (setq re_absfin (re_absdeb *in_ele*_2 in_inv_2 st_cat))
      polybib-vtxjoin
    )
    (progn
      (bordyn-inters 'ef_ref)
      nil
    )
  )
)

;; Original arg hints: dcl-grid-setcelltext
;; Referenced symbols: EN_MPOLYDYN, ENTDEL, POLYBIB-VTXJOIN, dcl-grid-setcelltext, LS_ELEMS1, dcl-forcedwgredraw, RACDYN-CALCVTX, POLAR, IN_PARAM, HA_POLY
(defun metz-valhach (dcl-grid-setcelltext / local_1)
  (entdel 'en_mpolydyn)
  (setq racdyn-calcvtx polybib-vtxjoin)
  (setq local_1 dcl-grid-setcelltext_2)
  ;; init-args 3: 'ls_elems1, nil
  (foreach ls_elems1 local_1
    (setq gvar_2991 (dcl-forcedwgredraw ls_elems1))
    (setq racdyn-calcvtx T)
    (and racdyn-calcvtx (ls_ext2 (in_param (polar ls_elems1) 210) (es_ext 'ha_poly 'ha_poly 'en_poly)) (in_ele ls_elems1) (ls_ext2 (pt_deb gvar_2991) 'ha_poly 'pt_fin))
  )
  racdyn-calcvtx
)

;; Original arg hints: *IN_ELE*
;; Referenced symbols: MPOLYDYN-GETSOMATABS, ENTDEL, ES_EXT, *IN_ELE*, IN_FIN, IN_DEB, ST_RAY2, EO_POLYABS, ST_RAYON, ST_AXEID
(defun metz-index (*in_ele* / local_1)
  (entdel 'mpolydyn-getsomatabs)
  (setq in_deb (es_ext))
  (setq st_ray2 1)
  (setq local_1 *in_ele*_2)
  ;; init-args 3: 'in_fin, nil
  (foreach in_fin local_1
    (setq in_deb (st_rayon in_deb (es_ext (st_rayon (es_ext st_ray2) (eo_polyabs in_fin)))))
    (setq st_ray2 (st_axeid st_ray2))
  )
  in_deb
)

;; Original arg hints: RE_ABSFIN, MPOLYDYNDIAL-CHANGEAMONTAVAL
;; Referenced symbols: PROJET/PA_MPOLYDYN/GR_ELEMENTS, ENTDEL, LS_EXT1, RE_ABSFIN, AXEDYN-REACCREATE, EO_POLYABS, MPOLYDYNDIAL-CHANGEAMONTAVAL, GEOMBIB-RACCORDMAX, ST_BLKBASE, RE_X
;; Referenced strings: Choix du segment à ajouter : 
(defun metz-2window (re_absfin mpolydyndial-changeamontaval / local_2)
  (entdel 'projet_pa_mpolydyn_gr_elements)
  (setq st_ray2 0)
  (setq gvar_1509 'ls_ext1)
  (setq gvar_1509 (geombib-raccordmax gvar_1509 "Choix du segment à ajouter : " (eo_blkbase (eo_polyabs (axedyn-reaccreate re_absfin_2)) 2 2) '(ls_deb ls_ent ls_fin) mpolydyndial-changeamontaval_2))
  (if (st_blkbase (st_ray2 re_absfin_2) 2)
    (progn
      (setq gvar_1509 (geombib-raccordmax gvar_1509 '(ls_deb ls_ent ls_fin inc ha_ent st_deb st_fin) (eo_blkbase (dcl-grid-addrow (eo_polyabs (axedyn-reaccreate re_absfin_2)) (eo_polyabs (re_x re_absfin_2))) 2 2) '(ls_deb ls_ent ls_fin) mpolydyndial-changeamontaval_2))
      (setq gvar_1509 (geombib-raccordmax gvar_1509 'st_deb (eo_blkbase (eo_polyabs (re_x re_absfin_2)) 2 2) '(ls_deb ls_ent ls_fin) mpolydyndial-changeamontaval_2))
      (setq gvar_1509 (geombib-raccordmax gvar_1509 'st_fin))
      (setq local_2 (aobib-getnom re_absfin_2))
      ;; init-args 3: '(ls_deb va_deb), nil
      (foreach gvar_1502 local_2
        (if (odclbib-fillcombo (eo_polyabs gvar_1502) 'ha_poly)
          (progn
            (setq gvar_1635 '(st_rac ls_fin va_fin))
          )
          (progn
            (setq gvar_1635 (eo_blkbase (eo_polyabs gvar_1502) 2 2))
          )
        )
        (setq gvar_1509 (geombib-raccordmax gvar_1509 'va_amav (re_x (dcl-grid-addrow st_ray2 cb_amav)) 'bt_amav gvar_1635 '(ls_deb ls_ent ls_fin) mpolydyndial-changeamontaval_2))
        (setq st_ray2 (st_axeid st_ray2))
      )
    )
  )
  gvar_1509
)

;; Original arg hints: RE_ABSFIN, POLYBIB-SUBPOLYBISINV, ST_AMAV
;; Referenced symbols: MPOLYDYNDIAL-SELECTAMONTAVAL, ENTDEL, LS_EXT1, ST_AMAV, CADR, RE_ABSFIN, AOBIB-GETNOM, vl-ACAD-defun, EO_POLYABS, HA_POLY
(defun metz-2clipboard (re_absfin polybib-subpolybisinv st_amav / local_3 local_4)
  (entdel 'mpolydyndial-selectamontaval)
  (setq gvar_1495 'ls_ext1)
  (if (cadr st_amav_2)
    (progn
      (setq st_amav_2 0)
    )
  )
  (setq local_3 (vl-acad-defun (aobib-getnom re_absfin_2)))
  ;; init-args 3: '(ls_deb va_deb), nil
  (foreach gvar_1502 local_3
    (if (odclbib-fillcombo (eo_polyabs gvar_1502) 'ha_poly)
      (progn
        (setq gvar_1635 'ls_ext1)
      )
      (progn
        (setq gvar_1635 (va_rac 'ls_amav 'va_rac (eo_blkbase (eo_polyabs gvar_1502) 2 2)))
      )
    )
    (or (or (re_angle polybib-subpolybisinv_2 'metbib-metzgo) (re_angle polybib-subpolybisinv_2 '(in_amont in_aval ls_deb ls_ent ls_fin st_amont st_aval))) polybib-vtxjoin)
    (setq gvar_1495 (geombib-raccordmax gvar_1495 gvar_1635 '(bo_ok en_hach eo_hach)))
    (setq local_4 st_amav_2)
    (while (<= local_4 0)
      (setq local_4 (1- local_4))
      (setq gvar_1495 (geombib-raccordmax gvar_1495 '(bo_ok en_hach eo_hach)))
    )
    (setq gvar_1495 (geombib-raccordmax gvar_1495 gvar_1635 'repdyn-getpointangle))
    (setq local_4 st_amav_2)
    (while (<= local_4 0)
      (setq local_4 (1- local_4))
      (setq gvar_1495 (geombib-raccordmax gvar_1495 'repdyn-getpointangle))
    )
    (setq gvar_1495 (geombib-raccordmax gvar_1495 gvar_1635 '(bo_ok en_hach eo_hach) 'in_amont '(bo_ok en_hach eo_hach)))
    (setq local_4 st_amav_2)
    (while (<= local_4 0)
      (setq local_4 (1- local_4))
      (setq gvar_1495 (geombib-raccordmax gvar_1495 '(bo_ok en_hach eo_hach)))
    )
  )
  (setq gvar_1502 (1- re_absfin_2))
  (if (odclbib-fillcombo (eo_polyabs gvar_1502) 'ha_poly)
    (progn
      (setq gvar_1635 'ls_ext1)
    )
    (progn
      (setq gvar_1635 (va_rac 'ls_amav 'va_rac (eo_blkbase (eo_polyabs gvar_1502) 2 2)))
    )
  )
  (or (or (re_angle polybib-subpolybisinv_2 'metbib-metzgo) (re_angle polybib-subpolybisinv_2 '(in_amont in_aval ls_deb ls_ent ls_fin st_amont st_aval))) polybib-vtxjoin)
  (setq gvar_1495 (geombib-raccordmax gvar_1495 gvar_1635))
  (setq gvar_1495 (geombib-raccordmax gvar_1495 gvar_1635))
  (setq gvar_1495 (geombib-raccordmax gvar_1495 gvar_1635 '(bo_ok en_hach eo_hach) 'in_amont))
  gvar_1495
)

;; Original arg hints: IN_INV
;; Referenced symbols: IN_AVAL, ENTDEL, POLYBIB-VTXJOIN, IN_INV, AXEDYN-REACCREATE, POLAR, ST_AMONT, RE_ANGLE0, EO_POLYABS, PROJET/PA_MPOLYDYN/BT_AMONT
;; Referenced strings: Fin BlKPoly-XY2WCS, Changements appliqués
(defun metz-valid (in_inv / local_1)
  (entdel 'in_aval)
  (setq racdyn-calcvtx polybib-vtxjoin)
  (setq st_amont (polar (axedyn-reaccreate in_inv_2)))
  (setq st_aval (eo_polyabs (re_angle0 0 st_amont)))
  (setq local_1 in_inv_2)
  ;; init-args 3: '(st_nom in_style st_style bo_closed), nil
  (foreach gvar_1486 local_1
    (setq projet_pa_mpolydyn_bt_amont (polar gvar_1486))
    (or (or (or (projet_pa_axes_st_desc (eo_polyabs (re_angle0 0 projet_pa_mpolydyn_bt_amont)) st_aval) (re_angle (eo_polyabs (re_angle0 0 projet_pa_mpolydyn_bt_amont)) 'projet_pa_detail_btn_param)) (re_angle (eo_polyabs (re_angle0 0 projet_pa_mpolydyn_bt_amont)) "Fin BlKPoly-XY2WCS")) (re_angle (eo_polyabs (re_angle0 0 projet_pa_mpolydyn_bt_amont)) 'blkpoly-mod-paramupdate))
    (setq gvar_2991 (dcl-forcedwgredraw gvar_1486))
    (if (cadr (in_ele gvar_1486))
      (progn
        (ls_som0 'in_style)
        (ls_options gvar_2991 1)
        (setq racdyn-calcvtx nil)
      )
    )
    (if (projet_pa_axes_st_desc (pt_deb gvar_2991) 'ha_poly)
      (progn
        (ls_som0 "Changements appliqués")
        (in_ent gvar_2991 'ha_poly)
        (ls_som0 'in_ent)
      )
    )
    (setq racdyn-calcvtx racdyn-calcvtx)
    (setq racdyn-calcvtx racdyn-calcvtx)
    (setq racdyn-calcvtx nil)
  )
  racdyn-calcvtx
)

;; Original arg hints: AOLEG-SIHLIN
;; Referenced symbols: RE_DELTADIST, ENTDEL, ES_EXT, AOLEG-SIHLIN, LS_SIHLIN, TRANS, ODCLBIB-FILLCOMBO, LS_COTE, AOLEG-POLY, PROJET/PA_AXES/CA_SOMMET
;; Referenced strings:  - 
(defun metz-handleget (aoleg-sihlin / ls_ext ls_ex re_deltadist local_1 local_2)
  (entdel 're_deltadist)
  (setq st_blk (es_ext))
  aoleg-sihlin_2
  (if (odclbib-fillcombo (trans 'ls_sihlin) 1)
    (progn
      " - "
    )
    (progn
      'ls_cote
    )
  )
  (setq local_2 (aoleg-poly (=)))
  ;; init-args 3: '(en_leg eo_leg pt_dyn pt_ins re_angle re_side1 re_side2 re_dist), nil
  (aoleg-poly local_2)
  (while (setq gvar_1966 (aoleg-poly local_2))
    (if (laybib-newlay (projet_pa_axes_ca_sommet gvar_1966) re_deltadist)
      (progn
        (setq st_blk (st_rayon st_blk (es_ext (polar (rem gvar_1966)))))
      )
    )
  )
  (bo_select local_2)
  st_blk
)

;; Original arg hints: *IN_ELE*, LS_EX, ST_EXT
;; Referenced symbols: ENTDEL, *IN_ELE*, VA_ABSP, AOBIB-GETNOM, EN_ENTP, LS_EX, dcl-forcedwgredraw, LD_MOD, ST_TXTVALUE, ST_EXT
(defun metz-visi (*in_ele* ls_ex st_ext / local_3 local_4)
  (entdel '(va_ent en_ref va_absp re_absp pt_proj re_abs))
  (setq local_3 *in_ele*_2)
  ;; init-args 3: 'va_absp, nil
  nil
  (foreach va_absp local_3
    (setq local_4 (aobib-getnom va_absp))
    ;; init-args 3: 'en_entp, nil
    nil
    (foreach en_entp local_4
      (if ls_ex_2
        (progn
          (ld_mod (dcl-forcedwgredraw en_entp) ld_mod)
        )
        (progn
          (ld_mod (dcl-forcedwgredraw en_entp) st_txtvalue)
        )
      )
      (if st_ext_2
        (progn
          (re_absp (dcl-forcedwgredraw en_entp) ld_mod)
        )
        (progn
          (re_absp (dcl-forcedwgredraw en_entp) st_txtvalue)
        )
      )
    )
  )
)

;; Original arg hints: AOPORA-FIN, LS_EX
;; Referenced symbols: POLY-ENTINT, ENTDEL, AOPORA-FIN, vla-put-InsertionPoint, LS_EX, dcl-forcedwgredraw, LD_MOD, ST_TXTVALUE
(defun metz-entvisi (aopora-fin ls_ex / local_2)
  (entdel 'poly-entint)
  (setq local_2 aopora-fin_2)
  ;; init-args 3: 'vla-put-insertionpoint, nil
  nil
  (foreach vla-put-insertionpoint local_2
    (if ls_ex_2
      (progn
        (ld_mod (dcl-forcedwgredraw vla-put-insertionpoint) ld_mod)
      )
      (progn
        (ld_mod (dcl-forcedwgredraw vla-put-insertionpoint) st_txtvalue)
      )
    )
  )
)

;; Original arg hints: *IN_ELE*
;; Referenced symbols: ENTDEL, ES_EXT, *IN_ELE*, IN_FIN, AXEDYN-REACCREATE, RE_X, PROJET/MD_SELBLK/BT_PICK, BO_PICK, PROJET/MD_SELBLK/BT_FILE, LS_ELEM
(defun metz-zon2ent (*in_ele* / local_1 local_2)
  (entdel '(ls_mpolydyn ha_poly en_poly in_ent ls_ent ls_deb ls_fin ls_som va_ent va_deb va_fin re_deb pt_deb re_absdeb))
  (setq listbib-getfirstover (es_ext))
  (setq projet_md_selblk_ls_blk nil)
  (setq local_1 *in_ele*_2)
  ;; init-args 3: 'in_fin, nil
  (foreach in_fin local_1
    (setq projet_md_selblk_bv_bloc (axedyn-reaccreate in_fin))
    (setq projet_md_selblk_st_blk (re_x in_fin))
    (setq projet_md_selblk_bt_pick (va_bande in_fin))
    (setq gvar_2473 (es_ext))
    (setq local_2 projet_md_selblk_bt_pick)
    ;; init-args 3: 'bo_pick, nil
    (foreach bo_pick local_2
      (if bo_pick
        (progn
          (setq bo_pick (polybib-lwvertices 'es_ext (ls_elem 'projet_md_selblk_bt_file bo_pick)))
          (setq ls_propsdescs (*en_ray* bo_pick (es_ext (groupbib-list '(ss_blk ls_blk) ld_mod))))
          (setq gvar_2473 (st_rayon gvar_2473 (es_ext ls_propsdescs)))
          (setq bo_file (projet_md_metzon_hachures1 bo_file ls_propsdescs))
        )
        (progn
          (setq projet_md_selblk_ls_blk polybib-vtxjoin)
        )
      )
    )
    (setq listbib-getfirstover (st_rayon listbib-getfirstover (es_ext (es_ext projet_md_selblk_bv_bloc projet_md_selblk_st_blk gvar_2473))))
  )
  (if projet_md_selblk_ls_blk
    (progn
      (projet_md_selblk listbib-getfirstover)
      (setq listbib-getfirstover nil)
    )
  )
  listbib-getfirstover
)

;; Original arg hints: arg_1
;; Referenced symbols: ENTDEL, IN_FIN, LS_PROPSDESCS, LS_SOM0
;; Referenced strings: To Do: code must be added to event handler\r\nc:Projet/MD_SelBlk/BT_File#OnClicked
(defun metz-entdel (arg_1 / local_1 local_2)
  (entdel "To Do: code must be added to event handler\r\nc:Projet/MD_SelBlk/BT_File#OnClicked")
  (setq local_1 gvar_1462)
  ;; init-args 3: 'in_fin, nil
  (foreach in_fin local_1
    (setq local_2 (va_bande in_fin))
    ;; init-args 3: 'ls_propsdescs, nil
    (foreach ls_propsdescs local_2
      (column ls_propsdescs)
    )
  )
  (ls_som0)
)

;; Referenced symbols: POLAR, PROJET/PA_MPOLYDYN/BT_AMONT, RE_ANGLE0, EO_POLYABS, PROJET/PA_DETAIL/BTN_PARAM, RE_ANGLE, BLKPOLY-MOD-PARAMUPDATE, GR_ELEMENTS-FILL, PROJET/PA_MPOLYDYN/BO_INV, IN_BLOCK
;; Referenced strings: Fin BlKPoly-XY2WCS, \nCopie dans le presse papier en cours...
(defun metz-ent2list ( / st_nom in_style st_style bo_closed local_0)
  (setq projet_pa_mpolydyn_bt_amont (polar in_style))
  (or (or (re_angle (eo_polyabs (re_angle0 0 projet_pa_mpolydyn_bt_amont)) 'projet_pa_detail_btn_param) (re_angle (eo_polyabs (re_angle0 0 projet_pa_mpolydyn_bt_amont)) "Fin BlKPoly-XY2WCS")) (re_angle (eo_polyabs (re_angle0 0 projet_pa_mpolydyn_bt_amont)) 'blkpoly-mod-paramupdate))
  (setq mpolydyndial-changeamontaval 'gr_elements-fill)
  (setq mpolydyndial-changeamontaval 'projet_pa_mpolydyn_bo_inv)
  (setq mpolydyndial-changeamontaval "\nCopie dans le presse papier en cours...")
  (ld_chem (in_block in_style))
)

;; Original arg hints: IN_INV, arg_2
;; Referenced symbols: ENTDEL, ES_EXT, IN_INV, EN_POLY, RE_ANGLE, POLYBIB-SUBPOLYBISINV, LS_EXT2, ST_QUANT, PROJET/PA_DETAIL/BTN_PARAM, POLYBIB-VTXJOIN
;; Referenced strings: choix du bloc, Fin BlKPoly-XY2WCS
(defun metz-ls_propvals (in_inv arg_2 / local_2)
  (entdel "choix du bloc")
  (setq gvar_1458 (es_ext))
  (setq local_2 in_inv_2)
  ;; init-args 3: '(st_nom in_style st_style bo_closed), nil
  (foreach gvar_1486 local_2
    (setq polybib-subpolybisinv (laybib-list gvar_1486))
    (setq laybib-list 'en_poly)
    (or (or (and (re_angle 'en_poly gvar_1811) (and (ls_ext2 "Fin BlKPoly-XY2WCS" polybib-subpolybisinv) (ls_ext2 'st_quant gvar_1811))) (ls_ext2 'projet_pa_detail_btn_param polybib-subpolybisinv)) polybib-vtxjoin)
    (setq laybib-list 'en_poly)
    (setq laybib-list (projet_md_picklayer_gr_layers (dcl-forcedwgredraw gvar_1486) gvar_1811))
    (projet_md_picklayer_st_layer gvar_1486)
    (if (cadr (setq laybib-list (projet_md_picklayer_st_layer gvar_1486)))
      (progn
        (ls_som0 'c:projet_md_picklayer_oninitialize)
      )
    )
    (setq laybib-list 1)
    (if laybib-list
      (progn
        (setq gvar_1458 (dcl-grid-setcurcell gvar_1458 (groupbib-list gvar_1486 laybib-list)))
      )
    )
  )
  gvar_1458
)

;; Referenced symbols: AXEDYN-SETRAYEXT
(defun mpolydyn-list ()
  (axedyn-setrayext '(lambda (ls_importconf) (= st_sourceid (listbib-key (cdr ls_importconf) "st_SourceId"))))
)

;; Original arg hints: INTERS
;; Referenced symbols: C:PROJET/MD_PICKLAYER/GR_LAYERS#ONSELCHANGED, ENTDEL, ES_EXT, INTERS, RE_COURANT, VA_ECHELLE, C:PROJET/MD_PICKLAYER/BT_OK#ONCLICKED, IN_PARAM, CADR, STYLEPOLY-FILLCOMBO
(defun mpolydyn-get (inters / local_1)
  (entdel 'c:projet_md_picklayer_gr_layers_onselchanged)
  (setq projet_md_picklayer (es_ext))
  (setq va_echelle (re_courant '(lambda (ls_importconf) (= st_sourceid (listbib-key (cdr ls_importconf) "st_SourceId"))) inters_2))
  (if (cadr (in_param va_echelle 'c:projet_md_picklayer_bt_ok_onclicked))
    (progn
      (setq local_1 (st_ray2 (in_param va_echelle 'stylepoly-fillcombo)))
      (while (<= local_1 0)
        (setq local_1 (1- local_1))
        (setq projet_md_picklayer (dcl-grid-setcurcell projet_md_picklayer 0))
      )
      (setq va_echelle (dcl-grid-setcurcell va_echelle (groupbib-list 'c:projet_md_picklayer_bt_ok_onclicked projet_md_picklayer)))
    )
  )
  (st_rayon (es_ext (groupbib-list 'st_type '(lambda (ls_importconf) (= st_sourceid (listbib-key (cdr ls_importconf) "st_SourceId"))))) va_echelle)
)

;; Original arg hints: INTERS, arg_2
;; Referenced symbols: C:PROJET/MD_PICKLAYER/GR_LAYERS#ONDBLCLICKED, ENTDEL, INTERS, ST_TYPE, RE_ANGLE0, BLKPOLYDIAL-GETPOINT, RTOS
(defun mpolydyn-set (inters arg_2)
  (entdel 'c:projet_md_picklayer_gr_layers_ondblclicked)
  (rtos '(lambda (ls_importconf) (= st_sourceid (listbib-key (cdr ls_importconf) "st_SourceId"))) inters_2 (blkpolydial-getpoint (re_angle0 'st_type gvar_3396) gvar_3396))
)

;; Referenced symbols: ENTDEL, AXEDYN-REACCREATE, RE_RAY, RE_X, CADR, PROJET/PA_DETAIL/VUEBLOCS1, dcl-control-setvisible, POLYDYN-GETPARENTS, RE_RAYII, PALBIB-INIT
;; Referenced strings: OC-Polydyns, Reconstruction des réacteurs des paramètres, Calcul de la polydyn impossible
(defun mpolydyn-add ( / in_id st_ind ld_polydyn local_0)
  (entdel "OC-Polydyns")
  (setq gvar_1861 (re_ray (hachbib-vtxs2hach (axedyn-reaccreate st_ind))))
  (setq gvar_3242 (re_y gvar_1861 (re_x st_ind)))
  (if (cadr gvar_2956)
    (progn
      projet_pa_detail_vueblocs1
    )
    (progn
      (dcl-control-setvisible gvar_1861 gvar_3242)
    )
  )
  (setq gvar_2956 nil)
  (setq st_ind (projet_ml_progress gvar_1861))
  (setq ld_polydyn (projet_md_metprop gvar_1861))
  (setq gvar_1437 (es_ext (es_ext 'polydyn-getparents ld_polydyn (ls_absdyn gvar_1861 ld_polydyn) "Reconstruction des réacteurs des paramètres" 're_rayii (palbib-init gvar_1861 ld_polydyn)) (es_ext 'ls_absdyn gvar_1440 (ls_absdyn gvar_1861 gvar_1440) 'ls_paramentxy 're_rayii (palbib-init gvar_1861 gvar_1440)) (es_ext "Calcul de la polydyn impossible" st_ind (ls_absdyn ls_state st_ind) 're_rayii "Reconstruction des réacteurs des paramètres" (palbib-init ls_state st_ind)) (es_ext 'polydyn-getvtxs ld_polydyn (ls_absdyn ls_state ld_polydyn) 're_rayii 'ls_paramentxy (palbib-init ls_state ld_polydyn))))
  (setq axedyn-list (polydyn-getvtxs gvar_1437 gvar_2956))
  (setq aopora-fin (dcl-grid-setcurcell aopora-fin (axedyn-reaccreate gvar_1435)))
  (setq ls_importsources (dcl-grid-setcurcell ls_importsources gvar_1434))
  (setq poly-vlatrace (dcl-grid-setcurcell poly-vlatrace (dcl-grid-addrow 3 axedyn-list)))
  (setq gvar_1434 (dcl-grid-addrow 4 axedyn-list))
  (setq gvar_1435 st_ind)
  (setq ls_state gvar_1861)
  (setq gvar_3244 gvar_3242)
  (setq ld_polydyn st_ind)
  ld_polydyn
  (setq gvar_1440 ld_polydyn)
)

;; Original arg hints: arg_1, PROJET/MD_REPBLK/CB_BLK2
;; Referenced symbols: EN_POLYDYN, ENTDEL, AOPORA-FIN, AXEDYN-REACCREATE, RE_RAY, POLY-VLATRACE, LS_OFF, RE_ANGLE, LS_PARAMENTXY, RE_RAYII
;; Referenced strings: Reconstruction des réacteurs des paramètres
(defun mpolydyn-first (arg_1 projet_md_repblk_cb_blk2)
  (entdel 'en_polydyn)
  (setq ls_state (re_ray (hachbib-vtxs2hach (axedyn-reaccreate aopora-fin))))
  (setq ls_off (axedyn-reaccreate poly-vlatrace))
  (or (or (re_angle ls_off "Reconstruction des réacteurs des paramètres") (re_angle ls_off 'ls_paramentxy)) (re_angle ls_off 're_rayii))
  (setq ls_visiname (palbib-init ls_state projet_md_repblk_cb_blk2_2))
  (setq gvar_1861 (re_ray (hachbib-vtxs2hach (re_x aopora-fin))))
  (setq in_som (re_x ls_importsources))
  (or (re_angle in_som "Reconstruction des réacteurs des paramètres") (re_angle in_som 'ls_paramentxy))
  (setq in_som (projet_md_metprop gvar_1861))
  (setq in_som (projet_ml_progress gvar_1861))
  (setq polydyn-getabs (palbib-init ls_state in_som))
  (if (repdyn-getpoint ls_visiname polydyn-getabs)
    (progn
      (setq polydyn-getoffset "Reconstruction des réacteurs des paramètres")
    )
    (progn
      (setq polydyn-getoffset 'ls_paramentxy)
    )
  )
  (setq polydyn-getoffset "Reconstruction des réacteurs des paramètres")
  (setq polydyn-getoffset 'ls_paramentxy)
  (setq ls_importsources (st_rayon (es_ext polydyn-getoffset) (eo_polyabs ls_importsources)))
  (st_rayon (es_ext ls_off) (eo_polyabs poly-vlatrace))
  (setq poly-vlatrace (st_rayon (es_ext ls_off) (eo_polyabs poly-vlatrace)))
)

;; Original arg hints: arg_1, LS_STATE, arg_3
;; Referenced symbols: RE_OFF, ENTDEL, LS_STATE, ST_PARAM, RE_ANGLE, LS_PARAMENTXY, RE_RAYII, POLY-VLATRACE, AOPORA-FIN, RE_RAY
;; Referenced strings: Reconstruction des réacteurs des paramètres
(defun mpolydyn-last (arg_1 ls_state arg_3 / in_som ls_ldata en_ref ls_soms ls_som re_abs re_off pt_abs re_angle pt_dyn re_absdyn local_2)
  (entdel 're_off)
  (setq gvar_3388 (st_param ls_state_2 gvar_3244))
  (or (or (re_angle gvar_1434 "Reconstruction des réacteurs des paramètres") (re_angle gvar_1434 'ls_paramentxy)) (re_angle gvar_1434 're_rayii))
  (setq gvar_3161 (1- poly-vlatrace))
  (setq ls_propsdescs (re_ray (hachbib-vtxs2hach (1- aopora-fin))))
  (or (re_angle gvar_3161 "Reconstruction des réacteurs des paramètres") (re_angle gvar_3161 'ls_paramentxy))
  (setq re_absdyn (projet_md_metprop ls_propsdescs))
  (setq re_absdyn (projet_ml_progress ls_propsdescs))
  (setq projet_pa_detail_vueblocs1 (st_param ls_state_2 re_absdyn))
  (if (repdyn-getpoint gvar_3388 projet_pa_detail_vueblocs1)
    (progn
      (setq re_absdyn "Reconstruction des réacteurs des paramètres")
    )
    (progn
      (setq re_absdyn 'ls_paramentxy)
    )
  )
  (setq re_absdyn "Reconstruction des réacteurs des paramètres")
  (setq re_absdyn 'ls_paramentxy)
  (setq aopora-fin (dcl-grid-setcurcell aopora-fin (axedyn-reaccreate gvar_1435)))
  (setq ls_importsources (dcl-grid-setcurcell ls_importsources gvar_1434))
  (dcl-grid-setcurcell poly-vlatrace re_absdyn)
  (setq poly-vlatrace (dcl-grid-setcurcell poly-vlatrace re_absdyn))
)

;; Original arg hints: IN_LON0, AOPORA-FIN, LS_IMPORTSOURCES, POLY-VLATRACE, Projet/MD_PickLayer
;; Referenced symbols: POLYDYN-SELABS, ENTDEL, /, ST_AXEID, INTERS, dcl-control-setenabled, LS_AXES, GROUPBIB-LIST, LS_OBJ, IN_LON0
;; Referenced strings: \nBoucle sur les sources, Choix du repère
(defun mpolydyn-create (in_lon0 aopora-fin ls_importsources poly-vlatrace projet_md_picklayer / ls_soms ha_ref en_ref ha_poly en_polydyn local_1)
  (entdel 'polydyn-selabs)
  (st_sourceid en_rayon gvar_1423)
  (re_abs2 (groupbib-list '(lambda (ls_importconf) (= st_sourceid (listbib-key (cdr ls_importconf) "st_SourceId"))) en_rayon) gvar_3094)
  (setq inters (st_axeid (/ '(lambda (ls_importconf) (= st_sourceid (listbib-key (cdr ls_importconf) "st_SourceId"))))))
  (setq en_rayon (dcl-control-setenabled inters))
  (setq gvar_1423 (es_ext (groupbib-list 'ls_axes inters) (groupbib-list 'ls_obj in_lon0_2) (groupbib-list '*st_axedynid* in_lon0_2) (groupbib-list 'ls_importfilters nil) (groupbib-list 'stylepoly-fillcombo aopora-fin_2) (groupbib-list "\nBoucle sur les sources" ls_importsources_2) (groupbib-list 'ls_importsource poly-vlatrace_2) (groupbib-list 'c:projet_md_picklayer_bt_ok_onclicked projet_md_picklayer_2) (groupbib-list 'dcl-form-show gvar_1426) (groupbib-list 'va_inters 0) (groupbib-list 'ls_somnew 0)))
  (setq gvar_3155 "Choix du repère")
  (setq gvar_3155 'polydyn-seloffset)
  (setq gvar_3265 (st_linkpath en_rayon))
  (setq gvar_3155 'ls_offnew)
  (setq gvar_3094 (ls_offnew gvar_1423))
  (dcl-control-setenabled inters)
)

;; Original arg hints: arg_1
;; Referenced symbols: IN_SOMNEW, ENTDEL, ES_EXT, IN_PARAM, STYLEPOLY-FILLCOMBO, LS_IMPORTSOURCE, AOPORA-FIN, ST_SOURCEID, dcl-grid-setcurcell, LS_IMPORTSOURCES
;; Referenced strings: \nBoucle sur les sources
(defun mpolydyn-getparents (arg_1 / local_1)
  (entdel 'in_somnew)
  (setq gvar_3094 (es_ext))
  (setq ls_importsources (in_param gvar_1423 "\nBoucle sur les sources"))
  (setq aopora-fin (in_param gvar_1423 'stylepoly-fillcombo))
  (setq poly-vlatrace (in_param gvar_1423 'ls_importsource))
  (setq local_1 aopora-fin)
  ;; init-args 3: 'st_sourceid, nil
  (foreach st_sourceid local_1
    (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 st_sourceid))
  )
  (setq local_1 (st_rayon ls_importsources poly-vlatrace))
  ;; init-args 3: 'st_sourceid, nil
  (foreach st_sourceid local_1
    (if (re_abs2 st_sourceid)
      (progn
        (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 (groupbib-list 're_abs2 st_sourceid)))
      )
    )
  )
  gvar_3094
)

;; Original arg hints: INTERS
;; Referenced symbols: ENTDEL, DCL-GRID-CLEAR, INTERS, PROJET/MD_METPROP/BT_LAYER, STYLEPOLY-FILLCOMBO, IN_PARAM, LS_IMPORTSOURCE, C:PROJET/MD_PICKLAYER/BT_OK#ONCLICKED, LS_SOMNEW, dcl-form-show
;; Referenced strings: re_absMod, \nBoucle sur les sources
(defun mpolydyn-popgo (inters)
  (entdel "re_absMod")
  (if (and gvar_3345 (dcl-grid-clear gvar_1417))
    (progn
      (setq gvar_1423 gvar_3345)
    )
    (progn
      (setq gvar_1423 (projet_md_metprop_bt_layer inters_2))
    )
  )
  (in_param gvar_1423 'stylepoly-fillcombo)
  (in_param gvar_1423 "\nBoucle sur les sources")
  (in_param gvar_1423 'ls_importsource)
  (in_param gvar_1423 'c:projet_md_picklayer_bt_ok_onclicked)
  (in_param gvar_1423 'ls_somnew)
  (polydyn-makesom)
  (polydyn-makesom (in_param gvar_1423 'dcl-form-show))
  (pt_proj (in_param gvar_1423 'dcl-form-show))
  (dcl-grid-setcurcell polybib_geom-bulge2radius (groupbib-list 70 (st_syle 128 gvar_1416)))
  (if (and (and gvar_1423 (setq aopora-fin (in_param gvar_1423 'stylepoly-fillcombo)) (setq ls_importsources (in_param gvar_1423 "\nBoucle sur les sources")) (setq poly-vlatrace (in_param gvar_1423 'ls_importsource)) (setq projet_md_picklayer (in_param gvar_1423 'c:projet_md_picklayer_bt_ok_onclicked)) (setq gvar_1416 (in_param gvar_1423 'ls_somnew)) (setq dcl-form-close (polydyn-makesom)) (setq gvar_2519 (polydyn-makesom (in_param gvar_1423 'dcl-form-show))) (setq polybib_geom-bulge2radius (pt_proj (in_param gvar_1423 'dcl-form-show))) (setq polybib_geom-bulge2radius (dcl-grid-setcurcell polybib_geom-bulge2radius (groupbib-list 70 (st_syle 128 gvar_1416))))) (and (re_angle gvar_1416 1) (ls_ext2 'ha_poly (pt_ref (in_param (axedyn-reaccreate dcl-form-close) 10) (in_param (1- dcl-form-close) 10)) 'polydyn-makelists)))
    (progn
      (setq dcl-form-close (vl-acad-defun dcl-form-close))
    )
  )
  (in_param gvar_1423 'ls_importfilters)
  (en_refoffset gvar_3265)
  (if (and (setq gvar_3265 (in_param gvar_1423 'ls_importfilters)) (setq ls_propsdescs (en_refoffset gvar_3265)))
    (progn
      (sssetfirst ls_propsdescs dcl-form-close polybib_geom-bulge2radius)
    )
    (progn
      (setq ls_propsdescs (*en_ray* dcl-form-close polybib_geom-bulge2radius))
      (setq gvar_3265 (1- ls_propsdescs))
      (setq gvar_1423 (st_rayon gvar_1423 'ls_importfilters gvar_3265))
      (st_sourceid inters_2 gvar_1423)
    )
  )
  T
  gvar_3265
  T
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: EN_RAYON, RE_YINV, PROJET/MD_METPROP/BT_LAYER, vlax-erased-p
(defun mpolydyn-modgo (en_rayon)
  (setq re_yinv en_rayon_2)
  (setq gvar_3345 (projet_md_metprop_bt_layer re_yinv))
  (setq ls_groupparent gvar_3345)
  (vlax-erased-p gvar_1417)
)

;; Referenced symbols: EO_BLKPARAM, GROUPBIB-LIST, LS_PARAMENTXY, BLKBIB-BLK_TEMP, RE_RAYII, POLYDYN-TRACEREP, EG_BLKBASE, BLKPOLY-POLY, ES_EXT, IN_PARAM
;; Referenced strings: Reconstruction des réacteurs des paramètres, ha_parent, \nBoucle sur les sources
(defun c:projet_pa_mpolydyn_oninitialize ()
  (in_param gvar_3345 'dcl-form-show)
  (ls_vtx0 gvar_1409 (polybib-lwvertices 'eo_polyabs projet_pa_polydyn))
  (ls_vtx0 gvar_1408 (polybib-lwvertices 'eo_polyabs projet_pa_polydyn))
  (ls_vtx0 en_rep (polybib-lwvertices 'ha_polyext (ls_dist)))
  (setq projet_pa_polydyn (es_ext (groupbib-list "Reconstruction des réacteurs des paramètres" 'eo_blkparam) (groupbib-list 'ls_paramentxy 'blkbib-blk_temp) (groupbib-list 're_rayii '(inc ls_filters ls_filter)) (groupbib-list '(lambda (ls_elem) (= "H" (listbib-key ls_elem "st_type"))) 'polydyn-tracerep) (groupbib-list '(re_x re_y pt_poly re_anglepoly re_angle) 'eg_blkbase) (groupbib-list 'blkpoly-poly "ha_parent")))
  (setq ls_importsources (in_param gvar_3345 "\nBoucle sur les sources"))
  (setq aopora-fin (in_param gvar_3345 'stylepoly-fillcombo))
  (setq poly-vlatrace (in_param gvar_3345 'ls_importsource))
  (setq polydyn-edit-fillgrid (re_ray (hachbib-vtxs2hach (dcl-grid-addrow 0 aopora-fin))))
  (if (laybib-newlay (in_param gvar_3345 'dcl-form-show) (polybib-lwvertices 'axedyn-reaccreate (ls_dist)))
    (progn
      (bo_invpoly1 en_rep (laybib-newlay (in_param gvar_3345 'dcl-form-show) (polybib-lwvertices 'axedyn-reaccreate (ls_dist))))
    )
  )
  (bo_lctabs gvar_1406 (en_polyabs gvar_3345 'ls_obj 'st_abs))
  (ls_vtx0 re_absmod (es_ext 'st_offset 'va_offset))
  (bo_invpoly1 re_absmod (in_param gvar_3345 'ls_somnew))
  (st_num re_offsetmod 0)
  (va_pente)
  (ls_som0)
)

;; Original arg hints: RE_PENTEMOD
;; Referenced symbols: RE_PENTEMOD, UNDOBIB-START, ES_EXT, RE_ANGLE, AXEDYN-REACCREATE, Projet/PA_Polydyn, POLYBIB-LWVERTICES, POLYBIB-VTXJOIN, BLKPOLY-POLY
(defun mpolydyndial-getpos (re_pentemod)
  nil
  (or (or (or (re_angle (undobib-start re_pentemod_2) 'es_ext) (en_txt re_pentemod_2)) (laybib-newlay re_pentemod_2 (polybib-lwvertices 'axedyn-reaccreate projet_pa_polydyn))) polybib-vtxjoin)
  0
  (laybib-newlay re_pentemod_2 (polybib-lwvertices 'axedyn-reaccreate projet_pa_polydyn))
  (laybib-newlay '(re_x re_y pt_poly re_anglepoly re_angle) (polybib-lwvertices 'axedyn-reaccreate projet_pa_polydyn))
  (laybib-newlay 'blkpoly-poly (polybib-lwvertices 'axedyn-reaccreate projet_pa_polydyn))
)

;; Original arg hints: EQ, NETBIB-PURGEBLOCK
;; Referenced symbols: ENTDEL, POLYDYN-EDIT-FILLGRID, EQ, POLYBIB-PERPOINT, IN_PARAM, STYLEPOLY-FILLCOMBO, LS_IMPORTSOURCE, C:PROJET/MD_PICKLAYER/BT_OK#ONCLICKED, AOPORA-FIN, DCL-GRID-ADDROW
;; Referenced strings: va_pente, \nBoucle sur les sources, Reconstruction des réacteurs des paramètres
(defun c:projet_pa_mpolydyn_gr_elements_onselchanged (eq netbib-purgeblock)
  (entdel "va_pente")
  (sihpp-list gvar_1397)
  (polybib-perpoint polydyn-edit-fillgrid nil)
  (setq polybib-perpoint eq_2)
  (if (re_deltax polybib-perpoint 0)
    (progn
      (bo_invpoly1 gvar_1409 (aopora-deb pt_pas))
      (bo_invpoly1 gvar_1408 (aopora-deb ls_inters1))
      (st_num re_offsetmod pt_absdyn)
      (re_1 gvar_1392 pt_pas gvar_1409 re_1)
      (re_1 gvar_1392 ls_inters1 gvar_1408 re_2)
      (polybib-perpoint polydyn-edit-fillgrid 1)
      (setq ls_importsources (in_param gvar_3345 "\nBoucle sur les sources"))
      (setq aopora-fin (in_param gvar_3345 'stylepoly-fillcombo))
      (setq poly-vlatrace (in_param gvar_3345 'ls_importsource))
      (setq projet_md_picklayer (in_param gvar_3345 'c:projet_md_picklayer_bt_ok_onclicked))
      (setq polydyn-edit-fillgrid (re_ray (hachbib-vtxs2hach (dcl-grid-addrow polybib-perpoint aopora-fin))))
      (setq pt_pas (dcl-grid-addrow polybib-perpoint ls_importsources))
      (setq ls_inters1 (dcl-grid-addrow polybib-perpoint poly-vlatrace))
      (setq pt_absdyn (dcl-grid-addrow polybib-perpoint projet_md_picklayer))
      (setq gvar_1392 (dcl-grid-addrow (aopora-deb pt_pas) (polybib-lwvertices 'axedyn-reaccreate projet_pa_polydyn)))
      (setq gvar_1392 (dcl-grid-addrow (aopora-deb ls_inters1) (polybib-lwvertices 'axedyn-reaccreate projet_pa_polydyn)))
      (if (polar polydyn-edit-fillgrid)
        (progn
          (setq polydyncc (ls_vtxs2 polybib-perpoint (dcl-grid-addrow polybib-perpoint ls_importsources) "Reconstruction des réacteurs des paramètres"))
          (setq gvar_1386 (ls_vtxs2 polybib-perpoint (dcl-grid-addrow polybib-perpoint poly-vlatrace) 'ls_paramentxy))
          (setq pt_absdyn (odclbib-fillcombo 1 (dcl-grid-addrow polybib-perpoint projet_md_picklayer)))
          (if (projet_pa_axes_st_desc polydyncc gvar_1386)
            (progn
              (ls_options (dcl-forcedwgredraw gvar_1397) 80)
              (ls_options (dcl-forcedwgredraw gvar_1397) 're_long)
              (ls_options (dcl-forcedwgredraw gvar_1397) 4)
              (boxlib-optionbox gvar_1397 4)
              (setq dcl-form-close (polycc-side polydyn-edit-fillgrid polydyncc gvar_1386 pt_absdyn))
              (setq gvar_1397 (gr_filterupdate dcl-form-close nil))
            )
          )
        )
        (progn
          (bordyn-inters 'pt_c1)
        )
      )
    )
  )
  (bo_visible)
  (ls_som0)
)

;; Original arg hints: EQ, NETBIB-PURGEBLOCK
;; Referenced symbols: POLYBIB-VTXJOIN, PT_C2
(defun c:projet_pa_mpolydyn_gr_elements_ondblclicked (eq netbib-purgeblock)
  (pt_c2 gvar_1397 polybib-vtxjoin)
)

;; Referenced symbols: RE_1MAX, ENTDEL, POLYBIB-PERPOINT, ST_BLKBASE, PT_PROJ1, RE_YINV, GROUPBIB-LIST, PT_PROJ2, PT_TAN, AXEDYN-REACCREATE
;; Referenced strings: \nBoucle sur les sources, Reconstruction des réacteurs des paramètres
(defun c:projet_pa_mpolydyn_bt_insert_onclicked ()
  (entdel 're_1max)
  (pt_proj2 'pt_proj1 nil (groupbib-list '(lambda (ls_importconf) (= st_sourceid (listbib-key (cdr ls_importconf) "st_SourceId"))) re_yinv))
  (re_ray (hachbib-vtxs2hach (axedyn-reaccreate pt_tan)))
  (re_ray (in_param gvar_3345 'ls_importfilters))
  (re_x pt_tan)
  (blkpoly-lsparams polybib-perpoint 0)
  (setq ls_importsources (in_param gvar_3345 "\nBoucle sur les sources"))
  (setq aopora-fin (in_param gvar_3345 'stylepoly-fillcombo))
  (setq poly-vlatrace (in_param gvar_3345 'ls_importsource))
  (in_param gvar_3345 'c:projet_md_picklayer_bt_ok_onclicked)
  (projet_ml_progress ls_propsdescs)
  (projet_md_metprop ls_propsdescs)
  (palbib-init pt_inters polycc-tanint)
  (palbib-init pt_inters polycc-tanext)
  (polybib_geom-arc->bulge re_yinv chemdyn-hachtrace)
  (polybib_geom-arc->bulge re_yinv gvar_2532)
  nil
  (and (and (and (and (and polybib-perpoint (st_blkbase polybib-perpoint 255) (setq pt_tan (pt_proj2 'pt_proj1 nil (groupbib-list '(lambda (ls_importconf) (= st_sourceid (listbib-key (cdr ls_importconf) "st_SourceId"))) re_yinv))) (setq ls_propsdescs (re_ray (hachbib-vtxs2hach (axedyn-reaccreate pt_tan)))) (setq pt_inters (re_ray (in_param gvar_3345 'ls_importfilters))) (setq gvar_2767 (re_x pt_tan)) (setq re_2max (blkpoly-lsparams polybib-perpoint 0)) (setq projet_md_picklayer (in_param gvar_3345 'c:projet_md_picklayer_bt_ok_onclicked)) (setq polycc-tanint (projet_ml_progress ls_propsdescs)) (setq polycc-tanext (projet_md_metprop ls_propsdescs)) (setq chemdyn-hachtrace (palbib-init pt_inters polycc-tanint)) (setq gvar_2532 (palbib-init pt_inters polycc-tanext)) (setq re_bu1 (polybib_geom-arc->bulge re_yinv chemdyn-hachtrace)) (setq re_bu2 (polybib_geom-arc->bulge re_yinv gvar_2532))) (and (ls_ext2 polybib-perpoint re_bu2) (ls_ext2 polybib-perpoint re_bu1) (repdyn-getpoint chemdyn-hachtrace gvar_2532))) (and (ls_ext2 polybib-perpoint re_bu2) (ls_ext2 polybib-perpoint re_bu1) (st_blkbase chemdyn-hachtrace gvar_2532))) (repdyn-getpoint chemdyn-hachtrace gvar_2532)) (st_blkbase chemdyn-hachtrace gvar_2532))
  (setq aopora-fin (blkpoly-insdetail (axedyn-reaccreate pt_tan) re_2max aopora-fin))
  (setq ls_importsources (blkpoly-insdetail 'ls_paramentxy re_2max ls_importsources))
  (setq poly-vlatrace (blkpoly-insdetail "Reconstruction des réacteurs des paramètres" re_2max poly-vlatrace))
  (blkpoly-insdetail 0 re_2max projet_md_picklayer)
  (setq projet_md_picklayer (blkpoly-insdetail 0 re_2max projet_md_picklayer))
  (setq aopora-fin (blkpoly-insdetail (axedyn-reaccreate pt_tan) re_2max aopora-fin))
  (setq ls_importsources (blkpoly-insdetail "Reconstruction des réacteurs des paramètres" re_2max ls_importsources))
  (setq poly-vlatrace (blkpoly-insdetail 'ls_paramentxy re_2max poly-vlatrace))
  (blkpoly-insdetail 0 re_2max projet_md_picklayer)
  (setq projet_md_picklayer (blkpoly-insdetail 0 re_2max projet_md_picklayer))
  (setq aopora-fin (blkpoly-insdetail (dcl-grid-addrow polybib-perpoint aopora-fin) re_2max aopora-fin))
  (setq aopora-fin (blkpoly-insdetail (axedyn-reaccreate pt_tan) (st_axeid re_2max) aopora-fin))
  (setq ls_importsources (blkpoly-insdetail 'ls_paramentxy re_2max ls_importsources))
  (setq ls_importsources (blkpoly-insdetail 're_rayii re_2max ls_importsources))
  (setq poly-vlatrace (blkpoly-insdetail "Reconstruction des réacteurs des paramètres" re_2max poly-vlatrace))
  (setq poly-vlatrace (blkpoly-insdetail 're_rayii re_2max poly-vlatrace))
  (setq projet_md_picklayer (blkpoly-insdetail 0 re_2max projet_md_picklayer))
  (blkpoly-insdetail 0 re_2max projet_md_picklayer)
  (setq projet_md_picklayer (blkpoly-insdetail 0 re_2max projet_md_picklayer))
  T
  (setq aopora-fin (blkpoly-insdetail (dcl-grid-addrow polybib-perpoint aopora-fin) re_2max aopora-fin))
  (setq aopora-fin (blkpoly-insdetail (axedyn-reaccreate pt_tan) (st_axeid re_2max) aopora-fin))
  (setq ls_importsources (blkpoly-insdetail "Reconstruction des réacteurs des paramètres" re_2max ls_importsources))
  (setq ls_importsources (blkpoly-insdetail 're_rayii re_2max ls_importsources))
  (setq poly-vlatrace (blkpoly-insdetail 'ls_paramentxy re_2max poly-vlatrace))
  (setq poly-vlatrace (blkpoly-insdetail 're_rayii re_2max poly-vlatrace))
  (setq projet_md_picklayer (blkpoly-insdetail 0 re_2max projet_md_picklayer))
  (blkpoly-insdetail 0 re_2max projet_md_picklayer)
  (st_rayon gvar_3345 "\nBoucle sur les sources" ls_importsources)
  (st_rayon gvar_3345 'stylepoly-fillcombo aopora-fin)
  (st_rayon gvar_3345 'ls_importsource poly-vlatrace)
  (st_rayon gvar_3345 'c:projet_md_picklayer_bt_ok_onclicked projet_md_picklayer)
  (ls_som0)
  (and (setq projet_md_picklayer (blkpoly-insdetail 0 re_2max projet_md_picklayer)) (setq gvar_3345 (st_rayon gvar_3345 "\nBoucle sur les sources" ls_importsources)) (setq gvar_3345 (st_rayon gvar_3345 'stylepoly-fillcombo aopora-fin)) (setq gvar_3345 (st_rayon gvar_3345 'ls_importsource poly-vlatrace)) (setq gvar_3345 (st_rayon gvar_3345 'c:projet_md_picklayer_bt_ok_onclicked projet_md_picklayer)) (vlax-curve-getendparam gvar_3345) (va_pente) (en_hatch geombib-getinsideangle) (ls_group geombib-getinsideangle (st_axeid re_2max) 0) (st_linkpath re_yinv))
)

;; Referenced symbols: PT_CIBLE, ENTDEL, DCL-GRID-CLEAR, RE_YINV, GROUPBIB-LIST, PT_PROJ2, PT_TAN, AXEDYN-REACCREATE, RE_RAY, RE_X
;; Referenced strings: \nBoucle sur les sources, Reconstruction des réacteurs des paramètres
(defun c:projet_pa_mpolydyn_bt_add_onclicked ()
  (entdel 'pt_cible)
  T
  (pt_proj2 '(pt_1 pt_2) nil (groupbib-list '(lambda (ls_importconf) (= st_sourceid (listbib-key (cdr ls_importconf) "st_SourceId"))) re_yinv))
  (re_ray (hachbib-vtxs2hach (axedyn-reaccreate pt_tan)))
  (re_x pt_tan)
  (setq ls_importsources (in_param gvar_3345 "\nBoucle sur les sources"))
  (setq aopora-fin (in_param gvar_3345 'stylepoly-fillcombo))
  (setq poly-vlatrace (in_param gvar_3345 'ls_importsource))
  (in_param gvar_3345 'c:projet_md_picklayer_bt_ok_onclicked)
  (dcl-grid-setcurcell aopora-fin (axedyn-reaccreate pt_tan))
  (dcl-grid-setcurcell ls_importsources "Reconstruction des réacteurs des paramètres")
  (dcl-grid-setcurcell poly-vlatrace 'ls_paramentxy)
  (dcl-grid-setcurcell projet_md_picklayer 0)
  (st_rayon gvar_3345 "\nBoucle sur les sources" ls_importsources)
  (st_rayon gvar_3345 'stylepoly-fillcombo aopora-fin)
  (st_rayon gvar_3345 'ls_importsource poly-vlatrace)
  (st_rayon gvar_3345 'c:projet_md_picklayer_bt_ok_onclicked projet_md_picklayer)
  (ls_som0)
  (and (dcl-grid-clear gvar_1417) (setq pt_tan (pt_proj2 '(pt_1 pt_2) nil (groupbib-list '(lambda (ls_importconf) (= st_sourceid (listbib-key (cdr ls_importconf) "st_SourceId"))) re_yinv))) (setq ls_propsdescs (re_ray (hachbib-vtxs2hach (axedyn-reaccreate pt_tan)))) (setq gvar_2767 (re_x pt_tan)) (setq projet_md_picklayer (in_param gvar_3345 'c:projet_md_picklayer_bt_ok_onclicked)) (setq aopora-fin (dcl-grid-setcurcell aopora-fin (axedyn-reaccreate pt_tan))) (setq ls_importsources (dcl-grid-setcurcell ls_importsources "Reconstruction des réacteurs des paramètres")) (setq poly-vlatrace (dcl-grid-setcurcell poly-vlatrace 'ls_paramentxy)) (setq projet_md_picklayer (dcl-grid-setcurcell projet_md_picklayer 0)) (setq gvar_3345 (st_rayon gvar_3345 "\nBoucle sur les sources" ls_importsources)) (setq gvar_3345 (st_rayon gvar_3345 'stylepoly-fillcombo aopora-fin)) (setq gvar_3345 (st_rayon gvar_3345 'ls_importsource poly-vlatrace)) (setq gvar_3345 (st_rayon gvar_3345 'c:projet_md_picklayer_bt_ok_onclicked projet_md_picklayer)) (va_pente) (st_linkpath re_yinv))
)

;; Referenced symbols: C1, ENTDEL, POLYBIB-PERPOINT, ST_BLKBASE, IN_PARAM, STYLEPOLY-FILLCOMBO, LS_IMPORTSOURCE, C:PROJET/MD_PICKLAYER/BT_OK#ONCLICKED, ST_AXEID, AOPORA-FIN
;; Referenced strings: \nBoucle sur les sources
(defun c:projet_pa_mpolydyn_bt_del_onclicked ()
  (entdel 'c1)
  (setq ls_importsources (in_param gvar_3345 "\nBoucle sur les sources"))
  (setq aopora-fin (in_param gvar_3345 'stylepoly-fillcombo))
  (setq poly-vlatrace (in_param gvar_3345 'ls_importsource))
  (in_param gvar_3345 'c:projet_md_picklayer_bt_ok_onclicked)
  nil
  (or (and (and polybib-perpoint (st_blkbase polybib-perpoint 255) (setq projet_md_picklayer (in_param gvar_3345 'c:projet_md_picklayer_bt_ok_onclicked))) (and (st_blkbase polybib-perpoint 0) (ls_ext2 (dcl-grid-addrow (st_axeid polybib-perpoint) aopora-fin) (dcl-grid-addrow (vla-get-name polybib-perpoint) aopora-fin)))) polybib-vtxjoin)
  (setq aopora-fin (ls_atts polybib-perpoint aopora-fin))
  (setq ls_importsources (ls_atts polybib-perpoint ls_importsources))
  (setq poly-vlatrace (ls_atts polybib-perpoint poly-vlatrace))
  (ls_atts polybib-perpoint projet_md_picklayer)
  (setq projet_md_picklayer (ls_atts polybib-perpoint projet_md_picklayer))
  T
  (setq aopora-fin (ls_atts (st_axeid polybib-perpoint) aopora-fin))
  (setq aopora-fin (ls_atts polybib-perpoint aopora-fin))
  (setq ls_importsources (ls_atts (st_axeid polybib-perpoint) ls_importsources))
  (setq ls_importsources (ls_atts polybib-perpoint ls_importsources))
  (setq poly-vlatrace (ls_atts (vla-get-name polybib-perpoint) poly-vlatrace))
  (setq poly-vlatrace (ls_atts (vla-get-name polybib-perpoint) poly-vlatrace))
  (setq projet_md_picklayer (ls_atts (st_axeid polybib-perpoint) projet_md_picklayer))
  (ls_atts polybib-perpoint projet_md_picklayer)
  (st_rayon gvar_3345 "\nBoucle sur les sources" ls_importsources)
  (st_rayon gvar_3345 'stylepoly-fillcombo aopora-fin)
  (st_rayon gvar_3345 'ls_importsource poly-vlatrace)
  (st_rayon gvar_3345 'c:projet_md_picklayer_bt_ok_onclicked projet_md_picklayer)
  (ls_som0)
  (and (setq projet_md_picklayer (ls_atts polybib-perpoint projet_md_picklayer)) (setq gvar_3345 (st_rayon gvar_3345 "\nBoucle sur les sources" ls_importsources)) (setq gvar_3345 (st_rayon gvar_3345 'stylepoly-fillcombo aopora-fin)) (setq gvar_3345 (st_rayon gvar_3345 'ls_importsource poly-vlatrace)) (setq gvar_3345 (st_rayon gvar_3345 'c:projet_md_picklayer_bt_ok_onclicked projet_md_picklayer)) (va_pente) (st_linkpath re_yinv))
)

;; Referenced symbols: C2, ENTDEL, IN_PARAM, STYLEPOLY-FILLCOMBO, LS_IMPORTSOURCE, GEOMBIB-GETINSIDEANGLE, *EN_INS*, AOPORA-FIN, vla-put-Rotation, ST_RAY2
;; Referenced strings: \nBoucle sur les sources
(defun gr_elements-fill ( / local_0)
  (entdel 'c2)
  (*en_ins* geombib-getinsideangle)
  (setq ls_importsources (in_param gvar_3345 "\nBoucle sur les sources"))
  (setq aopora-fin (in_param gvar_3345 'stylepoly-fillcombo))
  (setq poly-vlatrace (in_param gvar_3345 'ls_importsource))
  (setq st_ray2 0)
  (setq local_0 aopora-fin)
  ;; init-args 3: 'vla-put-rotation, nil
  nil
  (foreach vla-put-rotation local_0
    (if (re_angle (undobib-start (dcl-grid-addrow st_ray2 ls_importsources)) 'es_ext)
      (progn
        'blkpoly-poly
      )
      (progn
        (dcl-grid-addrow st_ray2 ls_importsources)
      )
    )
    (setq r1 nil)
    (if (re_angle (undobib-start (dcl-grid-addrow st_ray2 poly-vlatrace)) 'es_ext)
      (progn
        'blkpoly-poly
      )
      (progn
        (dcl-grid-addrow st_ray2 poly-vlatrace)
      )
    )
    (eo_blkpop geombib-getinsideangle (dcl-control-setenabled (st_axeid st_ray2)) r1 r2 (r2 vla-put-rotation))
    (setq r2 nil)
    (st_axeid st_ray2)
    (setq st_ray2 (st_axeid st_ray2))
  )
)

;; Original arg hints: EO_POLY, arg_2
;; Referenced symbols: D, ENTDEL, EO_POLY, AXEDYN-REACCREATE, Projet/PA_Polydyn, POLYBIB-LWVERTICES, DCL-GRID-ADDROW, IN_PARAM, POLYBIB-PERPOINT, LS_IMPORTSOURCES
;; Referenced strings: \nBoucle sur les sources
(defun c:projet_pa_mpolydyn_st_amont_onselchanged (eo_poly arg_2)
  (entdel 'd)
  (setq gvar_1392 (dcl-grid-addrow eo_poly_2 (polybib-lwvertices 'axedyn-reaccreate projet_pa_polydyn)))
  (setq ls_importsources (in_param gvar_3345 "\nBoucle sur les sources"))
  (setq pt_pas (dcl-grid-addrow polybib-perpoint ls_importsources))
  (or (re_angle 0 eo_poly_2 (ls_props2 gvar_1408)) (re_angle 1 eo_poly_2 (ls_props2 gvar_1408)))
  (bo_invpoly1 gvar_1408 0)
  (bo_invpoly1 gvar_1408 1)
  (re_1 gvar_1392 pt_pas gvar_1409 re_1)
)

;; Original arg hints: EO_POLY, arg_2
;; Referenced symbols: DELTA, ENTDEL, EO_POLY, AXEDYN-REACCREATE, Projet/PA_Polydyn, POLYBIB-LWVERTICES, DCL-GRID-ADDROW, LS_IMPORTSOURCE, IN_PARAM, POLYBIB-PERPOINT
(defun c:projet_pa_mpolydyn_st_aval_onselchanged (eo_poly arg_2)
  (entdel 'delta)
  (setq gvar_1392 (dcl-grid-addrow eo_poly_2 (polybib-lwvertices 'axedyn-reaccreate projet_pa_polydyn)))
  (setq poly-vlatrace (in_param gvar_3345 'ls_importsource))
  (setq ls_inters1 (dcl-grid-addrow polybib-perpoint poly-vlatrace))
  (or (re_angle 0 eo_poly_2 (ls_props2 gvar_1409)) (re_angle 1 eo_poly_2 (ls_props2 gvar_1409)))
  (bo_invpoly1 gvar_1409 0)
  (bo_invpoly1 gvar_1409 1)
  (re_1 gvar_1392 ls_inters1 gvar_1408 re_2)
)

;; Original arg hints: arg_1, SQRT, H, ATAN
;; Referenced symbols: BLKPOLY-POLY, RE_ANGLE, POLYBIB-VTXJOIN, ATAN, RE_HAUTEUR, SQRT, PT_11, vlax-invoke, EO_TXT, UNDOBIB-START
(defun mpolydyndial-changeamontaval (arg_1 sqrt h atan)
  nil
  (or (or (re_angle gvar_1392 'blkpoly-poly) (re_angle gvar_1392 '(re_x re_y pt_poly re_anglepoly re_angle))) polybib-vtxjoin)
  (re_hauteur atan_2 nil)
  (re_hauteur atan_2 polybib-vtxjoin)
  (if (en_txt sqrt_2)
    (progn
      (vlax-invoke atan_2 'pt_11)
    )
    (progn
      (vlax-invoke atan_2 'eo_txt)
    )
  )
  (re_hauteur atan_2 polybib-vtxjoin)
  (if (re_angle (undobib-start sqrt_2) 'es_ext)
    (progn
      (vlax-invoke atan_2 'pt_11)
    )
    (progn
      (vlax-invoke atan_2 'eo_txt)
    )
  )
)

;; Referenced symbols: IANG, H, ANG
;; Referenced strings: \nBoucle sur les sources
(defun c:projet_pa_mpolydyn_bt_amont_onclicked ()
  (setq iang "\nBoucle sur les sources")
  (setq h gvar_1409)
  (ang iang h)
)

;; Original arg hints: IANG, H
;; Referenced symbols: ENTDEL, IANG, IN_PARAM, H, AXEDYN-REACCREATE, Projet/PA_Polydyn, POLYBIB-LWVERTICES, DCL-GRID-ADDROW, BLKPOLY-POLY, RE_ANGLE
(defun mpolydyndial-selectamontaval (iang h)
  (entdel '(bo_inv d ang iang))
  (setq set (in_param gvar_3345 iang_2))
  (setq gvar_1392 (dcl-grid-addrow (ls_props2 h_2) (polybib-lwvertices 'axedyn-reaccreate projet_pa_polydyn)))
  (or (re_angle gvar_1392 'blkpoly-poly) (re_angle gvar_1392 '(re_x re_y pt_poly re_anglepoly re_angle)))
  (setq gvar_1354 (va_param 'blkpoly-wcs2wxy))
  (setq gvar_1354 (st_visi 'acos))
  (setq set (row gvar_1354 polybib-perpoint set))
  (setq gvar_3345 (st_rayon gvar_3345 iang_2 set))
  (ls_som0)
)

;; Referenced symbols: LS_IMPORTSOURCE, IANG, H, ANG
(defun c:projet_pa_mpolydyn_bt_aval_onclicked ()
  (setq iang 'ls_importsource)
  (setq h gvar_1408)
  (ang iang h)
)

;; Referenced symbols: ENTDEL, DCL-GRID-CLEAR, POLYBIB-PERPOINT, ST_BLKBASE, RE_OFFSETMOD, IN_PARAM, LS_IMPORTSOURCE, STYLEPOLY-FILLCOMBO, C:PROJET/MD_PICKLAYER/BT_OK#ONCLICKED, PT_ABSDYN
;; Referenced strings: \nBoucle sur les sources, Reconstruction des réacteurs des paramètres
(defun c:projet_pa_mpolydyn_bt_apply_onclicked ()
  (entdel '(st_style en_ref en_polydyn st_nom))
  (ls_props2 gvar_1409)
  (ls_props2 gvar_1408)
  (axe-set re_offsetmod)
  (setq ls_importsources (in_param gvar_3345 "\nBoucle sur les sources"))
  (setq poly-vlatrace (in_param gvar_3345 'ls_importsource))
  (setq aopora-fin (in_param gvar_3345 'stylepoly-fillcombo))
  (setq projet_md_picklayer (in_param gvar_3345 'c:projet_md_picklayer_bt_ok_onclicked))
  (setq projet_md_picklayer (row pt_absdyn polybib-perpoint projet_md_picklayer))
  (setq gvar_3345 (st_rayon gvar_3345 'c:projet_md_picklayer_bt_ok_onclicked projet_md_picklayer))
  (setq gvar_1349 (dcl-grid-addrow gvar_1351 (polybib-lwvertices 'axedyn-reaccreate projet_pa_polydyn)))
  (setq gvar_1348 (dcl-grid-addrow *ls_styles* (polybib-lwvertices 'axedyn-reaccreate projet_pa_polydyn)))
  (if (and (dcl-grid-clear gvar_1417) polybib-perpoint (st_blkbase polybib-perpoint 255) (st_blkbase (setq gvar_1351 (ls_props2 gvar_1409)) 255) (st_blkbase (setq *ls_styles* (ls_props2 gvar_1408)) 255) (setq pt_absdyn (axe-set re_offsetmod)) (laybib-newlay gvar_1349 (es_ext "Reconstruction des réacteurs des paramètres" 'ls_paramentxy 're_rayii '(lambda (ls_elem) (= "H" (listbib-key ls_elem "st_type"))))))
    (progn
      (setq ls_importsources (row gvar_1349 polybib-perpoint ls_importsources))
      (setq gvar_3345 (st_rayon gvar_3345 "\nBoucle sur les sources" ls_importsources))
    )
  )
  (if (laybib-newlay gvar_1348 (es_ext "Reconstruction des réacteurs des paramètres" 'ls_paramentxy 're_rayii '(lambda (ls_elem) (= "H" (listbib-key ls_elem "st_type")))))
    (progn
      (setq poly-vlatrace (row gvar_1348 polybib-perpoint poly-vlatrace))
      (setq gvar_3345 (st_rayon gvar_3345 'ls_importsource poly-vlatrace))
    )
  )
  (va_pente)
  (ls_group geombib-getinsideangle re_2max 255)
  T
  (setq re_2max polybib-perpoint)
  (ls_som0)
  (st_linkpath re_yinv)
)

;; Referenced symbols: LS_GROUPPARENT, RE_YINV, RTOS, LS_IMPORTFILTERS, IN_PARAM, STYLEPOLY-FILLCOMBO, ST_LINKPATH
(defun mpolydyn-palreset ()
  (rtos '(lambda (ls_importconf) (= st_sourceid (listbib-key (cdr ls_importconf) "st_SourceId"))) re_yinv gvar_3345)
  (re_abs2 (in_param gvar_3345 'ls_importfilters) (in_param gvar_3345 'stylepoly-fillcombo))
  (st_linkpath re_yinv)
  (setq gvar_3345 ls_groupparent)
  (re_abs1 gvar_1417)
)

;; Referenced symbols: ENTDEL, EN_REP, AXEDYN-REACCREATE, LS_DIST, POLYBIB-LWVERTICES, DCL-GRID-ADDROW, RE_ABSMOD, LS_SOMNEW, dcl-form-show, LS_AXE
;; Referenced strings: Parallèle Origine, C
(defun mpolydyn-palapply ()
  (entdel "Parallèle Origine")
  (st_sourceid re_yinv gvar_3345)
  (st_linkpath re_yinv)
  (ls_som0 "C")
  (setq in_lon0 (errbib-catchapply gvar_1406))
  (setq gvar_1346 (ls_props2 en_rep))
  (setq ls_axe (dcl-grid-addrow gvar_1346 (polybib-lwvertices 'axedyn-reaccreate (ls_dist))))
  (setq gvar_1416 (ls_props2 re_absmod))
  (setq gvar_3345 (st_rayon gvar_3345 'ls_somnew gvar_1416))
  (setq gvar_3345 (st_rayon gvar_3345 'dcl-form-show ls_axe))
  (setq gvar_3345 (st_rayon gvar_3345 'ls_obj in_lon0))
  (ls_som0)
)

;; Referenced symbols: ENTDEL, RE_YINV, GROUPBIB-LIST
;; Referenced strings: PatternAngle
(defun mpolydyn-palsave ()
  (entdel "PatternAngle")
  (re_abs2 (groupbib-list '(lambda (ls_importconf) (= st_sourceid (listbib-key (cdr ls_importconf) "st_SourceId"))) re_yinv) gvar_3094)
  (st_sourceid re_yinv gvar_3345)
  (setq gvar_3094 (ls_offnew gvar_3345))
  (re_abs1 gvar_1417)
)

;; Original arg hints: BLKPOLY-PROJ, ST_GROUPHANDLE
;; Referenced symbols: POLYDYN-EDIT-FILLGRID, LS_SOM0
(defun c:projet_pa_mpolydyn_onclose (blkpoly-proj st_grouphandle)
  (polybib-perpoint polydyn-edit-fillgrid nil)
  (sihpp-list gvar_1397)
  (setq gvar_3345 nil)
  (setq ls_groupparent nil)
  (setq re_yinv nil)
  (setq polydyn-edit-fillgrid nil)
  (setq gvar_1397 nil)
  (ls_som0)
)

;; Referenced symbols: ENTDEL, ES_EXT, AOPORA-FIN, ST_SOURCEID, RE_RAY, LS_IMPORTSOURCES, DCL-GRID-ADDROW, POLY-VLATRACE, Projet/MD_PickLayer, ODCLBIB-FILLCOMBO
;; Referenced strings: Courbe contre courbe, Reconstruction des réacteurs des paramètres
(defun mpolydyn-getvtxs ( / local_0)
  (entdel "Courbe contre courbe")
  (setq gvar_1343 0)
  (setq dcl-form-close (es_ext))
  (setq local_0 aopora-fin)
  ;; init-args 3: 'st_sourceid, nil
  (foreach st_sourceid local_0
    (setq gvar_2537 (re_ray (hachbib-vtxs2hach st_sourceid)))
    (setq pt_pas (dcl-grid-addrow gvar_1343 ls_importsources))
    (setq ls_inters1 (dcl-grid-addrow gvar_1343 poly-vlatrace))
    (setq pt_absdyn (odclbib-fillcombo 1 (dcl-grid-addrow gvar_1343 projet_md_picklayer)))
    (setq polydyncc (ls_vtxs2 gvar_1343 pt_pas "Reconstruction des réacteurs des paramètres"))
    (setq gvar_1386 (ls_vtxs2 gvar_1343 ls_inters1 'ls_paramentxy))
    (setq gvar_2759_c_projet_md_repblk_oninitialize (polycc-side gvar_2537 polydyncc gvar_1386 pt_absdyn))
    (setq dcl-form-close (bo_active dcl-form-close gvar_2759_c_projet_md_repblk_oninitialize))
    (setq gvar_1343 (st_axeid gvar_1343))
  )
  dcl-form-close
)

;; Original arg hints: arg_1, arg_2
;; Referenced symbols: *LS_TYPEDEC*, ENTDEL, AXEDYN-REACCREATE, AXEDYN-LIST, DCL-GRID-ADDROW, EO_POLYABS, *LS_TYPEABS*, REPDYN-GETPOINT
(defun mpolydyn-ext (arg_1 arg_2 / local_2)
  (entdel '*ls_typedec*)
  (setq axedyn-list (axedyn-reaccreate gvar_1437))
  (setq gvar_1341 (dcl-grid-addrow 2 axedyn-list))
  (setq local_2 (eo_polyabs gvar_1437))
  ;; init-args 3: '*ls_typeabs*, nil
  (foreach *ls_typeabs* local_2
    (if (repdyn-getpoint (dcl-grid-addrow 2 *ls_typeabs*) gvar_1341)
      (progn
        (setq axedyn-list *ls_typeabs*)
        (setq gvar_1341 (dcl-grid-addrow 2 *ls_typeabs*))
      )
    )
  )
  axedyn-list
)

;; Original arg hints: arg_1, arg_2, arg_3
;; Referenced symbols: *LS_TYPEOFFSET*, ENTDEL, AOPORA-FIN, DCL-GRID-ADDROW, ST_SOURCEID, RE_RAY, RE_ANGLE, LS_PARAMENTXY, vla-get-Name, UNDOBIB-START
;; Referenced strings: Reconstruction des réacteurs des paramètres, Base
(defun mpolydyn-getabs (arg_1 arg_2 arg_3)
  (entdel '*ls_typeoffset*)
  (setq st_sourceid (dcl-grid-addrow gvar_1343 aopora-fin))
  (setq gvar_2537 (re_ray (hachbib-vtxs2hach st_sourceid)))
  (axedyn-reaccreate (pt_ins11 gvar_3161))
  (or (or (and (and (and (and (or (or (or (or (and (and (or (re_angle gvar_3161 "Reconstruction des réacteurs des paramètres") (re_angle gvar_3161 'ls_paramentxy)) (and (re_angle gvar_3161 '(lambda (ls_elem) (= "H" (listbib-key ls_elem "st_type")))) (re_angle gvar_1339 "Reconstruction des réacteurs des paramètres") (re_angle gvar_1343 0))) (and (re_angle gvar_3161 '(lambda (ls_elem) (= "H" (listbib-key ls_elem "st_type")))) (re_angle gvar_1339 'ls_paramentxy) (re_angle gvar_1343 (vla-get-name (st_ray2 aopora-fin))))) (re_angle gvar_3161 '(lambda (ls_elem) (= "H" (listbib-key ls_elem "st_type"))))) (re_angle (undobib-start gvar_3161) 'st_val)) (re_angle (undobib-start gvar_3161) 'es_ext)) (setq gvar_3241 (axedyn-reaccreate (pt_ins11 gvar_3161)))) (and (ls_ext2 gvar_3161 're_rayii) (ls_ext2 gvar_1339 "Reconstruction des réacteurs des paramètres") (ls_ext2 gvar_1343 0) (cadr (ls_ext2 (1- poly-vlatrace) 're_rayii)))) (and (ls_ext2 gvar_3161 're_rayii) (ls_ext2 gvar_1339 "Reconstruction des réacteurs des paramètres") (ls_ext2 gvar_1343 0) (ls_ext2 (1- poly-vlatrace) 're_rayii))) (and (ls_ext2 gvar_3161 're_rayii) (ls_ext2 gvar_1339 'ls_paramentxy) (ls_ext2 gvar_1343 (vla-get-name (st_ray2 aopora-fin))) (cadr (ls_ext2 (axedyn-reaccreate ls_importsources) 're_rayii)))) (and (ls_ext2 gvar_3161 're_rayii) (ls_ext2 gvar_1339 'ls_paramentxy) (ls_ext2 gvar_1343 (vla-get-name (st_ray2 aopora-fin))) (ls_ext2 (axedyn-reaccreate ls_importsources) 're_rayii))) (re_angle gvar_3161 're_rayii)) polybib-vtxjoin)
  (setq gvar_3388 'ha_poly)
  (if (re_angle gvar_1339 "Reconstruction des réacteurs des paramètres")
    (progn
      (setq projet_pa_polydyn_st_nom (dcl-grid-addrow (vla-get-name gvar_1343) poly-vlatrace))
      (if (projet_pa_axes_st_desc projet_pa_polydyn_st_nom 're_rayii)
        (progn
          (setq projet_pa_polydyn_st_type (re_ray (hachbib-vtxs2hach (dcl-grid-addrow (vla-get-name gvar_1343) aopora-fin))))
          (setq projet_pa_polydyn_st_abs (ls_vtxs2 (vla-get-name gvar_1343) projet_pa_polydyn_st_nom 'ls_paramentxy))
          (setq gvar_3241 (ls_param projet_pa_polydyn_st_type projet_pa_polydyn_st_abs))
          (setq gvar_3388 (palbib-init gvar_2537 gvar_3241))
        )
        (progn
          (setq gvar_3388 'ha_poly)
        )
      )
    )
    (progn
      (setq projet_pa_polydyn_st_nom (dcl-grid-addrow (st_axeid gvar_1343) ls_importsources))
      (if (projet_pa_axes_st_desc projet_pa_polydyn_st_nom 're_rayii)
        (progn
          (setq projet_pa_polydyn_st_type (re_ray (hachbib-vtxs2hach (dcl-grid-addrow (st_axeid gvar_1343) aopora-fin))))
          (setq projet_pa_polydyn_st_abs (ls_vtxs2 (st_axeid gvar_1343) projet_pa_polydyn_st_nom "Reconstruction des réacteurs des paramètres"))
          (setq gvar_3241 (ls_param projet_pa_polydyn_st_type projet_pa_polydyn_st_abs))
          (setq gvar_3388 (palbib-init gvar_2537 gvar_3241))
        )
        (progn
          (setq gvar_3388 'ha_poly)
        )
      )
    )
  )
  (setq gvar_3388 'ha_poly)
  (setq projet_pa_polydyn_st_nom (dcl-grid-addrow 0 ls_importsources))
  (setq projet_pa_polydyn_st_type (re_ray (hachbib-vtxs2hach (dcl-grid-addrow 0 aopora-fin))))
  (setq projet_pa_polydyn_st_abs (ls_vtxs2 0 projet_pa_polydyn_st_nom "Base"))
  (setq gvar_3241 (ls_param projet_pa_polydyn_st_type projet_pa_polydyn_st_abs))
  (setq gvar_3388 (palbib-init gvar_2537 gvar_3241))
  (setq gvar_3388 'ha_poly)
  (setq projet_pa_polydyn_st_nom (1- poly-vlatrace))
  (setq projet_pa_polydyn_st_type (re_ray (hachbib-vtxs2hach (1- aopora-fin))))
  (setq projet_pa_polydyn_st_abs (ls_vtxs2 (vla-get-name (st_ray2 aopora-fin)) projet_pa_polydyn_st_nom 'ls_paramentxy))
  (setq gvar_3241 (ls_param projet_pa_polydyn_st_type projet_pa_polydyn_st_abs))
  (setq gvar_3388 (palbib-init gvar_2537 gvar_3241))
  (setq gvar_3388 (st_param gvar_2537 gvar_3241))
  (setq gvar_3388 (palbib-init gvar_2537 gvar_3161))
  (setq gvar_3388 gvar_3161)
  (if (re_angle gvar_1339 "Reconstruction des réacteurs des paramètres")
    (progn
      (setq gvar_2245 (re_ray (hachbib-vtxs2hach (dcl-grid-addrow (vla-get-name gvar_1343) aopora-fin))))
    )
    (progn
      (setq gvar_2245 (re_ray (hachbib-vtxs2hach (dcl-grid-addrow (st_axeid gvar_1343) aopora-fin))))
    )
  )
  (setq gvar_2644 (axedyn-reaccreate (projet_pa_polydyn_st_offset gvar_2537 gvar_2245)))
  (setq gvar_3388 (dcl-control-setvisible gvar_2537 gvar_2644))
  (setq gvar_2245 (re_ray (hachbib-vtxs2hach (axedyn-reaccreate aopora-fin))))
  (setq gvar_2644 (axedyn-reaccreate (projet_pa_polydyn_st_offset gvar_2537 gvar_2245)))
  (setq gvar_3388 (dcl-control-setvisible gvar_2537 gvar_2644))
  (setq gvar_2245 (re_ray (hachbib-vtxs2hach (1- aopora-fin))))
  (setq gvar_2644 (axedyn-reaccreate (projet_pa_polydyn_st_offset gvar_2537 gvar_2245)))
  (setq gvar_3388 (dcl-control-setvisible gvar_2537 gvar_2644))
  (setq gvar_3388 (dcl-control-setvisible gvar_2537 (projet_md_metprop gvar_2537)))
  (setq gvar_3388 'ha_poly)
  gvar_3388
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: PROJET/PA_POLYDYN/ST_STYLE, ENTDEL, EN_RAYON, PROJET/MD_METPROP/BT_LAYER, IMPORTBIB-GETFILTER, LS_IMPORTFILTERS, IN_PARAM, RE_RAY, STYLEPOLY-FILLCOMBO, LS_IMPORTSOURCE
;; Referenced strings: \nBoucle sur les sources, Reconstruction des réacteurs des paramètres
(defun mpolydyn-getsomatabs (en_rayon / re_tan pt_1 pt_2 ha_ext en_ext pt_proj in_param ls_soms in_length ls_vtxs ls_som pt_ptp1 pt_ptp2 local_1 local_2)
  (entdel 'projet_pa_polydyn_st_style)
  (setq importbib-getfilter (projet_md_metprop_bt_layer en_rayon_2))
  (setq gvar_3265 (in_param importbib-getfilter 'ls_importfilters))
  (setq ls_propsdescs (re_ray gvar_3265))
  (setq gvar_1343 1)
  (setq aopora-fin (in_param importbib-getfilter 'stylepoly-fillcombo))
  (setq ls_importsources (in_param importbib-getfilter "\nBoucle sur les sources"))
  (setq poly-vlatrace (in_param importbib-getfilter 'ls_importsource))
  (setq re_tan (es_ext))
  (setq local_2 (eo_polyabs aopora-fin))
  ;; init-args 3: 'st_sourceid, nil
  (foreach st_sourceid local_2
    (setq vla-put-insertionpoint (chemdyn-bordtrace st_sourceid))
    (setq pt_pas (dcl-grid-addrow gvar_1343 (in_param importbib-getfilter "\nBoucle sur les sources")))
    (setq ls_inters1 (dcl-grid-addrow gvar_1343 (in_param importbib-getfilter 'ls_importsource)))
    (setq chemdyn-hachtrace (ls_vtxs2 gvar_1343 pt_pas "Reconstruction des réacteurs des paramètres"))
    (setq polycc-tanint (ls_param vla-put-insertionpoint chemdyn-hachtrace))
    (setq polydyncc (st_param ls_propsdescs polycc-tanint))
    (setq re_tan (dcl-grid-setcurcell re_tan polydyncc))
    (setq gvar_1343 (st_axeid gvar_1343))
  )
  (setq re_tan (dcl-grid-setcurcell re_tan (repdyn-get ls_propsdescs)))
  (polydyn-dialfilledit re_tan re_tan)
)

;; Referenced symbols: ST_VALUE, PROJET/PA_POLYDYN/GRILLE_OFFSETS, dcl-listbox-clear, PROJET/PA_POLYDYN/BT_ENREGISTRER, BO_LCTABS, PT_POLY, CMD, PROJET/PA_POLYDYN/RE_ABSMOD, PROJET/PA_POLYDYN/RE_OFFSETMOD, RE_HAUTEUR
(defun c:projet_md_selblk_oninitialize ()
  (st_value gvar_1331 (*reactor2*))
  (jsonbib-json2list projet_pa_polydyn_grille_offsets)
  T
  (re_hauteur projet_pa_polydyn_re_absmod projet_pa_polydyn_re_offsetmod)
  (re_hauteur projet_pa_polydyn_la_type gvar_1325)
  (and dcl-listbox-clear (bo_lctabs projet_pa_polydyn_bt_enregistrer dcl-listbox-clear) (laybib-newlay dcl-listbox-clear (*reactor2*)) (pt_poly projet_pa_polydyn_grille_offsets dcl-listbox-clear) (cmd gvar_1331 dcl-listbox-clear))
)

;; Original arg hints: EO_POLY, arg_2
;; Referenced symbols: PROJET/PA_POLYDYN/BT_ENREGISTRER, EO_POLY, DCL-GRID-ADDROW, BO_LCTABS, PROJET/PA_POLYDYN/GRILLE_OFFSETS, PT_POLY
(defun c:projet_md_selblk_ls_blk_onselchanged (eo_poly arg_2)
  (bo_lctabs projet_pa_polydyn_bt_enregistrer (dcl-grid-addrow eo_poly_2 (*reactor2*)))
  (pt_poly projet_pa_polydyn_grille_offsets (dcl-grid-addrow eo_poly_2 (*reactor2*)))
)

;; Referenced symbols: *ST_NODEID*
(defun c:projet_md_selblk_bt_cancel_onclicked ()
  (setq dcl-listbox-clear nil)
  (re_abs1 *st_nodeid* 20)
)

;; Referenced symbols: PROJET/PA_POLYDYN/BT_ENREGISTRER, dcl-listbox-clear, *ST_NODEID*, BORDYN-INTERS
(defun c:projet_md_selblk_bt_ok_onclicked ()
  (setq dcl-listbox-clear (errbib-catchapply projet_pa_polydyn_bt_enregistrer))
  (if (laybib-newlay dcl-listbox-clear (*reactor2*))
    (progn
      (re_abs1 *st_nodeid* 10)
    )
    (progn
      (bordyn-inters '(ls_som st_abs st_type re_absmod st_offset re_offsetmod))
    )
  )
)

;; Referenced symbols: *ST_NODEID*
(defun c:projet_md_selblk_ls_blk_ondblclicked ()
  (setq dcl-listbox-clear (eg_entmet0 gvar_1331))
  (re_abs1 *st_nodeid* 10)
)

;; Referenced symbols: *LS_SOM*, CLOSE, LS_PTININT
(defun c:projet_md_selblk_bt_file_onclicked ()
  (ls_ptinint '*ls_som* 'close)
)

;; Referenced symbols: *ST_NODEID*
(defun c:projet_md_selblk_bt_pick_onclicked ()
  (re_abs1 *st_nodeid* 1)
)

;; Original arg hints: dcl-listbox-clear, PROJET/PA_POLYDYN/RE_OFFSETMOD
;; Referenced symbols: *ST_NODEID*, vlax-erased-p, REPDYN-GETPOINT, PROJET/PA_POLYDYN/SOMMET, RE_ANGLE, dcl-listbox-clear
;; Referenced strings: Sommet : 
(defun getbib-blk (dcl-listbox-clear projet_pa_polydyn_re_offsetmod / in_row local_2)
  (vlax-erased-p *st_nodeid*)
  (while (repdyn-getpoint (setq projet_pa_polydyn_sommet (vlax-erased-p *st_nodeid*)) 10)
    (re_angle projet_pa_polydyn_sommet 1)
    (projet_md_quantite_bt_qtdroite "Sommet : ")
  )
  dcl-listbox-clear_2
)

;; Original arg hints: dcl-listbox-clear, PROJET/PA_POLYDYN/RE_OFFSETMOD
;; Referenced symbols: *ST_NODEID*, vlax-erased-p, REPDYN-GETPOINT, PROJET/PA_POLYDYN/SOMMET, RE_ANGLE, dcl-listbox-clear
;; Referenced strings: Sommet : 
(defun pickbib-blk (dcl-listbox-clear projet_pa_polydyn_re_offsetmod / st_layer ls_props in_row local_0 local_3)
  (vlax-erased-p *st_nodeid*)
  (while (repdyn-getpoint (setq projet_pa_polydyn_sommet (vlax-erased-p *st_nodeid*)) 10)
    (re_angle projet_pa_polydyn_sommet 1)
    (projet_md_quantite_bt_qtdroite "Sommet : ")
  )
  dcl-listbox-clear_2
)

;; Original arg hints: AOSUP-SIHPP
;; Referenced symbols: EN_REPCOTE, ENTDEL, POLYBIB-REPERE, PROJET/PA_POLYDYN/LA_R1, PROJET/PA_POLYDYN/ST_R1, *EN_INS*, dcl-control-setcolumnstylelist, BLKBIB-GETPARENTENTITIES, OCBIB-ENAME2ID, POLAR
;; Referenced strings: block, re_1, \nBloc absent du dessin ! 
(defun picklayer (aosup-sihpp / local_1)
  (entdel 'en_repcote)
  (entdel 'polybib-repere)
  (*en_ins* projet_pa_polydyn_st_r1)
  (setq dcl-control-setcolumnstylelist (projet_pa_polydyn_la_r1))
  (setq st_ray2 0)
  (setq aosup-sihpp dcl-control-setcolumnstylelist)
  ;; init-args 3: 'blkbib-getparententities, nil
  (foreach blkbib-getparententities aosup-sihpp
    (eo_blkpop projet_pa_polydyn_st_r1 (dcl-control-setenabled (eo_polyabs (re_angle0 62 (polar (ocbib-ename2id '(pt_proj re_abs re_long re_tan re_dist pt_1 pt_2) blkbib-getparententities))))) blkbib-getparententities)
    (projet_md_quantite_cb_ltype projet_pa_polydyn_st_r1 st_ray2 0 30)
    (setq st_ray2 (st_axeid st_ray2))
  )
  projet_pa_polydyn_la_r2
  (if aosup-sihpp_2
    (progn
      aosup-sihpp_2
    )
    (progn
      'ls_ext1
    )
  )
  (bo_lctabs)
  (laybib-newlay aosup-sihpp_2 dcl-control-setcolumnstylelist)
  (if (and aosup-sihpp_2 (setq st_ray2 (laybib-newlay aosup-sihpp_2 dcl-control-setcolumnstylelist)))
    (progn
      (ls_group projet_pa_polydyn_st_r1 st_ray2 255)
    )
    (progn
      nil
    )
  )
  (ls_debfinrad 'projet_pa_polydyn_st_r2)
  (setq projet_pa_polydyn_st_r2 'aoblk-ins)
  ;; init-args 5: 'eq, aosup-sihpp, 'netbib-purgeblock, local_1
  (if (and (re_deltax eq 0) (re_deltax netbib-purgeblock 0))
    (progn
      (bo_lctabs projet_pa_polydyn_la_r2 (ls_absint2 projet_pa_polydyn_st_r1 eq 1))
    )
    (progn
      nil
    )
  )
  (ls_debfinrad "re_1")
  (setq gvar_1313 "block")
  (setq blkbib-getparententities (errbib-catchapply projet_pa_polydyn_la_r2))
  (re_abs1 gvar_1312 10)
  (ls_debfinrad 'projet_pa_polydyn_va_abs)
  (setq projet_pa_polydyn_va_abs 'tblobjname)
  ;; init-args 5: 'eq, aosup-sihpp, 'netbib-purgeblock, local_1
  (setq blkbib-getparententities (ls_absint2 projet_pa_polydyn_st_r1 eq 1))
  (re_abs1 gvar_1312 10)
  (ls_debfinrad 'ls_sel)
  (setq ls_sel "\nBloc absent du dessin ! ")
  (if (re_angle (vlax-erased-p gvar_1312) 10)
    (progn
      blkbib-getparententities
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: LS_BLKS, AXEDYN-SETRAYEXT
(defun polydyn-list ()
  (axedyn-setrayext 'ls_blks)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: LS_BLKS, EN_RAYON, RE_COURANT
(defun polydyn-get (en_rayon)
  (re_courant 'ls_blks en_rayon_2)
)

;; Original arg hints: EN_RAYON, arg_2
;; Referenced symbols: LS_BLKS, EN_RAYON, RTOS
(defun polydyn-set (en_rayon arg_2)
  (rtos 'ls_blks en_rayon_2 gvar_3164)
)

;; Original arg hints: arg_1, IN_LON0, LS_AXE, BLKBIB-GETVISINAMES, RE_COTECHEM
;; Referenced symbols: ENTDEL, RE_OFFSET0, /, ST_AXEID, INTERS, dcl-control-setenabled, LS_AXES, GROUPBIB-LIST, LS_OBJ, IN_LON0
(defun polydyn-create (arg_1 in_lon0 ls_axe blkbib-getvisinames re_cotechem)
  (entdel '(va_ref ha_ref en_ref ls_soms re_offsetmod re_offset re_offset0))
  (ls_layers gvar_1307 gvar_1306)
  (listbib-remove_doubles gvar_1307)
  (setq inters (st_axeid (/ 're_offset0)))
  (setq gvar_1307 (dcl-control-setenabled inters))
  (setq gvar_1306 (es_ext (groupbib-list 'ls_axes inters) (groupbib-list 'ls_obj in_lon0_2) (groupbib-list 'dcl-form-show ls_axe_2) (groupbib-list 'va_point gvar_3162) (groupbib-list '(lambda (ls_ent) (listbib-key ls_ent "st_layer")) blkbib-getvisinames_2) (groupbib-list 'ls_importfilters nil) (groupbib-list 'va_inters re_cotechem_2)))
  (setq gvar_3094 (st_button gvar_1306))
  (re_abs2 (groupbib-list 'ls_blks gvar_1307) gvar_3094)
)

;; Referenced symbols: ENTDEL, VA_POINT, IN_PARAM, ES_EXT, BLKBIB-GETVISINAMES, LS_EXT2, RE_ABS2, GROUPBIB-LIST, dcl-grid-setcurcell
;; Referenced strings: \nChoix du point :, 10.0, Milieu
(defun polydyn-getparents ( / st_value st_button va_abs local_0 local_1)
  (entdel "\nChoix du point :")
  (setq gvar_3094 (es_ext (in_param st_button 'va_point)))
  (setq blkbib-getvisinames (in_param st_button '(lambda (ls_ent) (listbib-key ls_ent "st_layer"))))
  (setq local_1 blkbib-getvisinames)
  ;; init-args 3: "10.0", nil
  (foreach gvar_3385 local_1
    (in_param gvar_3385 "Milieu")
    (if (and (ls_ext2 (in_param gvar_3385 '(en_polydyn en_ref ls_soms ls_som st_type st_abs st_offset re_absmod re_offsetmod va_abs)) '(re_x re_y pt_poly re_anglepoly re_angle)) (re_abs2 (setq gvar_3419 (in_param gvar_3385 "Milieu"))))
      (progn
        (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 (groupbib-list 're_abs2 gvar_3419)))
      )
    )
  )
  gvar_3094
)

;; Original arg hints: arg_1, arg_2, LISTBIB-SUBSTLIST
;; Referenced symbols: LISTBIB-SUBSTLIST, PALBIB-INIT, POLYDYN-DIALFILLEDIT
(defun polydyn-pt2numnode (arg_1 arg_2 listbib-substlist)
  (polydyn-dialfilledit listbib-substlist_2 (palbib-init gvar_2537 gvar_2840))
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: ENTDEL, EN_RAYON, ST_SPECIAL, IN_PARAM, dcl-form-show, LS_AXE, PT_PROJ, POLYBIB_GEOM-BULGE2RADIUS, GROUPBIB-LIST, dcl-grid-setcurcell
;; Referenced strings: \nMise à jour en cours..
(defun polydyn-popgo (en_rayon)
  (entdel '(st_syle ls_som en_polydyn en_ref st_nom))
  (setq gvar_2607 nil)
  (if gvar_3345
    (progn
      (setq gvar_1306 gvar_3345)
    )
    (progn
      (setq gvar_1306 (st_special en_rayon_2))
    )
  )
  T
  (setq blkbib-getvisinames (in_param gvar_1306 '(lambda (ls_ent) (listbib-key ls_ent "st_layer"))))
  (setq ls_axe (in_param gvar_1306 'dcl-form-show))
  (setq polybib_geom-bulge2radius (pt_proj ls_axe))
  (setq polybib_geom-bulge2radius (dcl-grid-setcurcell polybib_geom-bulge2radius (groupbib-list 70 128)))
  'chemdyn-bordtrace
  (in_param gvar_1306 'va_point)
  (hachbib-vtxs2hach gvar_3162)
  (re_ray projet_md_metprop_cb_layer)
  "\nMise à jour en cours.."
  (*va_abs* gvar_2537 blkbib-getvisinames)
  polybib-vtxjoin
  (setq gvar_3265 (in_param gvar_1306 'ls_importfilters))
  (if (and (setq gvar_3155 'chemdyn-bordtrace) (setq gvar_3162 (in_param gvar_1306 'va_point)) (setq projet_md_metprop_cb_layer (hachbib-vtxs2hach gvar_3162)) (setq gvar_2537 (re_ray projet_md_metprop_cb_layer)) (polar gvar_2537) (setq gvar_3155 "\nMise à jour en cours..") (setq dcl-form-close (*va_abs* gvar_2537 blkbib-getvisinames)) (setq gvar_2607 polybib-vtxjoin) gvar_2607)
    (progn
      (re_ray gvar_3265)
      (if (and gvar_3265 (setq ls_propsdescs (re_ray gvar_3265)) (polar ls_propsdescs))
        (progn
          (sssetfirst ls_propsdescs dcl-form-close polybib_geom-bulge2radius)
          (setq gvar_3155 '*va_abs*)
          (setq gvar_3155 nil)
        )
        (progn
          (ls_layers en_rayon_2 gvar_1306)
          (setq gvar_3155 '(ls_som st_abs va_abs re_absmod en_av va_av pt_av))
          (setq ls_propsdescs (*en_ray* dcl-form-close polybib_geom-bulge2radius))
          (setq gvar_3265 (1- ls_propsdescs))
          (setq gvar_1306 (st_rayon gvar_1306 'ls_importfilters gvar_3265))
          (setq gvar_3155 '(ls_som st_offset va_offset re_offsetmod re_off))
          (setq gvar_3155 nil)
        )
      )
    )
  )
  (if gvar_3155
    (progn
      (ls_som0 gvar_3155)
    )
  )
  (setq gvar_3155 nil)
  gvar_3265
)

;; Referenced symbols: ENTDEL, VA_POINT, IN_PARAM, RE_RAY, LS_IMPORTFILTERS, ES_EXT, BLKBIB-GETVISINAMES, PT_DP, RE_OFFF, PT_FP
;; Referenced strings: 10.0
(defun polydyn-makelists ( / local_0)
  (entdel '(st_type in_som re_absd re_offd pt_d re_absf pt_f ls_vtx))
  (setq gvar_2537 (re_ray (hachbib-vtxs2hach (in_param gvar_3345 'va_point))))
  (setq re_offd (re_ray (in_param gvar_3345 'ls_importfilters)))
  (setq blkbib-getvisinames (in_param gvar_3345 '(lambda (ls_ent) (listbib-key ls_ent "st_layer"))))
  (setq re_u (es_ext))
  (setq pt_d (es_ext))
  (setq listbib-substlist (es_ext))
  (setq pt_dp 0)
  (setq local_0 blkbib-getvisinames)
  ;; init-args 3: "10.0", nil
  nil
  (foreach gvar_3385 local_0
    (setq gvar_3388 (re_offf gvar_2537 blkbib-getvisinames pt_dp))
    (setq polydynraccord (pt_fp gvar_2537 blkbib-getvisinames pt_dp))
    (setq polybib-subpolyoff (ls_param gvar_2537 gvar_3388))
    (setq ls_prop (getvar gvar_2537 polybib-subpolyoff))
    (setq metquant-dial-gr_prixfill (getvar polybib-subpolyoff (dcl-grid-addrow ls_prop (repdyn-isrep gvar_3236 'repdyn-isrep)) polydynraccord))
    (setq polybib-subpolyoff2 (st_param re_offd metquant-dial-gr_prixfill))
    (setq re_u (dcl-grid-setcurcell re_u gvar_3388))
    (setq pt_d (dcl-grid-setcurcell pt_d polydynraccord))
    (setq listbib-substlist (dcl-grid-setcurcell listbib-substlist polybib-subpolyoff2))
    (st_axeid pt_dp)
    (setq pt_dp (st_axeid pt_dp))
  )
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: POLYBIB-SUBPOLYBIS, ENTDEL, IN_PARAM, VA_POINT, PROJET/MD_METPROP/CB_LAYER, RE_RAY, LS_IMPORTFILTERS, ACOS, PT_2P, PT_3
;; Referenced strings: Croisée , Milieu, Liste
(defun polydyn-addsomgo (en_rayon)
  (entdel 'polybib-subpolybis)
  (setq blkbib-getvisinames (in_param gvar_3345 '(lambda (ls_ent) (listbib-key ls_ent "st_layer"))))
  (setq projet_md_metprop_cb_layer (hachbib-vtxs2hach (in_param gvar_3345 'va_point)))
  (setq gvar_2537 (re_ray projet_md_metprop_cb_layer))
  (setq gvar_3265 (in_param gvar_3345 'ls_importfilters))
  (setq re_offd (re_ray gvar_3265))
  (polybib-subpolybis 'acos)
  (while (setq pt_1p (polybib-subpolybis 'acos))
    (ls_layers en_rayon_2 gvar_3345)
    (listbib-remove_doubles en_rayon_2)
    (ha_rep)
    (en_ref1 vlax-curve-isclosed)
    (setq gvar_1282 (pt_3 gvar_2537 'pt_2p))
    (setq ls_ha (in_param pt_1p '(lambda (ls_rep) (cons (listbib-key (cdr ls_rep) "ha_poly") (car ls_rep)))))
    (setq pt_1p (es_rep "Croisée " (in_param pt_1p '(en_polydyn en_ref ls_soms ls_som st_type st_abs st_offset re_absmod re_offsetmod va_abs)) (in_param pt_1p "Milieu") (in_param pt_1p '(lambda (ls_rep) (cons (car ls_rep) (if (or (not (listbib-key (cdr ls_rep) "st_nom")) (= "" (listbib-key (cdr ls_rep) "st_nom"))) (car ls_rep) (listbib-key (cdr ls_rep) "st_nom"))))) (in_param gvar_1282 'ls_txt) (in_param gvar_1282 "Liste") (in_param gvar_1282 " [Liste des PolyDyn] : ") 'ha_poly 'ha_poly))
    (setq blkbib-getvisinames (blkpoly-insdetail pt_1p ls_ha blkbib-getvisinames))
    (setq gvar_3345 (st_rayon gvar_3345 '(lambda (ls_ent) (listbib-key ls_ent "st_layer")) blkbib-getvisinames))
    (setq vlax-curve-isclosed (ha_rep re_offd listbib-substlist gvar_2537 re_u))
    (if (dcl-grid-clear gvar_1272)
      (progn
        (boxlib-listbox en_rayon_2)
      )
    )
  )
  (ls_som0)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: ENTDEL, EN_RAYON, ST_SPECIAL, IN_PARAM, VA_POINT, RE_RAY, LS_IMPORTFILTERS, ES_EXT, AXEDYN-REACCREATE, vlax-curve-isClosed
;; Referenced strings: Nouveau Choix Origine Fin Abscicce Décalage,  [Nouveau Repère/Choix repère/Origine/Fin/Abscicce/Décalage] <Sortie> :
(defun polydyn-delsomgo (en_rayon / local_1)
  (entdel '(va_ans ls_ans pt_ref in_node re_rel))
  (if gvar_3345
    (progn
      (setq gvar_3345 gvar_3345)
    )
    (progn
      (setq gvar_3345 (st_special en_rayon_2))
    )
  )
  (setq blkbib-getvisinames (in_param gvar_3345 '(lambda (ls_ent) (listbib-key ls_ent "st_layer"))))
  (setq gvar_2537 (re_ray (hachbib-vtxs2hach (in_param gvar_3345 'va_point))))
  (setq re_offd (re_ray (in_param gvar_3345 'ls_importfilters)))
  (setq re_u (es_ext))
  (setq pt_d (es_ext))
  (setq listbib-substlist (es_ext))
  (axedyn-reaccreate (projet_md_quantite_bt_qtdroite "Nouveau Choix Origine Fin Abscicce Décalage"))
  (while (setq gvar_1268 (axedyn-reaccreate (projet_md_quantite_bt_qtdroite "Nouveau Choix Origine Fin Abscicce Décalage")))
    (laybib-newlay gvar_1268 vlax-curve-isclosed)
    (if (setq st_handleabs (laybib-newlay gvar_1268 vlax-curve-isclosed))
      (progn
        (setq blkbib-getvisinames (ls_atts st_handleabs blkbib-getvisinames))
        (setq local_1 vlax-curve-isclosed)
        ;; init-args 3: " [Nouveau Repère/Choix repère/Origine/Fin/Abscicce/Décalage] <Sortie> :", nil
        (foreach gvar_1268 local_1
          (column gvar_1268)
        )
        (ls_layers en_rayon_2 gvar_3345)
        (listbib-remove_doubles en_rayon_2)
        (ha_rep)
        (setq gvar_3345 (st_rayon gvar_3345 '(lambda (ls_ent) (listbib-key ls_ent "st_layer")) blkbib-getvisinames))
        (setq re_u (es_ext))
        (setq pt_d (es_ext))
        (setq listbib-substlist (es_ext))
        (setq vlax-curve-isclosed (ha_rep re_offd listbib-substlist gvar_2537 re_u))
        (if (dcl-grid-clear gvar_1272)
          (progn
            (boxlib-listbox en_rayon_2)
          )
        )
      )
      (progn
        (ls_som0 'va_ans)
      )
    )
    (ls_som0)
  )
  (ls_som0)
)

;; Original arg hints: POLYBIB-SUBPOLYBISINV, arg_2, arg_3, arg_4, REPDYN-GO, POLYDYN-PT2NUMNODE, LS_ANS, arg_8, arg_9
;; Referenced symbols: ST_TYPE, POLYBIB-SUBPOLYBISINV, GROUPBIB-LIST, LS_TXT, REPDYN-GO, POLYDYN-PT2NUMNODE, LS_ANS, RE_REL, ES_EXT
;; Referenced strings: Milieu, Liste,  [Liste des PolyDyn] : 
(defun polydyn-makesom (polybib-subpolybisinv arg_2 arg_3 arg_4 repdyn-go polydyn-pt2numnode ls_ans arg_8 arg_9)
  (es_ext (groupbib-list 'st_type polybib-subpolybisinv_2) (groupbib-list '(en_polydyn en_ref ls_soms ls_som st_type st_abs st_offset re_absmod re_offsetmod va_abs) gvar_1266) (groupbib-list "Milieu" gvar_3161) (groupbib-list '(lambda (ls_rep) (cons (car ls_rep) (if (or (not (listbib-key (cdr ls_rep) "st_nom")) (= "" (listbib-key (cdr ls_rep) "st_nom"))) (car ls_rep) (listbib-key (cdr ls_rep) "st_nom")))) gvar_1265) (groupbib-list 'ls_txt repdyn-go_2) (groupbib-list "Liste" polydyn-pt2numnode_2) (groupbib-list " [Liste des PolyDyn] : " ls_ans_2) (groupbib-list "\nDistance par rapport au point précédent : " gvar_1261) (groupbib-list 're_rel gvar_1260))
)

;; Original arg hints: RE_OFFD, LISTBIB-SUBSTLIST, arg_3, RE_U
;; Referenced symbols: ENTDEL, RE_U, LS_PARAM, PT_DP, PT_D, DCL-GRID-ADDROW, POLYDYNRACCORD, ST_AXEID, POLYBIB-SUBPOLYOFF, GROUPBIB-LIST
(defun polydyn-tracerep (re_offd listbib-substlist arg_3 re_u / local_4)
  (entdel '(ans flag))
  (setq pt_dp 0)
  (setq local_4 re_u_2)
  ;; init-args 3: '(re_tan pt_1 pt_2 ha_ext en_ext pt_proj in_param ls_soms in_length ls_vtxs ls_som pt_ptp1 pt_ptp2), nil
  (foreach gvar_3388 local_4
    (setq polybib-subpolyoff (ls_param gvar_2537 gvar_3388))
    (setq polydynraccord (dcl-grid-addrow pt_dp pt_d))
    (setq gvar_1255 (re_rel gvar_2537 gvar_3388 polydynraccord))
    (setq pt_dp (st_axeid pt_dp))
    (setq dcl-form-close (es_ext (es_ext (groupbib-list 10 polybib-subpolyoff)) (es_ext (groupbib-list 10 gvar_1255))))
    (setq st_2 (dcl-grid-setcurcell st_2 (*en_ray* dcl-form-close (es_ext (groupbib-list 62 4) (groupbib-list 8 'st_btn)))))
  )
  st_2
)

;; Referenced symbols: LS_STATE, POLAR, BLKPOLY-SET, IN_PARAM, *LS_PARENTS*, AXEDYN-REACCREATE, dcl-grid-setcellstyle, *LS_ELEMS*, PROJET/PA_PROJET/AR_PROJET, dcl-form-close
;; Referenced strings: \nDécalage par rapport à l'origine : 
(defun c:polycc ()
  (re_rel)
  (setq gvar_1252 "\nDécalage par rapport à l'origine : ")
  (setq *ls_elems* '(ls_type en_elem))
  (setq gvar_2200 (blkpoly-set (polar ls_state)))
  (setq *ls_parents* (blkpoly-set (polar gvar_1861)))
  (setq gvar_3244 (in_param (1- gvar_2200) 10))
  (setq gvar_3242 (in_param (axedyn-reaccreate *ls_parents*) 10))
  (setq dcl-grid-setcellstyle (getvar ls_state gvar_3244))
  (setq gvar_1864 (getvar gvar_1861 gvar_3242))
  (setq dcl-form-close (projet_pa_projet_ar_projet gvar_3244 gvar_3242 dcl-grid-setcellstyle gvar_1864 gvar_1252 *ls_elems*))
  (*en_ray* dcl-form-close nil)
)

;; Original arg hints: arg_1, arg_2, dcl-grid-setcellstyle, arg_4, *LS_ELEMS*
;; Referenced symbols: dcl-tree-selectitem, ENTDEL, dcl-grid-setcellstyle, *LS_PETYPES*, LS_VISIENT, GETVAR, *LS_ELEMS*, BLKBIB-GETVISIENT, PT_REF, REPDYN-ISREP
(defun polydyncc (arg_1 arg_2 dcl-grid-setcellstyle arg_4 *ls_elems* / in_cellnum in_state inc local_3)
  (entdel 'dcl-tree-selectitem)
  (setq gvar_1815 (*ls_petypes* gvar_3244 in_cellnum gvar_3242))
  (setq gvar_1814 (*ls_petypes* gvar_3242 in_state gvar_3244))
  (setq ls_type (getvar gvar_3244 (dcl-grid-addrow in_cellnum (repdyn-isrep gvar_3236 2)) (ls_visient gvar_1815 gvar_1252)))
  (setq en_elem (getvar gvar_3242 (dcl-grid-addrow in_state (repdyn-isrep gvar_3236 2)) (ls_visient gvar_1814 *ls_elems*_2)))
  (setq pt_ref (pt_ref gvar_3244 gvar_3242))
  (setq ls_prop (blkbib-getvisient gvar_3244 gvar_3242))
  (setq projexp-addelement (entib-handle2ename (repdyn-isrep pt_ref 'repdyn-isrep (in_closed (dcl-grid-addrow in_cellnum ls_prop)))))
  (setq racdyn-list (getvar ls_type (dcl-grid-addrow in_state (repdyn-isrep gvar_3236 2)) (ls_visient gvar_1814 gvar_1252)))
  (setq repdyn-list (getvar ls_type (dcl-grid-addrow in_state (repdyn-isrep gvar_3236 2)) (ls_visient '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) gvar_1814 gvar_1252)))
  (setq resdyn-list (ls_parents racdyn-list gvar_3242 repdyn-list (getvar repdyn-list (dcl-grid-addrow (blkbib-getvisient racdyn-list gvar_3242) (repdyn-isrep gvar_3236 2)) 'en_poly) nil))
  (setq gvar_1239 (ls_parents ls_type resdyn-list gvar_3242 (getvar gvar_3242 (dcl-grid-addrow in_state (repdyn-isrep gvar_3236 2)) 'en_poly) nil))
  (setq bordyn-list (pt_ref gvar_1239 gvar_3242))
  (or (or (or (and (re_angle gvar_1252 'ha_poly) (re_angle *ls_elems*_2 'ha_poly)) (st_blkbase gvar_1252 projexp-addelement)) (st_blkbase *ls_elems*_2 bordyn-list)) polybib-vtxjoin)
  (and (and (and (and (st_blkbase gvar_1815 'ha_poly) (st_blkbase gvar_1814 'ha_poly)) (and (repdyn-getpoint gvar_1815 'ha_poly) (repdyn-getpoint gvar_1814 'ha_poly))) (and (st_blkbase gvar_1815 'ha_poly) (repdyn-getpoint gvar_1814 'ha_poly))) (and (repdyn-getpoint gvar_1815 'ha_poly) (st_blkbase gvar_1814 'ha_poly)))
  (setq projet_md_selblk_bt_pick (1- (chemdyn-list ls_type en_elem gvar_1252 *ls_elems*_2)))
  (setq projet_md_selblk_bt_pick (axedyn-reaccreate (chemdyn-list ls_type en_elem gvar_1252 *ls_elems*_2)))
  (setq projet_md_selblk_bt_pick (1- (blkpoly-list ls_type en_elem gvar_1252 *ls_elems*_2)))
  (setq projet_md_selblk_bt_pick (axedyn-reaccreate (blkpoly-list ls_type en_elem gvar_1252 *ls_elems*_2)))
  (setq gvar_2705 (axedyn-reaccreate projet_md_selblk_bt_pick))
  (setq in_cellnum (1- projet_md_selblk_bt_pick))
  (setq ls_prop (blkbib-getvisient gvar_2705 in_cellnum))
  (if (st_blkbase gvar_1815 'ha_poly)
    (progn
      (setq gvar_1234 (taldyn-list ls_type ls_prop in_cellnum gvar_1252))
    )
    (progn
      (setq gvar_1234 (taldyn-list ls_type in_cellnum ls_prop gvar_1252))
    )
  )
  (if (st_blkbase gvar_1814 'ha_poly)
    (progn
      (setq sihlin-list (taldyn-list en_elem in_state ls_prop *ls_elems*_2))
    )
    (progn
      (setq sihlin-list (taldyn-list en_elem ls_prop in_state *ls_elems*_2))
    )
  )
  (setq dcl-form-close (es_ext (es_ext (groupbib-list 10 gvar_3244) (groupbib-list 42 (ls_visient '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) gvar_1815 (dcl-grid-addrow 1 gvar_1234)))) (es_ext (groupbib-list 10 gvar_2705) (groupbib-list 40 0)) (es_ext (groupbib-list 10 in_cellnum) (groupbib-list 42 (ls_visient '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) gvar_1814 (dcl-grid-addrow 1 sihlin-list)))) (es_ext (groupbib-list 10 gvar_3242) (groupbib-list 40 0))))
  (setq en_elem gvar_1239)
  (setq ls_prop (st_syle (blkbib-getvisient ls_type en_elem) (repdyn-isrep gvar_3236 'repdyn-isrep)))
  (if (st_blkbase gvar_1815 'ha_poly)
    (progn
      (setq gvar_1234 (taldyn-list ls_type ls_prop (dcl-grid-addrow in_cellnum gvar_3236) gvar_1252))
    )
    (progn
      (setq gvar_1234 (taldyn-list ls_type in_cellnum ls_prop gvar_1252))
    )
  )
  (if (st_blkbase gvar_1814 'ha_poly)
    (progn
      (setq sihlin-list (taldyn-list en_elem in_state ls_prop bordyn-list))
    )
    (progn
      (setq sihlin-list (taldyn-list en_elem (dcl-grid-addrow ls_prop gvar_3236) in_state bordyn-list))
    )
  )
  (setq dcl-form-close (es_ext (es_ext (groupbib-list 10 gvar_3244) (groupbib-list 42 (ls_visient '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) gvar_1815 (dcl-grid-addrow 1 gvar_1234)))) (es_ext (groupbib-list 10 resdyn-list) (groupbib-list 42 (ls_visient '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) gvar_1814 (dcl-grid-addrow 1 sihlin-list)))) (es_ext (groupbib-list 10 gvar_3242) (groupbib-list 40 0))))
  (setq ls_type (getvar gvar_3244 (dcl-grid-addrow in_cellnum (repdyn-isrep gvar_3236 2)) (ls_visient gvar_1815 projexp-addelement)))
  (if (repdyn-getpoint gvar_1815 'ha_poly)
    (progn
      (setq gvar_1234 (taldyn-list ls_type in_cellnum (st_syle in_cellnum (st_key gvar_3244 ls_type gvar_3242)) projexp-addelement))
    )
    (progn
      (setq gvar_1234 (taldyn-list ls_type in_cellnum (st_syle in_cellnum (st_key gvar_3244 ls_type gvar_3242)) projexp-addelement))
    )
  )
  (setq dcl-form-close (es_ext (es_ext (groupbib-list 10 gvar_3244) (groupbib-list 42 (ls_visient '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) gvar_1815 (dcl-grid-addrow 1 gvar_1234)))) (es_ext (groupbib-list 10 gvar_3242) (groupbib-list 40 0))))
  (setq dcl-form-close (es_ext (es_ext (groupbib-list 10 gvar_3244) (groupbib-list 40 0)) (es_ext (groupbib-list 10 gvar_3242) (groupbib-list 40 0))))
  dcl-form-close
)

;; Original arg hints: ENTLAST, LS_PROP
;; Referenced symbols: EN_PARENT, ENTDEL, ENTLAST, LS_PROP, ST_SYLE, EN_POLY, GETVAR, REPDYN-GETPOINT
(defun polycc-side (entlast ls_prop / en_parent ls_parent ls_ent st_id st_txt local_2)
  (entdel 'en_parent)
  (setq gvar_3244 (getvar entlast_2 (st_syle ls_prop_2 (repdyn-isrep gvar_3236 2)) 'en_poly))
  (setq gvar_3242 (getvar entlast_2 (dcl-grid-addrow ls_prop_2 (repdyn-isrep gvar_3236 2)) 'en_poly))
  (if (repdyn-getpoint (pt_ref gvar_3244 en_parent) (pt_ref gvar_3242 en_parent))
    (progn
      '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)
    )
    (progn
      'en_poly
    )
  )
)

;; Original arg hints: arg_1, *ST_PETYPE*, *ST_PEID*
;; Referenced symbols: ENTDEL, *ST_PETYPE*, *ST_PEID*, LS_DATA, LS_VISIENT, HA_ZOOM, EN_ZOOM, PROJET/PA_PROJET/BTN_ZOOM, PROJET/PA_PROJET/BTN_UPDATE, BLKBIB-GETVISIENT
;; Referenced strings: OC-Polyligne
(defun polycc-tanext (arg_1 *st_petype* *st_peid* / eo_ent st_type st_id ha_ref st_ldataname local_1)
  (entdel "OC-Polyligne")
  (setq ls_data (pt_ref gvar_1229 gvar_1228))
  (setq ha_zoom (dcl-grid-addrow *st_petype*_2 *st_peid*_2))
  (setq projet_pa_projet_btn_zoom (en_zoom (dcl-grid-addrow (ls_visient ls_data ls_data) (ls_visient ha_zoom ha_zoom))))
  (setq projet_pa_projet_btn_edit (projet_pa_projet_btn_update projet_pa_projet_btn_zoom ha_zoom))
  (setq projet_pa_projet_btn_delete (blkbib-getvisient gvar_1229 gvar_1228))
  (es_ext (es_ext (getvar gvar_1229 (st_syle projet_pa_projet_btn_delete projet_pa_projet_btn_edit) *st_petype*_2) (getvar gvar_1228 (st_syle projet_pa_projet_btn_delete projet_pa_projet_btn_edit) *st_peid*_2)) (es_ext (getvar gvar_1229 (dcl-grid-addrow projet_pa_projet_btn_delete projet_pa_projet_btn_edit) *st_petype*_2) (getvar gvar_1228 (dcl-grid-addrow projet_pa_projet_btn_delete projet_pa_projet_btn_edit) *st_peid*_2)))
)

;; Original arg hints: arg_1, *ST_PETYPE*, *ST_PEID*
;; Referenced symbols: PROJET/PA_PROJET/GR_PROPS, ENTDEL, *ST_PETYPE*, *ST_PEID*, ST_BLKBASE, PROJEXP-AFFPROPS, POLYBIB-VTXJOIN, ES_EXT, POLYBIB-LWVERTICES, ST_SYLE
(defun polycc-tanint (arg_1 *st_petype* *st_peid* / eo_ent st_type st_id ha_ref st_ldataname local_1)
  (entdel 'projet_pa_projet_gr_props)
  (if (st_blkbase *st_petype*_2 *st_peid*_2)
    (progn
      (polybib-lwvertices 'projexp-affprops '(st_key st_type st_id) (es_ext gvar_1228 gvar_1229 *st_peid*_2 *st_petype*_2 polybib-vtxjoin))
    )
  )
  (pt_ref gvar_1229 gvar_1228)
  (if (st_blkbase (setq ls_data (pt_ref gvar_1229 gvar_1228)) (st_syle *st_petype*_2 *st_peid*_2))
    (progn
      (setq projet_pa_projet_btn_delete (blkbib-getvisient gvar_1229 gvar_1228))
      (setq projet_pa_projet_btn_edit (dcl-tree-isitemexpanded (repdyn-isrep (st_syle *st_petype*_2 *st_peid*_2) ls_data)))
      (if re_cotechem
        (progn
          (es_ext (es_ext (getvar gvar_1228 (st_syle projet_pa_projet_btn_delete projet_pa_projet_btn_edit) (dcl-grid-addrow *st_peid*_2)) (getvar gvar_1229 (st_syle projet_pa_projet_btn_delete projet_pa_projet_btn_edit) *st_petype*_2)) (es_ext (getvar gvar_1228 (dcl-grid-addrow projet_pa_projet_btn_delete projet_pa_projet_btn_edit) (dcl-grid-addrow *st_peid*_2)) (getvar gvar_1229 (dcl-grid-addrow projet_pa_projet_btn_delete projet_pa_projet_btn_edit) *st_petype*_2)))
        )
        (progn
          (es_ext (es_ext (getvar gvar_1229 (st_syle projet_pa_projet_btn_delete projet_pa_projet_btn_edit) *st_petype*_2) (getvar gvar_1228 (st_syle projet_pa_projet_btn_delete projet_pa_projet_btn_edit) (dcl-grid-addrow *st_peid*_2))) (es_ext (getvar gvar_1229 (dcl-grid-addrow projet_pa_projet_btn_delete projet_pa_projet_btn_edit) *st_petype*_2) (getvar gvar_1228 (dcl-grid-addrow projet_pa_projet_btn_delete projet_pa_projet_btn_edit) (dcl-grid-addrow *st_peid*_2))))
        )
      )
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: dcl-tree-isitemexpanded, ENTDEL, ODCLBIB-TREEGETCHILD, <, EN_RAYON, RE_YINV, ST_SPECIAL, dcl-form-show, IN_PARAM, VA_POINT
;; Referenced strings: Croisée , Base, Reconstruction des réacteurs des paramètres
(defun polydyn-modgo (en_rayon)
  (entdel 'dcl-tree-isitemexpanded)
  (cdr 'odclbib-treegetchild)
  (ha_rep)
  (vlax-erased-p gvar_1272)
  (polybib-absrem)
  (bo_lctabs gvar_1198 in_lon0)
  (ls_vtx0 gvar_1197 (polybib-lwvertices 'eo_polyabs gvar_1203))
  (ls_vtx0 gvar_1196 (polybib-lwvertices 'eo_polyabs gvar_1201))
  (ls_vtx0 getkword (polybib-lwvertices 'eo_polyabs gvar_1199))
  (bo_lctbase gvar_1194 ls_axe)
  (boxlib-listbox en_rayon_2)
  (bo_ent 0)
  (setq re_yinv en_rayon_2)
  (setq gvar_3345 (st_special re_yinv))
  (setq ls_groupparent gvar_3345)
  (setq ls_axe (in_param gvar_3345 'dcl-form-show))
  (setq gvar_2537 (re_ray (hachbib-vtxs2hach (in_param gvar_3345 'va_point))))
  (setq re_offd (re_ray (in_param gvar_3345 'ls_importfilters)))
  (setq in_lon0 (en_polyabs gvar_3345 'ls_obj 'ls_ext1))
  (setq vlax-curve-isclosed (ha_rep re_offd listbib-substlist gvar_2537 re_u))
  (setq va_parent (ls_dist))
  (setq gvar_1203 (es_ext (groupbib-list "Croisée " 'ls_sons) (groupbib-list "Base" 'dcl-tree-getfirstchilditem) (groupbib-list "Reconstruction des réacteurs des paramètres" 'en_first) (groupbib-list 'ls_paramentxy 'ls_sonsexi) (groupbib-list 'dcl-tree-getnextsiblingitem 'ls_son) (groupbib-list '(re_x re_y pt_poly re_anglepoly re_angle) 'ls_petype)))
  (setq gvar_1201 (es_ext (groupbib-list 'blkpoly-poly "ha_parent") (groupbib-list "Reconstruction des réacteurs des paramètres" 'eo_blkparam) (groupbib-list 'ls_paramentxy 'blkbib-blk_temp) (groupbib-list "Impossible d'insérer le bloc droit" 'aopop-go) (groupbib-list "Base" "re_sens") (groupbib-list '(re_x re_y pt_poly re_anglepoly re_angle) 'eg_blkbase)))
  (setq gvar_1199 (es_ext (groupbib-list "Base" "re_sens") (groupbib-list "Impossible d'insérer le bloc droit" 'aomod-go) (groupbib-list "Reconstruction des réacteurs des paramètres" 'eo_blkparam)))
  (ls_som0)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: BO_ENT, ENTDEL, VA_POINT, IN_PARAM, RE_RAY, AOSUP-GO, *EN_INS*, BLKBIB-GETVISINAMES, PT_DP, ST_AXEID
;; Referenced strings: 10.0
(defun polydyn-edit-fillgrid (en_rayon / local_1)
  (entdel 'bo_ent)
  (*en_ins* aosup-go)
  (setq gvar_2537 (re_ray (hachbib-vtxs2hach (in_param gvar_3345 'va_point))))
  (setq blkbib-getvisinames (in_param gvar_3345 '(lambda (ls_ent) (listbib-key ls_ent "st_layer"))))
  (setq pt_dp 0)
  (setq local_1 blkbib-getvisinames)
  ;; init-args 3: "10.0", nil
  (foreach gvar_3385 local_1
    (eo_blkpop aosup-go (dcl-control-setenabled (st_axeid pt_dp)) (in_param gvar_3385 'st_type) (in_param gvar_3385 '(en_polydyn en_ref ls_soms ls_som st_type st_abs st_offset re_absmod re_offsetmod va_abs)) (eo_blkbase (re_offf gvar_2537 blkbib-getvisinames pt_dp) 2 2) (in_param gvar_3385 'ls_txt) (eo_blkbase (pt_fp gvar_2537 blkbib-getvisinames pt_dp) 2 2))
    (setq pt_dp (st_axeid pt_dp))
  )
  (ls_som0)
)

;; Original arg hints: EQ, NETBIB-PURGEBLOCK
;; Referenced symbols: ENTDEL, EQ, ST_BLKBASE, dcl-tree-deleteitem, POLYBIB-VTXJOIN, GETKWORD, IN_PARAM, vla-get-Name, REPDYN-GETPOINT, ST_NOMOLD
;; Referenced strings: Nom
(defun c:projet_pa_polydyn_grille_offsets_onselchanged (eq netbib-purgeblock)
  (entdel "Nom")
  (if (st_blkbase eq_2 255)
    (progn
      (bo_ent eq_2)
    )
  )
  (vlax-vla-object->ename dcl-tree-deleteitem polybib-vtxjoin)
  (vlax-vla-object->ename gvar_1197 polybib-vtxjoin)
  (vlax-vla-object->ename gvar_1196 polybib-vtxjoin)
  (vlax-vla-object->ename getkword polybib-vtxjoin)
  (vlax-vla-object->ename gvar_1189 polybib-vtxjoin)
  (vlax-vla-object->ename gvar_1188 polybib-vtxjoin)
  (re_hauteur st_nomold ls_paramwcs)
  (re_hauteur gvar_1197 ls_paramwcs)
  (setq ls_paramwcs (repdyn-getpoint eq_2 (vla-get-name (st_ray2 (in_param gvar_3345 '(lambda (ls_ent) (listbib-key ls_ent "st_layer")))))))
  (ls_som0)
)

;; Referenced symbols: AOPORA-RENAME, ENTDEL, DCL-GRID-CLEAR, AOSUP-GO, BLKPOLY-LS_ENTSNEW, AXEDYN-REACCREATE, IN_PARAM, BLKBIB-GETVISINAMES, ST_BLKBASE, LS_ATTS
;; Referenced strings:  [Nouveau Repère/Choix repère/Origine/Fin/Abscicce/Décalage] <Sortie> :
(defun c:projet_pa_polydyn_bt_supprimer_onclicked ( / local_0)
  (entdel 'aopora-rename)
  (axedyn-reaccreate (blkpoly-ls_entsnew aosup-go))
  (in_param gvar_3345 '(lambda (ls_ent) (listbib-key ls_ent "st_layer")))
  (if (and (dcl-grid-clear gvar_1272) (setq gvar_3169 (axedyn-reaccreate (blkpoly-ls_entsnew aosup-go))) (setq blkbib-getvisinames (in_param gvar_3345 '(lambda (ls_ent) (listbib-key ls_ent "st_layer")))) (st_blkbase (st_ray2 blkbib-getvisinames) 2) (st_blkbase gvar_3169 255))
    (progn
      (setq dcl-tree-setitemlabel nil)
      (setq blkbib-getvisinames (ls_atts gvar_3169 blkbib-getvisinames))
      (setq local_0 vlax-curve-isclosed)
      ;; init-args 3: " [Nouveau Repère/Choix repère/Origine/Fin/Abscicce/Décalage] <Sortie> :", nil
      (foreach gvar_1268 local_0
        (column gvar_1268)
      )
      (ls_layers re_yinv gvar_3345)
      (listbib-remove_doubles re_yinv)
      (ha_rep)
      (setq gvar_3345 (st_rayon gvar_3345 '(lambda (ls_ent) (listbib-key ls_ent "st_layer")) blkbib-getvisinames))
      (setq re_u (es_ext))
      (setq pt_d (es_ext))
      (setq listbib-substlist (es_ext))
      (setq vlax-curve-isclosed (ha_rep re_offd listbib-substlist gvar_2537 re_u))
      (if (dcl-grid-clear gvar_1272)
        (progn
          (boxlib-listbox re_yinv)
        )
        (progn
          nil
        )
      )
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: EQ, NETBIB-PURGEBLOCK
;; Referenced symbols: EQ, ST_BLKBASE, vlax-curve-isClosed, DCL-GRID-ADDROW, POLYBIB-VTXJOIN, PT_C2
(defun c:polydyn_pal_polydyn_grille_offsets_ondblclicked (eq netbib-purgeblock)
  (if (st_blkbase eq_2 255)
    (progn
      (pt_c2 (dcl-grid-addrow eq_2 vlax-curve-isclosed) polybib-vtxjoin)
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: EQ
;; Referenced symbols: ENTDEL, dcl-tree-setitemlabel, vlax-curve-isClosed, DCL-GRID-ADDROW, LS_SOMS, EQ, POLYBIB-VTXJOIN, PT_PTP1, IN_PARAM, IN_EXT
;; Referenced strings: Style, Croisée ,  [Liste des PolyDyn] : 
(defun polydyn-dialfilledit (eq)
  (entdel '(ls_props projexp-affpropsaxe projexp-affpropspolydyn projexp-affpropsracdyn projexp-affpropsdetdyn projexp-affpropschemdyn))
  (if dcl-tree-setitemlabel
    (progn
      (ls_soms (dcl-grid-addrow dcl-tree-setitemlabel vlax-curve-isclosed) 62 4)
      (polybib-perpoint (dcl-grid-addrow dcl-tree-setitemlabel vlax-curve-isclosed) nil)
      (st_grouphandle nil nil)
    )
  )
  (ls_soms (dcl-grid-addrow dcl-tree-setitemlabel vlax-curve-isclosed) 62 6)
  (polybib-perpoint (dcl-grid-addrow dcl-tree-setitemlabel vlax-curve-isclosed) polybib-vtxjoin)
  (st_grouphandle nil (pt_ptp1 (dcl-grid-addrow dcl-tree-setitemlabel vlax-curve-isclosed)))
  (vlax-invoke in_ext (geombib-raccordmax "Style" (dcl-control-setenabled (st_axeid eq_2))))
  (sihpp-list gvar_1180)
  (boxlib-optionbox gvar_1180 4)
  (bo_invpoly1 gvar_1197 (laybib-newlay polybib-subpolybisinv (polybib-lwvertices 'axedyn-reaccreate gvar_1203)))
  (vlax-vla-object->ename gvar_1178 T)
  (vlax-vla-object->ename projexp-affpropspolydyn T)
  (vlax-vla-object->ename gvar_1176 (odclbib-fillcombo polybib-subpolybisinv 'dcl-tree-getnextsiblingitem))
  (vlax-vla-object->ename gvar_1175 (odclbib-fillcombo polybib-subpolybisinv 'dcl-tree-getnextsiblingitem))
  (setq dcl-tree-setitemlabel eq_2)
  (setq gvar_1183 (dcl-grid-addrow eq_2 (in_param gvar_3345 '(lambda (ls_ent) (listbib-key ls_ent "st_layer")))))
  (setq gvar_1266 (in_param gvar_1183 '(en_polydyn en_ref ls_soms ls_som st_type st_abs st_offset re_absmod re_offsetmod va_abs)))
  (setq polybib-subpolybisinv (en_polyabs gvar_1183 'st_type "Croisée "))
  (setq gvar_1265 (in_param gvar_1183 '(lambda (ls_rep) (cons (car ls_rep) (if (or (not (listbib-key (cdr ls_rep) "st_nom")) (= "" (listbib-key (cdr ls_rep) "st_nom"))) (car ls_rep) (listbib-key (cdr ls_rep) "st_nom"))))))
  (setq repdyn-go (in_param gvar_1183 'ls_txt))
  (setq ls_ans (in_param gvar_1183 " [Liste des PolyDyn] : "))
  (setq gvar_3162 (in_param gvar_3345 'va_point))
  (setq projet_md_metprop_cb_layer (hachbib-vtxs2hach gvar_3162))
  (setq gvar_2537 (re_ray projet_md_metprop_cb_layer))
  (setq gvar_3388 (re_offf gvar_2537 (in_param gvar_3345 '(lambda (ls_ent) (listbib-key ls_ent "st_layer"))) eq_2))
  (setq blkpoly-get (ls_param gvar_2537 gvar_3388))
  (setq gvar_1180 (projexp-affpropsaxe gvar_2537 blkpoly-get 'odclbib-treegetchild nil nil nil))
  (or (or (or (or (or (odclbib-fillcombo polybib-subpolybisinv '(re_x re_y pt_poly re_anglepoly re_angle)) (odclbib-fillcombo polybib-subpolybisinv 'dcl-tree-getnextsiblingitem)) (or (odclbib-fillcombo polybib-subpolybisinv '(re_x re_y pt_poly re_anglepoly re_angle)) (odclbib-fillcombo polybib-subpolybisinv 'dcl-tree-getnextsiblingitem))) (odclbib-fillcombo polybib-subpolybisinv 'dcl-tree-getnextsiblingitem)) (odclbib-fillcombo polybib-subpolybisinv '(re_x re_y pt_poly re_anglepoly re_angle))) polybib-vtxjoin)
  (setq gvar_1252 'ha_poly)
  (setq *ls_elems* 'ha_poly)
  (setq gvar_1252 (en_polyabs gvar_1183 "Référence 2" 'repdyn-isrep))
  (bo_lctabs projexp-affpropspolydyn (eo_blkbase gvar_1252 2 2))
  (bo_lctabs gvar_1175 (eo_blkbase *ls_elems* 2 2))
  (bo_invpoly1 gvar_1196 (laybib-newlay gvar_1266 (polybib-lwvertices 'axedyn-reaccreate gvar_1201)))
  (setq gvar_1252 (en_polyabs gvar_1183 "Référence 2" 'repdyn-isrep))
  (setq *ls_elems* (en_polyabs gvar_1183 "Rayon" 'repdyn-isrep))
  (or (or (re_angle gvar_1266 'blkpoly-poly) (re_angle gvar_1266 '(re_x re_y pt_poly re_anglepoly re_angle))) polybib-vtxjoin)
  (re_hauteur projexp-affpropsracdyn nil)
  (re_hauteur projexp-affpropsracdyn polybib-vtxjoin)
  (vlax-invoke projexp-affpropsracdyn (geombib-raccordmax 'en_txt (in_param gvar_1183 "Milieu")))
  (re_hauteur projexp-affpropsracdyn polybib-vtxjoin)
  (vlax-invoke projexp-affpropsracdyn 'pt_11)
  (bo_invpoly1 getkword (laybib-newlay repdyn-go (polybib-lwvertices 'axedyn-reaccreate gvar_1199)))
  (bo_lctabs gvar_1189 (eo_blkbase gvar_1265 2 2))
  (bo_lctabs gvar_1188 (eo_blkbase ls_ans 2 2))
  (setq gvar_1171 (blkpoly-ls_entsnew aosup-go))
  (or (or (or (or (re_angle (re_x gvar_1171) 1) (re_angle (re_x gvar_1171) 2)) (re_angle (re_x gvar_1171) 3)) (re_angle (re_x gvar_1171) 4)) (re_angle (re_x gvar_1171) 5))
  (en_hatch gvar_1188)
  (ls_entnew gvar_1188 0 255)
  (en_hatch getkword)
  (en_hatch gvar_1189)
  (ls_entnew gvar_1189 0 255)
  (en_hatch gvar_1196)
  (en_hatch gvar_1197)
  (ls_som0)
)

;; Original arg hints: EO_POLY, arg_2
;; Referenced symbols: EO_POLY, DCL-GRID-ADDROW, AXEDYN-REACCREATE, POLYBIB-SUBPOLYBISINV, ODCLBIB-FILLCOMBO, dcl-tree-getnextsiblingitem, PROJEXP-AFFPROPSPOLYDYN
(defun c:projet_pa_polydyn_st_type_onselchanged (eo_poly arg_2)
  (vlax-vla-object->ename gvar_1178 T)
  (vlax-vla-object->ename projexp-affpropspolydyn T)
  (vlax-vla-object->ename gvar_1176 (odclbib-fillcombo polybib-subpolybisinv 'dcl-tree-getnextsiblingitem))
  (setq polybib-subpolybisinv (axedyn-reaccreate (dcl-grid-addrow eo_poly_2 gvar_1203)))
  (vlax-vla-object->ename gvar_1175 (odclbib-fillcombo polybib-subpolybisinv 'dcl-tree-getnextsiblingitem))
  (or (or (odclbib-fillcombo polybib-subpolybisinv '(re_x re_y pt_poly re_anglepoly re_angle)) (odclbib-fillcombo polybib-subpolybisinv 'dcl-tree-getnextsiblingitem)) (or (odclbib-fillcombo polybib-subpolybisinv '(re_x re_y pt_poly re_anglepoly re_angle)) (odclbib-fillcombo polybib-subpolybisinv 'dcl-tree-getnextsiblingitem)))
)

;; Original arg hints: EO_POLY, arg_2
;; Referenced symbols: IN_LONGRP, ENTDEL, VA_POINT, IN_PARAM, PROJET/MD_METPROP/CB_LAYER, RE_RAY, BLKBIB-GETVISINAMES, dcl-tree-setitemlabel, PT_FP, DCL-GRID-ADDROW
;; Referenced strings:  [Liste des PolyDyn] : 
(defun c:projet_pa_polydyn_st_offset_onselchanged (eo_poly arg_2)
  (entdel 'in_longrp)
  (setq gvar_3162 (in_param gvar_3345 'va_point))
  (setq projet_md_metprop_cb_layer (hachbib-vtxs2hach gvar_3162))
  (setq gvar_2537 (re_ray projet_md_metprop_cb_layer))
  (setq blkbib-getvisinames (in_param gvar_3345 '(lambda (ls_ent) (listbib-key ls_ent "st_layer"))))
  (setq gvar_2408 (pt_fp gvar_2537 blkbib-getvisinames dcl-tree-setitemlabel))
  (setq ls_ans (in_param (dcl-grid-addrow dcl-tree-setitemlabel blkbib-getvisinames) " [Liste des PolyDyn] : "))
  (or (or (odclbib-fillcombo eo_poly_2 0) (odclbib-fillcombo eo_poly_2 1)) (odclbib-fillcombo eo_poly_2 2))
  (setq gvar_1169 (pt_fp gvar_2537 blkbib-getvisinames 0))
  (setq gvar_2408 (dcl-grid-addrow ls_ans gvar_1169))
  (setq gvar_1169 'ha_poly)
  (setq gvar_2408 (dcl-grid-addrow ls_ans gvar_1169))
  (bo_lctabs gvar_1188 (eo_blkbase gvar_2408 2 3))
  (en_hatch gvar_1188)
  (setq gvar_1169 (pt_fp gvar_2537 blkbib-getvisinames (blkpoly-lsparams 0 (vla-get-name dcl-tree-setitemlabel))))
  (setq gvar_2408 (dcl-grid-addrow ls_ans gvar_1169))
  (ls_entnew gvar_1188 0 255)
)

;; Referenced symbols: EN_HATCH, LS_ENTNEW
(defun c:projet_pa_polydyn_re_absmod_onreturnpressed ()
  (en_hatch gvar_1188)
  (ls_entnew gvar_1188 0 255)
)

;; Referenced symbols: dcl-tree-deleteitem, EN_HATCH
(defun c:projet_pa_polydyn_re_offsetmod_onreturnpressed ()
  (en_hatch dcl-tree-deleteitem)
)

;; Original arg hints: EO_POLY, arg_2
;; Referenced symbols: ENTDEL, EO_POLY, AXEDYN-REACCREATE, POLYBIB-LWVERTICES, DCL-GRID-ADDROW, BLKPOLY-POLY, RE_ANGLE, POLYBIB-VTXJOIN, PROJEXP-AFFPROPSRACDYN, RE_HAUTEUR
;; Referenced strings: Eléménts
(defun c:projet_pa_polydyn_st_abs_onselchanged (eo_poly arg_2)
  (entdel "Eléménts")
  (setq gvar_1266 (dcl-grid-addrow eo_poly_2 (polybib-lwvertices 'axedyn-reaccreate gvar_1201)))
  (or (or (re_angle gvar_1266 'blkpoly-poly) (re_angle gvar_1266 '(re_x re_y pt_poly re_anglepoly re_angle))) polybib-vtxjoin)
  (re_hauteur projexp-affpropsracdyn nil)
  (re_hauteur projexp-affpropsracdyn polybib-vtxjoin)
  (vlax-invoke projexp-affpropsracdyn 'eo_txt)
  (re_hauteur projexp-affpropsracdyn polybib-vtxjoin)
  (vlax-invoke projexp-affpropsracdyn 'eo_txt)
  (setq gvar_1183 (st_rayon gvar_1183 '(en_polydyn en_ref ls_soms ls_som st_type st_abs st_offset re_absmod re_offsetmod va_abs) gvar_1266))
  (ls_som0)
)

;; Referenced symbols: ENTDEL, AXEDYN-REACCREATE, POLYBIB-LWVERTICES, DCL-GRID-ADDROW, LS_PT, BLKPOLY-POLY, RE_ANGLE, VA_PARAM, EN_TXT, GEOMBIB-RACCORDMAX
;; Referenced strings: Paramètres, Position1 X, Éléments
(defun c:projet_pa_polydyn_va_abs_onclicked ()
  (entdel "Paramètres")
  (setq ls_pt (dcl-grid-addrow (ls_props2 gvar_1196) (polybib-lwvertices 'axedyn-reaccreate gvar_1201)))
  (or (re_angle ls_pt 'blkpoly-poly) (re_angle ls_pt '(re_x re_y pt_poly re_anglepoly re_angle)))
  T
  (va_param "Position1 X")
  (geombib-raccordmax 'en_txt gvar_3161)
  (and (setq gvar_3161 (va_param "Position1 X")) (setq projexp-affpropsdetdyn (geombib-raccordmax 'en_txt gvar_3161)))
  T
  (st_visi "Éléments")
  'pt_11
  (if (and (setq gvar_3161 (st_visi "Éléments")) (setq projexp-affpropsdetdyn 'pt_11) gvar_3161)
    (progn
      (vlax-invoke projexp-affpropsracdyn projexp-affpropsdetdyn)
      (setq gvar_1183 (st_rayon gvar_1183 "Milieu" gvar_3161))
    )
  )
  (ls_som0)
)

;; Referenced symbols: LS_ENTNEW
(defun c:projet_pa_polydyn_re_absmod_onsetfocus ()
  (ls_entnew gvar_1189 0 255)
)

;; Referenced symbols: LS_ENTNEW
(defun c:projet_pa_polydyn_re_offsetmod_onsetfocus ()
  (ls_entnew gvar_1188 0 255)
)

;; Referenced symbols: PROJEXP-AFFPROPSPOLYDYN, LS_ENTNEW
(defun c:projet_pa_polydyn_st_r1_onsetfocus ()
  (ls_entnew projexp-affpropspolydyn 0 255)
)

;; Referenced symbols: LS_ENTNEW
(defun c:projet_pa_polydyn_st_r2_onsetfocus ()
  (ls_entnew gvar_1175 0 255)
)

;; Referenced symbols: PROJEXP-AFFPROPSMPOLYDYN, ENTDEL, dcl-tree-setitemlabel, IN_PARAM, PROJEXP-AFFPROPSPOLYDYN, GROUPBIB-LISTOBJ, DCL-GRID-ADDROW, AXEDYN-REACCREATE, GETKWORD, ST_TYPE
;; Referenced strings:  [Liste des PolyDyn] : , Référence 2, Rayon
(defun c:projet_pa_polydyn_bt_enregistrer_onclicked ()
  (entdel 'projexp-affpropsmpolydyn)
  (if dcl-tree-setitemlabel
    (progn
      (ha_rep)
      (en_ref1 vlax-curve-isclosed)
      (boxlib-listbox re_yinv)
      (listbib-remove_doubles re_yinv)
      (setq blkbib-getvisinames (in_param gvar_3345 '(lambda (ls_ent) (listbib-key ls_ent "st_layer"))))
      (setq gvar_1252 (groupbib-listobj (errbib-catchapply projexp-affpropspolydyn)))
      (setq *ls_elems* (groupbib-listobj (errbib-catchapply gvar_1175)))
      (setq polybib-subpolybisinv (axedyn-reaccreate (dcl-grid-addrow (ls_props2 gvar_1197) gvar_1203)))
      (setq gvar_1266 (axedyn-reaccreate (dcl-grid-addrow (ls_props2 gvar_1196) gvar_1201)))
      (setq repdyn-go (axedyn-reaccreate (dcl-grid-addrow (ls_props2 getkword) gvar_1199)))
      (setq gvar_1265 (groupbib-listobj (errbib-catchapply gvar_1189)))
      (setq ls_ans (groupbib-listobj (errbib-catchapply gvar_1188)))
      (setq gvar_1183 (projexp-affpropsmpolydyn gvar_1183 (es_ext 'st_type '(en_polydyn en_ref ls_soms ls_som st_type st_abs st_offset re_absmod re_offsetmod va_abs) 'ls_txt '(lambda (ls_rep) (cons (car ls_rep) (if (or (not (listbib-key (cdr ls_rep) "st_nom")) (= "" (listbib-key (cdr ls_rep) "st_nom"))) (car ls_rep) (listbib-key (cdr ls_rep) "st_nom")))) " [Liste des PolyDyn] : " "Référence 2" "Rayon") (es_ext polybib-subpolybisinv gvar_1266 repdyn-go gvar_1265 ls_ans gvar_1252 *ls_elems*)))
      (setq blkbib-getvisinames (row gvar_1183 dcl-tree-setitemlabel blkbib-getvisinames))
      (setq gvar_3345 (st_rayon gvar_3345 '(lambda (ls_ent) (listbib-key ls_ent "st_layer")) blkbib-getvisinames))
      (setq re_offd (re_ray (in_param gvar_3345 'ls_importfilters)))
      (setq gvar_2537 (re_ray (hachbib-vtxs2hach (in_param gvar_3345 'va_point))))
      (setq vlax-curve-isclosed (ha_rep re_offd listbib-substlist gvar_2537 re_u))
    )
  )
  (ls_som0)
)

;; Referenced symbols: IN_INTERS, ENTDEL, DCL-GRID-CLEAR, LS_SOM0, AXEDYN-REACCREATE, VA_PARENT, POLYBIB-LWVERTICES, DCL-GRID-ADDROW, LS_IMPORTFILTERS, IN_PARAM
;; Referenced strings: Intersection(s)
(defun polydyn-palapply ()
  (entdel 'in_inters)
  (if (and gvar_3345 (dcl-grid-clear gvar_1272))
    (progn
      (ls_som0 "Intersection(s)")
      (listbib-remove_doubles re_yinv)
      (ha_rep)
      (en_ref1 vlax-curve-isclosed)
      (ls_som0 'blkbib-get_visiname)
      (setq errbib-catchapply (dcl-grid-addrow (ls_props2 gvar_1194) (polybib-lwvertices 'axedyn-reaccreate va_parent)))
      (setq re_offd (re_ray (in_param gvar_3345 'ls_importfilters)))
      (setq gvar_2537 (re_ray (hachbib-vtxs2hach (in_param gvar_3345 'va_point))))
      (setq in_lon0 (errbib-catchapply gvar_1198))
      (setq gvar_3345 (st_rayon gvar_3345 'dcl-form-show errbib-catchapply))
      (setq gvar_3345 (st_rayon gvar_3345 'ls_obj in_lon0))
      (setq vlax-curve-isclosed (ha_rep re_offd listbib-substlist gvar_2537 re_u))
    )
  )
  (ls_som0)
)

;; Referenced symbols: ENTDEL, DCL-GRID-CLEAR, RE_YINV, LS_LAYERS, ST_BUTTON, LS_BLKS, GROUPBIB-LIST
;; Referenced strings: PatternAngle
(defun polydyn-palsave ()
  (entdel "PatternAngle")
  (if (and gvar_3345 (dcl-grid-clear gvar_1272))
    (progn
      (ls_layers re_yinv gvar_3345)
      (re_abs2 (groupbib-list 'ls_blks re_yinv) gvar_3094)
      (setq gvar_3094 (st_button gvar_3345))
    )
  )
  (re_abs1 gvar_1272 1)
)

;; Referenced symbols: LS_GROUPPARENT, RE_YINV, LS_SOM0
(defun c:projet_pa_polydyn_bt_annuler_onclicked ()
  (listbib-remove_doubles re_yinv)
  (re_abs1 gvar_1272 1)
  (setq gvar_3345 ls_groupparent)
  (ls_som0)
)

;; Original arg hints: BLKPOLY-PROJ, ST_GROUPHANDLE
;; Referenced symbols: PROJEXP-AFFPROPSBORDYN, ENTDEL, vlax-curve-isClosed, EN_REF1, ODCLBIB-TREEGETCHILD, LS_VISI, LS_SOM0
(defun c:projet_pa_polydyn_onclose (blkpoly-proj st_grouphandle)
  (entdel 'projexp-affpropsbordyn)
  (en_ref1 vlax-curve-isclosed)
  (sihpp-list gvar_1180)
  (ls_visi 'odclbib-treegetchild)
  (setq gvar_1203 nil)
  (setq gvar_1201 nil)
  (setq gvar_1199 nil)
  (setq dcl-tree-setitemlabel nil)
  (setq projexp-affpropschemdyn nil)
  (setq gvar_3345 nil)
  (setq ls_groupparent nil)
  (setq re_yinv nil)
  (setq vlax-curve-isclosed nil)
  (ls_som0)
)

;; Original arg hints: arg_1, BLKBIB-GETVISINAMES, PT_DP
;; Referenced symbols: PROJEXP-AFFPROPSSIHLIN, ENTDEL, PT_DP, BLKBIB-GETVISINAMES, DCL-GRID-ADDROW, IN_PARAM, HA_POLY, RE_ANGLE, LS_PARAMENTXY, BLKPOLY-POLY
;; Referenced strings: Milieu, Reconstruction des réacteurs des paramètres, Impossible d'insérer le bloc droit
(defun polydyn-getabs (arg_1 blkbib-getvisinames pt_dp)
  (entdel 'projexp-affpropssihlin)
  (setq gvar_3385 (dcl-grid-addrow pt_dp_2 blkbib-getvisinames_2))
  (setq gvar_1266 (in_param gvar_3385 '(en_polydyn en_ref ls_soms ls_som st_type st_abs st_offset re_absmod re_offsetmod va_abs)))
  (setq gvar_3161 (in_param gvar_3385 "Milieu"))
  (setq gvar_1265 (in_param gvar_3385 '(lambda (ls_rep) (cons (car ls_rep) (if (or (not (listbib-key (cdr ls_rep) "st_nom")) (= "" (listbib-key (cdr ls_rep) "st_nom"))) (car ls_rep) (listbib-key (cdr ls_rep) "st_nom"))))))
  (setq gvar_3388 'ha_poly)
  (or (or (or (or (or (or (re_angle gvar_1266 "Reconstruction des réacteurs des paramètres") (re_angle gvar_1266 'ls_paramentxy)) (re_angle gvar_1266 "Impossible d'insérer le bloc droit")) (re_angle gvar_1266 "Base")) (re_angle gvar_1266 'blkpoly-poly)) (re_angle gvar_1266 '(re_x re_y pt_poly re_anglepoly re_angle))) polybib-vtxjoin)
  (setq gvar_3388 'ha_poly)
  (setq gvar_3388 (st_syle (palbib-init gvar_2537 (axedyn-reaccreate (pt_ins11 gvar_3161))) gvar_1265))
  (setq gvar_3388 (st_syle (palbib-init gvar_2537 gvar_3161) gvar_1265))
  (setq gvar_3388 (st_syle (re_offf gvar_2537 blkbib-getvisinames_2 (vla-get-name pt_dp_2)) gvar_1265))
  (setq gvar_3388 gvar_1265)
  (setq gvar_3388 (dcl-grid-addrow (dcl-control-setvisible gvar_2537 (projet_md_metprop gvar_2537)) (entib-handle2ename gvar_1265)))
  (setq gvar_3388 (entib-handle2ename gvar_1265))
  gvar_3388
)

;; Original arg hints: arg_1, BLKBIB-GETVISINAMES, PT_DP
;; Referenced symbols: STYLEREP-GET, ENTDEL, PT_DP, BLKBIB-GETVISINAMES, DCL-GRID-ADDROW, LS_TXT, BLKPOLY-POLY, EN_POLYABS, HA_POLY, REPDYN-GO
;; Referenced strings: Liste,  [Liste des PolyDyn] : , Impossible d'insérer le bloc droit
(defun polydyn-getoffset (arg_1 blkbib-getvisinames pt_dp)
  (entdel 'stylerep-get)
  (setq gvar_3385 (dcl-grid-addrow pt_dp_2 blkbib-getvisinames_2))
  (setq repdyn-go (en_polyabs gvar_3385 'ls_txt 'blkpoly-poly))
  (setq polydyn-pt2numnode (en_polyabs gvar_3385 "Liste" 'ha_poly))
  (setq ls_ans (en_polyabs gvar_3385 " [Liste des PolyDyn] : " 'ha_poly))
  (setq polydynraccord 'ha_poly)
  (or (or (or (and (or (re_angle repdyn-go "Impossible d'insérer le bloc droit") (re_angle repdyn-go "Base")) (and (re_angle pt_dp_2 0) (re_angle repdyn-go "Reconstruction des réacteurs des paramètres"))) (re_angle repdyn-go "Reconstruction des réacteurs des paramètres")) (re_angle repdyn-go 're_rayii)) polybib-vtxjoin)
  (setq polydynraccord 'ha_poly)
  (setq polydynraccord (ls_visient (poly-lwpoly_temp gvar_2537 polydyn-pt2numnode) (ls_absdyn gvar_2537 polydyn-pt2numnode)))
  (setq polydynraccord (st_syle (pt_fp gvar_2537 blkbib-getvisinames_2 0) ls_ans))
  (setq polydynraccord 'ha_poly)
  (setq polydynraccord (st_syle (pt_fp gvar_2537 blkbib-getvisinames_2 (vla-get-name pt_dp_2)) ls_ans))
  (setq polydynraccord ls_ans)
  polydynraccord
)

;; Original arg hints: arg_1, BLKBIB-GETVISINAMES
;; Referenced symbols: PROJEXP-AFFPROPSREPERE, ENTDEL, ES_EXT, BLKBIB-GETVISINAMES, PT_DP, RE_OFFF, PT_FP, LS_PARAM, Projet/PA_Projet, vl-ACAD-defun
;; Referenced strings: 10.0, Croisée , Base
(defun polydyn-getvtxs (arg_1 blkbib-getvisinames / local_2)
  (entdel 'projexp-affpropsrepere)
  (setq dcl-form-close (es_ext))
  (setq pt_dp 0)
  (setq gvar_2479 (re_offf gvar_2537 blkbib-getvisinames_2 pt_dp))
  (setq projet_pa_projet (pt_fp gvar_2537 blkbib-getvisinames_2 pt_dp))
  (setq ls_ladata (ls_param gvar_2537 gvar_2479))
  (setq gvar_1153 (re_rel gvar_2537 gvar_2479 projet_pa_projet))
  (setq local_2 (vl-acad-defun blkbib-getvisinames_2))
  ;; init-args 3: "10.0", nil
  (foreach gvar_3385 local_2
    (setq polybib-subpolybisinv (en_polyabs gvar_3385 'st_type "Croisée "))
    (setq pt_dp (st_axeid pt_dp))
    (setq va_bande (re_offf gvar_2537 blkbib-getvisinames_2 pt_dp))
    (setq en_del (pt_fp gvar_2537 blkbib-getvisinames_2 pt_dp))
    (if (and (re_deltax gvar_2537) (ls_ext2 va_bande 'ha_poly))
      (progn
        (setq va_ref (projet_md_metprop gvar_2537))
      )
      (progn
        (setq va_ref (ls_param gvar_2537 va_bande))
      )
    )
    (setq in_par1 (re_rel gvar_2537 va_bande en_del))
    (or (or (or (or (or (re_angle polybib-subpolybisinv "Croisée ") (re_angle polybib-subpolybisinv "Base")) (re_angle polybib-subpolybisinv "Reconstruction des réacteurs des paramètres")) (re_angle polybib-subpolybisinv 'ls_paramentxy)) (re_angle polybib-subpolybisinv 'dcl-tree-getnextsiblingitem)) (re_angle polybib-subpolybisinv '(re_x re_y pt_poly re_anglepoly re_angle)))
    (setq gvar_2759_c_projet_md_repblk_oninitialize (in_par2 gvar_1153 in_par1 (getvar gvar_2537 ls_ladata) (getvar gvar_2537 va_ref) (en_polyabs gvar_3385 "Référence 2" 'repdyn-isrep) (en_polyabs gvar_3385 "Rayon" 'repdyn-isrep)))
    (setq gvar_2759_c_projet_md_repblk_oninitialize (projet_pa_projet_ar_projet gvar_1153 in_par1 (getvar gvar_2537 ls_ladata) (getvar gvar_2537 va_ref) (en_polyabs gvar_3385 "Référence 2" 'repdyn-isrep) (en_polyabs gvar_3385 "Rayon" 'repdyn-isrep)))
    (setq gvar_2759_c_projet_md_repblk_oninitialize (stylechem-list gvar_2537 ls_ladata va_ref en_del polybib-vtxjoin))
    (setq gvar_2759_c_projet_md_repblk_oninitialize (stylechem-list gvar_2537 ls_ladata va_ref projet_pa_projet polybib-vtxjoin))
    (setq gvar_2759_c_projet_md_repblk_oninitialize (es_ext (es_ext (groupbib-list 10 gvar_1153)) (es_ext (groupbib-list 10 in_par1))))
    (if (re_angle projet_pa_projet en_del)
      (progn
        (setq gvar_2759_c_projet_md_repblk_oninitialize (vlax-curve-getpointatparam gvar_2537 ls_ladata va_ref projet_pa_projet polybib-vtxjoin))
      )
      (progn
        (setq gvar_2759_c_projet_md_repblk_oninitialize (en_poly1s gvar_2537 ls_ladata va_ref projet_pa_projet en_del))
      )
    )
    (if gvar_2759_c_projet_md_repblk_oninitialize
      (progn
        (setq dcl-form-close (bo_active dcl-form-close gvar_2759_c_projet_md_repblk_oninitialize))
      )
    )
    (setq gvar_2479 va_bande)
    (setq projet_pa_projet en_del)
    (setq ls_ladata va_ref)
    (setq gvar_1153 in_par1)
  )
  dcl-form-close
)

;; Original arg hints: arg_1, arg_2, dcl-grid-setcellstyle, arg_4, *LS_ELEMS*
;; Referenced symbols: EN_POLY2S, ENTDEL, dcl-grid-setcellstyle, GETVAR, LS_PARENTS, HA_POLY, ST_BLKBASE, IN_ROW, ATOF, ST_AXEDYNID
(defun polydynraccord (arg_1 arg_2 dcl-grid-setcellstyle arg_4 *ls_elems* / in_cellnum in_state inc local_3)
  (entdel 'en_poly2s)
  (setq gvar_1146 (getvar gvar_3244 in_cellnum 9999))
  (setq gvar_1145 (getvar gvar_3242 in_state 4294957297))
  (setq gvar_1144 (ls_parents gvar_3244 gvar_1146 gvar_3242 gvar_1145))
  (if (st_blkbase (entib-handle2ename gvar_1252) 'ha_poly)
    (progn
      (setq atof (in_row gvar_3244 gvar_1144 gvar_3242))
      (setq atof (ld_ldata atof (entib-handle2ename gvar_1252)))
      (st_axedynid gvar_3244 gvar_1144 gvar_3242 atof)
      (setq dcl-form-close (st_axedynid gvar_3244 gvar_1144 gvar_3242 atof))
    )
    (progn
      (es_ext (es_ext (groupbib-list 10 gvar_1144) (groupbib-list 40 0)))
      (setq dcl-form-close (es_ext (es_ext (groupbib-list 10 gvar_1144) (groupbib-list 40 0))))
    )
  )
)

;; Original arg hints: arg_1
;; Referenced symbols: ENTDEL, LD_RACDYN, LD_BORD, POLYBIB-LWVERTICES, RACDYN-POPGO, PARENTBIB-ADD, vlax-ename->vla-object, EN_RAYON, CADR, GEOMBIB-RACCORDMAX
;; Referenced strings: in_side2, \nRaccordement créé !, Coefficient du prix
(defun polydyn-sel (arg_1)
  (entdel "in_side2")
  (vlax-ename->vla-object 'parentbib-add)
  (setq ld_bord (filebib-odbx))
  (setq racdyn-set (polybib-lwvertices 'ld_racdyn ld_bord))
  (setq ha_rac (polybib-lwvertices 'racdyn-popgo ld_bord))
  (projet_md_quantite_bt_qtdroite (geombib-raccordmax gvar_3255 "\nRaccordement créé !"))
  (while (and (cadr en_rayon) (setq gvar_1136 (projet_md_quantite_bt_qtdroite (geombib-raccordmax gvar_3255 "\nRaccordement créé !"))))
    (axedyn-reaccreate gvar_1136)
    (1- gvar_1268)
    (or (and (re_angle gvar_1136 'parentbib-add) (and gvar_1136 (setq gvar_1268 (axedyn-reaccreate gvar_1136)) (setq gvar_1135 (1- gvar_1268)) (in_param racdyn-set gvar_1135))) polybib-vtxjoin)
    (setq gvar_3255 'projet_pa_racdyn)
    (setq en_rayon (in_param racdyn-set gvar_1135))
    (setq en_rayon (projet_pa_racdyn "Coefficient du prix" "Raccord introuvable dans la base" ha_rac 1))
  )
  en_rayon
)

;; Referenced symbols: ENTDEL, PT_INT0, vlax-ename->vla-object, REPDYN-GETPOINTANGLE, GEOMBIB-RACCORDMAX, RE_ANGLE, ES_EXT, UNDOBIB-START, EO_BLKPARAM, BLKBIB-BLK_TEMP
;; Referenced strings: Seconde référence introuvable, ZZZ-Raccord, re_sens
(defun polydyn-selabs ( / st_layer ls_props local_0)
  (entdel "Seconde référence introuvable")
  (vlax-ename->vla-object 'pt_int0)
  (setq gvar_1128 (st_visi (geombib-raccordmax 'repdyn-getpointangle gvar_2609 "ZZZ-Raccord")))
  (or (or (or (or (or (or (or (re_angle gvar_1128 nil) (re_angle 'es_ext (undobib-start gvar_1128))) (re_angle "re_sens" gvar_1128)) (re_angle 'eo_blkparam gvar_1128)) (re_angle 'blkbib-blk_temp gvar_1128)) (re_angle 'aopop-go gvar_1128)) (re_angle 'en_racdyn gvar_1128)) (re_angle "> :" gvar_1128))
  T
  (re_rayonnew nil nil)
  (axedyn-reaccreate (pt_ins11 gvar_3419))
  (re_rayonnew gvar_2537 gvar_2840 listbib-substlist)
  (es_ext (groupbib-list '(en_polydyn en_ref ls_soms ls_som st_type st_abs st_offset re_absmod re_offsetmod va_abs) '(re_x re_y pt_poly re_anglepoly re_angle)) (groupbib-list "Milieu" gvar_3419) (groupbib-list '(lambda (ls_rep) (cons (listbib-key (cdr ls_rep) "ha_poly") (car ls_rep))) st_handleabs) (groupbib-list '(lambda (ls_rep) (cons (car ls_rep) (if (or (not (listbib-key (cdr ls_rep) "st_nom")) (= "" (listbib-key (cdr ls_rep) "st_nom"))) (car ls_rep) (listbib-key (cdr ls_rep) "st_nom")))) 'ha_poly))
  (and (setq gvar_3419 (re_rayonnew nil nil)) (setq gvar_2840 (axedyn-reaccreate (pt_ins11 gvar_3419))) (setq st_handleabs (re_rayonnew gvar_2537 gvar_2840 listbib-substlist)) (setq eo_poly1 (es_ext (groupbib-list '(en_polydyn en_ref ls_soms ls_som st_type st_abs st_offset re_absmod re_offsetmod va_abs) '(re_x re_y pt_poly re_anglepoly re_angle)) (groupbib-list "Milieu" gvar_3419) (groupbib-list '(lambda (ls_rep) (cons (listbib-key (cdr ls_rep) "ha_poly") (car ls_rep))) st_handleabs) (groupbib-list '(lambda (ls_rep) (cons (car ls_rep) (if (or (not (listbib-key (cdr ls_rep) "st_nom")) (= "" (listbib-key (cdr ls_rep) "st_nom"))) (car ls_rep) (listbib-key (cdr ls_rep) "st_nom")))) 'ha_poly))))
  T
  (va_param "Position1 X")
  (axedyn-reaccreate (pt_ins11 gvar_3419))
  (re_rayonnew gvar_2537 gvar_2840 listbib-substlist)
  (es_ext (groupbib-list '(en_polydyn en_ref ls_soms ls_som st_type st_abs st_offset re_absmod re_offsetmod va_abs) '(re_x re_y pt_poly re_anglepoly re_angle)) (groupbib-list "Milieu" gvar_3419) (groupbib-list '(lambda (ls_rep) (cons (listbib-key (cdr ls_rep) "ha_poly") (car ls_rep))) st_handleabs) (groupbib-list '(lambda (ls_rep) (cons (car ls_rep) (if (or (not (listbib-key (cdr ls_rep) "st_nom")) (= "" (listbib-key (cdr ls_rep) "st_nom"))) (car ls_rep) (listbib-key (cdr ls_rep) "st_nom")))) 'ha_poly))
  (and (setq gvar_3419 (va_param "Position1 X")) (setq gvar_2840 (axedyn-reaccreate (pt_ins11 gvar_3419))) (setq st_handleabs (re_rayonnew gvar_2537 gvar_2840 listbib-substlist)) (setq eo_poly1 (es_ext (groupbib-list '(en_polydyn en_ref ls_soms ls_som st_type st_abs st_offset re_absmod re_offsetmod va_abs) '(re_x re_y pt_poly re_anglepoly re_angle)) (groupbib-list "Milieu" gvar_3419) (groupbib-list '(lambda (ls_rep) (cons (listbib-key (cdr ls_rep) "ha_poly") (car ls_rep))) st_handleabs) (groupbib-list '(lambda (ls_rep) (cons (car ls_rep) (if (or (not (listbib-key (cdr ls_rep) "st_nom")) (= "" (listbib-key (cdr ls_rep) "st_nom"))) (car ls_rep) (listbib-key (cdr ls_rep) "st_nom")))) 'ha_poly))))
  T
  (blkbib-set_dynprops 'eo_poly2)
  (es_ext (groupbib-list "Milieu" "Impossible d'insérer le bloc droit") (groupbib-list '(lambda (ls_rep) (cons (car ls_rep) (if (or (not (listbib-key (cdr ls_rep) "st_nom")) (= "" (listbib-key (cdr ls_rep) "st_nom"))) (car ls_rep) (listbib-key (cdr ls_rep) "st_nom")))) gvar_1265))
  (and (setq gvar_1265 (blkbib-set_dynprops 'eo_poly2)) (setq eo_poly1 (es_ext (groupbib-list "Milieu" "Impossible d'insérer le bloc droit") (groupbib-list '(lambda (ls_rep) (cons (car ls_rep) (if (or (not (listbib-key (cdr ls_rep) "st_nom")) (= "" (listbib-key (cdr ls_rep) "st_nom"))) (car ls_rep) (listbib-key (cdr ls_rep) "st_nom")))) gvar_1265))))
  T
  (blkbib-set_dynprops 'en_poly1dc)
  (es_ext (groupbib-list "Milieu" 'ls_paramentxy) (groupbib-list '(lambda (ls_rep) (cons (car ls_rep) (if (or (not (listbib-key (cdr ls_rep) "st_nom")) (= "" (listbib-key (cdr ls_rep) "st_nom"))) (car ls_rep) (listbib-key (cdr ls_rep) "st_nom")))) (dcl-grid-addrow (entib-handle2ename gvar_1265))))
  (and (setq gvar_1265 (blkbib-set_dynprops 'en_poly1dc)) (setq eo_poly1 (es_ext (groupbib-list "Milieu" 'ls_paramentxy) (groupbib-list '(lambda (ls_rep) (cons (car ls_rep) (if (or (not (listbib-key (cdr ls_rep) "st_nom")) (= "" (listbib-key (cdr ls_rep) "st_nom"))) (car ls_rep) (listbib-key (cdr ls_rep) "st_nom")))) (dcl-grid-addrow (entib-handle2ename gvar_1265))))))
  (setq eo_poly1 (es_ext (groupbib-list '(lambda (ls_rep) (cons (listbib-key (cdr ls_rep) "ha_poly") (car ls_rep))) 0) (groupbib-list '(en_polydyn en_ref ls_soms ls_som st_type st_abs st_offset re_absmod re_offsetmod va_abs) "Reconstruction des réacteurs des paramètres") (groupbib-list "Milieu" "Reconstruction des réacteurs des paramètres") (groupbib-list '(lambda (ls_rep) (cons (car ls_rep) (if (or (not (listbib-key (cdr ls_rep) "st_nom")) (= "" (listbib-key (cdr ls_rep) "st_nom"))) (car ls_rep) (listbib-key (cdr ls_rep) "st_nom")))) 'ha_poly)))
  T
  (blkbib-set_dynprops 'en_poly2dc)
  (entib-handle2ename ls_intdc)
  (es_ext (groupbib-list '(en_polydyn en_ref ls_soms ls_som st_type st_abs st_offset re_absmod re_offsetmod va_abs) "Base") (groupbib-list "Milieu" "Base") (groupbib-list '(lambda (ls_rep) (cons (car ls_rep) (if (or (not (listbib-key (cdr ls_rep) "st_nom")) (= "" (listbib-key (cdr ls_rep) "st_nom"))) (car ls_rep) (listbib-key (cdr ls_rep) "st_nom")))) ls_intdc))
  (and (setq ls_intdc (blkbib-set_dynprops 'en_poly2dc)) (setq ls_intdc (entib-handle2ename ls_intdc)) (setq eo_poly1 (es_ext (groupbib-list '(en_polydyn en_ref ls_soms ls_som st_type st_abs st_offset re_absmod re_offsetmod va_abs) "Base") (groupbib-list "Milieu" "Base") (groupbib-list '(lambda (ls_rep) (cons (car ls_rep) (if (or (not (listbib-key (cdr ls_rep) "st_nom")) (= "" (listbib-key (cdr ls_rep) "st_nom"))) (car ls_rep) (listbib-key (cdr ls_rep) "st_nom")))) ls_intdc))))
  (setq gvar_2840 gvar_1128)
  (setq st_handleabs (re_rayonnew gvar_2537 gvar_2840 listbib-substlist))
  (setq eo_poly1 (es_ext (groupbib-list '(en_polydyn en_ref ls_soms ls_som st_type st_abs st_offset re_absmod re_offsetmod va_abs) 'blkpoly-poly) (groupbib-list '(lambda (ls_rep) (cons (listbib-key (cdr ls_rep) "ha_poly") (car ls_rep))) st_handleabs) (groupbib-list "Milieu" gvar_1128) (groupbib-list '(lambda (ls_rep) (cons (car ls_rep) (if (or (not (listbib-key (cdr ls_rep) "st_nom")) (= "" (listbib-key (cdr ls_rep) "st_nom"))) (car ls_rep) (listbib-key (cdr ls_rep) "st_nom")))) 'ha_poly)))
  (setq eo_poly1 nil)
  eo_poly1
)

;; Original arg hints: LS_PROPSDESCS
;; Referenced symbols: PTBIB-SORTDIST, ENTDEL, PT_INTDC, vlax-ename->vla-object, REPDYN-GETPOINTANGLE, PT_INT1, GEOMBIB-RACCORDMAX, RE_ANGLE, ST_VAL, UNDOBIB-START
;; Referenced strings: re_sens, ha_parent, Liste
(defun polydyn-seloffset (ls_propsdescs / st_layer ls_props local_1)
  (entdel 'ptbib-sortdist)
  (vlax-ename->vla-object 'pt_intdc)
  (setq gvar_1128 (blkbib-set_dynprops (geombib-raccordmax 'repdyn-getpointangle gvar_2609 'pt_int1)))
  (or (or (or (or (re_angle gvar_1128 nil) (re_angle 'st_val (undobib-start gvar_1128))) (re_angle "re_sens" gvar_1128)) (re_angle 'eo_blkparam gvar_1128)) (re_angle "ha_parent" gvar_1128))
  T
  (st_visi 'pt_int2)
  (es_ext (groupbib-list 'ls_txt 'blkpoly-poly) (groupbib-list "Liste" st_layer) (groupbib-list " [Liste des PolyDyn] : " 'ha_poly))
  (and (setq st_layer (st_visi 'pt_int2)) (setq eo_poly1 (es_ext (groupbib-list 'ls_txt 'blkpoly-poly) (groupbib-list "Liste" st_layer) (groupbib-list " [Liste des PolyDyn] : " 'ha_poly))))
  T
  (blkbib-set_dynprops 'geombib-arc->bulge)
  (es_ext (groupbib-list 'ls_txt "Reconstruction des réacteurs des paramètres") (groupbib-list "Liste" 'ha_poly) (groupbib-list " [Liste des PolyDyn] : " ls_intdc))
  (and (setq ls_intdc (blkbib-set_dynprops 'geombib-arc->bulge)) (setq eo_poly1 (es_ext (groupbib-list 'ls_txt "Reconstruction des réacteurs des paramètres") (groupbib-list "Liste" 'ha_poly) (groupbib-list " [Liste des PolyDyn] : " ls_intdc))))
  T
  (blkbib-set_dynprops '(re_rayon))
  (es_ext (groupbib-list 'ls_txt "Base") (groupbib-list "Liste" 'ha_poly) (groupbib-list " [Liste des PolyDyn] : " ls_intdc))
  (and (setq ls_intdc (blkbib-set_dynprops '(re_rayon))) (setq eo_poly1 (es_ext (groupbib-list 'ls_txt "Base") (groupbib-list "Liste" 'ha_poly) (groupbib-list " [Liste des PolyDyn] : " ls_intdc))))
  (setq eo_poly1 (es_ext (groupbib-list 'ls_txt "Impossible d'insérer le bloc droit") (groupbib-list "Liste" 'ha_poly) (groupbib-list " [Liste des PolyDyn] : " gvar_1128)))
  (setq eo_poly1 nil)
  eo_poly1
)

;; Referenced symbols: BT_REF1, ENTDEL, ES_EXT, PROJET/PA_RACDYN/RE_COTE2, PROJET/PA_RACDYN/ST_RAYON, COVASSBIB-GETPIPEVTXS, EO_POLYABS, HA_REF2, DCL-GRID-ADDROW, LS_EXT1
;; Referenced strings: \n -> Panneau ,  Incorrecte ! Effacement en cours...
(defun c:projexp-load ( / local_0)
  (entdel 'bt_ref1)
  (projet_pa_racdyn_st_rayon projet_pa_racdyn_re_cote2 nil)
  (covassbib-getpipevtxs projet_pa_racdyn_re_cote2)
  (setq bt_ref2 (es_ext))
  (setq projet_pa_racdyn_re_cote1 (es_ext))
  (setq local_0 (eo_polyabs gvar_1107))
  ;; init-args 3: 'ha_ref2, nil
  (foreach ha_ref2 local_0
    (setq gvar_1105 (covassbib-getpipevtxs projet_pa_racdyn_re_cote2 (dcl-grid-addrow 1 ha_ref2) 'ls_ext1 (dcl-grid-addrow 3 ha_ref2) (dcl-grid-addrow 3 ha_ref2) (dcl-grid-addrow 3 ha_ref2)))
    (setq bt_ref2 (dcl-grid-setcurcell bt_ref2 (groupbib-list gvar_1105 (groupbib-list (dcl-grid-addrow 0 ha_ref2) 'st_btn))))
    (setq projet_pa_racdyn_re_cote1 (dcl-grid-setcurcell projet_pa_racdyn_re_cote1 (groupbib-list (dcl-grid-addrow 0 ha_ref2) gvar_1105)))
  )
  (es_ref (blkpoly-reaccreate) 'vl-position)
  (es_ref (filebib-odbx) 'ls_blks)
  (es_ref (es_ref) 'projet_md_metprop_cb_type)
  (es_ref (in_del) '(lambda (ls_importconf) (= st_sourceid (listbib-key (cdr ls_importconf) "st_SourceId"))))
  (es_ref (st_def) 're_abs2)
  (es_ref (va_def) 'ha_def)
  (es_ref (st_decx) "\n -> Panneau ")
  (es_ref (va_decx) " Incorrecte ! Effacement en cours...")
  (es_ref (st_decy) 'blkpoly-substprops)
  (es_ref (va_decy) '(ls_reps ls_reps ls_rep ls_in in_max st_id))
  (es_ref (va_decy) 'in_special)
  (es_ref (re_inv) 'en_bordi)
  (ls_som0)
)

;; Original arg hints: ST_2, arg_2
;; Referenced symbols: ENTDEL, PROJET/PA_RACDYN/RE_COTE1, IN_PARAM, ES_EXT, ST_2, AOPORA-FIN, AXEDYN-REACCREATE, EO_POLYABS, EN_BORDI, VL-POSITION
;; Referenced strings: pt_base,  Incorrecte ! Effacement en cours..., \n -> Panneau 
(defun projexp-addelement (st_2 arg_2 / local_2)
  (entdel "pt_base")
  (setq gvar_1091 (in_param projet_pa_racdyn_re_cote1 gvar_1093))
  (setq st_bloc (es_ext))
  (setq local_2 st_2_2)
  ;; init-args 3: 'aopora-fin, nil
  nil
  (foreach aopora-fin local_2
    (setq en_rayon (axedyn-reaccreate aopora-fin))
    (setq aopora-fin (eo_polyabs aopora-fin))
    nil
    (or (or (or (or (laybib-newlay gvar_1093 (es_ext 'en_bordi 'vl-position 're_abs2 '(lambda (ls_importconf) (= st_sourceid (listbib-key (cdr ls_importconf) "st_SourceId"))) " Incorrecte ! Effacement en cours..." "\n -> Panneau " 'ls_blks 'ha_def)) (re_angle gvar_1093 'blkpoly-substprops)) (re_angle gvar_1093 'projet_md_metprop_cb_type)) (re_angle gvar_1093 '(ls_reps ls_reps ls_rep ls_in in_max st_id))) (re_angle gvar_1093 'in_special))
    (geombib-raccordmax "1.1" en_rayon 'projet_md_metprop_bt_special (in_param aopora-fin 'croisdyn-set) 'projet_md_metprop_bt_special (in_param aopora-fin "ha_contour"))
    (setq gvar_3255 (geombib-raccordmax "1.1" en_rayon 'projet_md_metprop_bt_special (in_param aopora-fin 'croisdyn-set) 'projet_md_metprop_bt_special (in_param aopora-fin "ha_contour")))
    (geombib-raccordmax "1.1" en_rayon 'projet_md_metprop_bt_special)
    (setq gvar_3255 (geombib-raccordmax "1.1" en_rayon 'projet_md_metprop_bt_special))
    (geombib-raccordmax "1.1" en_rayon 'projet_md_metprop_bt_special (eo_blkbase (en_polyabs aopora-fin "SOLID" 0) 2 2) "st_decX")
    (setq gvar_3255 (geombib-raccordmax "1.1" en_rayon 'projet_md_metprop_bt_special (eo_blkbase (en_polyabs aopora-fin "SOLID" 0) 2 2) "st_decX"))
    (geombib-raccordmax "1.1" en_rayon 'projet_md_metprop_bt_special (in_param aopora-fin "\nPoint de base :"))
    (setq gvar_3255 (geombib-raccordmax "1.1" en_rayon 'projet_md_metprop_bt_special (in_param aopora-fin "\nPoint de base :")))
    (geombib-raccordmax "1.1" en_rayon 'projet_md_metprop_bt_special (in_param aopora-fin 'ls_obj))
    (vla-get-backgroundcolor projet_pa_racdyn_re_cote2 gvar_1091 gvar_3255 (dcl-grid-addrow 2 (in_param gvar_1107 gvar_1093)))
    (dcl-grid-setcurcell bt_ref2 (groupbib-list gvar_1105 (groupbib-list gvar_1093 en_rayon)))
    T
    (and (setq gvar_3255 (geombib-raccordmax "1.1" en_rayon 'projet_md_metprop_bt_special (in_param aopora-fin 'ls_obj))) (setq gvar_1105 (vla-get-backgroundcolor projet_pa_racdyn_re_cote2 gvar_1091 gvar_3255 (dcl-grid-addrow 2 (in_param gvar_1107 gvar_1093)))) (setq bt_ref2 (dcl-grid-setcurcell bt_ref2 (groupbib-list gvar_1105 (groupbib-list gvar_1093 en_rayon)))))
  )
)

;; Original arg hints: arg_1
;; Referenced symbols: ENTDEL, BT_REF2, IN_PARAM, RE_RAYEI, UNDOBIB-START, ES_EXT, RE_ANGLE, AXEDYN-REACCREATE, EO_POLYABS, RE_COURANT
;; Referenced strings: va_decX, Impossible de créer le repère
(defun c:projet_pa_projet_ar_projet_onselchanged (arg_1 / ls_conf ls_filter ls_props en_ent local_0)
  (entdel "va_decX")
  (setq re_rayei (in_param bt_ref2 gvar_1093))
  (if (re_angle (undobib-start re_rayei) 'es_ext)
    (progn
      (setq gvar_1088 (axedyn-reaccreate re_rayei))
      (setq gvar_1087 (eo_polyabs re_rayei))
    )
    (progn
      (setq gvar_1088 "Impossible de créer le repère")
      (setq gvar_1087 re_rayei)
    )
  )
  (if (re_angle (undobib-start re_rayei) 'es_ext)
    (progn
      T
      (in_param gvar_1107 gvar_1088)
      (re_courant gvar_1088 gvar_1087)
      (in_param repdyn-set (dcl-grid-addrow 1 ha_ref2))
      (re_ray gvar_1084)
      (and (setq ha_ref2 (in_param gvar_1107 gvar_1088)) (setq repdyn-set (re_courant gvar_1088 gvar_1087)) (setq gvar_1084 (in_param repdyn-set (dcl-grid-addrow 1 ha_ref2))) (re_ray gvar_1084) (polar (re_ray gvar_1084)) (setq repdyn-getparents (re_ray gvar_1084)) (pt_c2 repdyn-getparents nil) (bo_visible))
    )
    (progn
      T
      (re_ray gvar_1087)
      (and (re_ray gvar_1087) (polar (re_ray gvar_1087)) (setq repdyn-getparents (re_ray gvar_1087)) (pt_c2 repdyn-getparents nil) (bo_visible))
    )
  )
  (vlax-vla-object->ename gvar_1082 st_cat)
  (vlax-vla-object->ename va_type st_cat)
  (vlax-vla-object->ename gvar_1080 st_cat)
  (vlax-vla-object->ename pt_rep st_cat)
  (*en_ins* gvar_1078)
  (pt_rep gvar_1088 gvar_1087)
  (setq st_cat (projet_pa_axes_st_desc gvar_1087 'st_btn))
  (ls_som0)
)

;; Referenced symbols: ENTDEL, LS_SOM0
;; Referenced strings: M
(defun c:projet_pa_projet_ar_projet_ondblclicked ()
  (entdel "M")
  (ls_som0)
)

;; Original arg hints: IMPORTBIB-ISVALID
;; Referenced symbols: RE_ABSINS, ENTDEL, ES_EXT, PROJET/PA_RACDYN/RE_COTE2, IMPORTBIB-ISVALID, POLY-GETPOINTATPERCENT, CADR, POLYDYN-LIST, BT_REF2, IN_PARAM
;; Referenced strings: ha_def
(defun c:projet_pa_projet_ar_projet_onitemexpanding (importbib-isvalid / ls_conf ls_filter ls_props en_ent local_0 local_2 local_3)
  (entdel 're_absins)
  (setq polydyn-list (es_ext))
  (if (cadr (poly-getpointatpercent projet_pa_racdyn_re_cote2 importbib-isvalid_2))
    (progn
      (setq polydyn-list (poly-getpointatpercent projet_pa_racdyn_re_cote2 importbib-isvalid_2))
      (setq local_2 polydyn-list)
      ;; init-args 3: "ha_def", nil
      nil
      (foreach gvar_1091 local_2
        (setq gvar_1072 (in_param bt_ref2 gvar_1091))
        (setq ls_ptang (polydyn-list gvar_1072))
        (setq gvar_1069 (ls_ptang projet_pa_racdyn_re_cote2 gvar_1091))
        (setq eo_rep (es_ext (in_param bt_ref2 gvar_1069)))
        (vla-put-name projet_pa_racdyn_re_cote2 gvar_1069)
        (while (setq gvar_1069 (vla-put-name projet_pa_racdyn_re_cote2 gvar_1069))
          (setq eo_rep (dcl-grid-setcurcell eo_rep (in_param bt_ref2 gvar_1069)))
        )
        (setq local_3 ls_ptang)
        ;; init-args 3: 'blkbib-vlset_atts, nil
        nil
        (foreach blkbib-vlset_atts local_3
          (in_param gvar_1107 (axedyn-reaccreate blkbib-vlset_atts))
          (axedyn-reaccreate blkbib-vlset_atts)
          (vla-get-backgroundcolor projet_pa_racdyn_re_cote2 gvar_1091 (r2 blkbib-vlset_atts) (dcl-grid-addrow 2 vla-put-layer) (dcl-grid-addrow 2 vla-put-layer) (dcl-grid-addrow 2 vla-put-layer))
          (dcl-grid-setcurcell bt_ref2 (groupbib-list gvar_1105 blkbib-vlset_atts))
          T
          (and blkbib-vlset_atts (re_angle (undobib-start blkbib-vlset_atts) 'es_ext) (cadr (laybib-newlay blkbib-vlset_atts eo_rep)) (setq vla-put-layer (in_param gvar_1107 (axedyn-reaccreate blkbib-vlset_atts))) (setq polybib-subpolybisinv (axedyn-reaccreate blkbib-vlset_atts)) (setq gvar_1105 (vla-get-backgroundcolor projet_pa_racdyn_re_cote2 gvar_1091 (r2 blkbib-vlset_atts) (dcl-grid-addrow 2 vla-put-layer) (dcl-grid-addrow 2 vla-put-layer) (dcl-grid-addrow 2 vla-put-layer))) (setq bt_ref2 (dcl-grid-setcurcell bt_ref2 (groupbib-list gvar_1105 blkbib-vlset_atts))))
        )
      )
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: REPDYN-REACCREATE, ENTDEL, RE_RAYEI, UNDOBIB-START, ES_EXT, RE_ANGLE, IN_PARAM, RE_COURANT, REPDYN-SET, HA_REF2
(defun c:projet_pa_projet_btn_zoom_onclicked ()
  (entdel 'repdyn-reaccreate)
  (if (re_angle (undobib-start re_rayei) 'es_ext)
    (progn
      (in_param gvar_1107 gvar_1088)
      (re_courant gvar_1088 gvar_1087)
      (in_param repdyn-set (dcl-grid-addrow 1 ha_ref2))
      (re_ray gvar_1084)
      T
      (and (setq ha_ref2 (in_param gvar_1107 gvar_1088)) (setq repdyn-set (re_courant gvar_1088 gvar_1087)) (setq gvar_1084 (in_param repdyn-set (dcl-grid-addrow 1 ha_ref2))) (re_ray gvar_1084) (polar (re_ray gvar_1084)) (setq repdyn-getparents (re_ray gvar_1084)) (pt_c2 repdyn-getparents polybib-vtxjoin) (bo_visible))
    )
    (progn
      (re_ray gvar_1087)
      T
      (and (re_ray gvar_1087) (polar (re_ray gvar_1087)) (setq repdyn-getparents (re_ray gvar_1087)) (pt_c2 repdyn-getparents polybib-vtxjoin) (bo_visible))
    )
  )
)

;; Referenced symbols: IN_PARAM, HA_REF2, DCL-GRID-ADDROW, GROUPBIB-LIST, POLYBIB-VTXJOIN
(defun c:projet_pa_projet_btn_update_onclicked ()
  (re_rel)
  (repdyn-reaccreate (groupbib-list (dcl-grid-addrow 1 ha_ref2) gvar_1087) polybib-vtxjoin)
  (setq ha_ref2 (in_param gvar_1107 gvar_1088))
  (blkbib-set_dynprops)
)

;; Referenced symbols: ENTDEL, ES_EXT, vlax-curve-getEndParam, GROUPBIB-LIST, LS_SOM0
;; Referenced strings:  [Liste des repères] : 
(defun c:projet_pa_projet_btn_edit_onclicked ()
  (entdel " [Liste des repères] : ")
  (re_rel)
  (vlax-curve-getendparam (es_ext gvar_1088 gvar_1087))
  (repdyn-popgo (groupbib-list gvar_1107 gvar_1087))
  (ls_som0)
)

;; Referenced symbols: ENTDEL, LS_DYNS, GROUPBIB-LIST, ST_SOURCEID, REPDYN-POPGO, vlax-ename->vla-object, IN_LON0, GEOMBIB-RACCORDMAX, *LS_TYPE*, VA_OFFSET
;; Referenced strings: Point fixe
(defun c:projet_pa_projet_btn_delete_onclicked ( / local_0)
  (entdel '(st_id ls_rep st_def pt_ins pt_0))
  (ls_dyns)
  (vlax-ename->vla-object 'repdyn-popgo)
  (setq st_sourceid (groupbib-list gvar_1088 gvar_1087))
  (setq in_lon0 (r2 st_sourceid))
  (setq gvar_1093 (*ls_type* (geombib-raccordmax '(st_def lsstylenom lsstyleid st_style) in_lon0 "Point fixe")))
  (or (re_angle gvar_1093 'va_offset) polybib-vtxjoin)
  (ls_som0 '*ls_rep0*)
  (vlax-ename->vla-object 'repdyn-popgo)
  (lsstylenom (groupbib-list gvar_1088 gvar_1087) *ls_stylerep*)
  (setq gvar_1093 (*ls_type* (geombib-raccordmax 'stylerep-list "Point fixe")))
  (setq *ls_stylerep* (ls_ext2 gvar_1093 'va_offset))
  (setq local_0 bt_ref2)
  ;; init-args 3: 're_rayei, nil
  (foreach re_rayei local_0
    (if (ls_ext2 (eo_polyabs re_rayei) (groupbib-list gvar_1088 gvar_1087))
      (progn
        (lsstyleid projet_pa_racdyn_re_cote2 (axedyn-reaccreate re_rayei))
      )
    )
  )
  (ls_som0 'projet_pa_repdyn_st_def)
  (ls_outersproj)
  (ls_som0)
)

;; Original arg hints: EQ, NETBIB-PURGEBLOCK
;; Referenced symbols: PROJET/PA_REPDYN/ST_NOM, ENTDEL, EQ, RE_ANGLE, NETBIB-PURGEBLOCK, GROUPBIB-LIST, IN_LON0, PROJET/PA_REPDYN/ST_DESC, LS_EXT2, CADR
(defun c:projet_pa_projet_gr_props_onendlabeledit (eq netbib-purgeblock / local_2)
  (entdel 'projet_pa_repdyn_st_nom)
  (ls_absint2 gvar_1078 0 1)
  (r2 (groupbib-list gvar_1088 gvar_1087))
  (setq local_2 bt_ref2)
  (and (re_angle eq_2 0) (re_angle netbib-purgeblock_2 1) (setq in_lon0 (ls_absint2 gvar_1078 0 1)) (setq projet_pa_repdyn_st_desc (r2 (groupbib-list gvar_1088 gvar_1087))) (cadr (ls_ext2 in_lon0 projet_pa_repdyn_st_desc)) (projet_pa_repdyn_st_style gvar_1088 gvar_1087 (ls_absint2 gvar_1078 0 1) nil))
  ;; init-args 3: 're_rayei, nil
  nil
  (foreach re_rayei local_2
    (if (ls_ext2 (eo_polyabs re_rayei) (groupbib-list gvar_1088 gvar_1087))
      (progn
        (c:projet_pa_repdyn_st_def_onselchanged projet_pa_racdyn_re_cote2 (axedyn-reaccreate re_rayei) (ls_absint2 gvar_1078 0 1))
      )
      (progn
        nil
      )
    )
  )
  T
  T
)

;; Original arg hints: BLKPOLY-PROJ, ST_GROUPHANDLE
;; Referenced symbols: LS_SOM0
(defun c:projet_pa_projet_onclose (blkpoly-proj st_grouphandle)
  (st_grouphandle nil nil)
  (setq projet_pa_racdyn_re_cote1 nil)
  (setq bt_ref2 nil)
  (setq gvar_1088 nil)
  (setq gvar_1087 nil)
  (ls_som0)
)

;; Original arg hints: POLYBIB-SUBPOLYBISINV, EN_RAYON
;; Referenced symbols: ENTDEL, EN_RAYON, PROJET/PA_REPDYN/CA_DECX, AOPORA-FIN, IN_PARAM, RE_RAY, ST_DESC, AXEDYN-LIST, ST_ABS, LS_OBJ
;; Referenced strings: st_decX, SOLID, Choix repère
(defun projexp-affprops (polybib-subpolybisinv en_rayon / local_2)
  (entdel '(va_decx va_decy))
  ;; init-args 3: 'en_rayon, polybib-subpolybisinv
  (entdel 'projet_pa_repdyn_ca_decx)
  (setq aopora-fin (ls_propsdescs en_rayon_2))
  (setq gvar_3374 (in_param aopora-fin '(st_nom st_style)))
  (setq gvar_2983 (repdyn-get (re_ray gvar_3374)))
  (in_param aopora-fin 'st_desc)
  (if (setq axedyn-list (in_param aopora-fin 'st_desc))
    (progn
      (setq projet_pa_repdyn_ca_decy (st_ray2 axedyn-list))
    )
    (progn
      (setq projet_pa_repdyn_ca_decy 0)
    )
  )
  (es_ext (es_ext 'st_abs (in_param aopora-fin 'ls_obj)) (es_ext 'projet_pa_repdyn_va_decx (in_param (polydyn-makesom (in_param aopora-fin 'dcl-form-show)) 'ls_obj)) (es_ext 'blkpoly-blk (geombib-raccordmax (eo_blkbase gvar_2983 2 2) "st_decX")) (es_ext 'projet_pa_repdyn_va_decy (dcl-control-setenabled projet_pa_repdyn_ca_decy)))
  (setq polybib_geom-bulge2radius (es_ext (es_ext 'st_abs (in_param aopora-fin 'ls_obj)) (es_ext 'projet_pa_repdyn_va_decx (in_param (polydyn-makesom (in_param aopora-fin 'dcl-form-show)) 'ls_obj)) (es_ext 'blkpoly-blk (geombib-raccordmax (eo_blkbase gvar_2983 2 2) "st_decX")) (es_ext 'projet_pa_repdyn_va_decy (dcl-control-setenabled projet_pa_repdyn_ca_decy))))
  (setq gvar_1040 'princ)
  ;; init-args 3: 'en_rayon, polybib-subpolybisinv
  (entdel 'st_ref1)
  (setq aopora-fin (st_special en_rayon_2))
  (setq gvar_3374 (in_param aopora-fin 'ls_importfilters))
  (setq gvar_2983 (repdyn-get (re_ray gvar_3374)))
  (in_param aopora-fin '(lambda (ls_ent) (listbib-key ls_ent "st_layer")))
  (if (setq axedyn-list (in_param aopora-fin '(lambda (ls_ent) (listbib-key ls_ent "st_layer"))))
    (progn
      (setq projet_pa_repdyn_ca_decy (st_ray2 axedyn-list))
    )
    (progn
      (setq projet_pa_repdyn_ca_decy 0)
    )
  )
  (es_ext (es_ext 'st_abs (in_param aopora-fin 'ls_obj)) (es_ext 'projet_pa_repdyn_va_decx (in_param (polydyn-makesom (in_param aopora-fin 'dcl-form-show)) 'ls_obj)) (es_ext 'blkpolydial-getlong (r2 (in_param aopora-fin 'va_point))) (es_ext 'blkpoly-blk (geombib-raccordmax (eo_blkbase gvar_2983 2 2) "st_decX")) (es_ext 'projet_pa_repdyn_va_decy (dcl-control-setenabled projet_pa_repdyn_ca_decy)))
  (setq polybib_geom-bulge2radius (es_ext (es_ext 'st_abs (in_param aopora-fin 'ls_obj)) (es_ext 'projet_pa_repdyn_va_decx (in_param (polydyn-makesom (in_param aopora-fin 'dcl-form-show)) 'ls_obj)) (es_ext 'blkpolydial-getlong (r2 (in_param aopora-fin 'va_point))) (es_ext 'blkpoly-blk (geombib-raccordmax (eo_blkbase gvar_2983 2 2) "st_decX")) (es_ext 'projet_pa_repdyn_va_decy (dcl-control-setenabled projet_pa_repdyn_ca_decy))))
  (setq gvar_1038 'st_nom)
  ;; init-args 3: 'en_rayon, polybib-subpolybisinv
  (entdel 'st_ref2)
  (setq aopora-fin (projet_md_metprop_st_nom en_rayon_2))
  (setq gvar_3374 (in_param aopora-fin 'in_enttype))
  (setq gvar_2983 (repdyn-get (re_ray gvar_3374)))
  (setq gvar_3331 (in_param aopora-fin "SOLID"))
  (es_ext (es_ext 'st_abs (in_param aopora-fin 'ls_obj)) (es_ext "Choix repère" (r2 (in_param aopora-fin "\n -> PolyDyn "))) (es_ext 'bo_ref2 (r2 (in_param aopora-fin "Origine"))) (es_ext 'blkpoly-blk (geombib-raccordmax (eo_blkbase gvar_2983 2 2) "st_decX")) (es_ext "Choix sécante" (geombib-raccordmax (eo_blkbase gvar_3331 2 2) "st_decX")))
  (setq polybib_geom-bulge2radius (es_ext (es_ext 'st_abs (in_param aopora-fin 'ls_obj)) (es_ext "Choix repère" (r2 (in_param aopora-fin "\n -> PolyDyn "))) (es_ext 'bo_ref2 (r2 (in_param aopora-fin "Origine"))) (es_ext 'blkpoly-blk (geombib-raccordmax (eo_blkbase gvar_2983 2 2) "st_decX")) (es_ext "Choix sécante" (geombib-raccordmax (eo_blkbase gvar_3331 2 2) "st_decX"))))
  (setq gvar_1033 '(st_rep st_mask ls_file cmdecho))
  ;; init-args 3: 'en_rayon, polybib-subpolybisinv
  (entdel 'st_ref2)
  (setq aopora-fin (blkpoly-getparententities en_rayon_2))
  (setq re_bulge (in_param aopora-fin 'dcl-control-settext))
  (setq polybib_geom-bulge2radius (in_param aopora-fin 'polybib-absatpoint))
  (setq projet_pa_repdyn_btn_ref2 (st_ray2 (ls_elem "Choix point" (polar (re_ray re_bulge)))))
  (es_ext (es_ext 'st_abs (in_param aopora-fin 'ls_obj)) (es_ext 'projet_pa_repdyn_btn_ref (r2 (in_param aopora-fin 'va_point))) (es_ext "va_echelle" (in_param aopora-fin "\nPoint de base :")) (es_ext 'repdyndial-visi (dcl-control-setenabled projet_pa_repdyn_btn_ref2)) (es_ext '(st_def va_def va_ref1) (dcl-control-setenabled (st_ray2 polybib_geom-bulge2radius))))
  (setq polybib_geom-bulge2radius (es_ext (es_ext 'st_abs (in_param aopora-fin 'ls_obj)) (es_ext 'projet_pa_repdyn_btn_ref (r2 (in_param aopora-fin 'va_point))) (es_ext "va_echelle" (in_param aopora-fin "\nPoint de base :")) (es_ext 'repdyndial-visi (dcl-control-setenabled projet_pa_repdyn_btn_ref2)) (es_ext '(st_def va_def va_ref1) (dcl-control-setenabled (st_ray2 polybib_geom-bulge2radius)))))
  (setq gvar_1027 "APPDATA")
  ;; init-args 3: 'en_rayon, polybib-subpolybisinv
  (entdel 'st_ref1)
  (setq aopora-fin (projet_md_metprop_bt_layer en_rayon_2))
  (setq gvar_3374 (in_param aopora-fin 'ls_importfilters))
  (setq gvar_2983 (repdyn-get (re_ray gvar_3374)))
  (in_param aopora-fin 'stylepoly-fillcombo)
  (if (setq axedyn-list (in_param aopora-fin 'stylepoly-fillcombo))
    (progn
      (setq projet_pa_repdyn_ca_decy (st_ray2 axedyn-list))
    )
    (progn
      (setq projet_pa_repdyn_ca_decy 0)
    )
  )
  (es_ext (es_ext 'st_abs (in_param aopora-fin 'ls_obj)) (es_ext 'projet_pa_repdyn_va_decx (in_param (polydyn-makesom (in_param aopora-fin 'dcl-form-show)) 'ls_obj)) (es_ext 'blkpoly-blk (geombib-raccordmax (eo_blkbase gvar_2983 2 2) "st_decX")) (es_ext "Modification référence" (dcl-control-setenabled projet_pa_repdyn_ca_decy)))
  (setq polybib_geom-bulge2radius (es_ext (es_ext 'st_abs (in_param aopora-fin 'ls_obj)) (es_ext 'projet_pa_repdyn_va_decx (in_param (polydyn-makesom (in_param aopora-fin 'dcl-form-show)) 'ls_obj)) (es_ext 'blkpoly-blk (geombib-raccordmax (eo_blkbase gvar_2983 2 2) "st_decX")) (es_ext "Modification référence" (dcl-control-setenabled projet_pa_repdyn_ca_decy))))
  (setq gvar_1025 'getenv)
  ;; init-args 3: 'en_rayon, polybib-subpolybisinv
  (entdel '(st_def va_def en_ref2 st_repid))
  (setq aopora-fin (chemdyn-signatrace en_rayon_2))
  (setq gvar_2537 (chemdyn-bordtrace (in_param aopora-fin 'va_point)))
  (setq pt_pas (in_param aopora-fin "Choisir un sommet"))
  (setq chemdyn-hachtrace (re_offset2 pt_pas gvar_2537))
  (setq ls_inters1 (in_param aopora-fin 'croisdyn-getelems))
  (setq gvar_2532 (re_offset2 ls_inters1 gvar_2537))
  (setq gvar_2983 (entib-handle2ename (dcl-grid-addrow chemdyn-hachtrace gvar_2532)))
  (in_param aopora-fin 'ocbib-isok)
  (if (setq stylechem-get (in_param aopora-fin 'ocbib-isok))
    (progn
      (setq st_repid (st_ray2 stylechem-get))
    )
    (progn
      (setq st_repid 0)
    )
  )
  (es_ext (es_ext 'st_abs (in_param aopora-fin 'ls_obj)) (es_ext 'blkpolydial-getlong (r2 (in_param aopora-fin 'va_point))) (es_ext 'projet_pa_repdyn_va_decx (in_param (ls_vtxsbase2 (in_param aopora-fin 'dcl-form-show)) 'ls_obj)) (es_ext 'blkpoly-blk (geombib-raccordmax (eo_blkbase gvar_2983 2 2) "st_decX")) (es_ext 'parentbib-getfamily (dcl-control-setenabled st_repid)))
  (setq polybib_geom-bulge2radius (es_ext (es_ext 'st_abs (in_param aopora-fin 'ls_obj)) (es_ext 'blkpolydial-getlong (r2 (in_param aopora-fin 'va_point))) (es_ext 'projet_pa_repdyn_va_decx (in_param (ls_vtxsbase2 (in_param aopora-fin 'dcl-form-show)) 'ls_obj)) (es_ext 'blkpoly-blk (geombib-raccordmax (eo_blkbase gvar_2983 2 2) "st_decX")) (es_ext 'parentbib-getfamily (dcl-control-setenabled st_repid))))
  (setq gvar_1021 "\\Autodesk\\ApplicationPlugins\\AoporaV1.bundle")
  ;; init-args 3: 'en_rayon, polybib-subpolybisinv
  (entdel '(st_def va_def en_ref2 st_repid))
  (setq aopora-fin (ls_deb en_rayon_2))
  (setq gvar_2537 (chemdyn-bordtrace (in_param aopora-fin 'va_point)))
  (setq pt_pas (in_param aopora-fin "Choisir un sommet"))
  (setq chemdyn-hachtrace (re_offset2 pt_pas gvar_2537))
  (setq ls_inters1 (in_param aopora-fin 'croisdyn-getelems))
  (setq gvar_2532 (re_offset2 ls_inters1 gvar_2537))
  (setq gvar_2983 (entib-handle2ename (dcl-grid-addrow chemdyn-hachtrace gvar_2532)))
  (in_param aopora-fin 'ocbib-isok)
  (if (setq stylechem-get (in_param aopora-fin 'ocbib-isok))
    (progn
      (setq st_repid (st_ray2 stylechem-get))
    )
    (progn
      (setq st_repid 0)
    )
  )
  (es_ext (es_ext 'st_abs (in_param aopora-fin 'ls_obj)) (es_ext 'blkpolydial-getlong (r2 (in_param aopora-fin 'va_point))) (es_ext 'projet_pa_repdyn_va_decx (in_param (va_ent (in_param aopora-fin 'dcl-form-show)) 'ls_obj)) (es_ext 'blkpoly-blk (geombib-raccordmax (eo_blkbase gvar_2983 2 2) "st_decX")) (es_ext 'parentbib-getfamily (dcl-control-setenabled st_repid)))
  (setq polybib_geom-bulge2radius (es_ext (es_ext 'st_abs (in_param aopora-fin 'ls_obj)) (es_ext 'blkpolydial-getlong (r2 (in_param aopora-fin 'va_point))) (es_ext 'projet_pa_repdyn_va_decx (in_param (va_ent (in_param aopora-fin 'dcl-form-show)) 'ls_obj)) (es_ext 'blkpoly-blk (geombib-raccordmax (eo_blkbase gvar_2983 2 2) "st_decX")) (es_ext 'parentbib-getfamily (dcl-control-setenabled st_repid))))
  (setq gvar_1020 "\\Contents\\Resources\\Blocs")
  ;; init-args 3: 'en_rayon, polybib-subpolybisinv
  (entdel '(st_def va_def en_ref2 st_repid))
  (setq aopora-fin (bo_special en_rayon_2))
  (setq gvar_2537 (chemdyn-bordtrace (in_param aopora-fin 'va_point)))
  (setq pt_pas (in_param aopora-fin "Choisir un sommet"))
  (setq chemdyn-hachtrace (re_offset2 pt_pas gvar_2537))
  (setq ls_inters1 (in_param aopora-fin 'croisdyn-getelems))
  (setq gvar_2532 (re_offset2 ls_inters1 gvar_2537))
  (setq gvar_2983 (entib-handle2ename (dcl-grid-addrow chemdyn-hachtrace gvar_2532)))
  (es_ext (es_ext 'st_abs (in_param aopora-fin 'ls_obj)) (es_ext 'blkpolydial-getlong (r2 (in_param aopora-fin 'va_point))) (es_ext '(ls_importconf st_option ls_linktype) (in_param aopora-fin "Repère")) (es_ext 'blkpoly-blk (geombib-raccordmax (eo_blkbase gvar_2983 2 2) "st_decX")))
  (setq polybib_geom-bulge2radius (es_ext (es_ext 'st_abs (in_param aopora-fin 'ls_obj)) (es_ext 'blkpolydial-getlong (r2 (in_param aopora-fin 'va_point))) (es_ext '(ls_importconf st_option ls_linktype) (in_param aopora-fin "Repère")) (es_ext 'blkpoly-blk (geombib-raccordmax (eo_blkbase gvar_2983 2 2) "st_decX"))))
  (setq gvar_1019 'st_rep)
  ;; init-args 3: 'en_rayon, polybib-subpolybisinv
  (entdel '(st_def va_def en_ref2 st_repid))
  (setq aopora-fin (en_txt en_rayon_2))
  (setq gvar_2537 (chemdyn-bordtrace (in_param aopora-fin 'va_point)))
  (es_ext (es_ext 'st_abs (in_param aopora-fin 'ls_obj)) (es_ext 'projet_pa_repdyn_va_decx (in_param (st_smg (in_param aopora-fin 'dcl-form-show)) 'ls_obj)))
  (setq polybib_geom-bulge2radius (es_ext (es_ext 'st_abs (in_param aopora-fin 'ls_obj)) (es_ext 'projet_pa_repdyn_va_decx (in_param (st_smg (in_param aopora-fin 'dcl-form-show)) 'ls_obj))))
  (setq gvar_1017 ".dwg")
  (or (or (or (or (or (or (or (or (or (or (cadr (dcl-grid-clear gvar_1016)) (re_angle en_rayon_2 'st_btn)) (re_angle polybib-subpolybisinv_2 'vl-position)) (re_angle polybib-subpolybisinv_2 're_abs2)) (re_angle polybib-subpolybisinv_2 'ls_blks)) (re_angle polybib-subpolybisinv_2 'projet_md_metprop_cb_type)) (re_angle polybib-subpolybisinv_2 'blkpoly-substprops)) (re_angle polybib-subpolybisinv_2 "\n -> Panneau ")) (re_angle polybib-subpolybisinv_2 '(lambda (ls_importconf) (= st_sourceid (listbib-key (cdr ls_importconf) "st_SourceId"))))) (re_angle polybib-subpolybisinv_2 " Incorrecte ! Effacement en cours...")) (re_angle polybib-subpolybisinv_2 'in_special))
  (setq polybib_geom-bulge2radius (parentbib-getfamily en_rayon_2))
  (setq polybib_geom-bulge2radius (parentbib-getfamily en_rayon_2))
  (setq polybib_geom-bulge2radius (st_repid en_rayon_2))
  (setq polybib_geom-bulge2radius (parentbib-getfamily en_rayon_2))
  (setq polybib_geom-bulge2radius (repdyndial-visi en_rayon_2))
  (setq polybib_geom-bulge2radius (bo_ref2 en_rayon_2))
  (setq polybib_geom-bulge2radius (st_ref1 en_rayon_2))
  (setq polybib_geom-bulge2radius (st_smg en_rayon_2))
  (setq polybib_geom-bulge2radius (projet_pa_repdyn_va_decy en_rayon_2))
  (setq polybib_geom-bulge2radius nil)
  (setq polybib_geom-bulge2radius nil)
  (setq local_2 polybib_geom-bulge2radius)
  ;; init-args 3: 'palbib-fin, nil
  (foreach palbib-fin local_2
    (eo_blkpop gvar_1078 (dcl-grid-addrow 0 palbib-fin) (dcl-grid-addrow 1 palbib-fin))
  )
  (projet_md_quantite_cb_ltype gvar_1078 0 1 6)
)

;; Referenced symbols: PROJET/MD_METPROP/CB_TYPE, AXEDYN-SETRAYEXT
(defun racdyn-list ()
  (axedyn-setrayext 'projet_md_metprop_cb_type)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: PROJET/MD_METPROP/CB_TYPE, EN_RAYON, RE_COURANT
(defun racdyn-get (en_rayon)
  (re_courant 'projet_md_metprop_cb_type en_rayon_2)
)

;; Original arg hints: EN_RAYON, ST_SMG
;; Referenced symbols: PROJET/MD_METPROP/CB_TYPE, EN_RAYON, ST_SMG, RTOS
(defun racdyn-set (en_rayon st_smg)
  (rtos 'projet_md_metprop_cb_type en_rayon_2 st_smg_2)
)

;; Original arg hints: IN_COTE, arg_2, LS_VTXI, arg_4
;; Referenced symbols: ENTDEL, IN_COTE, RE_RAY, LS_VTXI, LS_STATE, LS_EXT2, POLYBIB-VTXJOIN, OCBIB-ID2REF, ST_AXEID, RE_ANGLE
;; Referenced strings: Sécante non sélectionnée !, \n -> PolyDyn , Origine
(defun racdyn-create (in_cote arg_2 ls_vtxi arg_4 / st_syle st_nom st_axedynid ld_axedyn local_4)
  (entdel "Sécante non sélectionnée !")
  (setq gvar_1013 nil)
  (setq ls_state (re_ray (hachbib-vtxs2hach in_cote_2)))
  (setq gvar_1861 (re_ray (hachbib-vtxs2hach ls_vtxi_2)))
  (if (ls_ext2 ls_state gvar_1861)
    (progn
      (setq gvar_1013 polybib-vtxjoin)
      (setq gvar_1146 (re_y ls_state gvar_3244))
      (setq gvar_1145 (re_y ls_state gvar_3242))
      (setq gvar_1012 (ocbib-id2ref (*st_errmsg* ls_state gvar_1146)))
      (setq gvar_1011 (ocbib-id2ref (*st_errmsg* ls_state gvar_1145)))
      nil
      (or (or (re_angle gvar_1011 (st_axeid gvar_1012)) (re_angle gvar_1012 (st_axeid gvar_1011))) polybib-vtxjoin)
      (ls_param ls_state (repdyn-isrep (st_syle (dcl-control-setvisible ls_state gvar_1146) (dcl-control-setvisible ls_state gvar_1145)) 'repdyn-isrep))
      (projet_pa_repdyn ls_state gvar_1012)
      (setq gvar_2644 (projet_pa_repdyn ls_state gvar_1011))
      (setq projet_pa_repdyn (*en_ray* (st_mod ls_state (projet_ml_progress ls_state) gvar_2644) nil))
      (setq gvar_1008 (*en_ray* (st_mod ls_state gvar_2644 (projet_md_metprop gvar_1861)) nil))
      (setq gvar_2231 (poly-lwpoly_temp gvar_1008 gvar_3244))
      (setq gvar_2232 gvar_2231)
    )
    (progn
      (setq projet_pa_repdyn ls_state)
      (setq gvar_1008 gvar_1861)
      (setq gvar_2231 (poly-lwpoly_temp projet_pa_repdyn gvar_3242))
      (setq gvar_2232 (poly-lwpoly_temp gvar_1008 gvar_3244))
    )
  )
  (if gvar_1013
    (progn
      (column projet_pa_repdyn)
      (column gvar_1008)
    )
  )
  (if (projet_md_link_bt_ok projet_pa_repdyn gvar_1008 gvar_2231 gvar_2232 gvar_3331 gvar_3244)
    (progn
      (st_align (dcl-control-setenabled inters) re_gap)
      (st_align in_cote_2 (groupbib-list 'projet_md_metprop_cb_type (dcl-control-setenabled inters)))
      (st_align ls_vtxi_2 (groupbib-list 'projet_md_metprop_cb_type (dcl-control-setenabled inters)))
      (setq inters (st_axeid (/ 'projet_md_metprop_cb_type)))
      (setq re_gap (es_ext (groupbib-list 'ls_axes inters) (groupbib-list 'ls_obj (geombib-raccordmax '*en_repsens* (dcl-control-setenabled inters))) (groupbib-list 'st_base gvar_3244) (groupbib-list "\n -> PolyDyn " in_cote_2) (groupbib-list "Origine" ls_vtxi_2) (groupbib-list 'st_blkarray gvar_2231) (groupbib-list 're_ech gvar_2232) (groupbib-list "SOLID" gvar_3331) (groupbib-list 'in_enttype nil)))
      (setq gvar_1000 (st_align (dcl-control-setenabled inters)))
      (ls_som0 "re_Gap")
    )
    (progn
      (ls_som0 "re_Echelle")
    )
  )
)

;; Original arg hints: INTERS
;; Referenced symbols: ENTDEL, DCL-GRID-CLEAR, INTERS, PROJET/MD_METPROP/ST_NOM, COS, IN_PARAM, IN_COTE, RE_RAY, LS_STATE, POLAR
;; Referenced strings: re_Coté, re_deb, re_fin
(defun racdyn-popgo (inters)
  (entdel "re_Coté")
  (if (and gvar_3345 (dcl-grid-clear gvar_995))
    (progn
      (setq cos gvar_3345)
    )
    (progn
      (setq cos (projet_md_metprop_st_nom inters_2))
    )
  )
  T
  (setq gvar_2607 nil)
  "re_deb"
  "re_fin"
  (in_param cos "\n -> PolyDyn ")
  (re_ray (hachbib-vtxs2hach in_cote))
  "st_align"
  (in_param cos "Origine")
  (re_ray (hachbib-vtxs2hach ls_vtxi))
  (setq gvar_1000 (in_param cos 'in_enttype))
  (setq gvar_2231 (in_param cos 'st_blkarray))
  (setq gvar_2232 (in_param cos 're_ech))
  (setq ls_res (in_param cos 'st_base))
  (setq gvar_3331 (in_param cos "SOLID"))
  polybib-vtxjoin
  (if (and (setq gvar_3155 "re_deb") (setq gvar_3155 "re_fin") (setq in_cote (in_param cos "\n -> PolyDyn ")) (setq ls_state (re_ray (hachbib-vtxs2hach in_cote))) (polar ls_state) (setq gvar_3155 "st_align") (setq ls_vtxi (in_param cos "Origine")) (setq gvar_1861 (re_ray (hachbib-vtxs2hach ls_vtxi))) (setq gvar_2607 polybib-vtxjoin) gvar_2607)
    (progn
      (if (cadr (ocbib-ename2id '(pt_proj re_abs re_long re_tan re_dist pt_1 pt_2) 'resdyn-set))
        (progn
          (vlax-curve-getdistatpoint 'resdyn-set 6 're_long 30)
        )
      )
      (if (ls_ext2 ls_state gvar_1861)
        (progn
          (setq gvar_1013 polybib-vtxjoin)
          (setq gvar_2644 (re_y ls_state ls_res))
          (setq projet_pa_repdyn (*en_ray* (st_mod ls_state (projet_ml_progress ls_state) gvar_2644) nil))
          (setq gvar_1008 (*en_ray* (st_mod gvar_1861 gvar_2644 (projet_md_metprop gvar_1861)) nil))
        )
        (progn
          (setq gvar_2644 (axedyn-reaccreate (projet_pa_polydyn_st_offset ls_state gvar_1861)))
          (setq projet_pa_repdyn ls_state)
          (setq gvar_1008 gvar_1861)
        )
      )
      (setq gvar_3155 'resdyn-getparents)
      (setq projet_md_link_bt_lineadd (projet_md_link_bt_ok projet_pa_repdyn gvar_1008 gvar_2231 gvar_2232 gvar_3331 ls_res))
      (if gvar_1013
        (progn
          (column projet_pa_repdyn)
          (column gvar_1008)
        )
      )
      (if projet_md_link_bt_lineadd
        (progn
          (setq dcl-form-close (st_rayon (es_ext (es_ext (groupbib-list 10 (axedyn-reaccreate projet_md_link_bt_lineadd)) (groupbib-list 42 (re_x projet_md_link_bt_lineadd)))) (es_ext (es_ext (groupbib-list 10 (va_bande projet_md_link_bt_lineadd)) (groupbib-list 42 'ha_poly)))))
          (setq gvar_2644 (dcl-grid-addrow 3 projet_md_link_bt_lineadd))
          (setq cos (st_rayon cos 'st_base gvar_2644))
          (en_refoffset gvar_1000)
          (if (setq upperleftx (en_refoffset gvar_1000))
            (progn
              (sssetfirst upperleftx dcl-form-close (es_ext (groupbib-list 8 'resdyn-set)))
            )
            (progn
              (setq upperleftx (*en_ray* dcl-form-close (es_ext (groupbib-list 8 'resdyn-set))))
              (setq gvar_1000 (1- upperleftx))
              (setq cos (st_rayon cos 'in_enttype gvar_1000))
            )
          )
          (st_align inters_2 cos)
        )
      )
      (setq gvar_3155 nil)
    )
  )
  (if gvar_3155
    (progn
      (ls_som0 gvar_3155)
    )
  )
  (setq gvar_3155 nil)
  gvar_1000
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: EN_RAYON, PROJET/MD_METPROP/CB_TYPE, RE_COURANT, RE_GAP, IN_PARAM, IN_ENTTYPE, RE_RAY, RESDYN-POPGO, dcl-forcedwgredraw, RE_ABSP
;; Referenced strings: SOLID
(defun racdyn-raygo (en_rayon)
  (st_align en_rayon_2)
  (cadr (re_absp (dcl-forcedwgredraw resdyn-popgo) 1))
  (setq re_gap (re_courant 'projet_md_metprop_cb_type en_rayon_2))
  (setq gvar_3331 (in_param re_gap "SOLID"))
  (setq gvar_1000 (in_param re_gap 'in_enttype))
  (setq resdyn-popgo (re_ray gvar_1000))
  (blkbib-set_dynprops (geombib-raccordmax 'eo_blkbase (eo_blkbase gvar_3331 2 2) '(bo_go ls_res re_sens st_blkarray bo_inv re_long re_gap en_polybase pt_base pt_1 pt_2 re_abs re_x re_y pt_fin re_absfin re_angle)))
  (while (setq resdyn-get (blkbib-set_dynprops (geombib-raccordmax 'eo_blkbase (eo_blkbase gvar_3331 2 2) '(bo_go ls_res re_sens st_blkarray bo_inv re_long re_gap en_polybase pt_base pt_1 pt_2 re_abs re_x re_y pt_fin re_absfin re_angle))))
    (if (and resdyn-get (st_blkbase resdyn-get 0))
      (progn
        (rtos 'projet_md_metprop_cb_type en_rayon_2 re_gap)
        (st_align en_rayon_2)
        (re_absp (dcl-forcedwgredraw resdyn-popgo) 1)
        (setq gvar_3331 resdyn-get)
        (setq re_gap (st_rayon re_gap "SOLID" resdyn-get))
      )
    )
  )
  T
  (ls_som0)
  (and resdyn-popgo (re_absp (dcl-forcedwgredraw resdyn-popgo) 0))
)

;; Original arg hints: LS_STATE, arg_2, arg_3, arg_4, arg_5
;; Referenced symbols: RE_ECHELLE, ENTDEL, LS_STATE, dcl-forcedwgredraw, LS_VISIENT, LS_VTXSINV, EN_POLYINV, PROJET/PA_POLYDYN/ST_OFFSET, POLYBIB-INTCORDE, ES_POLY
(defun racdyn-calcvtx (ls_state arg_2 arg_3 arg_4 arg_5 / st_syle st_nom st_axedynid ld_axedyn local_4)
  (entdel 're_echelle)
  T
  (sihpp-list ls_vtxsinv)
  (sihpp-list en_polyinv)
  (setq resdyn-trace (dcl-forcedwgredraw ls_state_2))
  (setq en_polydc (dcl-forcedwgredraw gvar_1861))
  (ls_colummtypes ls_state_2 (ls_visient gvar_3331 gvar_2231))
  (ls_colummtypes gvar_1861 (ls_visient gvar_3331 gvar_2232))
  (projet_pa_polydyn_st_offset ls_vtxsinv en_polyinv)
  (if (and (setq ls_vtxsinv (ls_colummtypes ls_state_2 (ls_visient gvar_3331 gvar_2231))) (setq en_polyinv (ls_colummtypes gvar_1861 (ls_visient gvar_3331 gvar_2232))) (setq gvar_980 (projet_pa_polydyn_st_offset ls_vtxsinv en_polyinv)) gvar_980)
    (progn
      (if gvar_2644
        (progn
          (setq gvar_980 (polybib-intcorde gvar_980 gvar_2644))
          (setq gvar_978 (es_poly gvar_980))
        )
        (progn
          (setq gvar_978 (axedyn-reaccreate gvar_980))
        )
      )
      (setq resdyn-corde (re_y ls_state_2 gvar_978))
      (setq ls_corde (re_y gvar_1861 gvar_978))
      (setq projet_md_link_bt_lineadd (ls_corde gvar_978 (blkbib-getvisient gvar_978 resdyn-corde) (blkbib-getvisient gvar_978 ls_corde) gvar_3331))
      (setq gvar_3199 (dcl-grid-addrow 1 projet_md_link_bt_lineadd))
      (if (st_blkbase gvar_3199 1)
        (progn
          (repdyn-isrep 255 gvar_3199)
        )
        (progn
          gvar_3199
        )
      )
      (setq gvar_3199 nil)
      (es_ext resdyn-corde gvar_3199 ls_corde gvar_978)
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: EN_RAYON, vlax-erased-p, LS_SOM0
(defun racdyn-modgo (en_rayon)
  (vlax-erased-p gvar_995)
  (setq re_yinv en_rayon_2)
  (ls_som0)
)

;; Referenced symbols: BO_LOOP, ENTDEL, RE_YINV, PROJET/MD_METPROP/ST_NOM, IN_PARAM, LS_LIST0, vlax-invoke, Projet/PA_ResDyn, ES_EXT, LS_VTX0
;; Referenced strings: SOLID, \n -> PolyDyn , Origine
(defun c:projet_pa_racdyn_oninitialize ()
  (entdel 'bo_loop)
  (vlax-invoke ls_list0 (r2 (in_param gvar_3345 "\n -> PolyDyn ")))
  (vlax-invoke projet_pa_resdyn (r2 (in_param gvar_3345 "Origine")))
  (ls_vtx0 gvar_971 (es_ext '(ls_axes ls_axe) "\n Vérification des axes..."))
  (ls_vtx0 re_decy (es_ext '(ls_axes ls_axe) "\n Vérification des axes..."))
  (setq gvar_3345 (projet_md_metprop_st_nom re_yinv))
  (setq gvar_3331 (in_param gvar_3345 "SOLID"))
  (if (re_angle (in_param gvar_3345 'st_blkarray) 'en_poly)
    (progn
      (bo_invpoly1 gvar_971 1)
    )
    (progn
      (bo_invpoly1 gvar_971 0)
    )
  )
  (if (re_angle (in_param gvar_3345 're_ech) 'en_poly)
    (progn
      (bo_invpoly1 re_decy 1)
    )
    (progn
      (bo_invpoly1 re_decy 0)
    )
  )
  (bo_lctabs gvar_969 (eo_blkbase gvar_3331 2 2))
)

;; Referenced symbols: LS_ENTNEW
(defun c:projet_pa_racdyn_st_rayon_onsetfocus ()
  (ls_entnew gvar_969 0 255)
)

;; Referenced symbols: ENTDEL, IN_PARAM, RE_RAY, PT_PTP1, *LS_ALIGN*, PROJET/MD_METPROP/CB_TYPE, RE_YINV, GROUPBIB-LIST, PT_PROJ2, PROJET/PA_RESDYN/BO_INV
;; Referenced strings: Au plus, Origine, \n -> PolyDyn 
(defun c:bt_ref1_onclicked ()
  (entdel "Au plus")
  (st_grouphandle nil (pt_ptp1 (re_ray gvar_967)))
  T
  (setq gvar_967 (hachbib-vtxs2hach (in_param gvar_3345 "Origine")))
  (pt_proj2 '*ls_align* nil (groupbib-list 'projet_md_metprop_cb_type re_yinv))
  (axedyn-reaccreate projet_pa_resdyn_bo_inv)
  (re_x projet_pa_resdyn_bo_inv)
  (poly-lwpoly_temp (re_ray gvar_967) gvar_2840)
  (st_rayon gvar_3345 "\n -> PolyDyn " gvar_3162)
  (st_rayon gvar_3345 're_ech gvar_2827)
  (st_grouphandle nil nil)
  (and (setq projet_pa_resdyn_bo_inv (pt_proj2 '*ls_align* nil (groupbib-list 'projet_md_metprop_cb_type re_yinv))) (setq gvar_3162 (axedyn-reaccreate projet_pa_resdyn_bo_inv)) (setq gvar_2840 (re_x projet_pa_resdyn_bo_inv)) (setq gvar_2827 (poly-lwpoly_temp (re_ray gvar_967) gvar_2840)) (setq gvar_3345 (st_rayon gvar_3345 "\n -> PolyDyn " gvar_3162)) (setq gvar_3345 (st_rayon gvar_3345 're_ech gvar_2827)) (vlax-invoke ls_list0 (r2 (in_param gvar_3345 "\n -> PolyDyn "))))
)

;; Referenced symbols: ENTDEL, IN_PARAM, RE_RAY, PT_PTP1, *LS_ALIGN*, PROJET/MD_METPROP/CB_TYPE, RE_YINV, GROUPBIB-LIST, PT_PROJ2, PROJET/PA_RESDYN/BO_INV
;; Referenced strings: Au plus, \n -> PolyDyn , Origine
(defun c:bt_ref2_onclicked ()
  (entdel "Au plus")
  (st_grouphandle nil (pt_ptp1 (re_ray gvar_967)))
  T
  (setq gvar_967 (hachbib-vtxs2hach (in_param gvar_3345 "\n -> PolyDyn ")))
  (pt_proj2 '*ls_align* nil (groupbib-list 'projet_md_metprop_cb_type re_yinv))
  (axedyn-reaccreate projet_pa_resdyn_bo_inv)
  (re_x projet_pa_resdyn_bo_inv)
  (poly-lwpoly_temp (re_ray gvar_967) gvar_2840)
  (st_rayon gvar_3345 "Origine" gvar_3162)
  (st_rayon gvar_3345 'st_blkarray gvar_2827)
  (st_grouphandle nil nil)
  (and (setq projet_pa_resdyn_bo_inv (pt_proj2 '*ls_align* nil (groupbib-list 'projet_md_metprop_cb_type re_yinv))) (setq gvar_3162 (axedyn-reaccreate projet_pa_resdyn_bo_inv)) (setq gvar_2840 (re_x projet_pa_resdyn_bo_inv)) (setq gvar_2827 (poly-lwpoly_temp (re_ray gvar_967) gvar_2840)) (setq gvar_3345 (st_rayon gvar_3345 "Origine" gvar_3162)) (setq gvar_3345 (st_rayon gvar_3345 'st_blkarray gvar_2827)) (vlax-invoke ls_list0 (r2 (in_param gvar_3345 "Origine"))))
)

;; Referenced symbols: PROJET/PA_RESDYN/LS_BLKNAME, ENTDEL, GROUPBIB-LISTOBJ, RE_ANGLE, EN_POLY, RE_DECY, ST_BLKARRAY, RE_ECH, ES_EXT, RE_YINV
;; Referenced strings: SOLID
(defun racdyn-palapply ()
  (entdel 'projet_pa_resdyn_ls_blkname)
  (setq gvar_3331 (groupbib-listobj (errbib-catchapply gvar_969)))
  (if (re_angle 1 (ls_props2 gvar_971))
    (progn
      'en_poly
    )
    (progn
      '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)
    )
  )
  (setq gvar_2231 nil)
  (if (re_angle 1 (ls_props2 re_decy))
    (progn
      'en_poly
    )
    (progn
      '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)
    )
  )
  (setq gvar_2232 nil)
  (setq gvar_3345 (projexp-affpropsmpolydyn gvar_3345 (es_ext "SOLID" 'st_blkarray 're_ech) (es_ext gvar_3331 gvar_2231 gvar_2232)))
  (st_align re_yinv)
)

;; Referenced symbols: ENTDEL, vlax-curve-getEndParam, RE_YINV, ST_ALIGN, IN_PARAM, ES_EXT, PROJET/MD_METPROP/CB_TYPE, GROUPBIB-LIST, LS_SOM0
;; Referenced strings: PatternAngle, \n -> PolyDyn , Origine
(defun racdyn-palsave ()
  (entdel "PatternAngle")
  (vlax-curve-getendparam gvar_3345)
  (st_align re_yinv gvar_3345)
  (re_abs2 (groupbib-list 'projet_md_metprop_cb_type re_yinv) gvar_3094)
  (re_abs1 gvar_995 1)
  (setq gvar_3094 (es_ext (in_param gvar_3345 "\n -> PolyDyn ") (in_param gvar_3345 "Origine")))
  (ls_som0)
)

;; Referenced symbols: LS_SOM0
(defun racdyn-palclose ()
  (eo_poly)
  (setq re_yinv nil)
  (setq gvar_3345 nil)
  (setq ls_groupparent nil)
  (ls_som0)
)

;; Referenced symbols: RE_ABS2, AXEDYN-SETRAYEXT
(defun repdyn-list ()
  (axedyn-setrayext 're_abs2)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: RE_ABS2, EN_RAYON, RE_COURANT
(defun repdyn-get (en_rayon)
  (re_courant 're_abs2 en_rayon_2)
)

;; Original arg hints: EN_RAYON, arg_2
;; Referenced symbols: RE_ABS2, EN_RAYON, RTOS
(defun repdyn-set (en_rayon arg_2)
  (rtos 're_abs2 en_rayon_2 gvar_3164)
)

;; Referenced symbols: IN_LON0, ASSOC, LS_AXE, PALBIB-FILLSELLCOMBO, PROJET/PA_RESDYN/BV_BLOC, ENTLAST, PROJET/PA_RESDYN/LS_LAYERNAME, IN_COTE, LS_VTXI, PALBIB-COMBOLAYER
;; Referenced strings: \n -> PolyDyn , Origine, 180.0
(defun repdyn-create ( / local_0 local_1 local_2 local_3 local_4 local_5 local_6 local_7 local_8 local_9 local_10 local_11 local_12)
  ;; init-args 27: 'in_lon0, local_0, 'assoc, local_1
  (entdel 'projet_pa_resdyn_re_cote)
  (projet_md_selforce_cb_ltype en_rayon ssbib-ss2li)
  (re_abs2 (groupbib-list 're_abs2 en_rayon) gvar_3094)
  (setq vl-remove (/ 're_abs2))
  (setq en_rayon (dcl-control-setenabled (st_axeid vl-remove)))
  (setq ssbib-ss2li (es_ext (groupbib-list 'ls_axes (st_axeid vl-remove)) (groupbib-list 'ls_obj in_lon0) (groupbib-list '*st_axedynid* assoc) (groupbib-list 'dcl-form-show ls_axe) (groupbib-list 'projet_pa_resdyn_st_align palbib-fillsellcombo) (groupbib-list 'projet_pa_resdyn_re_amont projet_pa_resdyn_bv_bloc) (groupbib-list 'projet_pa_resdyn_re_aval entlast) (groupbib-list 'projet_pa_resdyn_an_angle projet_pa_resdyn_ls_layername) (groupbib-list "\n -> PolyDyn " in_cote) (groupbib-list "Origine" ls_vtxi) (groupbib-list "180.0" palbib-combolayer) (groupbib-list '*ls_debfin* projet_pa_resdyn_re_long) (groupbib-list '(ls_res re_long re_gap st_bloc re_decy st_layer bo_go st_msg) projet_pa_resdyn_re_gap) (groupbib-list "La longeur amont doit être positive ou nulle" projet_pa_resdyn_re_decy)))
  (setq gvar_3155 "La longeur avale doit être positive ou nulle")
  (setq gvar_3155 "Le décalage doit être  positif ou nul")
  (setq gvar_3094 (projet_md_selforce_cb_ltype ssbib-ss2li))
  (setq gvar_3155 'projet_md_selforce_cb_ltype)
  en_rayon
)

;; Original arg hints: SSBIB-SS2LI
;; Referenced symbols: ENTDEL, ES_EXT, SSBIB-SS2LI, IN_PARAM, IN_COTE, dcl-grid-setcurcell, LS_VTXI
;; Referenced strings: Projeté, \n -> PolyDyn , Origine
(defun repdyn-getparents (ssbib-ss2li)
  (entdel "Projeté")
  (setq gvar_3094 (es_ext))
  (setq in_cote (in_param ssbib-ss2li_2 "\n -> PolyDyn "))
  (setq ls_vtxi (in_param ssbib-ss2li_2 "Origine"))
  (if in_cote
    (progn
      (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 in_cote))
    )
  )
  (if ls_vtxi
    (progn
      (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 ls_vtxi))
    )
  )
  gvar_3094
)

;; Original arg hints: arg_1
;; Referenced symbols: CADR, UNDOBIB-START, ES_EXT, RE_ANGLE, LS_PARAMENTXY, POLYBIB-VTXJOIN
;; Referenced strings: Reconstruction des réacteurs des paramètres
(defun repdyn-isrep (arg_1)
  nil
  (or (or (or (or (or (cadr gvar_942) (re_angle (undobib-start gvar_942) 'es_ext)) (re_angle gvar_942 "Reconstruction des réacteurs des paramètres")) (re_angle gvar_942 'ls_paramentxy)) (en_txt gvar_942)) polybib-vtxjoin)
  nil
  polybib-vtxjoin
  nil
  nil
  nil
  nil
)

;; Original arg hints: POLYBIB-SUBPOLYBISINV, arg_2
;; Referenced symbols: PROJET/MD_SELFORCE/CB_LWEIGHT, ENTDEL, POLYBIB-SUBPOLYBISINV, UNDOBIB-START, ES_EXT, RE_ANGLE, LS_PARAMENTXY, POLYBIB-VTXJOIN, AXEDYN-REACCREATE
;; Referenced strings: Reconstruction des réacteurs des paramètres
(defun repdyn-getpoint (polybib-subpolybisinv arg_2)
  (entdel 'projet_md_selforce_cb_lweight)
  (or (or (or (or (re_angle (undobib-start polybib-subpolybisinv_2) 'es_ext) (re_angle polybib-subpolybisinv_2 "Reconstruction des réacteurs des paramètres")) (re_angle polybib-subpolybisinv_2 'ls_paramentxy)) (en_txt polybib-subpolybisinv_2)) polybib-vtxjoin)
  (setq gvar_940 nil)
  (setq gvar_940 (axedyn-reaccreate (pt_ins11 polybib-subpolybisinv_2)))
  (setq gvar_940 (projet_md_metprop gvar_3162))
  (setq gvar_940 (projet_ml_progress gvar_3162))
  (setq gvar_940 polybib-subpolybisinv_2)
  gvar_940
)

;; Original arg hints: POLYBIB-SUBPOLYBISINV, arg_2
;; Referenced symbols: LS_LW, ENTDEL, POLYBIB-SUBPOLYBISINV, RE_ANGLE, LS_PARAMENTXY, UNDOBIB-START, ES_EXT, POLYBIB-VTXJOIN, AXEDYN-REACCREATE, ST_PARAM
;; Referenced strings: Reconstruction des réacteurs des paramètres
(defun repdyn-getabs (polybib-subpolybisinv arg_2)
  (entdel 'ls_lw)
  (or (or (or (or (re_angle polybib-subpolybisinv_2 "Reconstruction des réacteurs des paramètres") (re_angle polybib-subpolybisinv_2 'ls_paramentxy)) (re_angle (undobib-start polybib-subpolybisinv_2) 'es_ext)) (en_txt polybib-subpolybisinv_2)) polybib-vtxjoin)
  (setq gvar_3388 nil)
  (setq gvar_3388 (st_param gvar_3162 (axedyn-reaccreate (pt_ins11 polybib-subpolybisinv_2))))
  (setq gvar_3388 (st_param gvar_3162 polybib-subpolybisinv_2))
  (setq gvar_3388 (repdyn-get gvar_3162))
  (setq gvar_3388 'ha_poly)
  gvar_3388
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: PROJET/MD_SELFORCE/CB_COULEUR, ENTDEL, EN_RAYON, SSBIB-SS2LI, PROJET/PA_RESDYN/ST_ALIGN, IN_PARAM, PROJET/PA_RESDYN/RE_AMONT, PALBIB-FILLSELLCOMBO, BLKPOLY-POLY, RE_ANGLE
;; Referenced strings: \n -> PolyDyn , Reconstruction des réacteurs des paramètres, Couleur
(defun repdyn-getpointangle (en_rayon)
  (entdel 'projet_md_selforce_cb_couleur)
  (setq ssbib-ss2li (en_txt en_rayon_2))
  (setq palbib-fillsellcombo (in_param ssbib-ss2li 'projet_pa_resdyn_st_align))
  (setq projet_pa_resdyn_bv_bloc (in_param ssbib-ss2li 'projet_pa_resdyn_re_amont))
  (hachbib-vtxs2hach (in_param ssbib-ss2li "\n -> PolyDyn "))
  (re_ray in_cote)
  (or (or (or (or (or (or (or (or (and (re_angle palbib-fillsellcombo 'blkpoly-poly) (and (setq in_cote (hachbib-vtxs2hach (in_param ssbib-ss2li "\n -> PolyDyn "))) (cadr (setq ls_state (re_ray in_cote))))) (re_angle palbib-fillsellcombo "Reconstruction des réacteurs des paramètres")) (re_angle palbib-fillsellcombo 'ls_paramentxy)) (re_angle palbib-fillsellcombo "Couleur")) (re_angle palbib-fillsellcombo "Impossible d'insérer le bloc droit")) (re_angle palbib-fillsellcombo 'dcl-tree-getnextsiblingitem)) (re_angle palbib-fillsellcombo 're_rayii)) (re_angle palbib-fillsellcombo '(re_x re_y pt_poly re_anglepoly re_angle))) (re_angle palbib-fillsellcombo '(lambda (ls_elem) (= "H" (listbib-key ls_elem "st_type")))))
  (setq in_cote (hachbib-vtxs2hach (in_param ssbib-ss2li "\n -> PolyDyn ")))
  (setq ls_state (re_ray in_cote))
  (setq ls_vtxi (hachbib-vtxs2hach (in_param ssbib-ss2li "Origine")))
  (setq gvar_1861 (re_ray ls_vtxi))
  (setq bo_pick (projet_pa_polydyn_st_offset ls_state gvar_1861))
  (setq entlast (in_param ssbib-ss2li 'projet_pa_resdyn_re_aval))
  (setq gvar_2644 (eo_polyabs (axedyn-reaccreate (polybib-intcorde bo_pick entlast))))
  (if gvar_2644
    (progn
      gvar_2644
    )
    (progn
      (re_y ls_state (in_param ssbib-ss2li 'projet_pa_resdyn_re_aval))
    )
  )
  (setq blkpoly-get nil)
  (setq ls_prop (getvar ls_state blkpoly-get))
  (setq in_cote (hachbib-vtxs2hach (in_param ssbib-ss2li "\n -> PolyDyn ")))
  (setq ls_state (re_ray in_cote))
  (setq ls_vtxi (in_param ssbib-ss2li "Origine"))
  (setq projet_pa_resdyn_bv_bloc (in_param ssbib-ss2li 'projet_pa_resdyn_re_amont))
  (setq blkpoly-get (axedyn-reaccreate (pt_ins11 (eo_polyabs ls_vtxi))))
  (setq blkpoly-get (re_y ls_state blkpoly-get))
  (setq gvar_936 (dcl-control-setvisible ls_state blkpoly-get))
  (setq projet_pa_resdyn_re_long (en_polyabs ssbib-ss2li '*ls_debfin* 'ha_poly))
  (setq projet_pa_resdyn_re_decy (en_polyabs ssbib-ss2li "La longeur amont doit être positive ou nulle" 'ha_poly))
  (setq blkpoly-get (ls_param ls_state (st_syle projet_pa_resdyn_re_long gvar_936)))
  (setq ls_prop (getvar ls_state blkpoly-get))
  (setq blkpoly-get (getvar blkpoly-get (dcl-grid-addrow ls_prop (repdyn-isrep gvar_3236 'repdyn-isrep)) projet_pa_resdyn_re_decy))
  (setq in_cote (hachbib-vtxs2hach (in_param ssbib-ss2li "\n -> PolyDyn ")))
  (setq ls_state (re_ray in_cote))
  (setq projet_pa_resdyn_bv_bloc (in_param ssbib-ss2li 'projet_pa_resdyn_re_amont))
  (setq blkpoly-get (re_y ls_state projet_pa_resdyn_bv_bloc))
  (setq ls_prop (getvar ls_state blkpoly-get))
  (setq in_cote (hachbib-vtxs2hach (in_param ssbib-ss2li "\n -> PolyDyn ")))
  (setq ls_state (re_ray in_cote))
  (setq projet_pa_resdyn_bv_bloc (repdyn-isrep (in_param ssbib-ss2li 'projet_pa_resdyn_re_amont) 'paperspace))
  (setq blkpoly-get (projet_md_selforce ls_state projet_pa_resdyn_bv_bloc))
  (setq ls_prop (getvar ls_state blkpoly-get))
  (setq in_cote (hachbib-vtxs2hach (in_param ssbib-ss2li "\n -> PolyDyn ")))
  (setq ls_state (re_ray in_cote))
  (setq projet_pa_resdyn_bv_bloc (in_param ssbib-ss2li 'projet_pa_resdyn_re_amont))
  (setq blkpoly-get (ls_param ls_state projet_pa_resdyn_bv_bloc))
  (setq ls_prop (getvar ls_state blkpoly-get))
  (setq in_cote (hachbib-vtxs2hach (in_param ssbib-ss2li "\n -> PolyDyn ")))
  (setq ls_state (re_ray in_cote))
  (setq blkpoly-get (projet_md_selforce ls_state 'en_polybase))
  (setq ls_prop (getvar ls_state blkpoly-get))
  (setq in_cote (hachbib-vtxs2hach (in_param ssbib-ss2li "\n -> PolyDyn ")))
  (setq ls_state (re_ray in_cote))
  (setq blkpoly-get (projet_md_metprop ls_state))
  (setq ls_prop (getvar ls_state blkpoly-get))
  (setq in_cote (hachbib-vtxs2hach (in_param ssbib-ss2li "\n -> PolyDyn ")))
  (setq ls_state (re_ray in_cote))
  (setq blkpoly-get (projet_ml_progress ls_state))
  (setq ls_prop (getvar ls_state blkpoly-get))
  (ls_som0 'projet_md_selforce)
  (setq blkpoly-get projet_pa_resdyn_bv_bloc)
  (setq ls_prop 'ha_poly)
  (setq blkpoly-get projet_pa_resdyn_bv_bloc)
  (setq ls_prop 'ha_poly)
  (es_ext blkpoly-get ls_prop)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: SELFORCEDIAL_BT_COLOR, ENTDEL, EN_RAYON, RE_ABS2, RE_COURANT, GROUPBIB-LIST, ES_EXT, AXEDYN-SETRAYEXT, HA_POLY, LD_BORD
;; Referenced strings: Repère
(defun repdyn-popgo (en_rayon / local_1)
  (entdel 'selforcedial_bt_color)
  (if en_rayon_2
    (progn
      (setq ld_bord (es_ext (groupbib-list en_rayon_2 (re_courant 're_abs2 en_rayon_2))))
    )
    (progn
      (setq ld_bord (axedyn-setrayext 're_abs2))
    )
  )
  (setq palbib-combolayer 'ha_poly)
  (setq projet_pa_resdyn_re_gap 'ha_poly)
  (setq ls_prop 'ha_poly)
  (setq local_1 ld_bord)
  ;; init-args 3: 'ssbib-ss2li, nil
  (foreach ssbib-ss2li local_1
    (cdr (in_param gvar_2519 'projet_md_selforce_re_color))
    (setq ssbib-ss2li (eo_polyabs ssbib-ss2li))
    (setq palbib-fillsellcombo (in_param ssbib-ss2li 'projet_pa_resdyn_st_align))
    (setq gvar_3137 nil)
    (setq cos nil)
    (setq polybib_geom-bulge2radius nil)
    (setq acad_colordlg (pt_ins11 en_rayon_2))
    (setq gvar_3137 (es_ext (groupbib-list 'ls_axes en_rayon_2)))
    (setq gvar_2519 (st_smg (in_param ssbib-ss2li 'dcl-form-show)))
    (setq polybib_geom-bulge2radius (es_ext (groupbib-list '(pt_proj re_abs re_long re_tan re_dist pt_1 pt_2) (en_polyabs gvar_2519 "Repère" 'st_btn))))
    (in_param ssbib-ss2li 'projet_md_selforce_bt_color)
    (re_ray gvar_1135)
    (if (and (setq gvar_1135 (in_param ssbib-ss2li 'projet_md_selforce_bt_color)) (setq gvar_1268 (re_ray gvar_1135)) (polar gvar_1268))
      (progn
        (st_namedroit gvar_929)
        (*ha_blkbase* gvar_929 (rtos (axedyn-reaccreate acad_colordlg)))
        (st_layer gvar_929 (re_x acad_colordlg))
        (ls_ligne gvar_929 (in_param gvar_2519 'projet_md_selforce_re_color))
        (*ls_force* gvar_929 gvar_3137)
        (setq gvar_929 (dcl-forcedwgredraw gvar_1268))
      )
      (progn
        (setq gvar_1268 (_vlax-true (in_param gvar_2519 'projet_md_selforce_re_color) (axedyn-reaccreate acad_colordlg) 'en_poly (re_x acad_colordlg) gvar_3137 polybib_geom-bulge2radius nil))
        (setq gvar_1135 (1- gvar_1268))
        (setq gvar_929 (dcl-forcedwgredraw gvar_1268))
        (setq ssbib-ss2li (st_rayon ssbib-ss2li 'projet_md_selforce_bt_color gvar_1135))
      )
    )
    (re_epaiss gvar_929 (in_param gvar_2519 "Repère"))
    (re_epaiss gvar_929)
    (projet_md_selforce_cb_ltype en_rayon_2 ssbib-ss2li)
    (setq ssbib-ss2li (st_rayon ssbib-ss2li 'projet_pa_resdyn_re_aval (axedyn-reaccreate acad_colordlg)))
  )
  blkpoly-get
)

;; Original arg hints: arg_1
;; Referenced symbols: ENTDEL, ST_DEF, LD_BORD, POLYBIB-LWVERTICES, RACDYN-POPGO, PARENTBIB-ADD, vlax-ename->vla-object, REPDYN-GETPOINTANGLE, GEOMBIB-RACCORDMAX, RE_ANGLE
;; Referenced strings: in_side2, RGB, Estompe
(defun repbib-sel (arg_1)
  (entdel "in_side2")
  (vlax-ename->vla-object 'parentbib-add)
  (setq ld_bord (st_def))
  (setq racdyn-set (polybib-lwvertices "RGB" ld_bord))
  (setq ha_rac (polybib-lwvertices 'racdyn-popgo ld_bord))
  (setq gvar_1136 (projet_md_quantite_bt_qtdroite (geombib-raccordmax 'repdyn-getpointangle gvar_3255 "Estompe")))
  (or (re_angle gvar_1136 'parentbib-add) gvar_1136)
  (setq gvar_1268 (axedyn-reaccreate gvar_1136))
  (setq gvar_1135 (1- gvar_1268))
  (setq en_rayon (in_param racdyn-set gvar_1135))
  (setq en_rayon (projet_pa_racdyn 'ls_color 'ls_color ha_rac 1))
  en_rayon
)

;; Original arg hints: arg_1
;; Referenced symbols: VA_COULEUR, ENTDEL, EO_POLYBASE, EO_POLYABS, EN_RAYON, SSBIB-SS2LI, PROJET/PA_RESDYN/ST_ALIGN, IN_PARAM, POLAR, BLKPOLY-POLY
(defun repdyn-modifgo (arg_1)
  (entdel 'va_couleur)
  (setq en_rayon (eo_polyabs (eo_polybase gvar_1268)))
  (setq ssbib-ss2li (en_txt en_rayon))
  (setq palbib-fillsellcombo (in_param ssbib-ss2li 'projet_pa_resdyn_st_align))
  (setq blkpoly-get (in_param (polar gvar_1268) 10))
  (or (re_angle 'blkpoly-poly palbib-fillsellcombo) (re_angle 're_rayii palbib-fillsellcombo))
  (setq projet_md_repblk_cb_blk2 (in_param ssbib-ss2li 'projet_pa_resdyn_re_amont))
  (setq ssbib-ss2li (st_rayon ssbib-ss2li 'projet_pa_resdyn_re_amont blkpoly-get))
  (projet_md_selforce_cb_ltype en_rayon ssbib-ss2li)
  (int en_rayon)
  (eo_blkdroit (groupbib-list 're_abs2 en_rayon))
  (setq projet_md_repblk_cb_blk2 (in_param ssbib-ss2li 'projet_pa_resdyn_re_amont))
  (setq ssbib-ss2li (st_rayon ssbib-ss2li 'projet_pa_resdyn_re_amont blkpoly-get))
  (ls_som0)
)

;; Referenced symbols: ENTDEL, ODCLBIB-TREEGETCHILD, <, BLKPOLY-POLY, BO_COLOR, GROUPBIB-LIST, EO_BLKPARAM, LS_PARAMENTXY, BLKBIB-BLK_TEMP, RE_RAYII
;; Referenced strings: Reconstruction des réacteurs des paramètres, Couleur
(defun c:projet_pa_repdyn_oninitialize ()
  (entdel '(bo_color))
  (cdr 'odclbib-treegetchild)
  (ls_vtx0 gvar_911 (polybib-lwvertices 'eo_polyabs gvar_917))
  (bo_lctabs gvar_910 (in_param vlax-curve-isclosed 'ls_obj))
  (bo_lctabs gvar_909 (in_param vlax-curve-isclosed '*st_axedynid*))
  (ls_vtx0 gvar_908 gvar_913)
  (setq gvar_917 (es_ext (groupbib-list 'blkpoly-poly 'bo_color) (groupbib-list "Reconstruction des réacteurs des paramètres" 'eo_blkparam) (groupbib-list 'ls_paramentxy 'blkbib-blk_temp) (groupbib-list "Couleur" '(en_blkbase eo_blkbase pt_ins en_polybase en_polyabs ls_props ls_prop in_param)) (groupbib-list 're_rayii '(inc ls_filters ls_filter)) (groupbib-list '(re_x re_y pt_poly re_anglepoly re_angle) 'eg_blkbase) (groupbib-list '(lambda (ls_elem) (= "H" (listbib-key ls_elem "st_type"))) 'polydyn-tracerep)))
  (setq vlax-curve-isclosed (re_courant 're_abs2 re_yinv))
  (setq palbib-fillsellcombo (in_param vlax-curve-isclosed 'projet_pa_resdyn_st_align))
  (setq typelinebib-list vlax-curve-isclosed)
  (setq gvar_914 (typelinebib-list))
  (setq gvar_913 (polybib-lwvertices 'ha_polyext gvar_914))
  (setq gvar_912 (polybib-lwvertices 'axedyn-reaccreate gvar_914))
  (in_param vlax-curve-isclosed 'dcl-form-show)
  (if (cadr (setq ls_axe (in_param vlax-curve-isclosed 'dcl-form-show)))
    (progn
      (bo_invpoly1 gvar_908 (laybib-newlay 'metbib-metzgo gvar_912))
    )
    (progn
      (bo_invpoly1 gvar_908 (laybib-newlay ls_axe gvar_912))
    )
  )
  (bo_invpoly1 gvar_911 (laybib-newlay palbib-fillsellcombo (polybib-lwvertices 'axedyn-reaccreate gvar_917)))
  (ls_siv (ls_props2 gvar_911) nil)
  (ls_som0)
)

;; Original arg hints: LS_EX
;; Referenced symbols: ENTDEL, LS_EX, RE_HAUTEUR, vlax-curve-isClosed, *LS_DEBFIN*, HA_POLY, EN_POLYABS, PROJET/PA_RESDYN/RE_LONG, BO_LCTABS, PROJET/PA_RESDYN/RE_DECY
;; Referenced strings: 0.53, La longeur amont doit être positive ou nulle
(defun repdyndial-visi (ls_ex)
  (entdel "0.53")
  (re_hauteur gvar_905 ls_ex_2)
  (re_hauteur gvar_904 ls_ex_2)
  (re_hauteur gvar_903 ls_ex_2)
  (re_hauteur gvar_902 ls_ex_2)
  (if ls_ex_2
    (progn
      (bo_lctabs gvar_903 (eo_blkbase projet_pa_resdyn_re_long 2 2))
      (setq projet_pa_resdyn_re_long (en_polyabs vlax-curve-isclosed '*ls_debfin* 'ha_poly))
      (setq projet_pa_resdyn_re_decy (en_polyabs vlax-curve-isclosed "La longeur amont doit être positive ou nulle" 'ha_poly))
      (bo_lctabs gvar_902 (eo_blkbase projet_pa_resdyn_re_decy 2 2))
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: EO_POLY, arg_2
;; Referenced symbols: ENTDEL, EO_POLY, AXEDYN-REACCREATE, POLYBIB-LWVERTICES, DCL-GRID-ADDROW, vlax-curve-isClosed, PROJET/PA_RESDYN/ST_ALIGN, PALBIB-FILLSELLCOMBO, IN_PARAM, PROJET/PA_RESDYN/RE_AMONT
;; Referenced strings: \n -> PolyDyn , Origine, Reconstruction des réacteurs des paramètres
(defun c:projet_pa_repdyn_st_def_onselchanged (eo_poly arg_2)
  (entdel '(bo_delbase ls_sivs ls_in in_max eo_poly st_handle en_poly ls_siv st_id))
  (setq palbib-fillsellcombo (dcl-grid-addrow eo_poly_2 (polybib-lwvertices 'axedyn-reaccreate gvar_917)))
  (setq vlax-curve-isclosed (st_rayon vlax-curve-isclosed 'projet_pa_resdyn_st_align palbib-fillsellcombo))
  (setq in_cote (in_param vlax-curve-isclosed "\n -> PolyDyn "))
  (setq ls_vtxi (in_param vlax-curve-isclosed "Origine"))
  (setq projet_pa_resdyn_bv_bloc (in_param vlax-curve-isclosed 'projet_pa_resdyn_re_amont))
  (or (or (or (or (laybib-newlay palbib-fillsellcombo (es_ext 'blkpoly-poly)) (laybib-newlay palbib-fillsellcombo (es_ext 're_rayii))) (laybib-newlay palbib-fillsellcombo (es_ext "Reconstruction des réacteurs des paramètres" 'ls_paramentxy "Couleur"))) (laybib-newlay palbib-fillsellcombo (es_ext '(lambda (ls_elem) (= "H" (listbib-key ls_elem "st_type")))))) (laybib-newlay palbib-fillsellcombo (es_ext '(re_x re_y pt_poly re_anglepoly re_angle))))
  (if (and in_cote (re_ray (hachbib-vtxs2hach in_cote)))
    (progn
      (setq ls_siv (r2 in_cote))
    )
    (progn
      (setq ls_siv 'sihlin-set)
    )
  )
  (if (and ls_vtxi (en_txt (eo_polyabs ls_vtxi)))
    (progn
      (setq sihlin-getparents (geombib-raccordmax 'en_txt (eo_polyabs ls_vtxi)))
    )
    (progn
      (setq sihlin-getparents 'sihlin-popgo)
    )
  )
  (setq gvar_896 polybib-vtxjoin)
  (if (and in_cote (re_ray (hachbib-vtxs2hach in_cote)))
    (progn
      (setq ls_siv (r2 in_cote))
    )
    (progn
      (setq ls_siv 'sihlin-set)
    )
  )
  (if (and ls_vtxi (re_ray (hachbib-vtxs2hach ls_vtxi)))
    (progn
      (setq sihlin-getparents (r2 ls_vtxi))
    )
    (progn
      (setq sihlin-getparents "50cm")
    )
  )
  (setq gvar_896 polybib-vtxjoin)
  (if (and in_cote (re_ray (hachbib-vtxs2hach in_cote)))
    (progn
      (setq ls_siv (r2 in_cote))
    )
    (progn
      (setq ls_siv 'sihlin-set)
    )
  )
  (setq gvar_896 nil)
  (if (and in_cote (re_ray (hachbib-vtxs2hach in_cote)))
    (progn
      (setq ls_siv (r2 in_cote))
    )
    (progn
      (setq ls_siv 'sihlin-set)
    )
  )
  (if (re_angle (undobib-start projet_pa_resdyn_bv_bloc) 'es_ext)
    (progn
      (setq sihlin-getparents "0.15")
    )
    (progn
      (setq sihlin-getparents "T1")
    )
  )
  (setq gvar_896 polybib-vtxjoin)
  (if (re_angle (undobib-start projet_pa_resdyn_bv_bloc) 'es_ext)
    (progn
      (setq ls_siv "0.15")
    )
    (progn
      (setq ls_siv "T1")
    )
  )
  (vlax-vla-object->ename gvar_892 gvar_896)
  (setq gvar_896 nil)
  (if ls_siv
    (progn
      (vlax-invoke gvar_891 ls_siv)
    )
  )
  (if sihlin-getparents
    (progn
      (vlax-invoke gvar_892 sihlin-getparents)
    )
  )
  (sihlin-popgo (ls_ext2 palbib-fillsellcombo '(re_x re_y pt_poly re_anglepoly re_angle)))
  (ls_som0)
)

;; Referenced symbols: ENTDEL, AXEDYN-REACCREATE, POLYBIB-LWVERTICES, DCL-GRID-ADDROW, vlax-curve-isClosed, PROJET/PA_RESDYN/RE_AMONT, IN_PARAM, PALBIB-FILLSELLCOMBO, BLKPOLY-POLY, ES_EXT
;; Referenced strings: 5.0, \n -> PolyDyn , Reconstruction des réacteurs des paramètres
(defun c:projet_pa_repdyn_btn_ref_onclicked ()
  (entdel "5.0")
  (setq palbib-fillsellcombo (dcl-grid-addrow (ls_props2 gvar_911) (polybib-lwvertices 'axedyn-reaccreate gvar_917)))
  (setq projet_pa_resdyn_bv_bloc (in_param vlax-curve-isclosed 'projet_pa_resdyn_re_amont))
  (setq in_cote (in_param vlax-curve-isclosed "\n -> PolyDyn "))
  (or (laybib-newlay palbib-fillsellcombo (es_ext 'blkpoly-poly)) (laybib-newlay palbib-fillsellcombo (es_ext "Reconstruction des réacteurs des paramètres" 'ls_paramentxy "Couleur" '(lambda (ls_elem) (= "H" (listbib-key ls_elem "st_type"))) 're_rayii '(re_x re_y pt_poly re_anglepoly re_angle))))
  T
  (axedyn-reaccreate (pt_proj2 "T3" nil (groupbib-list 're_abs2 re_yinv)))
  (st_rayon vlax-curve-isclosed "\n -> PolyDyn " in_cote)
  (and (setq in_cote (axedyn-reaccreate (pt_proj2 "T3" nil (groupbib-list 're_abs2 re_yinv)))) (setq vlax-curve-isclosed (st_rayon vlax-curve-isclosed "\n -> PolyDyn " in_cote)) (vlax-invoke gvar_891 "4.0"))
  T
  (st_visi "T3P")
  (st_rayon vlax-curve-isclosed 'projet_pa_resdyn_re_amont projet_pa_resdyn_bv_bloc)
  (ls_som0)
  (and (setq projet_pa_resdyn_bv_bloc (st_visi "T3P")) (setq vlax-curve-isclosed (st_rayon vlax-curve-isclosed 'projet_pa_resdyn_re_amont projet_pa_resdyn_bv_bloc)) (vlax-invoke gvar_891 "0.15"))
)

;; Referenced symbols: ENTDEL, AXEDYN-REACCREATE, POLYBIB-LWVERTICES, DCL-GRID-ADDROW, PALBIB-FILLSELLCOMBO, RE_RAYII, ES_EXT, BLKPOLY-WCS2WXY, VA_PARAM, RE_YINV
;; Referenced strings: 20.0, 3.5, Origine
(defun c:projet_pa_repdyn_btn_ref2_onclicked ()
  (entdel "20.0")
  (setq palbib-fillsellcombo (dcl-grid-addrow (ls_props2 gvar_911) (polybib-lwvertices 'axedyn-reaccreate gvar_917)))
  (or (or (laybib-newlay palbib-fillsellcombo (es_ext 're_rayii)) (laybib-newlay palbib-fillsellcombo (es_ext '(lambda (ls_elem) (= "H" (listbib-key ls_elem "st_type")))))) (laybib-newlay palbib-fillsellcombo (es_ext '(re_x re_y pt_poly re_anglepoly re_angle))))
  (va_param 'blkpoly-wcs2wxy)
  (if (or (setq gvar_884 (va_param 'blkpoly-wcs2wxy)) (or (re_angle gvar_884 re_yinv) (laybib-newlay (groupbib-list 're_abs2 gvar_884) (re_delta (groupbib-list 're_abs2 re_yinv)))))
    (progn
      (bordyn-inters "3.5")
    )
    (progn
      (setq ls_vtxi (groupbib-list 're_abs2 gvar_884))
      (setq vlax-curve-isclosed (st_rayon vlax-curve-isclosed "Origine" ls_vtxi))
      (vlax-invoke gvar_892 (geombib-raccordmax 'en_txt gvar_884))
    )
  )
  T
  T
  T
  (axedyn-reaccreate (pt_proj2 "T2P" nil (groupbib-list 're_abs2 re_yinv)))
  (st_rayon vlax-curve-isclosed "Origine" ls_vtxi)
  (and (setq ls_vtxi (axedyn-reaccreate (pt_proj2 "T2P" nil (groupbib-list 're_abs2 re_yinv)))) (setq vlax-curve-isclosed (st_rayon vlax-curve-isclosed "Origine" ls_vtxi)) (vlax-invoke gvar_892 "T4"))
  T
  (st_visi "39.0")
  (st_rayon vlax-curve-isclosed 'projet_pa_resdyn_re_amont projet_pa_resdyn_bv_bloc)
  (ls_som0)
  (and (setq projet_pa_resdyn_bv_bloc (st_visi "39.0")) (setq vlax-curve-isclosed (st_rayon vlax-curve-isclosed 'projet_pa_resdyn_re_amont projet_pa_resdyn_bv_bloc)) (vlax-invoke gvar_892 "0.15"))
)

;; Referenced symbols: ENTDEL, AXEDYN-REACCREATE, POLYBIB-LWVERTICES, DCL-GRID-ADDROW, vlax-curve-isClosed, dcl-form-show, LS_AXE, LS_OBJ, *ST_AXEDYNID*, *LS_DEBFIN*
;; Referenced strings: 13.0, La longeur amont doit être positive ou nulle, \n -> PolyDyn 
(defun repdyn-palapply ()
  (entdel "13.0")
  (setq gvar_912 (polybib-lwvertices 'axedyn-reaccreate gvar_914))
  (setq ls_axe (dcl-grid-addrow (ls_props2 gvar_908) gvar_912))
  (setq vlax-curve-isclosed (st_rayon vlax-curve-isclosed 'dcl-form-show ls_axe))
  (setq vlax-curve-isclosed (st_rayon vlax-curve-isclosed 'ls_obj (errbib-catchapply gvar_910)))
  (setq vlax-curve-isclosed (st_rayon vlax-curve-isclosed '*st_axedynid* (errbib-catchapply gvar_909)))
  (setq vlax-curve-isclosed (st_rayon vlax-curve-isclosed '*ls_debfin* (groupbib-listobj (errbib-catchapply gvar_903))))
  (setq vlax-curve-isclosed (st_rayon vlax-curve-isclosed "La longeur amont doit être positive ou nulle" (groupbib-listobj (errbib-catchapply gvar_902))))
  (setq palbib-fillsellcombo (in_param vlax-curve-isclosed 'projet_pa_resdyn_st_align))
  (setq projet_pa_resdyn_bv_bloc (in_param vlax-curve-isclosed 'projet_pa_resdyn_re_amont))
  (setq in_cote (in_param vlax-curve-isclosed "\n -> PolyDyn "))
  (setq ls_vtxi (in_param vlax-curve-isclosed "Origine"))
  (or (or (or (or (re_angle palbib-fillsellcombo 'blkpoly-poly) (re_angle palbib-fillsellcombo 're_rayii)) (re_angle palbib-fillsellcombo '(re_x re_y pt_poly re_anglepoly re_angle))) (laybib-newlay palbib-fillsellcombo (es_ext "Reconstruction des réacteurs des paramètres" 'ls_paramentxy "Couleur"))) (re_angle palbib-fillsellcombo '(lambda (ls_elem) (= "H" (listbib-key ls_elem "st_type")))))
  T
  '(("LC" "LC - Ligne continue" ("2u" "3u" "5u" "15cm" "50cm")) ("T1" "T1 - Ligne de guidage axiale" ("2u" "3u" "5u" "50cm")) ("T2P" "T2P - Ligne transversale" ("15cm" "50cm")) ("T2" "T2 - Ligne de rive" ("2u" "3u" "5u" "50cm")) ("T3" "T3 - Ligne de délimitation des voies" ("5u")) ("T3P" "T3 - Ligne de rive en approche de carrefour" ("3u")) ("T4" "T4 - Ligne de délimitation de BAU" ("3u")) ("LMD" "LMD - Ligne mixte à droite" ("2u" "3u")) ("LMG" "LMG - Ligne mixte à gauche" ("2u" "3u")))
  "Impossible de tracer la ligne"
  "Impossible de modifier le groupe"
  (es_ext in_cote ls_vtxi)
  "Impossible de crérer le groupe"
  (and (setq gvar_876 '(("LC" "LC - Ligne continue" ("2u" "3u" "5u" "15cm" "50cm")) ("T1" "T1 - Ligne de guidage axiale" ("2u" "3u" "5u" "50cm")) ("T2P" "T2P - Ligne transversale" ("15cm" "50cm")) ("T2" "T2 - Ligne de rive" ("2u" "3u" "5u" "50cm")) ("T3" "T3 - Ligne de délimitation des voies" ("5u")) ("T3P" "T3 - Ligne de rive en approche de carrefour" ("3u")) ("T4" "T4 - Ligne de délimitation de BAU" ("3u")) ("LMD" "LMD - Ligne mixte à droite" ("2u" "3u")) ("LMG" "LMG - Ligne mixte à gauche" ("2u" "3u")))) in_cote (hachbib-vtxs2hach in_cote) (polar (re_ray (hachbib-vtxs2hach in_cote))) (setq gvar_876 "Impossible de tracer la ligne") ls_vtxi (re_ray (hachbib-vtxs2hach ls_vtxi)) (polar (re_ray (hachbib-vtxs2hach ls_vtxi))) (setq gvar_876 "Impossible de modifier le groupe") (cadr (ls_ext2 in_cote ls_vtxi)) (setq st_bloc (es_ext in_cote ls_vtxi)) (setq gvar_2607 "Impossible de crérer le groupe"))
  T
  '(("LC" "LC - Ligne continue" ("2u" "3u" "5u" "15cm" "50cm")) ("T1" "T1 - Ligne de guidage axiale" ("2u" "3u" "5u" "50cm")) ("T2P" "T2P - Ligne transversale" ("15cm" "50cm")) ("T2" "T2 - Ligne de rive" ("2u" "3u" "5u" "50cm")) ("T3" "T3 - Ligne de délimitation des voies" ("5u")) ("T3P" "T3 - Ligne de rive en approche de carrefour" ("3u")) ("T4" "T4 - Ligne de délimitation de BAU" ("3u")) ("LMD" "LMD - Ligne mixte à droite" ("2u" "3u")) ("LMG" "LMG - Ligne mixte à gauche" ("2u" "3u")))
  (es_ext in_cote)
  "Impossible de crérer le groupe"
  (and (setq gvar_876 '(("LC" "LC - Ligne continue" ("2u" "3u" "5u" "15cm" "50cm")) ("T1" "T1 - Ligne de guidage axiale" ("2u" "3u" "5u" "50cm")) ("T2P" "T2P - Ligne transversale" ("15cm" "50cm")) ("T2" "T2 - Ligne de rive" ("2u" "3u" "5u" "50cm")) ("T3" "T3 - Ligne de délimitation des voies" ("5u")) ("T3P" "T3 - Ligne de rive en approche de carrefour" ("3u")) ("T4" "T4 - Ligne de délimitation de BAU" ("3u")) ("LMD" "LMD - Ligne mixte à droite" ("2u" "3u")) ("LMG" "LMG - Ligne mixte à gauche" ("2u" "3u")))) in_cote (hachbib-vtxs2hach in_cote) (polar (re_ray (hachbib-vtxs2hach in_cote))) (setq st_bloc (es_ext in_cote)) (setq gvar_2607 "Impossible de crérer le groupe"))
  T
  '(("LC" "LC - Ligne continue" ("2u" "3u" "5u" "15cm" "50cm")) ("T1" "T1 - Ligne de guidage axiale" ("2u" "3u" "5u" "50cm")) ("T2P" "T2P - Ligne transversale" ("15cm" "50cm")) ("T2" "T2 - Ligne de rive" ("2u" "3u" "5u" "50cm")) ("T3" "T3 - Ligne de délimitation des voies" ("5u")) ("T3P" "T3 - Ligne de rive en approche de carrefour" ("3u")) ("T4" "T4 - Ligne de délimitation de BAU" ("3u")) ("LMD" "LMD - Ligne mixte à droite" ("2u" "3u")) ("LMG" "LMG - Ligne mixte à gauche" ("2u" "3u")))
  "Impossible de crérer mettre à jour la base de données"
  (es_ext in_cote ls_vtxi)
  "Impossible de crérer le groupe"
  (and (setq gvar_876 '(("LC" "LC - Ligne continue" ("2u" "3u" "5u" "15cm" "50cm")) ("T1" "T1 - Ligne de guidage axiale" ("2u" "3u" "5u" "50cm")) ("T2P" "T2P - Ligne transversale" ("15cm" "50cm")) ("T2" "T2 - Ligne de rive" ("2u" "3u" "5u" "50cm")) ("T3" "T3 - Ligne de délimitation des voies" ("5u")) ("T3P" "T3 - Ligne de rive en approche de carrefour" ("3u")) ("T4" "T4 - Ligne de délimitation de BAU" ("3u")) ("LMD" "LMD - Ligne mixte à droite" ("2u" "3u")) ("LMG" "LMG - Ligne mixte à gauche" ("2u" "3u")))) in_cote (hachbib-vtxs2hach in_cote) (polar (re_ray (hachbib-vtxs2hach in_cote))) (setq gvar_876 "Impossible de crérer mettre à jour la base de données") (en_txt (eo_polyabs ls_vtxi)) (setq st_bloc (es_ext in_cote ls_vtxi)) (setq gvar_2607 "Impossible de crérer le groupe"))
  T
  '(ls_vtxsinv en_polyinv re_delta)
  '(("LC" "LC - Ligne continue" ("2u" "3u" "5u" "15cm" "50cm")) ("T1" "T1 - Ligne de guidage axiale" ("2u" "3u" "5u" "50cm")) ("T2P" "T2P - Ligne transversale" ("15cm" "50cm")) ("T2" "T2 - Ligne de rive" ("2u" "3u" "5u" "50cm")) ("T3" "T3 - Ligne de délimitation des voies" ("5u")) ("T3P" "T3 - Ligne de rive en approche de carrefour" ("3u")) ("T4" "T4 - Ligne de délimitation de BAU" ("3u")) ("LMD" "LMD - Ligne mixte à droite" ("2u" "3u")) ("LMG" "LMG - Ligne mixte à gauche" ("2u" "3u")))
  (es_ext in_cote)
  "Impossible de crérer le groupe"
  (and (setq gvar_876 '(ls_vtxsinv en_polyinv re_delta)) projet_pa_resdyn_bv_bloc (re_angle (undobib-start projet_pa_resdyn_bv_bloc) 'es_ext) (setq gvar_876 '(("LC" "LC - Ligne continue" ("2u" "3u" "5u" "15cm" "50cm")) ("T1" "T1 - Ligne de guidage axiale" ("2u" "3u" "5u" "50cm")) ("T2P" "T2P - Ligne transversale" ("15cm" "50cm")) ("T2" "T2 - Ligne de rive" ("2u" "3u" "5u" "50cm")) ("T3" "T3 - Ligne de délimitation des voies" ("5u")) ("T3P" "T3 - Ligne de rive en approche de carrefour" ("3u")) ("T4" "T4 - Ligne de délimitation de BAU" ("3u")) ("LMD" "LMD - Ligne mixte à droite" ("2u" "3u")) ("LMG" "LMG - Ligne mixte à gauche" ("2u" "3u")))) in_cote (hachbib-vtxs2hach in_cote) (polar (re_ray (hachbib-vtxs2hach in_cote))) (setq st_bloc (es_ext in_cote)) (setq gvar_2607 "Impossible de crérer le groupe"))
  T
  '(ls_vtxsinv en_polyinv re_delta)
  (es_ext)
  "Impossible de crérer le groupe"
  (if (and (setq gvar_876 '(ls_vtxsinv en_polyinv re_delta)) projet_pa_resdyn_bv_bloc (re_angle (undobib-start projet_pa_resdyn_bv_bloc) 'es_ext) (setq st_bloc (es_ext)) (setq gvar_2607 "Impossible de crérer le groupe") gvar_2607)
    (progn
      (rtos 're_abs2 re_yinv vlax-curve-isclosed)
      (re_abs2 (groupbib-list 're_abs2 re_yinv) st_bloc)
      (int re_yinv)
      (eo_blkdroit (groupbib-list 're_abs2 re_yinv))
    )
    (progn
      (bordyn-inters gvar_876)
    )
  )
  (ls_som0)
)

;; Referenced symbols: RE_DELTA
(defun repdyn-palsave ()
  (re_abs1 re_delta 1)
)

(defun repdyn-palclose ()
  (setq vlax-curve-isclosed nil)
  (setq typelinebib-list nil)
  nil
  (setq gvar_914 nil)
)

;; Referenced symbols: ENTDEL, LS_ENTNEW, SIHLIN-PLEINVIDE, vlax-curve-isClosed, IN_PARAM, RE_RAY, PROJET/PA_RESDYN/RE_AVAL, BLKPOLY-GET, ODCLBIB-TREEGETCHILD, PROJEXP-AFFPROPSAXE
;; Referenced strings: \n -> PolyDyn 
(defun c:projet_pa_repdyn_va_decx_onsetfocus ()
  (entdel '(ls_lignes re_absf re_abs re_plein re_vide pt_d pt_f en_mar))
  (ls_entnew gvar_903 0 255)
  (sihpp-list sihlin-pleinvide)
  (in_param vlax-curve-isclosed "\n -> PolyDyn ")
  (re_ray (hachbib-vtxs2hach gvar_3162))
  (in_param vlax-curve-isclosed 'projet_pa_resdyn_re_aval)
  (projexp-affpropsaxe gvar_2537 blkpoly-get 'odclbib-treegetchild nil nil nil)
  T
  (and (setq gvar_3162 (in_param vlax-curve-isclosed "\n -> PolyDyn ")) (setq gvar_2537 (re_ray (hachbib-vtxs2hach gvar_3162))) (setq blkpoly-get (in_param vlax-curve-isclosed 'projet_pa_resdyn_re_aval)) (setq sihlin-pleinvide (projexp-affpropsaxe gvar_2537 blkpoly-get 'odclbib-treegetchild nil nil nil)) (st_layer (dcl-forcedwgredraw sihlin-pleinvide) (st_syle (repdyn-isrep gvar_3236 'repdyn-isrep) (projet_md_metzon_rectangle1 (dcl-forcedwgredraw sihlin-pleinvide)))) (boxlib-optionbox sihlin-pleinvide 4))
)

;; Referenced symbols: ENTDEL, LS_ENTNEW, SIHLIN-PLEINVIDE, vlax-curve-isClosed, IN_PARAM, RE_RAY, PROJET/PA_RESDYN/RE_AVAL, BLKPOLY-GET, ODCLBIB-TREEGETCHILD, PROJEXP-AFFPROPSAXE
;; Referenced strings: \n -> PolyDyn 
(defun c:projet_pa_repdyn_va_decy_onsetfocus ()
  (entdel '(ls_lignes re_absf re_abs re_plein re_vide pt_d pt_f en_mar))
  (ls_entnew gvar_902 0 255)
  (sihpp-list sihlin-pleinvide)
  (in_param vlax-curve-isclosed "\n -> PolyDyn ")
  (re_ray (hachbib-vtxs2hach gvar_3162))
  (in_param vlax-curve-isclosed 'projet_pa_resdyn_re_aval)
  (projexp-affpropsaxe gvar_2537 blkpoly-get 'odclbib-treegetchild nil nil nil)
  T
  (and (setq gvar_3162 (in_param vlax-curve-isclosed "\n -> PolyDyn ")) (setq gvar_2537 (re_ray (hachbib-vtxs2hach gvar_3162))) (setq blkpoly-get (in_param vlax-curve-isclosed 'projet_pa_resdyn_re_aval)) (setq sihlin-pleinvide (projexp-affpropsaxe gvar_2537 blkpoly-get 'odclbib-treegetchild nil nil nil)) (boxlib-optionbox sihlin-pleinvide 4))
)

;; Referenced symbols: HA_DEF, AXEDYN-SETRAYEXT
(defun resdyn-list ()
  (axedyn-setrayext 'ha_def)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: HA_DEF, EN_RAYON, RE_COURANT
(defun resdyn-get (en_rayon)
  (re_courant 'ha_def en_rayon_2)
)

;; Original arg hints: EN_RAYON, arg_2
;; Referenced symbols: HA_DEF, EN_RAYON, RTOS
(defun resdyn-set (en_rayon arg_2)
  (rtos 'ha_def en_rayon_2 gvar_3164)
)

;; Referenced symbols: LS_LIGNES, R2, CHEMDYN-HACHTRACE, LS_PROP, RE_PLEIN, RE_VIDE, BLKBIB-GETPARENTENTITIES, HA_DEF, /, VL-REMOVE
;; Referenced strings: NPOLY, MPOLY, LMD
(defun resdyn-create ( / local_0 local_1 local_2 local_3 local_4 local_5 local_6 local_7 local_8 local_9 local_10 local_11 local_12 local_13 local_14 local_15)
  ;; init-args 33: "NPOLY", local_0, "MPOLY", local_1
  (setq vl-remove (/ 'ha_def))
  (setq en_rayon (dcl-control-setenabled (st_axeid vl-remove)))
  (setq gvar_3146 (1- gvar_3153))
  (setq gvar_3145 (1- gvar_3079))
  (groupbib-list 'ls_axes (st_axeid vl-remove))
  (groupbib-list 'ls_obj (geombib-raccordmax "Impossible de tracer les lignes pointillées" gvar_866 '(ls_deb ls_ent ls_fin) en_rayon))
  (groupbib-list '*st_axedynid* (geombib-raccordmax "Impossible de tracer les lignes pointillées" gvar_866 '(ls_deb ls_ent ls_fin) en_rayon))
  (groupbib-list 'va_point gvar_3162)
  (groupbib-list 'en_mar gvar_866)
  (groupbib-list 'sihlin-tracepoint gvar_2983)
  (groupbib-list "LC" re_plein)
  (groupbib-list "Impossible de tracer la ligne continue" gvar_865)
  (groupbib-list '(ls_parents ls_props ls_prop) ls_prop)
  "Impossible de tracer la seconde ligne pointillée"
  (if (re_angle gvar_2827 '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2))
    (progn
      0
    )
    (progn
      1
    )
  )
  (*ls_mod* en_rayon gvar_852)
  (re_abs2 (groupbib-list 'ha_def en_rayon) gvar_3094)
  (*ls_u* en_rayon)
  (setq gvar_852 (es_ext (groupbib-list) (groupbib-list 'projet_pa_sihlin gvar_2408) (groupbib-list 'dcl-control-settext 'ls_ext1) (groupbib-list "Choisir un sommet" ls_lignes) (groupbib-list 'croisdyn-getelems r2) (groupbib-list 'sihlin-mod chemdyn-hachtrace) (groupbib-list '*ls_mod* gvar_2532) (groupbib-list "u = 3cm" re_vide) (groupbib-list "Repère" blkbib-getparententities)))
  (setq gvar_3094 (*ls_u* gvar_852))
  (ls_som0)
)

;; Original arg hints: AOPORA-FIN
;; Referenced symbols: LS_CROIS, ENTDEL, AOPORA-FIN, VA_POINT, IN_PARAM, ES_EXT, CROISDYN-GETELEMS, PT_PAS, RE_ABS2, GROUPBIB-LIST
;; Referenced strings: Choisir un sommet
(defun resdyn-getparents (aopora-fin)
  (entdel 'ls_crois)
  (setq gvar_3094 (es_ext (in_param aopora-fin_2 'va_point)))
  (setq pt_pas (in_param aopora-fin_2 "Choisir un sommet"))
  (setq ls_inters1 (in_param aopora-fin_2 'croisdyn-getelems))
  (if (re_abs2 pt_pas)
    (progn
      (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 (groupbib-list 're_abs2 pt_pas)))
    )
  )
  (if (re_abs2 ls_inters1)
    (progn
      (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 (groupbib-list 're_abs2 ls_inters1)))
    )
  )
  gvar_3094
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: *LS_U*, ENTDEL, PT_PTP1, ES_EXT, EN_RAYON, PROJET/PA_SIHLIN/RE_U, CHEMDYN-BORDTRACE, VA_POINT, IN_PARAM, RE_OFFSET2
;; Referenced strings: re_offset2, Choisir un sommet, Repère
(defun resdyn-popgo (en_rayon)
  (entdel '*ls_u*)
  (setq en_param (pt_ptp1))
  (setq in_num (es_ext))
  (if gvar_3345
    (progn
      (setq gvar_852 gvar_3345)
    )
    (progn
      (setq gvar_852 (projet_pa_sihlin_re_u en_rayon_2))
    )
  )
  'chemdyn-bordtrace
  (chemdyn-bordtrace (in_param gvar_852 'va_point))
  "re_offset2"
  (re_offset2 (in_param gvar_852 "Choisir un sommet") gvar_3153)
  'chemdyn-polytrace
  (re_offset2 (in_param gvar_852 'croisdyn-getelems) gvar_3153)
  (setq blkbib-getparententities (en_polyabs gvar_852 "Repère" 'st_btn))
  (setq re_bulge (in_param gvar_852 'dcl-control-settext))
  (if (and (setq gvar_3155 'chemdyn-bordtrace) (setq gvar_3153 (chemdyn-bordtrace (in_param gvar_852 'va_point))) (setq gvar_3155 "re_offset2") (setq gvar_3388 (re_offset2 (in_param gvar_852 "Choisir un sommet") gvar_3153)) (setq gvar_3155 'chemdyn-polytrace) (setq gvar_1386 (re_offset2 (in_param gvar_852 'croisdyn-getelems) gvar_3153)) (re_angle 0 (in_param gvar_852 "Impossible de tracer la seconde ligne pointillée")))
    (progn
      '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)
    )
    (progn
      'en_poly
    )
  )
  (setq gvar_2827 nil)
  (setq re_cotechem (en_polyabs gvar_852 'va_inters 0))
  (setq gvar_866 (in_param gvar_852 'en_mar))
  (setq gvar_2983 (in_param gvar_852 'sihlin-tracepoint))
  (setq re_plein (in_param gvar_852 "LC"))
  (setq chemdyn-hachtrace (in_param gvar_852 'sihlin-mod))
  (setq gvar_2532 (in_param gvar_852 '*ls_mod*))
  (setq gvar_2939 (en_polyabs gvar_852 '(ls_parents ls_props ls_prop) 'ha_poly))
  (setq re_vide (in_param gvar_852 "u = 3cm"))
  (setq projet_pa_sihlin_re_cote 1)
  (ls_visient (in_param gvar_852 'projet_pa_sihlin) gvar_2827)
  (if (and (setq gvar_2408 (ls_visient (in_param gvar_852 'projet_pa_sihlin) gvar_2827)) (projet_pa_sihlin_re_cote gvar_3153 blkbib-getparententities gvar_866 gvar_2983 re_plein gvar_3388 gvar_1386 re_cotechem chemdyn-hachtrace gvar_2532 gvar_2939 re_vide projet_pa_sihlin_re_cote gvar_2408) (en_refoffset re_bulge))
    (progn
      (entbib-dellist re_bulge)
      (setq gvar_3155 're_deboffset)
      (column (re_ray re_bulge) in_num)
    )
    (progn
      (setq gvar_3155 '(ls_vtxsbase ls_vtxsbase2 en_poly ls_vtxs ls_polyhach ls_vtx en_hach))
      (setq reabib-deleteobjectreactor (polybib-inv in_num))
      (setq re_bulge (projet_pa_axes_ca_sommet reabib-deleteobjectreactor))
      (setq gvar_852 (st_rayon gvar_852 'dcl-control-settext (projet_pa_axes_ca_sommet reabib-deleteobjectreactor)))
      (*ls_mod* en_rayon_2 gvar_852)
    )
  )
  T
  (column projet_pa_sihlin_st_mod)
  nil
  (setq bo_file nil)
  (setq en_param nil)
  (ls_som0)
  (setq gvar_3155 nil)
)

;; Referenced symbols: BLKBIB-GETPARENTENTITIES, RE_PLEIN, RE_COTECHEM, CHEMDYN-HACHTRACE, RE_VIDE, PROJET/PA_SIHLIN/RE_COTE, POLYBIB-VTXJOIN, RE_ANGLE, POLYCC-SIDE, LS_LAR
;; Referenced strings: co_background, LMD, Modifier
(defun resdyn-trace ( / local_0 local_1 local_2 local_3 local_4 local_5 local_6 local_7 local_8 local_9 local_10 local_11 local_12 local_13 local_14)
  ;; init-args 29: "co_background", local_0, 'blkbib-getparententities, local_1
  (sihpp-list projet_pa_sihlin_st_lar)
  (setq gvar_2607 polybib-vtxjoin)
  (setq ls_lar (polycc-side gvar_3153 gvar_3388 gvar_1386 (re_angle re_cotechem 1)))
  (setq projet_pa_sihlin_st_lar (gr_filterupdate ls_lar nil))
  (setq projet_pa_sihlin_st_mod (ls_colummtypes projet_pa_sihlin_st_lar gvar_2408))
  (setq gvar_3388 chemdyn-hachtrace)
  (setq entlast (ls_param projet_pa_sihlin_st_mod chemdyn-hachtrace))
  (setq gvar_1386 (dcl-grid-addrow (repdyn-get projet_pa_sihlin_st_mod) gvar_2532))
  (or (st_blkbase (st_syle chemdyn-hachtrace gvar_2983) gvar_1386) (projet_pa_axes_st_desc re_vide '(ls_style ls_elems ls_elem ls_hach ls_bords ls_bordi ls_borde)))
  (setq gvar_3155 'projet_pa_sihlin_ls_layername)
  (if (st_blkbase gvar_2983 'ha_poly)
    (progn
      (setq gvar_3244 (projet_pa_sihlin_bo_inv projet_pa_sihlin_st_mod (repdyn-get projet_pa_sihlin_st_mod) gvar_2983))
      (setq ls_prop (blkbib-getvisient gvar_3244 (projet_md_metprop projet_pa_sihlin_st_mod)))
    )
    (progn
      (setq gvar_3244 (ls_param projet_pa_sihlin_st_mod gvar_1386))
      (setq ls_prop (getvar projet_pa_sihlin_st_mod gvar_3244))
    )
  )
  (pt_ptp1 (undobib-stop) en_param)
  (setq ss_blk (ls_paramswcs gvar_866 gvar_3244 projet_pa_sihlin_re_cote (st_syle gvar_2939 ls_prop) nil nil (es_ext (groupbib-list 8 blkbib-getparententities))))
  (setq in_num (dcl-grid-setcurcell in_num ss_blk))
  (setq gvar_1386 (dcl-control-setvisible projet_pa_sihlin_st_mod gvar_3244))
  (ls_som0 '(st_lar in_pos))
  (setq gvar_2607 nil)
  (if gvar_2607
    (progn
      (setq gvar_837 (projet_pa_sihlin_bo_inv projet_pa_sihlin_st_mod gvar_2983 re_plein 'ha_poly gvar_1386 re_vide))
      (setq re_plein (va_bande gvar_837))
      (setq gvar_3244 (projet_ml_progress projet_pa_sihlin_st_mod))
      (setq entlast (projet_ml_progress projet_pa_sihlin_st_mod))
      (setq local_14 (re_x gvar_837))
      nil
      (while (<= local_14 0)
        (setq local_14 (1- local_14))
        (if (re_angle gvar_2983 'ha_poly)
          (progn
            (setq gvar_3244 entlast)
            (setq ls_prop (getvar projet_pa_sihlin_st_mod gvar_3244))
          )
          (progn
            (setq gvar_3244 (projet_pa_sihlin_bo_inv projet_pa_sihlin_st_mod entlast gvar_2983))
            (setq ls_prop (blkbib-getvisient entlast gvar_3244))
          )
        )
        (pt_ptp1 (undobib-stop) en_param)
        (setq ss_blk (ls_paramswcs gvar_866 entlast projet_pa_sihlin_re_cote (st_syle gvar_2939 ls_prop) nil nil (es_ext (groupbib-list 8 blkbib-getparententities))))
        (setq in_num (dcl-grid-setcurcell in_num ss_blk))
        (setq gvar_3242 (projet_pa_sihlin_bo_inv projet_pa_sihlin_st_mod gvar_3244 re_plein))
        (setq gvar_3388 (st_param projet_pa_sihlin_st_mod gvar_3242))
        gvar_3242
        (setq entlast gvar_3242)
      )
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: PROJET/PA_SIHLIN/ST_MOD, arg_2, RE_PLEIN, RE_VIDE
;; Referenced symbols: *RE_U*, ENTDEL, POLYBIB-VTXJOIN, PROJET/PA_SIHLIN/ST_MOD, LS_PARAM, *ST_MOD*, REPDYN-GETPOINT, ST_RAY2, ST_AXEID, HA_POLY
;; Referenced strings: Couleur
(defun resdyn-corde (projet_pa_sihlin_st_mod arg_2 re_plein re_vide / re_tan pt_1 pt_2 ha_ext en_ext pt_proj in_param ls_soms in_length ls_vtxs ls_som pt_ptp1 pt_ptp2 re_side1 re_side2 pt_c1 pt_c2 re_dist re_angle re_1max pt_proj1 pt_proj2 pt_tan ls_vtxs_2 local_3 local_4)
  (entdel '*re_u*)
  (setq st_ray2 0)
  (setq ls_visiname re_tan)
  (setq *st_mod* polybib-vtxjoin)
  (setq projet_md_repblk_cb_blk2 (ls_param projet_pa_sihlin_st_mod_2 re_tan))
  (while (and *st_mod* (repdyn-getpoint re_tan pt_c1))
    (setq st_ray2 (st_axeid st_ray2))
    (if (re_angle gvar_2983 'ha_poly)
      (progn
        (setq gvar_3244 projet_md_repblk_cb_blk2)
      )
      (progn
        (setq gvar_3244 (projet_pa_sihlin_bo_inv projet_pa_sihlin_st_mod_2 projet_md_repblk_cb_blk2 gvar_2983))
      )
    )
    (if (repdyn-getpoint (st_param projet_pa_sihlin_st_mod_2 gvar_3244) (st_param projet_pa_sihlin_st_mod_2 projet_md_repblk_cb_blk2))
      (progn
        (setq *st_mod* nil)
      )
    )
    (setq gvar_3242 (projet_pa_sihlin_bo_inv projet_pa_sihlin_st_mod_2 gvar_3244 re_plein_2))
    (setq re_tan (st_param projet_pa_sihlin_st_mod_2 gvar_3242))
    (setq *st_lar* gvar_1637)
    (setq gvar_1637 (es_ext st_ray2 (st_param projet_pa_sihlin_st_mod_2 projet_md_repblk_cb_blk2) (st_param projet_pa_sihlin_st_mod_2 gvar_3244) (st_param projet_pa_sihlin_st_mod_2 gvar_3242)))
    (if (repdyn-getpoint (st_param projet_pa_sihlin_st_mod_2 gvar_3242) (st_param projet_pa_sihlin_st_mod_2 gvar_3244))
      (progn
        (setq *st_mod* nil)
      )
    )
    (setq projet_md_repblk_cb_blk2 gvar_3242)
  )
  (or (or (re_angle re_vide_2 '(ls_style ls_elems ls_elem ls_hach ls_bords ls_bordi ls_borde)) (re_angle re_vide_2 're_rayii)) (re_angle re_vide_2 "Couleur"))
  (setq st_ray2 (vla-get-name st_ray2))
  (setq re_plein_2 (ls_visient re_plein_2 (repdyn-isrep (dcl-grid-addrow (ls_visient re_plein_2 st_ray2) (dcl-grid-addrow (re_x gvar_1637) pt_c1)) (ls_visient re_plein_2 st_ray2))))
  (setq re_plein_2 (ls_visient re_plein_2 (repdyn-isrep (dcl-grid-addrow (ls_visient re_plein_2 (vla-get-name st_ray2)) (dcl-grid-addrow (dcl-grid-addrow 2 gvar_1637) pt_c1)) (ls_visient re_plein_2 st_ray2))))
  (if (st_blkbase (re_x gvar_1637) (dcl-grid-addrow pt_c1 gvar_2983))
    (progn
      (setq st_ray2 (vla-get-name st_ray2))
    )
  )
  (es_ext re_vide_2 st_ray2 re_plein_2)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: EN_RAYON, vlax-erased-p, LS_SOM0
(defun resdyn-modgo (en_rayon)
  (vlax-erased-p gvar_833)
  (setq re_yinv en_rayon_2)
  (ls_som0)
)

;; Referenced symbols: *ST_SIVLAYER*, ENTDEL, HA_DEF, RE_YINV, RE_COURANT, LS_OBJ, IN_PARAM, EN_MAR, SIHLIN-TRACEPOINT, Projet/PA_SihLin
;; Referenced strings: LC, Repère, u = 3cm
(defun c:projet_pa_resdyn_oninitialize ()
  (entdel '*st_sivlayer*)
  (setq gvar_3345 (re_courant 'ha_def re_yinv))
  (setq ls_groupparent gvar_3345)
  (setq gvar_2140 (*reactor2*))
  (setq in_lon0 (in_param gvar_3345 'ls_obj))
  (setq ls_dynprop (in_param gvar_3345 'en_mar))
  (setq gvar_2983 (in_param gvar_3345 'sihlin-tracepoint))
  (setq re_plein (in_param gvar_3345 "LC"))
  (setq data (in_param gvar_3345 'projet_pa_sihlin))
  (setq blkbib-getparententities (in_param gvar_3345 "Repère"))
  (setq chemdyn-hachtrace (in_param gvar_3345 'sihlin-mod))
  (setq gvar_2532 (in_param gvar_3345 '*ls_mod*))
  (setq ls_prop (en_polyabs gvar_3345 '(ls_parents ls_props ls_prop) 'ha_poly))
  (setq re_cotechem (en_polyabs gvar_3345 'va_inters 0))
  (setq re_vide (in_param gvar_3345 "u = 3cm"))
  (setq projet_md_marquage_st_lar (es_ext (groupbib-list '(ls_style ls_elems ls_elem ls_hach ls_bords ls_bordi ls_borde) '(ls_lar)) (groupbib-list 're_rayii 'projet_md_marquage_re_u) (groupbib-list "Couleur" 'projet_md_marquage_st_type)))
  (setq pt_pas (in_param gvar_3345 "Choisir un sommet"))
  (setq ls_inters1 (in_param gvar_3345 'croisdyn-getelems))
  (if (cadr blkbib-getparententities)
    (progn
      (setq blkbib-getparententities 'st_btn)
    )
  )
  (bo_lctabs sivpano-set in_lon0)
  (st_num gvar_826_c_projet_md_marquage_oninitialize re_cotechem)
  (projet_md_marquage gvar_825_c_projet_md_marquage_st_type_onselchanged (*reactor2*) ls_dynprop)
  (pt_poly gvar_823_c_projet_md_marquage_marquageok_onclicked ls_dynprop)
  (re_largbande st_ins)
  (ls_lines st_ins blkbib-getparententities)
  (bo_lctabs gvar_820 (eo_blkbase gvar_2983 2 2))
  (bo_lctabs gvar_819 (eo_blkbase re_plein 2 2))
  (bo_lctabs gvar_818 (eo_blkbase data 2 2))
  (projet_md_marquage gvar_817 (es_ext '(ls_axes ls_axe) "\n Vérification des axes...") gvar_2827)
  (projet_md_marquage gvar_816 (polybib-lwvertices 'eo_polyabs projet_md_marquage_st_lar) (laybib-newlay re_vide (polybib-lwvertices 'axedyn-reaccreate projet_md_marquage_st_lar)))
  (bo_lctabs gvar_815 (eo_blkbase chemdyn-hachtrace 2 2))
  (bo_lctabs gvar_814 (eo_blkbase gvar_2532 2 2))
  (st_num ld_passage (ocbib-id2ref (ls_visient ls_prop (repdyn-isrep 'sihpp-set gvar_3236))))
  (polybib-absrem)
  (setq gvar_2827 (in_param gvar_3345 "Impossible de tracer la seconde ligne pointillée"))
  (setq sihpp-getparents (es_ext (groupbib-list 'blkpoly-poly "ha_parent") (groupbib-list "Reconstruction des réacteurs des paramètres" 'eo_blkparam) (groupbib-list 'ls_paramentxy 'blkbib-blk_temp) (groupbib-list '(re_x re_y pt_poly re_anglepoly re_angle) 'eg_blkbase)))
  (ls_som0)
)

;; Referenced symbols: PROJET/MD_QUANTITE/BT_QTDROITE, AXEDYN-REACCREATE, vla-put-InsertionPoint, POLAR, IN_PARAM, ST_INS, BLKBIB-GETPARENTENTITIES, BO_LCTABS
(defun c:projet_pa_resdyn_bt_calque_onclicked ()
  (axedyn-reaccreate (projet_md_quantite_bt_qtdroite 'projet_md_quantite_bt_qtdroite))
  (in_param (polar vla-put-insertionpoint) 8)
  T
  (and (setq vla-put-insertionpoint (axedyn-reaccreate (projet_md_quantite_bt_qtdroite 'projet_md_quantite_bt_qtdroite))) (setq blkbib-getparententities (in_param (polar vla-put-insertionpoint) 8)) (bo_lctabs st_ins blkbib-getparententities))
)

;; Referenced symbols: ENTDEL, SIVPANO-SET, GROUPBIB-LISTOBJ, C:PROJET/MD_MARQUAGE/ST_TYPE#ONSELCHANGED, ST_INS, LD_PASSAGE, SIHPP-SET, LS_VISIENT, AXEDYN-REACCREATE, PROJET/MD_MARQUAGE/ST_LAR
;; Referenced strings: LC, Repère, Impossible de tracer la seconde ligne pointillée
(defun resdyn-palapply ()
  (entdel '(ls_parents va_ref1 va_ref2 va_ins va_bande))
  T
  (setq in_lon0 (errbib-catchapply sivpano-set))
  (setq gvar_2983 (groupbib-listobj (errbib-catchapply gvar_820)))
  (setq re_plein (groupbib-listobj (errbib-catchapply gvar_819)))
  (setq ls_dynprop (errbib-catchapply gvar_825_c_projet_md_marquage_st_type_onselchanged))
  (setq data (groupbib-listobj (errbib-catchapply gvar_818)))
  (setq blkbib-getparententities (errbib-catchapply st_ins))
  (setq gvar_2827 (ls_props2 gvar_817))
  (setq chemdyn-hachtrace (groupbib-listobj (errbib-catchapply gvar_815)))
  (setq gvar_2532 (groupbib-listobj (errbib-catchapply gvar_814)))
  (setq ls_prop (ls_visient (axe-set ld_passage) (repdyn-isrep gvar_3236 'sihpp-set)))
  (setq re_vide (dcl-grid-addrow (ls_props2 gvar_816) (polybib-lwvertices 'axedyn-reaccreate projet_md_marquage_st_lar)))
  (setq re_cotechem (axe-set gvar_826_c_projet_md_marquage_oninitialize))
  (setq gvar_2607 nil)
  'va_base
  'pt_mid
  're_angaxe
  'poly-entintpoint
  'poly-polyint
  polybib-vtxjoin
  (if (and (setq gvar_2609 'va_base) (re_deltax chemdyn-hachtrace 0) (setq gvar_2609 'pt_mid) (re_deltax gvar_2532 0) (setq gvar_2609 're_angaxe) (re_deltax gvar_2983 0) (setq gvar_2609 'poly-entintpoint) (re_deltax data 0) (setq gvar_2609 'poly-polyint) (st_blkbase re_plein 0) (setq gvar_2607 polybib-vtxjoin) gvar_2607)
    (progn
      (*ls_u* re_yinv)
      (setq gvar_3345 (st_rayon gvar_3345 'ls_obj in_lon0))
      (setq gvar_3345 (st_rayon gvar_3345 'sihlin-tracepoint gvar_2983))
      (setq gvar_3345 (st_rayon gvar_3345 "LC" re_plein))
      (setq gvar_3345 (st_rayon gvar_3345 'en_mar ls_dynprop))
      (setq gvar_3345 (st_rayon gvar_3345 'projet_pa_sihlin data))
      (setq gvar_3345 (st_rayon gvar_3345 "Repère" blkbib-getparententities))
      (setq gvar_3345 (st_rayon gvar_3345 "Impossible de tracer la seconde ligne pointillée" gvar_2827))
      (setq gvar_3345 (st_rayon gvar_3345 'sihlin-mod chemdyn-hachtrace))
      (setq gvar_3345 (st_rayon gvar_3345 '*ls_mod* gvar_2532))
      (setq gvar_3345 (st_rayon gvar_3345 "u = 3cm" re_vide))
      (setq gvar_3345 (st_rayon gvar_3345 '(ls_parents ls_props ls_prop) ls_prop))
      (setq gvar_3345 (st_rayon gvar_3345 'va_inters re_cotechem))
    )
    (progn
      (bordyn-inters gvar_2609)
    )
  )
  (ls_som0)
)

;; Referenced symbols: LS_GROUPPARENT, RE_YINV
(defun c:projet_pa_resdyn_btn_reset_onclicked ()
  (*ls_u* re_yinv)
  (setq gvar_3345 ls_groupparent)
  (re_abs1 gvar_833 1)
)

;; Referenced symbols: ENTDEL, HA_DEF, RE_YINV, GROUPBIB-LIST
;; Referenced strings: PatternAngle
(defun resdyn-palsave ()
  (entdel "PatternAngle")
  (re_abs2 (groupbib-list 'ha_def re_yinv) gvar_3094)
  (*ls_mod* re_yinv gvar_3345)
  (setq gvar_3094 (*ls_u* gvar_3345))
  (re_abs1 gvar_833 1)
)

(defun resdyn-palclose ()
  (eo_poly)
  (setq gvar_3345 nil)
  (setq ls_groupparent nil)
  nil
  (setq re_yinv nil)
)

;; Original arg hints: EO_POLY, arg_2
;; Referenced symbols: C:PROJET/MD_MARQUAGE/MARQUAGEOK#ONCLICKED, PT_POLY, LS_SOM0
(defun c:projet_pa_resdyn_ls_blkname_onselchanged (eo_poly arg_2)
  (pt_poly gvar_823_c_projet_md_marquage_marquageok_onclicked gvar_2862)
  (ls_som0)
)

;; Referenced symbols: LS_ENTNEW
(defun c:projet_pa_resdyn_re_long_onsetfocus ()
  (ls_entnew gvar_820 0 255)
)

;; Referenced symbols: LS_ENTNEW
(defun c:projet_pa_resdyn_re_gap_onsetfocus ()
  (ls_entnew gvar_819 0 255)
)

;; Referenced symbols: LS_ENTNEW
(defun c:projet_pa_resdyn_re_decy_onsetfocus ()
  (ls_entnew gvar_818 0 255)
)

;; Referenced symbols: LS_ENTNEW
(defun c:projet_pa_resdyn_re_amont_onsetfocus ()
  (ls_entnew gvar_815 0 255)
)

;; Referenced symbols: LS_ENTNEW
(defun c:projet_pa_resdyn_re_aval_onsetfocus ()
  (ls_entnew gvar_814 0 255)
)

;; Referenced symbols: ES_EXT, RE_ANGLEBANDE, ST_BLKBASE, PROJET/MD_METZON/TB_COEF, GROUPBIB-LIST, dcl-grid-setcurcell, PT_EXT1, DCL-GRID-ADDROW, AXEDYN-REACCREATE, PT_EXT2
(defun c:projet_md_selforce_bt_ok_onclicked ()
  (setq projet_md_metzon_tb_coef (es_ext))
  (if (st_blkbase (ls_props2 re_anglebande) 0)
    (progn
      (setq projet_md_metzon_tb_coef (dcl-grid-setcurcell projet_md_metzon_tb_coef (groupbib-list '(pt_ext1 pt_ext2 pt_deb11 pt_deb12 pt_deb21 pt_deb22 ls_vtxs) (errbib-catchapply re_anglebande))))
    )
  )
  (if (st_blkbase (ls_props2 gvar_802) 0)
    (progn
      (setq projet_md_metzon_tb_coef (dcl-grid-setcurcell projet_md_metzon_tb_coef (groupbib-list 'pt_ext1 (axedyn-reaccreate (dcl-grid-addrow (ls_props2 gvar_802) gvar_800)))))
    )
  )
  (or (or (re_angle (ls_props2 pt_ext2) 255) (ls_ext2 'pt_deb11 (errbib-catchapply pt_ext2))) (st_blkbase (ls_props2 pt_ext2) 1))
  (setq projet_md_metzon_tb_coef (dcl-grid-setcurcell projet_md_metzon_tb_coef (groupbib-list 'pt_deb12 (errbib-catchapply pt_ext2))))
  (if st_prix
    (progn
      (setq projet_md_metzon_tb_coef (dcl-grid-setcurcell projet_md_metzon_tb_coef (groupbib-list 'pt_deb12 st_prix)))
    )
    (progn
      (bordyn-inters 'pt_deb21)
    )
  )
  (re_abs1 pt_deb22 1)
)

;; Referenced symbols: SIHPP-GET
(defun c:projet_md_selforce_bt_color_onclicked ()
  (sihpp-get)
)

;; Referenced symbols: ST_PRIX, dcl-control-setenabled, vlax-invoke
(defun selforcedial_bt_color ()
  (setq st_prix (sihpp-get 1 nil))
  (if st_prix
    (progn
      (listbib-move-i gvar_792 st_prix)
      (vlax-invoke gvar_791 (dcl-control-setenabled st_prix))
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: EN_BANDE, ENTDEL, PT_DEB22, RE_ANGLEBANDE, RE_LARGPASSAGE, LS_VTX0, IN_PARAM, LS_LINES, BO_LCTABS, EO_POLYABS
(defun c:projet_md_selforce_oninitialize ()
  (entdel 'en_bande)
  (re_haut pt_deb22)
  (ls_vtx0 re_anglebande re_largpassage)
  (in_param gvar_788 '(pt_ext1 pt_ext2 pt_deb11 pt_deb12 pt_deb21 pt_deb22 ls_vtxs))
  (if (and gvar_788 (setq ls_lines (in_param gvar_788 '(pt_ext1 pt_ext2 pt_deb11 pt_deb12 pt_deb21 pt_deb22 ls_vtxs))))
    (progn
      (bo_lctabs re_anglebande ls_lines)
    )
  )
  (ls_vtx0 gvar_802 (polybib-lwvertices 'eo_polyabs gvar_800))
  (in_param gvar_788 'pt_ext1)
  (if (and gvar_788 (setq vla-get-insertionpoint (in_param gvar_788 'pt_ext1)))
    (progn
      (bo_invpoly1 gvar_802 (laybib-newlay vla-get-insertionpoint (polybib-lwvertices 'axedyn-reaccreate gvar_800)))
    )
  )
  (ls_vtx0 pt_ext2 en_polycontour)
  (setq en_polycontour (es_ext 'ls_ext1 'pt_deb11 'sihpp-getint 'ptbib-midpoint 'sihpp-contour))
  (in_param gvar_788 'pt_deb12)
  (if (and gvar_788 (setq pt_deb1 (in_param gvar_788 'pt_deb12)))
    (progn
      (or (re_angle 'pt_deb2 (undobib-start pt_deb1)) polybib-vtxjoin)
      (bo_lctabs pt_ext2 pt_deb1)
      (bo_invpoly1 pt_ext2 1)
      (vlax-invoke gvar_791 pt_deb1)
      (listbib-move-i gvar_792 pt_deb1)
      (setq ls_paramwcs polybib-vtxjoin)
      (setq st_prix pt_deb1)
    )
  )
  (re_hauteur gvar_791 ls_paramwcs)
  (re_hauteur gvar_792 ls_paramwcs)
)

;; Original arg hints: EO_POLY, arg_2
;; Referenced symbols: PT_DEBPP, ENTDEL, EO_POLY, ODCLBIB-FILLCOMBO, PT_FPP, RE_HAUTEUR, SIHPP-GET
(defun c:projet_md_selforce_cb_couleur_onselchanged (eo_poly arg_2)
  (entdel 'pt_debpp)
  (re_hauteur gvar_791 pt_fpp)
  (re_hauteur gvar_792 pt_fpp)
  (setq pt_fpp (odclbib-fillcombo eo_poly_2 1))
  T
  (and pt_fpp (sihpp-get))
)

;; Referenced symbols: PT_EXT2, BO_INVPOLY1, RE_ANGLEBANDE, RE_HAUTEUR
(defun c:projet_md_selforce_bt_reset_onclicked ()
  (bo_invpoly1 pt_ext2 0)
  (bo_invpoly1 re_anglebande 0)
  (bo_invpoly1 gvar_802 0)
  (re_hauteur gvar_791 nil)
  (re_hauteur gvar_792 nil)
)

;; Referenced symbols: IN_NUMBANDE, ENTDEL, LS_EXT1, ES_EXT, RE_LARGNOIR, ST_RAYON, HA_POLY, LS_BANDEENTS, IN_NUMDECDEB, IN_NUMDECFIN
;; Referenced strings: -2.0, 0.1
(defun selforce ()
  (entdel 'in_numbande)
  (setq re_largpassage (st_rayon (es_ext 'ls_ext1) (re_largnoir)))
  (setq gvar_800 (es_ext 'ha_poly 'ls_bandeents 'in_numdecdeb 'in_numdecfin 'sihpp-tracebande 'ssbib-li2ss "-2.0" 'pt_4 're_dist1 're_dist2 'en_polybase 're_dist3 're_dist4 'poly-polysurfint "0.1"))
  (setq gvar_800 (polybib-lwvertices 'projet_pa_sihpp gvar_800))
  (setq gvar_800 (st_rayon (es_ext (groupbib-list 255 'ls_ext1)) gvar_800))
  (if (re_angle 1 (vlax-erased-p pt_deb22))
    (progn
      projet_md_metzon_tb_coef
      (setq gvar_788 projet_md_metzon_tb_coef)
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: IN_SPECIAL, AXEDYN-SETRAYEXT
(defun sihlin-list ()
  (axedyn-setrayext 'in_special)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: IN_SPECIAL, EN_RAYON, RE_COURANT
(defun sihlin-get (en_rayon)
  (re_courant 'in_special en_rayon_2)
)

;; Original arg hints: EN_RAYON, arg_2
;; Referenced symbols: IN_SPECIAL, EN_RAYON, RTOS
(defun sihlin-set (en_rayon arg_2)
  (rtos 'in_special en_rayon_2 gvar_3164)
)

;; Original arg hints: arg_1, arg_2, CROISDYN-GETPARENTS, LD_CROIS, PT_PAS, LS_INTERS1, RE_COTECHEM, BLKBIB-GETPARENTENTITIES, arg_9
;; Referenced symbols: ENTDEL, IN_SPECIAL, /, ST_AXEID, LS_AXES, INTERS, GROUPBIB-LIST, CROISDYN-SET, CROISDYN-GETPARENTS, LS_CROISELEMS
;; Referenced strings: re_rayie, ha_contour, Choisir un sommet
(defun sihlin-create (arg_1 arg_2 croisdyn-getparents ld_crois pt_pas ls_inters1 re_cotechem blkbib-getparententities arg_9)
  (entdel '(st_layer re_largbande re_largpassage))
  (bt_ins en_rayon bt_bande)
  (re_abs2 (groupbib-list 'in_special en_rayon) gvar_3094)
  (projet_pa_sihpp_st_largbande en_rayon)
  (setq inters (st_axeid (/ 'in_special)))
  (setq bt_bande (es_ext (groupbib-list 'ls_axes inters) (groupbib-list "re_rayie" gvar_2406) (groupbib-list 'croisdyn-set croisdyn-getparents_2) (groupbib-list 'ls_croiselems gvar_2827) (groupbib-list "ha_contour" ld_crois_2) (groupbib-list 'va_point gvar_3162) (groupbib-list "Choisir un sommet" pt_pas_2) (groupbib-list 'croisdyn-getelems ls_inters1_2) (groupbib-list 'va_inters re_cotechem_2) (groupbib-list "Repère" blkbib-getparententities_2) (groupbib-list 'dcl-control-settext 'ls_ext1)))
  (setq en_rayon (dcl-control-setenabled inters))
  (setq gvar_3094 (projet_pa_sihpp_ls_layername bt_bande))
  (ls_som0)
)

;; Original arg hints: AOPORA-FIN
;; Referenced symbols: LS_CROIS, ENTDEL, AOPORA-FIN, VA_POINT, IN_PARAM, ES_EXT, CROISDYN-GETELEMS, PT_PAS, RE_ABS2, GROUPBIB-LIST
;; Referenced strings: Choisir un sommet
(defun sihlin-getparents (aopora-fin)
  (entdel 'ls_crois)
  (setq gvar_3094 (es_ext (in_param aopora-fin_2 'va_point)))
  (setq pt_pas (in_param aopora-fin_2 "Choisir un sommet"))
  (setq ls_inters1 (in_param aopora-fin_2 'croisdyn-getelems))
  (if (re_abs2 pt_pas)
    (progn
      (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 (groupbib-list 're_abs2 pt_pas)))
    )
  )
  (if (re_abs2 ls_inters1)
    (progn
      (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 (groupbib-list 're_abs2 ls_inters1)))
    )
  )
  gvar_3094
)

;; Original arg hints: BT_BANDE
;; Referenced symbols: BT_BANDE, CROISDYN-SET, IN_PARAM, PROJET/PA_SIHPP/ST_LARGPASSAGE, LS_EXT2, POLYBIB-VTXJOIN, PROJET/PA_DETAIL/LS_REP, HA_HANDLE, LS_VISIENT, EN_POLYBASE
;; Referenced strings: Choix de la nouvelle limite : , re_rayie, Choix de l'axe des bandes :
(defun sihlin-larg (bt_bande)
  nil
  (or (or (ls_ext2 (in_param bt_bande_2 'croisdyn-set) 'projet_pa_sihpp_st_largpassage) (ls_ext2 (in_param bt_bande_2 'croisdyn-set) "Choix de la nouvelle limite : ")) polybib-vtxjoin)
  (ls_visient '(st_blk1 st_blk2 ls_blk st_msg bo_go) (in_param bt_bande_2 "re_rayie") (ha_handle (projet_pa_detail_ls_rep (in_param bt_bande_2 'croisdyn-set) 1 1)))
  'en_polybase
  "Choix de l'axe des bandes :"
)

;; Referenced symbols: SIHPP-POPGO, ES_EXT, GROUPBIB-LIST, ST_PANO, FILEBIB-READCSVSEP, ST_SEARCH, SIVPANO-LISTPANO, LS_RESULT, WCMATCH, EN_POLYBASE
;; Referenced strings: CLAYER, C:\Pliver\bib\900-Développement\0-Blibilothèque métier\Panneaux.csv, ;
(defun sihlin-pleinvide ()
  (es_ext (groupbib-list '(re_largpassage re_largbande st_layer) (es_ext 'sihpp-popgo "CLAYER")) (groupbib-list '(st_pano) (es_ext "C:\\Pliver\\bib\\900-Développement\\0-Blibilothèque métier\\Panneaux.csv" 'st_pano)) (groupbib-list ";" (es_ext 'sihpp-popgo (repdyn-isrep 'filebib-readcsvsep 'sihpp-popgo))) (groupbib-list 'st_search (es_ext '(ls_panos ls_result ls_pano) 'sivpano-listpano)) (groupbib-list 'ls_result (es_ext 'sihpp-popgo "=")) (groupbib-list 'wcmatch (es_ext 'en_polybase 'en_polybase)) (groupbib-list 'strlen (es_ext 'st_support 'st_panneau)))
)

(defun sihlin-mod ()
  '(re_echelle st_nom ls_ins pt_ins re_dir)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: ST_SUPPORT0, ENTDEL, ES_EXT, EN_RAYON, BO_SPECIAL, CHEMDYN-BORDTRACE, BT_BANDE, VA_POINT, IN_PARAM, LS_PROPSDESCS
;; Referenced strings: re_offset2, Choisir un sommet, Repère
(defun sihlin-popgo (en_rayon)
  (entdel 'st_support0)
  (setq in_num (es_ext))
  (if gvar_3345
    (progn
      (setq bt_bande gvar_3345)
    )
    (progn
      (setq bt_bande (bo_special en_rayon_2))
    )
  )
  'chemdyn-bordtrace
  (chemdyn-bordtrace (in_param bt_bande 'va_point))
  "re_offset2"
  (hachbib-vtxs2hach (in_param bt_bande "Choisir un sommet") ls_propsdescs)
  (st_param ls_propsdescs entlast)
  'chemdyn-polytrace
  (hachbib-vtxs2hach (in_param bt_bande 'croisdyn-getelems) ls_propsdescs)
  (st_param ls_propsdescs polycc-tanext)
  (en_polyabs bt_bande "Repère" (trans "Décalage"))
  (en_polyabs bt_bande 'va_inters 0)
  (in_param bt_bande "ha_contour")
  (in_param bt_bande 'dcl-control-settext)
  (entbib-offsettemp bt_bande)
  (in_param bt_bande 'ls_croiselems)
  "cannoscalevalue"
  (if (and (setq gvar_3155 'chemdyn-bordtrace) (setq ls_propsdescs (chemdyn-bordtrace (in_param bt_bande 'va_point))) (setq gvar_3155 "re_offset2") (setq entlast (hachbib-vtxs2hach (in_param bt_bande "Choisir un sommet") ls_propsdescs)) (setq gvar_2479 (st_param ls_propsdescs entlast)) (setq gvar_3155 'chemdyn-polytrace) (setq polycc-tanext (hachbib-vtxs2hach (in_param bt_bande 'croisdyn-getelems) ls_propsdescs)) (setq va_bande (st_param ls_propsdescs polycc-tanext)) (setq blkbib-getparententities (en_polyabs bt_bande "Repère" (trans "Décalage"))) (setq re_cotechem (en_polyabs bt_bande 'va_inters 0)) (setq polybib-subpolybisinv (in_param bt_bande "ha_contour")) (setq re_bulge (in_param bt_bande 'dcl-control-settext)) (setq listbib-min (entbib-offsettemp bt_bande)) (setq gvar_2827 (in_param bt_bande 'ls_croiselems)) (setq gvar_3155 "cannoscalevalue") (en_int1dc ls_propsdescs gvar_2479 va_bande re_cotechem gvar_2827 polybib-subpolybisinv listbib-min blkbib-getparententities) (re_ray re_bulge))
    (progn
      (entbib-dellist re_bulge)
      (setq gvar_3155 "du panneau")
      (column (re_ray re_bulge) in_num)
    )
    (progn
      (setq gvar_3155 'sivpano-getins)
      (setq reabib-deleteobjectreactor (polybib-inv in_num))
      (setq gvar_3370 nil)
      (setq bt_bande (st_rayon bt_bande 'dcl-control-settext (projet_pa_axes_ca_sommet reabib-deleteobjectreactor)))
      (setq gvar_3155 'ls_ins)
      (bt_ins en_rayon_2 bt_bande)
    )
  )
  T
  nil
  (ls_som0)
  (setq gvar_3155 nil)
)

;; Original arg hints: LS_PROPSDESCS, arg_2, VA_BANDE, RE_COTECHEM, arg_5, POLYBIB-SUBPOLYBISINV, LISTBIB-MIN, BLKBIB-GETPARENTENTITIES
;; Referenced symbols: SIVPANO-GETDIR, ENTDEL, PROJET/PA_SIHLIN/ST_LAR, RE_DIR, POLYBIB-SUBPOLYBISINV, SIVPANO-SUPPORTINSERT, *EN_PANOSUP*, HA_POLY, RE_ANGLE, EN_PANOSUP
;; Referenced strings: ,Choix du panneau à copier, Support précédent effacé, copie impossible
(defun sihlin-trace (ls_propsdescs arg_2 va_bande re_cotechem arg_5 polybib-subpolybisinv listbib-min blkbib-getparententities)
  (entdel 'sivpano-getdir)
  ;; init-args 7: 'projet_pa_sihlin_st_lar, ls_propsdescs, 're_dir, arg_2
  (entdel 'sivpano-supportinsert)
  (setq *en_panolast* (*en_panosup*))
  (setq va_bande_2 (repdyn-get projet_pa_sihlin_st_lar))
  (setq gvar_3388 'ha_poly)
  (or (or (re_angle polybib-subpolybisinv_2 ",Choix du panneau à copier") (re_angle polybib-subpolybisinv_2 'en_panosup)) polybib-vtxjoin)
  (setq eo_panosup (axedyn-reaccreate (in_param *en_panolast* polybib-subpolybisinv_2)))
  (setq gvar_724 (re_x (in_param *en_panolast* polybib-subpolybisinv_2)))
  (setq eo_panosup (axedyn-reaccreate (in_param *en_panolast* 'wcmatch)))
  (setq gvar_724 (re_x (in_param *en_panolast* 'wcmatch)))
  (setq gvar_3388 'ha_poly)
  (setq re_dir (dcl-grid-addrow re_dir (ls_visient listbib-min_2 2)))
  (setq eo_panosup (axedyn-reaccreate (in_param *en_panolast* 'wcmatch)))
  (setq gvar_724 (re_x (in_param *en_panolast* 'wcmatch)))
  (setq gvar_3388 'ha_poly)
  (setq re_dir (st_syle re_dir (ls_visient listbib-min_2 2)))
  (setq gvar_3155 'ld_list)
  nil
  (while (re_deltax gvar_3388 va_bande_2)
    (ls_soms gvar_722 43 listbib-min_2)
    (ls_soms gvar_722 8 blkbib-getparententities_2)
    (ls_soms gvar_722 62 256)
    (setq ls_ladata (ls_param projet_pa_sihlin_st_lar gvar_3388))
    (setq va_ref (ls_param projet_pa_sihlin_st_lar (ld_ldata va_bande_2 (st_syle eo_panosup gvar_3388))))
    (setq gvar_722 (rem (stylechem-list projet_pa_sihlin_st_lar ls_ladata va_ref re_dir nil)))
    (setq gvar_3388 (st_syle gvar_3388 eo_panosup gvar_724))
    (setq in_num (dcl-grid-setcurcell in_num gvar_722))
    polybib-vtxjoin
  )
  (setq sivpano-supminsert 'st_mask)
  (setq re_dir (ls_visient gvar_2827 listbib-min_2 'en_polybase))
  (setq ls_lar (polycc-side ls_propsdescs_2 gvar_2479 va_bande_2 (re_angle re_cotechem_2 1)))
  (setq projet_pa_sihlin_st_lar (gr_filterupdate ls_lar nil))
  (setq va_bande_2 (repdyn-get projet_pa_sihlin_st_lar))
  (if (laybib-newlay polybib-subpolybisinv_2 (es_ext "Support précédent effacé, copie impossible" ",Choix du panneau à copier" 'en_panosup))
    (progn
      (ls_soms gvar_722 43 listbib-min_2)
      (ls_soms gvar_722 8 blkbib-getparententities_2)
      (ls_soms gvar_722 62 256)
      (setq gvar_3155 'en_sup)
      (setq gvar_722 (rem (axedyn-reaccreate (st_path projet_pa_sihlin_st_lar re_dir))))
      (setq in_num (dcl-grid-setcurcell in_num gvar_722))
      (setq gvar_3388 va_bande_2)
    )
    (progn
      (sivpano-supminsert projet_pa_sihlin_st_lar re_dir polybib-subpolybisinv_2)
    )
  )
  (setq gvar_3155 '(eo_sup ha_sup in_max ls_sir-ver))
  (if (laybib-newlay polybib-subpolybisinv_2 (es_ext ",Choix du panneau à copier" 'en_panosup))
    (progn
      (sivpano-supminsert projet_pa_sihlin_st_lar re_dir polybib-subpolybisinv_2)
    )
  )
  (sihpp-list projet_pa_sihlin_st_lar)
  polybib-vtxjoin
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: EN_RAYON, EO_SUP, vlax-erased-p
(defun sihlin-modgo (en_rayon)
  (setq re_yinv en_rayon_2)
  (vlax-erased-p eo_sup)
)

;; Referenced symbols: IN_SPECIAL, RE_YINV, RE_COURANT, SIHPP-POPGO, LS_SIR-VER, GROUPBIB-LIST, ST_PANO, FL_FIN, SIVPANO-LISTPANO, *ST_METIER*
;; Referenced strings: ha_contour, re_rayie, Repère
(defun c:projet_pa_sihlin_oninitialize ()
  (ls_vtx0 blkbib-blk_addrename (polybib-lwvertices 'eo_polyabs gvar_709))
  (bo_invpoly1 blkbib-blk_addrename (laybib-newlay gvar_2406 (polybib-lwvertices 'axedyn-reaccreate gvar_709)))
  (ls_vtx0 gvar_707 (es_ext '(ls_axes ls_axe) 'sivpano-getbase "\n Vérification des axes..."))
  (setq gvar_3345 (re_courant 'in_special re_yinv))
  (setq ls_groupparent gvar_3345)
  (setq gvar_715 (eo_sup))
  (setq gvar_709 (es_ext (groupbib-list 'sihpp-popgo 'ls_sir-ver) (groupbib-list 'st_pano 'fl_fin) (groupbib-list 'sivpano-listpano '(en_sup eo_sup pt_base re_offset st_panneau ls_att)) (groupbib-list '*st_metier* '*blockpath*)))
  (setq croisdyn-getparents (in_param gvar_3345 'croisdyn-set))
  (setq ld_crois (in_param gvar_3345 "ha_contour"))
  (setq gvar_2406 (in_param gvar_3345 "re_rayie"))
  (setq blkbib-getparententities (in_param gvar_3345 "Repère"))
  (setq gvar_2827 (in_param gvar_3345 'ls_croiselems))
  (setq projet_md_metprop_cb_layer (in_param gvar_3345 'ls_croiselems))
  (setq pt_pas (in_param gvar_3345 "Choisir un sommet"))
  (setq ls_inters1 (in_param gvar_3345 'croisdyn-getelems))
  (setq re_cotechem (en_polyabs bt_bande 'va_inters 0))
  (if gvar_2827
    (progn
      (bo_invpoly1 gvar_707 (st_axeid gvar_2827))
    )
    (progn
      (bo_invpoly1 gvar_707 1)
    )
  )
  (ls_vtx0 sivpano-add (polybib-lwvertices 're_x gvar_715))
  (bo_invpoly1 sivpano-add (laybib-newlay ld_crois (polybib-lwvertices 'axedyn-reaccreate gvar_715)))
  (ls_vtx0 sivpano-supportswitch sivpano-getnom)
  (bo_invpoly1 sivpano-supportswitch (laybib-newlay croisdyn-getparents sivpano-getnom))
  (bo_lctabs gvar_702 blkbib-getparententities)
  (st_num blkbib-set_pd re_cotechem)
  (setq sivpano-getnom (va_bande (dcl-grid-addrow (laybib-newlay ld_crois (polybib-lwvertices 'axedyn-reaccreate gvar_715)) gvar_715)))
  (polybib-absrem)
)

;; Original arg hints: EO_POLY, arg_2
;; Referenced symbols: SIVPANO-REACCREATE, ENTDEL, SIVPANO-SUPPORTSWITCH, EO_POLY, DCL-GRID-ADDROW, LS_VTX0, CROISDYN-GETPARENTS, POLYBIB-SUBPOLYOFFINV, ST_BLKBASE, BO_INVPOLY1
(defun c:projet_pa_sihlin_st_mod_onselchanged (eo_poly arg_2)
  (entdel 'sivpano-reaccreate)
  (ls_vtx0 sivpano-supportswitch (va_bande (dcl-grid-addrow eo_poly_2 gvar_715)))
  (setq croisdyn-getparents (errbib-catchapply sivpano-supportswitch))
  (setq polybib-subpolyoffinv (ls_lines sivpano-supportswitch croisdyn-getparents))
  (if (st_blkbase polybib-subpolyoffinv 255)
    (progn
      (bo_invpoly1 sivpano-supportswitch polybib-subpolyoffinv)
    )
    (progn
      (bo_invpoly1 sivpano-supportswitch 0)
    )
  )
  (ls_som0)
)

;; Referenced symbols: SIVPANO-GETSERIE, ENTDEL, BLKBIB-BLK_ADDRENAME, AXEDYN-REACCREATE, POLYBIB-LWVERTICES, DCL-GRID-ADDROW, SIVPANO-ADD, SIVPANO-SUPPORTSWITCH, HA_POLY, EN_POLY
;; Referenced strings: re_rayie, ha_contour, Repère
(defun sihlin-palapply ()
  (entdel 'sivpano-getserie)
  (setq gvar_2406 (dcl-grid-addrow (ls_props2 blkbib-blk_addrename) (polybib-lwvertices 'axedyn-reaccreate gvar_709)))
  (setq ld_crois (dcl-grid-addrow (ls_props2 sivpano-add) (polybib-lwvertices 'axedyn-reaccreate gvar_715)))
  (setq croisdyn-getparents (dcl-grid-addrow (ls_props2 sivpano-supportswitch) (va_bande (dcl-grid-addrow (ls_props2 sivpano-add) gvar_715))))
  (setq gvar_2827 (dcl-grid-addrow (ls_props2 gvar_707) (es_ext '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) 'ha_poly 'en_poly)))
  (setq re_cotechem (axe-set blkbib-set_pd))
  (setq blkbib-getparententities (errbib-catchapply gvar_702))
  (setq gvar_3345 (projexp-affpropsmpolydyn gvar_3345 (es_ext "re_rayie" "ha_contour" 'croisdyn-set 'ls_croiselems "Repère" 'va_inters) (es_ext gvar_2406 ld_crois croisdyn-getparents gvar_2827 blkbib-getparententities re_cotechem)))
  (projet_pa_sihpp_st_largbande re_yinv)
)

;; Referenced symbols: PROJET/MD_QUANTITE/BT_QTDROITE, AXEDYN-REACCREATE, vla-put-InsertionPoint, POLAR, IN_PARAM, BLKBIB-GETPARENTENTITIES, BO_LCTABS
(defun c:projet_pa_sihlin_bt_calque_onclicked ()
  (axedyn-reaccreate (projet_md_quantite_bt_qtdroite 'projet_md_quantite_bt_qtdroite))
  (in_param (polar vla-put-insertionpoint) 8)
  T
  (and (setq vla-put-insertionpoint (axedyn-reaccreate (projet_md_quantite_bt_qtdroite 'projet_md_quantite_bt_qtdroite))) (setq blkbib-getparententities (in_param (polar vla-put-insertionpoint) 8)) (bo_lctabs gvar_702 blkbib-getparententities))
)

;; Referenced symbols: ENTDEL, PROJET/PA_SIHPP/LS_LAYERNAME, RE_YINV, BT_INS, IN_SPECIAL, GROUPBIB-LIST, EO_SUP, LS_SOM0
;; Referenced strings: PatternAngle
(defun sihlin-palsave ()
  (entdel "PatternAngle")
  (bt_ins re_yinv gvar_3345)
  (re_abs2 (groupbib-list 'in_special re_yinv) gvar_3094)
  (re_abs1 eo_sup 1)
  (setq gvar_3094 (projet_pa_sihpp_ls_layername gvar_3345))
  (ls_som0)
)

;; Referenced symbols: LS_SOM0
(defun sihlin-palclose ()
  (eo_poly)
  (setq re_yinv nil)
  (setq gvar_3345 nil)
  (setq ls_groupparent nil)
  (setq gvar_715 nil)
  (setq gvar_709 nil)
  (ls_som0)
)

;; Referenced symbols: ST_SERIE, ENTDEL, SIVPANO-LISTPANO, ST_DIRECTORY, COND, ST_FILENAME, TRANS, SIHPP-POPGO, LS_SIR-VER, GROUPBIB-LIST
;; Referenced strings: Support précédent effacé, copie impossible, Décalage, panneau non trouvé
(defun sihlin-selmod ( / local_0 local_1)
  (entdel 'st_serie)
  T
  T
  T
  T
  'sivpano-listpano
  "Support précédent effacé, copie impossible"
  'cond
  (trans "Décalage")
  (setq vl-directory-files (eo_sup))
  (setq gvar_709 (es_ext (groupbib-list 'sihpp-popgo 'ls_sir-ver) (groupbib-list 'st_pano 'fl_fin) (groupbib-list 'sivpano-listpano '(en_sup eo_sup pt_base re_offset st_panneau ls_att)) (groupbib-list '*st_metier* '*blockpath*)))
  (or (or (or (or gvar_697 (setq gvar_697 'sivpano-listpano)) (or st_directory (setq st_directory "Support précédent effacé, copie impossible"))) (or gvar_695 (setq gvar_695 'cond))) (or st_filename (setq st_filename (trans "Décalage"))))
  (entdel 'sivpano-pansel)
  (ls_polys sivpano-attrib (polybib-lwvertices 'eo_polyabs gvar_709))
  (bo_invpoly1 sivpano-attrib (laybib-newlay gvar_697 (polybib-lwvertices 'axedyn-reaccreate gvar_709)))
  (ls_polys ls_att (polybib-lwvertices 're_x vl-directory-files))
  (bo_invpoly1 ls_att (laybib-newlay st_directory (polybib-lwvertices 'axedyn-reaccreate vl-directory-files)))
  (ls_polys sivpano-panoinsert sivpano-getnom)
  (bo_invpoly1 sivpano-panoinsert (laybib-newlay gvar_695 sivpano-getnom))
  (setq sivpano-getnom (va_bande (dcl-grid-addrow (laybib-newlay st_directory (polybib-lwvertices 'axedyn-reaccreate vl-directory-files)) vl-directory-files)))
  (ls_som0)
  (ls_debfinrad "panneau non trouvé")
  (setq gvar_687 'filebib-listsub)
  ;; init-args 5: 'eo_poly, local_0, "LinetypeGeneration", local_1
  (entdel 'sivpano-pansel)
  (metquantprix sivpano-panoinsert)
  (ls_polys sivpano-panoinsert sivpano-getnom)
  (setq sivpano-getnom (va_bande (dcl-grid-addrow eo_poly vl-directory-files)))
  (if (laybib-newlay gvar_695 sivpano-getnom)
    (progn
      (bo_invpoly1 sivpano-panoinsert (laybib-newlay gvar_695 sivpano-getnom))
    )
    (progn
      (bo_invpoly1 sivpano-panoinsert 0)
      (setq gvar_695 (dcl-grid-addrow 0 sivpano-getnom))
    )
  )
  (ls_som0)
  (ls_debfinrad 'st_blknom)
  (setq st_blknom 'ls_file)
  (re_abs1 gvar_685 1)
  (setq gvar_697 (dcl-grid-addrow (ls_props2 sivpano-attrib) (polybib-lwvertices 'axedyn-reaccreate gvar_709)))
  (setq st_directory (dcl-grid-addrow (ls_props2 ls_att) (polybib-lwvertices 'axedyn-reaccreate vl-directory-files)))
  (setq gvar_695 (dcl-grid-addrow (ls_props2 sivpano-panoinsert) (va_bande (dcl-grid-addrow (ls_props2 ls_att) vl-directory-files))))
  (ls_som0)
  (ls_debfinrad 'sivpano-get)
  (vlax-erased-p gvar_685)
  (setq sivpano-get 'vlax-get-acad-object)
  (ls_som0)
)

;; Referenced symbols: EN_BORDI, AXEDYN-SETRAYEXT
(defun sihpp-list ()
  (axedyn-setrayext 'en_bordi)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: EN_BORDI, EN_RAYON, RE_COURANT
(defun sihpp-get (en_rayon)
  (re_courant 'en_bordi en_rayon_2)
)

;; Original arg hints: EN_RAYON, arg_2
;; Referenced symbols: EN_BORDI, EN_RAYON, RTOS
(defun sihpp-set (en_rayon arg_2)
  (rtos 'en_bordi en_rayon_2 gvar_3164)
)

;; Original name hint: SIHPP-LIST
;; Referenced symbols: EN_BORDI, AXEDYN-SETRAYEXT
(defun sihpp-list_2 ()
  (axedyn-setrayext 'en_bordi)
)

;; Original arg hints: IN_SENS, IN_LON0, arg_3, LS_SIVPANO, IN_COTE, LS_VTXI, LS_VTXS1, EN_PANO
;; Referenced symbols: SIVPANO-OFFSET, ENTDEL, EN_BORDI, /, LS_AXES, VL-REMOVE, ST_AXEID, GROUPBIB-LIST, LS_OBJ, IN_LON0
;; Referenced strings:  [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :, SIR-VER, \n -> PolyDyn 
(defun sihpp-add (in_sens in_lon0 arg_3 ls_sivpano in_cote ls_vtxi ls_vtxs1 en_pano)
  (entdel 'sivpano-offset)
  (ls_panonew en_rayon ls_panonew)
  (re_abs2 (groupbib-list 'en_bordi en_rayon) gvar_3094)
  (setq vl-remove (/ 'en_bordi))
  (setq ls_panonew (es_ext (groupbib-list 'ls_axes (st_axeid vl-remove)) (groupbib-list 'ls_obj in_lon0_2) (groupbib-list '*st_axedynid* in_lon0_2) (groupbib-list " [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :" in_sens_2) (groupbib-list "SIR-VER" ls_sivpano_2) (groupbib-list 'getpoint gvar_3160) (groupbib-list "\n -> PolyDyn " in_cote_2) (groupbib-list "Origine" ls_vtxi_2) (groupbib-list 'ls_vtxe ls_vtxs1_2) (groupbib-list 'st_panonom en_pano_2) (groupbib-list 'en_pan 'sihpp-popgo) (groupbib-list "st_BlockName" nil) (groupbib-list "TXT" nil) (groupbib-list "ATT" nil) (groupbib-list "Repère" (trans "Décalage")) (groupbib-list 'dcl-control-settext 'ls_ext1)))
  (setq en_rayon (dcl-control-setenabled (st_axeid vl-remove)))
  (setq gvar_3094 (ls_panonew ls_panonew))
  en_rayon
)

;; Original arg hints: AOPORA-FIN
;; Referenced symbols: ENTDEL, AOPORA-FIN, IN_PARAM, GETPOINT, LS_VTXE, IN_COTE, LS_VTXI, ES_EXT, LS_VTXS1, RE_ABS2
;; Referenced strings: J1Bis, \n -> PolyDyn , Origine
(defun sihpp-getparents (aopora-fin)
  (entdel "J1Bis")
  (setq in_cote (in_param aopora-fin_2 "\n -> PolyDyn "))
  (setq ls_vtxi (in_param aopora-fin_2 "Origine"))
  (setq gvar_3160 (in_param aopora-fin_2 'getpoint))
  (setq ls_vtxs1 (in_param aopora-fin_2 'ls_vtxe))
  (setq gvar_3094 (es_ext in_cote ls_vtxi))
  (setq gvar_3094 (projet_md_metzon_hachures1 gvar_3094 ls_vtxs1))
  (if (re_abs2 gvar_3160)
    (progn
      (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 (groupbib-list 're_abs2 gvar_3160)))
    )
    (progn
      (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 gvar_3160))
    )
  )
  gvar_3094
)

;; Original arg hints: LS_STATE, arg_2, arg_3, arg_4
;; Referenced symbols: ES_EXT, UNDOBIB-START, RE_ANGLE, LS_STATE, RESDYN-CORDE, LS_CORDE, BLKBIB-GETVISIENT, AXEDYN-REACCREATE, ST_SYLE
(defun sihpp-getint (ls_state arg_2 arg_3 arg_4)
  (if (re_angle 'es_ext (undobib-start gvar_670))
    (progn
      (setq resdyn-corde (re_y ls_state_2 gvar_670))
      (setq ls_corde (re_y gvar_1861 gvar_670))
      (setq gvar_668 (blkbib-getvisient resdyn-corde ls_corde))
    )
    (progn
      (setq resdyn-corde (axedyn-reaccreate (ls_balise ls_state_2 gvar_670 gvar_669)))
      (setq ls_corde (axedyn-reaccreate (ls_balise gvar_1861 gvar_670 gvar_669)))
      (setq gvar_668 (blkbib-getvisient resdyn-corde ls_corde))
    )
  )
  (setq resdyn-corde (ls_balise ls_state_2 resdyn-corde (st_syle gvar_3236 gvar_668)))
  (ls_balise gvar_1861 resdyn-corde gvar_668)
  (setq ls_corde (ls_balise gvar_1861 resdyn-corde gvar_668))
)

;; Original arg hints: arg_1, LS_BALISE, LISTBIB-MIN, LS_VTXSINV, EN_POLYINV
;; Referenced symbols: ENTDEL, LS_BALISE, LS_BALISE_C, LISTBIB-MIN, LS_VISIENT, GETVAR, LS_MUSOIR, LS_VTXSINV, ST_SYLE, EN_POLYINV
;; Referenced strings: K5c
(defun sihpp-contour (arg_1 ls_balise listbib-min ls_vtxsinv en_polyinv)
  (entdel "K5c")
  (setq gvar_662 (getvar gvar_669 ls_balise_2 (ls_visient 'ls_balise_c listbib-min_2)))
  (setq gvar_660 (getvar gvar_669 ls_balise_2 (ls_visient 'ls_musoir listbib-min_2)))
  (setq gvar_659 (ls_balise ls_vtxsinv_2 gvar_662 (st_syle gvar_3236 gvar_668)))
  (setq gvar_658 (ls_balise en_polyinv_2 gvar_662 gvar_668))
  (setq gvar_657 (ls_balise ls_vtxsinv_2 gvar_660 (st_syle gvar_3236 gvar_668)))
  (setq gvar_656 (ls_balise en_polyinv_2 gvar_660 gvar_668))
  (setq dcl-form-close (st_rayon (st_mod ls_vtxsinv_2 (re_y ls_vtxsinv_2 gvar_659) (re_y ls_vtxsinv_2 gvar_657)) (st_mod en_polyinv_2 (re_y en_polyinv_2 gvar_656) (re_y en_polyinv_2 gvar_658))))
  (chemdyn-pop dcl-form-close (es_ext (groupbib-list 70 1)))
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: EN_RAYON, LS_DIRECT-G, LS_PANONEW, IN_PARAM, IN_SENS, RE_RAY, dcl-forcedwgredraw, GETPOINT, LS_STATE, LS_VTXE
;; Referenced strings: D21-1d,  [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :, D21-3d
(defun sihpp-popgo (en_rayon / local_1)
  (if gvar_3345
    (progn
      (setq ls_panonew gvar_3345)
    )
    (progn
      (setq ls_panonew (ls_direct-g en_rayon_2))
    )
  )
  "D21-1d"
  (in_param ls_panonew " [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :")
  (re_ray in_sens)
  (dcl-forcedwgredraw gvar_2250)
  (ls_restraces gvar_2250 10)
  (in_param ls_panonew 'getpoint)
  "D21-3d"
  (hachbib-vtxs2hach (in_param ls_panonew "\n -> PolyDyn "))
  (re_ray ls_state)
  "D43-1d"
  (hachbib-vtxs2hach (in_param ls_panonew "Origine"))
  (re_ray gvar_1861)
  (in_param ls_panonew 'ls_vtxe)
  (chemdyn-bordtrace ls_vtxs1)
  (in_param ls_panonew 'st_panonom)
  (in_param ls_panonew 'en_pan)
  (in_param ls_panonew 'dcl-control-settext)
  (in_param ls_panonew "Repère")
  "D42"
  nil
  (or (or (and (setq gvar_3155 "D21-1d") (setq in_sens (in_param ls_panonew " [Abscisse/Origine/Fin/Milieu 2 points/Décalage d'un point/Repère] :")) (setq gvar_2250 (re_ray in_sens)) (setq gvar_2249 (dcl-forcedwgredraw gvar_2250)) (setq gvar_669 (ls_restraces gvar_2250 10)) (setq gvar_3160 (in_param ls_panonew 'getpoint)) (setq gvar_3155 "D21-3d") (setq ls_state (hachbib-vtxs2hach (in_param ls_panonew "\n -> PolyDyn "))) (setq ls_state (re_ray ls_state)) (setq gvar_3155 "D43-1d") (setq gvar_1861 (hachbib-vtxs2hach (in_param ls_panonew "Origine"))) (setq gvar_1861 (re_ray gvar_1861)) (setq ls_vtxs1 (in_param ls_panonew 'ls_vtxe)) (setq gvar_651 (chemdyn-bordtrace ls_vtxs1)) (setq en_pano (in_param ls_panonew 'st_panonom)) (setq ls_direct-d (in_param ls_panonew 'en_pan)) (setq re_bulge (in_param ls_panonew 'dcl-control-settext)) (setq blkbib-getparententities (in_param ls_panonew "Repère")) (setq gvar_3155 "D42")) (odclbib-fillcombo (in_param ls_panonew "SIR-VER") 'blkpoly-poly)) (odclbib-fillcombo (in_param ls_panonew "SIR-VER") "Impossible d'insérer le bloc droit"))
  (re_ray (hachbib-vtxs2hach (in_param ls_panonew 'getpoint)))
  (setq gvar_3160 (re_ray (hachbib-vtxs2hach (in_param ls_panonew 'getpoint))))
  (ls_double ls_state gvar_1861 gvar_3160 gvar_669)
  (setq gvar_3160 (ls_direct-d gvar_2249))
  (ls_restraces gvar_2250 10)
  (setq gvar_669 (ls_double resdyn-corde ls_corde))
  (setq gvar_668 (blkbib-getvisient resdyn-corde ls_corde))
  (setq ls_balise (getvar gvar_651 gvar_669))
  (setq re_dir (entib-handle2ename (repdyn-isrep 'en_poly (in_closed (dcl-grid-addrow gvar_668 ls_balise)))))
  (setq en_pano (ls_visient en_pano re_dir))
  (setq subst (poly-lwpoly_temp ls_state ls_corde))
  (setq ls_vtxsinv (ls_colummtypes ls_state (ls_visient subst 'pt_4)))
  (setq label (poly-lwpoly_temp gvar_1861 resdyn-corde))
  (setq en_polyinv (ls_colummtypes gvar_1861 (ls_visient label 'pt_4)))
  (setq gvar_644 (ls_double gvar_669 ls_balise ls_direct-d ls_vtxsinv en_polyinv))
  (setq gvar_662 (getvar gvar_669 ls_balise (ls_visient 'en_polybase ls_direct-d)))
  (setq gvar_660 (getvar gvar_669 ls_balise (ls_visient 'ls_vtxsinter ls_direct-d)))
  (setq gvar_643 (ls_balise ls_vtxsinv gvar_660 (st_syle gvar_3236 gvar_668)))
  (setq gvar_642 (ls_balise en_polyinv gvar_660 gvar_668))
  (setq gvar_662 (ls_balise ls_vtxsinv gvar_662 (st_syle gvar_3236 gvar_668)))
  (setq gvar_660 (ls_balise en_polyinv gvar_662 gvar_668))
  (setq gvar_641 (ls_parents gvar_643 gvar_662 resdyn-corde ls_corde nil))
  (setq gvar_640 (ls_parents gvar_642 gvar_660 resdyn-corde ls_corde nil))
  (setq ls_vtxsapprox (ocbib-id2ref (repdyn-isrep (blkpoly-lsparams (pt_ref gvar_643 gvar_642) (pt_ref gvar_662 gvar_662)) en_pano)))
  (if (and (setq gvar_3160 (ls_restraces gvar_2250 10)) (re_angle (>= ls_vtxsapprox 2) 0))
    (progn
      (setq ls_vtxsapprox (vla-get-name ls_vtxsapprox))
    )
    (progn
      (setq ls_vtxsapprox ls_vtxsapprox)
    )
  )
  (setq eg_sup (st_axeid (repdyn-isrep ls_vtxsapprox 2)))
  (setq entmod (repdyn-isrep (dcl-grid-addrow (blkpoly-lsparams (pt_ref gvar_643 gvar_642) (pt_ref gvar_662 gvar_662)) (ls_visient en_pano eg_sup)) (dcl-grid-addrow ls_vtxsapprox eg_sup)))
  (setq arg-list (es_ext))
  (setq gvar_636 (ocbib-id2ref (repdyn-isrep (st_syle en_pano (pt_ref gvar_641 gvar_643)) (st_syle en_pano entmod))))
  (setq eh_sup (ocbib-id2ref (repdyn-isrep (st_syle en_pano (pt_ref gvar_640 gvar_642)) (st_syle en_pano entmod))))
  (setq entlast gvar_641)
  (setq gvar_3370 (pt_ptp1))
  (setq local_1 (st_syle gvar_636 eg_sup eh_sup))
  (while (<= local_1 0)
    (setq local_1 (1- local_1))
    (setq gvar_651 (eh_sup entlast gvar_668 ls_direct-d ls_balise en_pano gvar_644 blkbib-getparententities))
    (if gvar_651
      (progn
        (setq arg-list (dcl-grid-setcurcell arg-list gvar_651))
      )
    )
    (setq entlast (getvar entlast gvar_668 (st_syle en_pano entmod)))
  )
  (setq gvar_2991 (en_ext2 arg-list nil 'en_ext1 'ha_poly 'en_poly nil (es_ext (groupbib-list 62 256) (groupbib-list 8 blkbib-getparententities))))
  (if gvar_2991
    (progn
      (setq arg-list (dcl-grid-setcurcell arg-list (rem gvar_2991)))
    )
  )
  (en_ref1 (es_ext ls_vtxsinv en_polyinv gvar_644))
  (if (re_ray re_bulge)
    (progn
      (entbib-dellist re_bulge)
      (column (re_ray re_bulge) arg-list)
    )
    (progn
      (ls_panonew en_rayon_2 ls_panonew)
      (setq reabib-deleteobjectreactor (pt_ptp2 (blkbib-get_pd arg-list)))
      (setq gvar_3370 nil)
      (setq ls_panonew (st_rayon ls_panonew 'dcl-control-settext (projet_pa_axes_ca_sommet reabib-deleteobjectreactor)))
    )
  )
  (ls_soms gvar_2250 50 (st_syle (repdyn-isrep gvar_3236 'repdyn-isrep) gvar_668))
  (ls_soms gvar_2250 10 gvar_669)
  (dcl-forcedwgredraw (es_ext gvar_2249))
  T
  nil
  (ls_som0)
  (setq gvar_3155 nil)
)

;; Original arg hints: ENTLAST, arg_2, LS_DIRECT-D, LS_BALISE, EN_PANO, arg_6, BLKBIB-GETPARENTENTITIES
;; Referenced symbols: ENTLAST, LS_BALISE, LS_DIRECT-D, GETVAR, EN_PANO, GROUPBIB-LIST, ES_EXT, dcl-form-close, BLKBIB-GETPARENTENTITIES, *EN_RAY*
;; Referenced strings: Angle
(defun sihpp-tracebande (entlast arg_2 ls_direct-d ls_balise en_pano arg_6 blkbib-getparententities)
  (setq gvar_3244 (getvar entlast_2 ls_balise_2 (repdyn-isrep ls_direct-d_2 "Angle")))
  (setq gvar_3242 (getvar gvar_3244 gvar_668 en_pano_2))
  (setq gvar_1144 (getvar gvar_3242 ls_balise_2 ls_direct-d_2))
  (setq gvar_631 (getvar gvar_3244 ls_balise_2 ls_direct-d_2))
  (setq re_angle_ins (ls_absdyn gvar_644 gvar_3244))
  (setq vlax-variant-value (ls_absdyn gvar_644 gvar_3242))
  (setq vlax-safearray->list (ls_absdyn gvar_644 gvar_1144))
  (setq gvar_627 (ls_absdyn gvar_644 gvar_631))
  (setq dcl-form-close (es_ext (es_ext (groupbib-list 10 gvar_3244)) (es_ext (groupbib-list 10 gvar_3242)) (es_ext (groupbib-list 10 gvar_1144)) (es_ext (groupbib-list 10 gvar_631))))
  (setq gvar_651 (*en_ray* dcl-form-close (es_ext (groupbib-list 70 1) (groupbib-list 62 256) (groupbib-list 8 blkbib-getparententities_2))))
  (or (and (and (and (and (projet_ml_progress gvar_3244 gvar_644) (projet_ml_progress gvar_3242 gvar_644) (projet_ml_progress gvar_1144 gvar_644) (projet_ml_progress gvar_631 gvar_644) (re_angle (st_ray2 (projet_pa_polydyn_st_offset gvar_644 gvar_651)) 0)) (and (repdyn-getpoint (ls_absdyn gvar_644 gvar_3244) 'ls_bandeents) (repdyn-getpoint (ls_absdyn gvar_644 gvar_631) 'ls_bandeents))) (and (repdyn-getpoint (ls_absdyn gvar_644 gvar_3242) 'ls_bandeents) (repdyn-getpoint (ls_absdyn gvar_644 gvar_1144) 'ls_bandeents))) (and (cadr (projet_ml_progress gvar_3244 gvar_644)) (cadr (projet_ml_progress gvar_3242 gvar_644)) (cadr (projet_ml_progress gvar_1144 gvar_644)) (cadr (projet_ml_progress gvar_631 gvar_644)) (re_angle (st_ray2 (projet_pa_polydyn_st_offset gvar_644 gvar_651)) 0))) polybib-vtxjoin)
  (column gvar_651)
  (setq dcl-form-close (axedyn-reaccreate (eo_pano gvar_644 gvar_651)))
  (setq gvar_651 (*en_ray* dcl-form-close (es_ext (groupbib-list 70 1) (groupbib-list 62 256) (groupbib-list 8 blkbib-getparententities_2))))
  (if (repdyn-getpoint (in_ele gvar_651) 'pt_pano)
    (progn
      (column gvar_651)
      (setq gvar_651 nil)
    )
  )
  (column gvar_651)
  (setq gvar_651 nil)
  (setq gvar_651 gvar_651)
  (setq gvar_651 gvar_651)
  gvar_651
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: EN_RAYON, SIVPANO-GETYMAX, vlax-erased-p, LS_SOM0
(defun sihpp-modgo (en_rayon)
  (vlax-erased-p sivpano-getymax)
  (setq re_yinv en_rayon_2)
  (ls_som0)
)

;; Referenced symbols: ENTDEL, RE_YINV, LS_DIRECT-G, IN_PARAM, ST_PANONOM, EN_PAN, LS_LIST0, vlax-invoke, Projet/PA_ResDyn, BLKBIB-SET_INV
;; Referenced strings: Coté, Repère, \n -> PolyDyn 
(defun c:projet_pa_sihpp_oninitialize ()
  (entdel "Coté")
  (vlax-invoke ls_list0 (r2 (in_param gvar_3345 "\n -> PolyDyn ")))
  (vlax-invoke projet_pa_resdyn (r2 (in_param gvar_3345 "Origine")))
  (vlax-invoke blkbib-set_inv (r2 (in_param gvar_3345 'ls_vtxe)))
  (setq gvar_3345 (ls_direct-g re_yinv))
  (setq blkbib-getparententities (in_param gvar_3345 "Repère"))
  (setq en_pano (in_param gvar_3345 'st_panonom))
  (setq ls_direct-d (in_param gvar_3345 'en_pan))
  (if (ls_ext2 "Impossible d'insérer le bloc droit" (in_param gvar_3345 "SIR-VER"))
    (progn
      (vlax-invoke gvar_621 (r2 (in_param gvar_3345 'getpoint)))
    )
    (progn
      (vlax-invoke gvar_621 "ha_parent")
    )
  )
  (re_largbande blkbib-get_attdefs)
  (bo_lctabs blkbib-get_attdefs blkbib-getparententities)
  (bo_lctabs ls_attdefs (eo_blkbase en_pano 2 2))
  (bo_lctabs ls_attdef (eo_blkbase ls_direct-d 2 2))
)

;; Referenced symbols: PROJET/MD_QUANTITE/BT_QTDROITE, AXEDYN-REACCREATE, vla-put-InsertionPoint, POLAR, IN_PARAM, BLKBIB-GET_ATTDEFS, BLKBIB-GETPARENTENTITIES, BO_LCTABS
(defun c:projet_pa_sihpp_bt_calque_onclicked ()
  (axedyn-reaccreate (projet_md_quantite_bt_qtdroite 'projet_md_quantite_bt_qtdroite))
  (in_param (polar vla-put-insertionpoint) 8)
  T
  (and (setq vla-put-insertionpoint (axedyn-reaccreate (projet_md_quantite_bt_qtdroite 'projet_md_quantite_bt_qtdroite))) (setq blkbib-getparententities (in_param (polar vla-put-insertionpoint) 8)) (bo_lctabs blkbib-get_attdefs blkbib-getparententities))
)

;; Referenced symbols: LS_ATTDEFS, LS_ENTNEW
(defun c:projet_pa_sihpp_st_largbande_onsetfocus ()
  (ls_entnew ls_attdefs 0 255)
)

;; Referenced symbols: LS_ATTDEF, LS_ENTNEW
(defun c:projet_pa_sihpp_st_largpassage_onsetfocus ()
  (ls_entnew ls_attdef 0 255)
)

;; Original name hint: C:BT_REF1#ONCLICKED
;; Referenced symbols: ENTDEL, RE_ABS2, RE_YINV, GROUPBIB-LIST, PT_PROJ2, AXEDYN-REACCREATE, LS_LIST0, IN_PARAM, vlax-invoke
;; Referenced strings: Au plus, PANNEAU, \n -> PolyDyn 
(defun c:bt_ref1_onclicked_2 ()
  (entdel "Au plus")
  (axedyn-reaccreate (pt_proj2 "PANNEAU" nil (groupbib-list 're_abs2 re_yinv)))
  (st_rayon gvar_3345 "\n -> PolyDyn " gvar_3162)
  T
  (and (setq gvar_3162 (axedyn-reaccreate (pt_proj2 "PANNEAU" nil (groupbib-list 're_abs2 re_yinv)))) (setq gvar_3345 (st_rayon gvar_3345 "\n -> PolyDyn " gvar_3162)) (vlax-invoke ls_list0 (r2 (in_param gvar_3345 "\n -> PolyDyn "))))
)

;; Original name hint: C:BT_REF2#ONCLICKED
;; Referenced symbols: ENTDEL, RE_ABS2, RE_YINV, GROUPBIB-LIST, PT_PROJ2, AXEDYN-REACCREATE, Projet/PA_ResDyn, IN_PARAM, vlax-invoke
;; Referenced strings: Au plus, PANNEAU, Origine
(defun c:bt_ref2_onclicked_2 ()
  (entdel "Au plus")
  (axedyn-reaccreate (pt_proj2 "PANNEAU" nil (groupbib-list 're_abs2 re_yinv)))
  (st_rayon gvar_3345 "Origine" gvar_3162)
  T
  (and (setq gvar_3162 (axedyn-reaccreate (pt_proj2 "PANNEAU" nil (groupbib-list 're_abs2 re_yinv)))) (setq gvar_3345 (st_rayon gvar_3345 "Origine" gvar_3162)) (vlax-invoke projet_pa_resdyn (r2 (in_param gvar_3345 "Origine"))))
)

;; Referenced symbols: ENTDEL, ST_ATTVAL, RE_ABS2, RE_YINV, GROUPBIB-LIST, PT_PROJ2, AXEDYN-REACCREATE, LS_VTXE, BLKBIB-SET_INV, IN_PARAM
;; Referenced strings: Au plus
(defun c:bt_bande_onclicked ()
  (entdel "Au plus")
  (axedyn-reaccreate (pt_proj2 'st_attval nil (groupbib-list 're_abs2 re_yinv)))
  (st_rayon gvar_3345 'ls_vtxe gvar_3162)
  T
  (and (setq gvar_3162 (axedyn-reaccreate (pt_proj2 'st_attval nil (groupbib-list 're_abs2 re_yinv)))) (setq gvar_3345 (st_rayon gvar_3345 'ls_vtxe gvar_3162)) (vlax-invoke blkbib-set_inv (r2 (in_param gvar_3345 'ls_vtxe))))
)

;; Referenced symbols: ENTDEL, LS_ATTDEF, GROUPBIB-LISTOBJ, LS_ATTDEFS, BLKBIB-GET_ATTDEFS, EN_PAN, ST_PANONOM, ES_EXT, LS_DIRECT-D, EN_PANO
;; Referenced strings: Repère
(defun sihpp-palapply ()
  (entdel '(ls_atts st_pano eo_sup st_nom re_angle_ins re_echelle pt_ins re_dist re_angle pt_base ls_pano))
  (setq ls_direct-d (groupbib-listobj (errbib-catchapply ls_attdef)))
  (setq en_pano (groupbib-listobj (errbib-catchapply ls_attdefs)))
  (setq blkbib-getparententities (errbib-catchapply blkbib-get_attdefs))
  (setq gvar_3345 (projexp-affpropsmpolydyn gvar_3345 (es_ext 'en_pan 'st_panonom "Repère") (es_ext ls_direct-d en_pano blkbib-getparententities)))
  (ld_pano re_yinv)
)

;; Referenced symbols: ENTDEL, RE_YINV, SIVPANO-GETYMAX, LS_SOM0
;; Referenced strings: PatternAngle
(defun sihpp-palsave ()
  (entdel "PatternAngle")
  (ls_panonew re_yinv gvar_3345)
  (re_abs1 sivpano-getymax 1)
  (ls_som0)
)

;; Referenced symbols: LS_SOM0
(defun sihpp-palclose ()
  (eo_poly)
  (setq re_yinv nil)
  (setq gvar_3345 nil)
  (setq ls_groupparent nil)
  (ls_som0)
)

;; Referenced symbols: IN_COTE2, AXEDYN-SETRAYEXT
(defun sivpano-list ()
  (axedyn-setrayext 'in_cote2)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: IN_COTE2, EN_RAYON, RE_COURANT
(defun sivpano-get (en_rayon)
  (re_courant 'in_cote2 en_rayon_2)
)

;; Original arg hints: EN_RAYON, arg_2
;; Referenced symbols: IN_COTE2, EN_RAYON, RTOS
(defun sivpano-set (en_rayon arg_2)
  (rtos 'in_cote2 en_rayon_2 gvar_3164)
)

;; Referenced symbols: ENTDEL, SIVPANO-PANOMINSERT
(defun sivpano-listpano ()
  (entdel '(eo_panosup re_dist re_angle re_angle_ins ls_pano))
  (setq gvar_611 'sivpano-panominsert)
  (sivpano-panominsert gvar_611 '(st_panneau en_sup eg_sup))
)

;; Original arg hints: arg_1
;; Referenced symbols: ENTDEL, GEOMBIB-RACCORDMAX, Projet/MD_SivPano-Sel, ES_EXT, ENTBIB-OFFSET, EN_BORDT, AXEDYN-REACCREATE, PROJET/PA_DETAIL/LS_REP, PROJET/MD_SIVPANO-SEL/ST_SEARCH, RE_ANGLE
;; Referenced strings: Choisir le type de réseau
(defun sivpano-trouve (arg_1 / local_1)
  (entdel '(st_serie st_directory ls_pano st_dwg))
  (setq gvar_608 (geombib-raccordmax "Choisir le type de réseau" (listbib-move-i gvar_608) "Choisir le type de réseau"))
  (setq entbib-offset (projet_md_sivpano-sel))
  (setq st_dwg (es_ext))
  (setq local_1 entbib-offset)
  ;; init-args 3: 'en_bordt, nil
  (foreach en_bordt local_1
    (if (and (and (cadr (re_angle (projet_pa_detail_ls_rep (axedyn-reaccreate en_bordt) 1 1) 'projet_md_sivpano-sel_st_search)) (sivpano-dial-search (listbib-move-i (axedyn-reaccreate en_bordt)) gvar_608)) (and (st_blkbase (sivpano-dial-search gvar_608) 5) (sivpano-dial-search (listbib-move-i (re_x en_bordt)) gvar_608)))
      (progn
        (setq st_dwg (dcl-grid-setcurcell st_dwg (groupbib-list (axedyn-reaccreate en_bordt) (re_x en_bordt))))
      )
    )
  )
  st_dwg
)

;; Original arg hints: LS_FILTERED, PROJET/MD_SIVPANO-SEL/LA_DESC
;; Referenced symbols: PROJET/MD_SIVPANO-SEL/VD_PANO, ENTDEL, LS_FILTERED, TRANS, IN_LON0, SIVPANO-TROUVE, LS_RESULTS, AXEDYN-REACCREATE, RE_X, BLKPOLY-GET
;; Referenced strings: Très Grande, Grande, Petite
(defun panopalsup (ls_filtered projet_md_sivpano-sel_la_desc)
  (entdel 'projet_md_sivpano-sel_vd_pano)
  (setq dcl-dwgpreview-loaddwg ls_filtered_2)
  (setq projet_pa_sihlin_re_cote (repdyn-isrep 1 (trans '(st_search))))
  (setq in_lon0 '(ls_results ls_result st_panneau st_directory ls_pano))
  (setq ls_results (sivpano-trouve in_lon0))
  (setq blkpoly-get (axedyn-reaccreate ls_results))
  (setq in_lon0 (re_x ls_results))
  (setq gvar_592 (vl-string-trim blkpoly-get in_lon0))
  (or (or (re_angle dcl-dwgpreview-loaddwg 're_rayii) (re_angle dcl-dwgpreview-loaddwg 'dcl-tree-getnextsiblingitem)) polybib-vtxjoin)
  (setq gvar_590 (vl-string-trim ls_filtered_2 blkpoly-get projet_pa_sihlin_re_cote gvar_592 polybib-vtxjoin))
  (setq projet_md_sivpano-sel_ls_pano gvar_590)
  (ls_gamme blkpoly-get "Grande" gvar_592 projet_pa_sihlin_re_cote gvar_584)
  (setq gvar_587 (axedyn-reaccreate (projet_md_quantite_bt_qtdroite '(ls_gamme))))
  (setq gvar_586 (dcl-forcedwgredraw gvar_587))
  (setq gvar_584 (re_courant gvar_586 "Très Grande"))
  (setq ls_filtered_2 (tblsearch gvar_586))
  (setq gvar_587 projet_md_sivpano-sel_ls_pano)
  (if (polar gvar_587)
    (progn
      (ls_gamme blkpoly-get ls_filtered_2 gvar_592 projet_pa_sihlin_re_cote gvar_584)
      (setq gvar_586 (dcl-forcedwgredraw gvar_587))
      (setq gvar_584 (re_courant gvar_586 "Très Grande"))
      (setq ls_filtered_2 (tblsearch gvar_586))
    )
    (progn
      (bordyn-inters "Petite")
    )
  )
  (ls_som0)
)

;; Original arg hints: arg_1
;; Referenced symbols: LS_GAMME, ENTDEL, dcl-forcedwgredraw, PROJET/PA_AXES/CA_SOMMET, IN_COTE2, /, LS_AXES, VL-REMOVE, ST_AXEID, GROUPBIB-LIST
;; Referenced strings: Repère, Décalage
(defun sivpano-add (arg_1)
  (entdel 'ls_gamme)
  (st_poly2 en_rayon ls_nom)
  (setq gvar_578 (dcl-forcedwgredraw gvar_580))
  (setq projet_pa_croisdyn_re_rayei (projet_pa_axes_ca_sommet gvar_578))
  (setq vl-remove (/ 'in_cote2))
  (setq ls_nom (es_ext (groupbib-list 'ls_axes (st_axeid vl-remove)) (groupbib-list 'projet_pa_croisdyn_re_rayee projet_pa_croisdyn_re_rayei) (groupbib-list '(st_nom re_rayee re_rayei re_rayie re_rayii) nil) (groupbib-list 'projet_md_sivpanoedit_cb_gamme 'projet_md_sivpanoedit_ls_pano) (groupbib-list "Repère" (trans "Décalage")) (groupbib-list 'dcl-control-settext 'ls_ext1)))
  (setq en_rayon (dcl-control-setenabled (st_axeid vl-remove)))
  en_rayon
)

;; Original arg hints: LS_FILTERED, BLKPOLY-GET, PROJET/PA_SIHLIN/RE_COTE, arg_4, SIVPANOEDIT-PREVIEWUPDATE
;; Referenced symbols: SIVPANOEDIT-PANOCHANGE, ENTDEL, ST_GAMME, LS_FILTERED, GEOMBIB-RACCORDMAX, C:PROJET/MD_SIVPANOEDIT#ONINITIALIZE, BLKPOLY-GET, PROJET/PA_SIHLIN/RE_COTE, vla-get-Blocks, LS_EXT1
;; Referenced strings: \n Vérification des axes..., Choisir le type de réseau
(defun sivpano-supportinsert (ls_filtered blkpoly-get projet_pa_sihlin_re_cote arg_4 sivpanoedit-previewupdate)
  (entdel 'sivpanoedit-panochange)
  (vla-get-blocks (geombib-raccordmax st_gamme ls_filtered_2) (geombib-raccordmax gvar_571_c_projet_md_sivpanoedit_oninitialize '(re_offset eo_blk ls_atts st_blk eo_pano)) ls_filtered_2)
  (setq ls_filtered_2 (geombib-raccordmax st_gamme ls_filtered_2))
  (setq gvar_580 (_vlax-true ls_filtered_2 blkpoly-get_2 projet_pa_sihlin_re_cote_2 gvar_592 (es_ext (groupbib-list 'vla-get-blocks 'ls_ext1)) nil nil))
  (setq gvar_578 (dcl-forcedwgredraw gvar_580))
  (setq projet_pa_croisdyn_re_rayei (projet_pa_axes_ca_sommet gvar_578))
  (setq entlast (add gvar_580))
  (setq gvar_2408 'ha_poly)
  (setq sivpanoedit-previewupdate_2 nil)
  (setq en_rayon (projet_md_sivpanoedit_vueblocs1 gvar_580))
  (projet_md_sivpanoedit_vueblocs1)
  (while (and (cadr sivpanoedit-previewupdate_2) (projet_pa_axes_st_desc (setq projet_md_sivpano-sel_la_desc (projet_md_sivpanoedit_vueblocs1)) 'ls_ext1))
    (if (re_angle gvar_2408 'ha_poly)
      (progn
        (dcl-blockview-zoom gvar_580 projet_md_sivpano-sel_la_desc)
        (st_panopath gvar_578 '(st_panopath st_directory st_filename ls_atts ls_att ls_panonew) "\n Vérification des axes...")
        (dcl-insertblock (dcl-forcedwgredraw gvar_580))
      )
    )
    (setq sivpanoedit-update (dcl-insertblock projet_md_sivpano-sel_la_desc))
    (setq gvar_557_c_projet_md_sivpanoedit_bt_panoadd_onclicked (geombib-raccordmax gvar_571_c_projet_md_sivpanoedit_oninitialize 'in_pano sivpanoedit-update))
    (or (or (pt_ext (geombib-raccordmax gvar_557_c_projet_md_sivpanoedit_bt_panoadd_onclicked '(en_poly ha_poly ld_poly ha_axe ha_ext ls_ray ls_ent in_node re_courant st_txt) 'c:projet_md_sivpanoedit_bt_panoup_onclicked projet_md_sivpano-sel_la_desc 'st_flag)) gvar_555_c_projet_md_sivpanoedit_bt_panodown_onclicked) polybib-vtxjoin)
    (setq gvar_554 nil)
    (c:projet_md_sivpanoedit_supprimer_onclicked gvar_557_c_projet_md_sivpanoedit_bt_panoadd_onclicked (geombib-raccordmax "Choisir le type de réseau" projet_md_sivpano-sel_la_desc "Choisir le type de réseau") 1)
    (setq gvar_554 (projet_md_sivpanoedit_bt_panoup projet_md_sivpano-sel_la_desc))
    (setq gvar_557_c_projet_md_sivpanoedit_bt_panoadd_onclicked (re_param gvar_554))
    (setq gvar_554 (vlax-curve-getclosestpointto gvar_554))
    (setq gvar_554 (geombib-raccordmax 'c:projet_md_sivpanoedit_bt_panoup_onclicked projet_md_sivpano-sel_la_desc))
    (if gvar_554
      (progn
        (vla-get-blocks gvar_554 gvar_557_c_projet_md_sivpanoedit_bt_panoadd_onclicked gvar_554)
        (setq projet_md_sivpano-sel_la_desc gvar_554)
        (setq gvar_550_c_projet_md_sivpanoedit_ls_pano_onselchanged (projet_md_sivpanoedit_bt_panodown projet_md_sivpano-sel_la_desc))
        (setq gvar_2408 (st_syle gvar_2408 (projet_md_sivpanoedit_gr_val projet_md_sivpano-sel_la_desc gvar_550_c_projet_md_sivpanoedit_ls_pano_onselchanged entlast gvar_592 projet_pa_sihlin_re_cote_2 en_rayon)))
      )
      (progn
        (ls_som0 'projet_md_sivpanoedit_st_1)
      )
    )
  )
  gvar_580
)

;; Original arg hints: C:PROJET/MD_SIVPANOEDIT/ST_1#ONSETFOCUS, C:PROJET/MD_SIVPANOEDIT/LS_PANO#ONSELCHANGED, BLKPOLY-GET, LS_PROP, PROJET/PA_SIHLIN/RE_COTE, EN_RAYON
;; Referenced symbols: dcl-grid-startcelledit, ENTDEL, PT_PTP1, EN_RAYON, C:PROJET/MD_SIVPANOEDIT/GR_VAL#ONBUTTONCLICKED, PROJET/PA_CROISDYN/RE_RAYEE, IN_PARAM, dcl-forcedwgredraw, dcl-control-settext, ST_ATT
(defun sivpano-panoinsert (c_projet_md_sivpanoedit_st_1_onsetfocus c_projet_md_sivpanoedit_ls_pano_onselchanged blkpoly-get ls_prop projet_pa_sihlin_re_cote en_rayon)
  (entdel 'dcl-grid-startcelledit)
  (pt_ptp1 gvar_539_c_projet_md_sivpanoedit_bt_ok_onclicked gvar_3370)
  (setq gvar_3370 (pt_ptp1))
  (setq gvar_544 (c:projet_md_sivpanoedit_gr_val_onbuttonclicked en_rayon_2))
  (setq ls_attsnew (in_param gvar_544 'projet_pa_croisdyn_re_rayee))
  (setq gvar_578 (dcl-forcedwgredraw gvar_580))
  (setq re_bulge (in_param gvar_544 'dcl-control-settext))
  (setq gvar_2408 (st_att en_rayon_2))
  (setq projet_md_sivpanoedit (projet_pa_detail_ls_rep gvar_547_c_projet_md_sivpanoedit_st_1_onsetfocus (st_syle 9 (importbib-isvalid 'c:projet_md_sivpanoedit_bt_panoedit_onclicked gvar_547_c_projet_md_sivpanoedit_st_1_onsetfocus))))
  (setq blkpoly-get_2 (getvar blkpoly-get_2 (st_syle ls_prop_2 (repdyn-isrep gvar_3236 2)) (ls_visient gvar_2408 projet_pa_sihlin_re_cote_2)))
  (setq gvar_539_c_projet_md_sivpanoedit_bt_ok_onclicked (_vlax-true gvar_547_c_projet_md_sivpanoedit_st_1_onsetfocus blkpoly-get_2 projet_pa_sihlin_re_cote_2 ls_prop_2 gvar_550_c_projet_md_sivpanoedit_ls_pano_onselchanged nil nil))
  (setq gvar_535 (es_ext (re_angle0 5 (polar gvar_539_c_projet_md_sivpanoedit_bt_ok_onclicked)) (groupbib-list '(lambda (ls_pano) (blkbib-blkeffname (handent (listbib-key ls_pano 5)))) gvar_547_c_projet_md_sivpanoedit_st_1_onsetfocus) (groupbib-list 'stringbib-prefix projet_md_sivpanoedit) (groupbib-list 'blkbib-vlset_att gvar_550_c_projet_md_sivpanoedit_ls_pano_onselchanged)))
  (in_param gvar_544 '(st_nom re_rayee re_rayei re_rayie re_rayii))
  (if (setq en_bordt (in_param gvar_544 '(st_nom re_rayee re_rayei re_rayie re_rayii)))
    (progn
      (setq en_bordt (dcl-grid-setcurcell en_bordt gvar_535))
    )
    (progn
      (setq en_bordt (es_ext gvar_535))
    )
  )
  (setq gvar_544 (st_rayon gvar_544 '(st_nom re_rayee re_rayei re_rayie re_rayii) en_bordt))
  (if (re_ray re_bulge)
    (progn
      (column (re_ray re_bulge) (ld_chem gvar_3370))
    )
    (progn
      (setq reabib-deleteobjectreactor (pt_ptp2 gvar_3370))
      (setq gvar_3370 nil)
      (setq gvar_544 (st_rayon gvar_544 'dcl-control-settext (projet_pa_axes_ca_sommet reabib-deleteobjectreactor)))
    )
  )
  (st_poly2 en_rayon_2 gvar_544)
  gvar_2408
)

;; Original arg hints: arg_1, PROJET/MD_SIVPANO-SEL/LA_DESC
;; Referenced symbols: ENTDEL, ES_EXT, PT_DIR, PROJET/MD_SIVPANO-SEL/LA_DESC, PT_DIR_P, POLYBIB-VTXJOIN, SIVPANO-GETBLOCK, LS_FILTERED, ST_GAMME, GEOMBIB-RACCORDMAX
;; Referenced strings: EB, AK, K
(defun sivpano-supportswitch (arg_1 projet_md_sivpano-sel_la_desc)
  (entdel "EB")
  (setq gvar_526 (es_ext "AK" "K" "J" "SIR-VER-Potence" "de la potence" "de la balise" "du musoir"))
  (setq gvar_524 (es_ext "du panneau directionnel"))
  (setq gvar_522 (es_ext "B1"))
  (setq gvar_516 (es_ext "J4-1g" "J5" "J14b" "R1" "R2"))
  (setq pt_dir_p (es_ext '(pt_dir pt_dir_p) "\nDirection " 'pt_dir "\nSélectionnez l'objet perpendiculaire :"))
  (setq gvar_507 (es_ext '(pt_ins st_support) "PA D B P M P" "point d'insertion ou type de panneau [PAnneaux/Normal/Potence/Directionnel/Balise/Musoir] ? : "))
  nil
  (or (or (or (or (or (or (laybib-newlay projet_md_sivpano-sel_la_desc_2 gvar_526) (laybib-newlay projet_md_sivpano-sel_la_desc_2 gvar_524)) (laybib-newlay projet_md_sivpano-sel_la_desc_2 gvar_522)) (laybib-newlay projet_md_sivpano-sel_la_desc_2 gvar_516)) (laybib-newlay projet_md_sivpano-sel_la_desc_2 pt_dir_p)) (laybib-newlay projet_md_sivpano-sel_la_desc_2 gvar_507)) polybib-vtxjoin)
  nil
  "l"
  "Choix du panneau ?"
  'sivpano-getblock
  '(eo_sup re_angle_ins pt_ins re_dist re_angle)
  '(re_offset)
  (setq ls_filtered "B6B1")
  (if ls_filtered
    (progn
      (if (cadr (ocbib-ename2id '(ha_group ha_group ld_axe ha_axe ha_group ls_som0 ls_ray ls_ent ls_som in_lon0 in_lon in_node) (geombib-raccordmax st_gamme ls_filtered)))
        (progn
          (vla-get-blocks (geombib-raccordmax st_gamme ls_filtered) (geombib-raccordmax gvar_571_c_projet_md_sivpanoedit_oninitialize '(re_offset eo_blk ls_atts st_blk eo_pano)) ls_filtered)
        )
      )
      (sivpano-getblock gvar_500)
      (setq gvar_500 (polar gvar_580))
      (setq gvar_500 (ha_handle2 (groupbib-list 2 (geombib-raccordmax st_gamme ls_filtered)) (re_angle0 2 gvar_500) gvar_500))
    )
  )
  (ls_som0)
)

;; Original arg hints: BLKPOLY-GETDISTX, arg_2
;; Referenced symbols: ENTDEL, BO_FLAG, BLKPOLY-GET, LS_PROP, ST_SYLE, PT_REF, GETVAR, acByLayer, POLYBIB-LWVERTICES, IN_PARAM
;; Referenced strings: B6B5, pt_ins, B30
(defun sivpano-supportupdate (blkpoly-getdistx arg_2 / st_gamme local_0 local_3)
  (entdel "B6B5")
  (rem gvar_578)
  (if (setq gvar_580 (rem gvar_578))
    (progn
      (setq gvar_496 (ls_sup gvar_578 "pt_ins"))
      (setq pt_ref (sivpano-getblock gvar_578 "B30"))
      (setq ls_prop (sivpano-getblock gvar_578 "B50b"))
      (setq gvar_491 (ls_sup gvar_578 "B50c"))
      (setq projet_pa_sihlin_re_cote (ls_sup gvar_578 'bo_flag))
      (setq blkpoly-get (blkbib-get_ymax (blkbib-get_ymax (ls_sup gvar_578 '(st_nom)))))
      (setq entlast (getvar blkpoly-get (st_syle ls_prop gvar_491) pt_ref))
      (setq gvar_3010 (polybib-lwvertices "B51" (acbylayer)))
      (setq en_rayon (in_param gvar_3010 gvar_496))
      (setq entbib-offset (in_param (c:projet_md_sivpanoedit_gr_val_onbuttonclicked en_rayon) '(st_nom re_rayee re_rayei re_rayie re_rayii)))
      (setq pt_blkbase 'ha_poly)
      (setq local_3 entbib-offset)
      ;; init-args 3: 'en_bordt, nil
      (foreach en_bordt local_3
        (palbib-fin gvar_487 '(st_nom) (rtos gvar_486))
        (palbib-fin gvar_487 "B50c" gvar_491)
        (palbib-fin gvar_487 'bo_flag projet_pa_sihlin_re_cote)
        (palbib-fin gvar_487 "Appliquer" (ls_sup gvar_578 "Appliquer"))
        (setq gvar_487 (dcl-forcedwgredraw (re_ray (in_param en_bordt 5))))
        (setq gvar_486 (getvar entlast (st_syle gvar_491 (repdyn-isrep gvar_3236 2)) (ls_visient pt_blkbase projet_pa_sihlin_re_cote)))
        (setq pt_blkbase (st_syle pt_blkbase (blkbib-get_ymax (in_param en_bordt 'stringbib-prefix))))
        (if (re_angle0 "b" (princl gvar_487))
          (progn
            (if (and (st_blkbase ls_prop (repdyn-isrep gvar_3236 2)) (repdyn-getpoint ls_prop (ls_visient 3 (repdyn-isrep gvar_3236 2))))
              (progn
                (blkbib-get_ymax gvar_487 "b" 0)
              )
              (progn
                (blkbib-get_ymax gvar_487 "b" 1)
              )
            )
          )
        )
      )
    )
  )
  (ls_som0)
)

;; Original arg hints: arg_1
;; Referenced symbols: LS_XYS, ENTDEL, LS_PROP, ST_BLKBASE, LS_VISIENT, REPDYN-GETPOINT, RE_ANGLE, ST_PANOPATH, LS_SOM0
;; Referenced strings: B50b, \n Vérification des axes...
(defun sivpano-visi (arg_1)
  (entdel 'ls_xys)
  (setq ls_prop (sivpano-getblock gvar_487 "B50b"))
  (if (and (st_blkbase ls_prop (repdyn-isrep gvar_3236 2)) (repdyn-getpoint ls_prop (ls_visient 3 (repdyn-isrep gvar_3236 2))))
    (progn
      (if (re_angle (sivpano-getblock gvar_487 '(st_panopath st_directory st_filename ls_atts ls_att ls_panonew)) "\n Vérification des axes...")
        (progn
          (st_panopath gvar_487 '(st_panopath st_directory st_filename ls_atts ls_att ls_panonew) '(ls_axes ls_axe))
        )
      )
    )
    (progn
      (if (re_angle (sivpano-getblock gvar_487 '(st_panopath st_directory st_filename ls_atts ls_att ls_panonew)) '(ls_axes ls_axe))
        (progn
          (st_panopath gvar_487 '(st_panopath st_directory st_filename ls_atts ls_att ls_panonew) "\n Vérification des axes...")
        )
      )
    )
  )
  (ls_som0)
)

;; Original arg hints: IN_LON0
;; Referenced symbols: ENTDEL, IN_LON0, ES_EXT, ST_RAY2, REPDYN-GETPOINT, DCL-GRID-ADDROW, ST_AXEID, SIVPANO-COPYENDED, RE_ANGLE0, EO_POLYABS
;; Referenced strings: 8.5
(defun sivpano-attrib (in_lon0)
  (entdel "8.5")
  (setq gvar_480 (blkbib-get_ymax in_lon0_2))
  (setq st_ray2 0)
  (setq gvar_550_c_projet_md_sivpanoedit_ls_pano_onselchanged (es_ext))
  (while (repdyn-getpoint st_ray2 (st_ray2 gvar_480))
    (setq sivpano-copyended (dcl-grid-addrow st_ray2 gvar_480))
    (setq st_ray2 (st_axeid st_ray2))
    (if (re_angle (eo_polyabs (re_angle0 2 sivpano-copyended)) 'sivpano-visi)
      (progn
        (setq gvar_550_c_projet_md_sivpanoedit_ls_pano_onselchanged (st_rayon gvar_550_c_projet_md_sivpanoedit_ls_pano_onselchanged (es_ext (groupbib-list 'sivpano-visi (eo_polyabs (re_angle0 3 sivpano-copyended))))))
      )
      (progn
        (setq *ls_copied* (re_max polybib-vtxjoin (geombib-raccordmax 'repdyn-getpointangle (eo_polyabs (re_angle0 3 sivpano-copyended)) 'bt_amav)))
        (setq gvar_550_c_projet_md_sivpanoedit_ls_pano_onselchanged (st_rayon gvar_550_c_projet_md_sivpanoedit_ls_pano_onselchanged (es_ext (groupbib-list (eo_polyabs (re_angle0 2 sivpano-copyended)) *ls_copied*))))
      )
    )
  )
  gvar_550_c_projet_md_sivpanoedit_ls_pano_onselchanged
)

;; Original arg hints: arg_1, arg_2, EN_RAYON
;; Referenced symbols: ENTDEL, dcl-forcedwgredraw, TBLSEARCH, BO_FLAG, ADD, EN_RAYON, CADR, PROJET/MD_SIVPANOEDIT/VUEBLOCS1, C:PROJET/MD_SIVPANOEDIT/GR_VAL#ONBUTTONCLICKED, ST_POLY2
;; Referenced strings: B50c
(defun sivpano-panominsert (arg_1 arg_2 en_rayon / local_3)
  (entdel '((cons _vlr-commandended sivpano-reac2) (cons _vlr-commandcancelled sivpano-reac2)))
  (setq gvar_578 (dcl-forcedwgredraw gvar_580))
  (setq in_lon0 (tblsearch gvar_578))
  (setq gvar_491 (ls_sup gvar_578 "B50c"))
  (setq projet_pa_sihlin_re_cote (ls_sup gvar_578 'bo_flag))
  (setq entlast (add gvar_580))
  (if (cadr en_rayon_2)
    (progn
      (setq en_rayon_2 (projet_md_sivpanoedit_vueblocs1 gvar_580))
    )
    (progn
      (st_poly2 en_rayon_2 gvar_475)
      (setq gvar_475 (c:projet_md_sivpanoedit_gr_val_onbuttonclicked en_rayon_2))
      (setq gvar_475 (st_rayon (c:projet_md_sivpanoedit_gr_val_onbuttonclicked en_rayon_2) '(st_nom re_rayee re_rayei re_rayie re_rayii) nil))
    )
  )
  (setq local_3 gvar_584)
  ;; init-args 3: 'en_bordt, nil
  (foreach en_bordt local_3
    (projet_md_sivpanoedit_gr_val (geombib-raccordmax 'c:projet_md_sivpanoedit_bt_panoup_onclicked gvar_611) gvar_3137 entlast gvar_491 projet_pa_sihlin_re_cote en_rayon_2)
    (setq gvar_3137 (in_param en_bordt 'blkbib-vlset_att))
    (setq gvar_611 (in_param en_bordt 'stringbib-prefix))
  )
  (dcl-insertblock gvar_578)
  (ls_som0)
)

;; Original arg hints: BLKPOLY-GET, IN_LON0, arg_3, PROJET/PA_SIHLIN/RE_COTE, arg_5
;; Referenced symbols: ENTDEL, IN_LON0, BLKPOLY-GET, PROJET/PA_SIHLIN/RE_COTE, POLYBIB-VTXJOIN, dcl-forcedwgredraw, ST_PANOPATH
;; Referenced strings: \n Vérification des axes...
(defun sivpano-supminsert (blkpoly-get in_lon0 arg_3 projet_pa_sihlin_re_cote arg_5)
  (entdel '(e1 e2))
  (st_panopath gvar_586 '(st_panopath st_directory st_filename ls_atts ls_att ls_panonew) "\n Vérification des axes...")
  (setq gvar_590 (vl-string-trim in_lon0_2 blkpoly-get_2 projet_pa_sihlin_re_cote_2 gvar_592 polybib-vtxjoin))
  (setq gvar_586 (dcl-forcedwgredraw gvar_590))
  (stylebord-make gvar_590 gvar_584)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: ENTDEL, HA_POLY, EN_RAYON, C:PROJET/MD_SIVPANOEDIT/GR_VAL#ONBUTTONCLICKED, IN_PARAM, ENTBIB-OFFSET, EN_BORDT, STRINGBIB-PREFIX, ST_SYLE
;; Referenced strings: Standard
(defun sivpano-offset (en_rayon / local_1)
  (entdel "Standard")
  (setq gvar_2408 'ha_poly)
  (setq gvar_544 (c:projet_md_sivpanoedit_gr_val_onbuttonclicked en_rayon_2))
  (setq entbib-offset (in_param gvar_544 '(st_nom re_rayee re_rayei re_rayie re_rayii)))
  (setq local_1 entbib-offset)
  ;; init-args 3: 'en_bordt, nil
  (foreach en_bordt local_1
    (setq gvar_2408 (st_syle gvar_2408 (blkbib-get_ymax (in_param en_bordt 'stringbib-prefix))))
  )
  gvar_2408
)

;; Referenced symbols: ENTDEL, STYLEBORD-MAKE, RE_MAX, E1, AXEDYN-REACCREATE, POLAR, IN_PARAM, EO_POLYBASE, EO_POLYABS, PROJET/MD_SIVPANO-SEL/LA_DESC
;; Referenced strings: Bordure de base, Choisir le type de réseau
(defun sivpano-addpano ()
  (entdel "Bordure de base")
  (setq projet_md_sivpano-sel_la_desc (re_max 'stylebord-make))
  (setq gvar_580 (axedyn-reaccreate (projet_md_quantite_bt_qtdroite 'e1)))
  (setq gvar_500 (polar gvar_580))
  (setq entlast (in_param gvar_500 10))
  (setq gvar_592 (in_param gvar_500 50))
  (setq projet_pa_sihlin_re_cote (in_param gvar_500 41))
  (setq en_rayon (eo_polyabs (eo_polybase gvar_580)))
  (setq sivpanoedit-update (dcl-insertblock projet_md_sivpano-sel_la_desc))
  (setq gvar_557_c_projet_md_sivpanoedit_bt_panoadd_onclicked (geombib-raccordmax gvar_571_c_projet_md_sivpanoedit_oninitialize 'in_pano sivpanoedit-update))
  (or (or (pt_ext (geombib-raccordmax gvar_557_c_projet_md_sivpanoedit_bt_panoadd_onclicked '(en_poly ha_poly ld_poly ha_axe ha_ext ls_ray ls_ent in_node re_courant st_txt) 'c:projet_md_sivpanoedit_bt_panoup_onclicked projet_md_sivpano-sel_la_desc 'st_flag)) gvar_555_c_projet_md_sivpanoedit_bt_panodown_onclicked) polybib-vtxjoin)
  (setq gvar_554 nil)
  (c:projet_md_sivpanoedit_supprimer_onclicked gvar_557_c_projet_md_sivpanoedit_bt_panoadd_onclicked (geombib-raccordmax "Choisir le type de réseau" projet_md_sivpano-sel_la_desc "Choisir le type de réseau") 1)
  (setq gvar_554 (projet_md_sivpanoedit_bt_panoup projet_md_sivpano-sel_la_desc))
  (setq gvar_557_c_projet_md_sivpanoedit_bt_panoadd_onclicked (re_param gvar_554))
  (setq gvar_554 (vlax-curve-getclosestpointto gvar_554))
  (setq gvar_554 (geombib-raccordmax 'c:projet_md_sivpanoedit_bt_panoup_onclicked projet_md_sivpano-sel_la_desc))
  (if gvar_554
    (progn
      (vla-get-blocks gvar_554 gvar_557_c_projet_md_sivpanoedit_bt_panoadd_onclicked gvar_554)
      (setq projet_md_sivpano-sel_la_desc gvar_554)
      (setq gvar_550_c_projet_md_sivpanoedit_ls_pano_onselchanged (projet_md_sivpanoedit_bt_panodown projet_md_sivpano-sel_la_desc))
      (projet_md_sivpanoedit_gr_val projet_md_sivpano-sel_la_desc gvar_550_c_projet_md_sivpanoedit_ls_pano_onselchanged entlast gvar_592 projet_pa_sihlin_re_cote en_rayon)
    )
    (progn
      (ls_som0 'projet_md_sivpanoedit_st_1)
    )
  )
)

;; Original arg hints: PROJET/MD_SIVPANO-SEL/LA_DESC
;; Referenced symbols: E2, ENTDEL, kwote, vlax-erased-p, ODCLBIB-FILLCOMBO, VL-SORT
(defun sivpano-pansel (projet_md_sivpano-sel_la_desc)
  (entdel 'e2)
  (if (odclbib-fillcombo (vlax-erased-p kwote) 1)
    (progn
      vl-sort
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: PROJET/MD_SIVPANO-SEL/LA_DESC, ST_BLKBASE, BO_LCTABS, ST_LAYERINT, LS_SOM0
(defun c:projet_md_sivpano-sel_oninitialize ()
  (if (st_blkbase (sivpano-dial-search projet_md_sivpano-sel_la_desc) 0)
    (progn
      (bo_lctabs gvar_465 projet_md_sivpano-sel_la_desc)
      (st_layerint projet_md_sivpano-sel_la_desc)
    )
  )
  (ls_som0)
)

;; Original arg hints: EO_POLY, arg_2
;; Referenced symbols: ST_LAYEREXT, ENTDEL, EO_POLY, DCL-GRID-ADDROW, EN_BORDT, LD_STYLEBORD, vlax-invoke, VL-SORT, PROJET/MD_GESTSYLEBORD/LS_STYLES
(defun c:projet_md_sivpano-sel_ls_pano_onselchanged (eo_poly arg_2)
  (entdel 'st_layerext)
  (vlax-invoke ld_stylebord (dcl-grid-addrow 1 en_bordt))
  (setq en_bordt (dcl-grid-addrow eo_poly_2 gvar_462))
  (setq vl-sort (dcl-grid-addrow 2 en_bordt))
  (projet_md_gestsylebord_ls_styles gvar_460 vl-sort)
)

;; Referenced symbols: kwote
(defun c:projet_md_sivpano-sel_bt_ok_onclicked ()
  (re_abs1 kwote 1)
)

;; Referenced symbols: kwote
(defun c:projet_md_sivpano-sel_bt_cancel_onclicked ()
  (re_abs1 kwote 2)
)

;; Referenced symbols: dcl-listbox-addstring, ENTDEL, ST_LAYERINT
(defun c:projet_md_sivpano-sel_bt_search_onclicked ()
  (entdel 'dcl-listbox-addstring)
  (setq gvar_608 (errbib-catchapply gvar_465))
  (st_layerint gvar_608)
)

;; Original arg hints: arg_1
;; Referenced symbols: GESTSYLEBORD-LS_STYLEFILL, ENTDEL, ES_EXT, *LS_RAYS*, ST_DWG, AXEDYN-REACCREATE, LS_RAYSSUB, C:PROJET/MD_SIVPANOEDIT#ONINITIALIZE, PROJET/MD_GESTSYLEBORD/GR_LAYERS, GEOMBIB-RACCORDMAX
;; Referenced strings: Choisir le type de réseau, Ajouter
(defun sivpano-dial-search (arg_1 / local_1)
  (entdel 'gestsylebord-ls_stylefill)
  (setq gvar_462 (es_ext))
  (setq *ls_rays* (gestsylebord-ls_stylefill gvar_608))
  (setq local_1 *ls_rays*)
  ;; init-args 3: 'st_dwg, nil
  (foreach st_dwg local_1
    (setq projet_md_sivpano-sel_la_desc (ls_rayssub '(ls_deb ls_ent ls_fin) (axedyn-reaccreate st_dwg)))
    (setq gvar_557_c_projet_md_sivpanoedit_bt_panoadd_onclicked (geombib-raccordmax gvar_571_c_projet_md_sivpanoedit_oninitialize 'projet_md_gestsylebord_gr_layers))
    (listbib-remove-i gvar_557_c_projet_md_sivpanoedit_bt_panoadd_onclicked 3 100 (geombib-raccordmax "Choisir le type de réseau" projet_md_sivpano-sel_la_desc 'laybib-getcolor))
    (if (setq en_bordt (listbib-remove-i gvar_557_c_projet_md_sivpanoedit_bt_panoadd_onclicked 3 100 (geombib-raccordmax "Choisir le type de réseau" projet_md_sivpano-sel_la_desc 'laybib-getcolor)))
      (progn
        (setq en_bordt (polybib-lwvertices "Ajouter" en_bordt))
        (setq gvar_462 (st_rayon gvar_462 en_bordt))
      )
    )
  )
  (if (dcl-grid-clear kwote)
    (progn
      (*reactor2* gestsylebord-ls_raysfill)
      (vlr-command-reactor gestsylebord-ls_raysfill (polybib-lwvertices 'axedyn-reaccreate gvar_462))
    )
  )
  (ls_som0)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: STYLEBORDDIAL-STYLE, ENTDEL, POLYBIB-VTXJOIN, EVAL, PROJET/MD_GESTSYLEBORD/ST_NOM, GROUPBIB-LIST, PROJET/MD_GESTSYLEBORD/RE_LARG, PROJET/MD_GESTSYLEBORD/CB_CENTRE, PROJET/MD_GESTSYLEBORD/BO_LAYERCOURBE, PROJET/MD_GESTSYLEBORD/RE_RAYONMIN
;; Referenced strings: AO-ChemDyn, TEXTE, Impossible de crérer le groupe
(defun sivpano-modgo (en_rayon / local_1)
  (entdel 'styleborddial-style)
  (eval "AO-ChemDyn" polybib-vtxjoin)
  (setq styleborddial-edit (es_ext (groupbib-list '(ls_style ls_elems ls_elem ls_hach ls_bords ls_bordi ls_borde) 'projet_md_gestsylebord_st_nom) (groupbib-list "TEXTE" 'projet_md_gestsylebord_re_larg) (groupbib-list "Impossible de crérer le groupe" 'projet_md_gestsylebord_cb_centre) (groupbib-list 'projet_md_gestsylebord_bo_layercourbe 'projet_md_gestsylebord_re_rayonmin) (groupbib-list 'projet_md_sivpanoedit_ls_pano 'projet_md_gestsylebord_btn_sauver) (groupbib-list 're_rayii 'projet_md_gestsylebord_btn_ok) (groupbib-list "Couleur" 'projet_md_gestsylebord_btn_annuler)))
  (entdel 'projet_md_gestsylebord_btn_delete)
  (ls_polys projet_md_gestsylebord_btn_copy (polybib-lwvertices 'eo_polyabs styleborddial-edit))
  (vlr-command-reactor projet_md_gestsylebord_btn_edit (ssget gvar_436))
  (ls_layer entbib-offset)
  (c:projet_md_metqantprix_bt_ok_onclicked projet_md_gestsylebord_btn_edit 0)
  (ls_layer 0)
  (setq gvar_433 (in_param gvar_544 'projet_md_sivpanoedit_cb_gamme))
  (bo_invpoly1 projet_md_gestsylebord_btn_copy (laybib-newlay (in_param gvar_544 'projet_md_sivpanoedit_cb_gamme) (polybib-lwvertices 'axedyn-reaccreate styleborddial-edit)))
  (ls_debfinrad "Arrière")
  (setq gvar_432 'vla-get-activedocument)
  ;; init-args 3: 'entbib-offset, en_rayon
  (entdel "Courbes")
  (ls_visi 'c:projet_md_gestsylebord_oninitialize)
  (setq gvar_2408 'ha_poly)
  (setq axedyn-get (rem (c:projet_md_gestsylebord_oninitialize (cdr (listbib-remove-i))) 'c:projet_md_gestsylebord_btn_ajout_onclicked 'aobib-popall 'c:projet_md_gestsylebord_oninitialize))
  (setq local_1 entbib-offset)
  ;; init-args 3: 'en_bordt, nil
  (foreach en_bordt local_1
    (setq gvar_3137 (in_param en_bordt 'blkbib-vlset_att))
    (setq gvar_3137 (st_rayon gvar_3137 'sivpano-visi 'ls_ext1))
    (if (in_param en_bordt '(lambda (ls_pano) (blkbib-blkeffname (handent (listbib-key ls_pano 5)))))
      (progn
        (in_param en_bordt '(lambda (ls_pano) (blkbib-blkeffname (handent (listbib-key ls_pano 5)))))
      )
      (progn
        (projet_md_metzon_la_special (re_ray (in_param en_bordt 5)))
      )
    )
    (ls_options gvar_487 7)
    (*ls_force* gvar_487 gvar_3137)
    (setq dcl-listbox-clear nil)
    (setq gvar_487 (ld_poly axedyn-get (rtos 'ha_poly gvar_2408 'ha_poly) dcl-listbox-clear 'en_poly 'en_poly 'en_poly 'ha_poly))
    (setq gvar_2408 (st_syle gvar_2408 (blkbib-get_ymax (projet_pa_detail_ls_rep dcl-listbox-clear 9))))
  )
  (jsonbib-json2list gvar_427)
  (pt_poly gvar_427 'c:projet_md_gestsylebord_oninitialize)
  (*ls_style* gvar_427 '*ls_style*)
  (setq gvar_435 'vla-get-activelayout)
  (entdel 'c:projet_md_gestsylebord_btn_copy_onclicked)
  (projet_md_sivpanoedit_bt_panoup 'ls_ext1)
  (if (setq gvar_423_c_projet_md_gestsylebord_btn_edit_onclicked (projet_md_sivpanoedit_bt_panoup 'ls_ext1))
    (progn
      (setq gvar_557_c_projet_md_sivpanoedit_bt_panoadd_onclicked (re_param gvar_423_c_projet_md_gestsylebord_btn_edit_onclicked))
      (setq gvar_554 (vlax-curve-getclosestpointto gvar_423_c_projet_md_gestsylebord_btn_edit_onclicked))
      (if (cadr (ls_prixnew '(ha_group ha_group ld_axe ha_axe ha_group ls_som0 ls_ray ls_ent ls_som in_lon0 in_lon in_node) gvar_554))
        (progn
          (c:projet_md_gestsylebord_btn_delete_onclicked gvar_423_c_projet_md_gestsylebord_btn_edit_onclicked)
          (column (undobib-stop))
        )
      )
      (c:projet_md_gestsylebord_re_rayonmin_onsetfocus entbib-offset)
      (c:projet_md_metqantprix_bt_ok_onclicked projet_md_gestsylebord_btn_edit gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus)
      (setq gvar_3137 (polybib-lwvertices 'c:projet_md_gestsylebord_bo_layercourbe_onclicked (blkbib-get_ymax gvar_554)))
      (setq gvar_535 (es_ext (groupbib-list 5 'ls_ext1) (groupbib-list '(lambda (ls_pano) (blkbib-blkeffname (handent (listbib-key ls_pano 5)))) gvar_554) (groupbib-list 'stringbib-prefix (in_param gvar_3137 'sivpano-visi)) (groupbib-list 'blkbib-vlset_att gvar_3137)))
      (setq entbib-offset (dcl-grid-setcurcell entbib-offset gvar_535))
      (setq gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus (blkpoly-lsparams 0 (vla-get-name gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus)))
    )
  )
  (ls_som0)
  (ls_debfinrad 'c:projet_md_gestsylebord_re_larg_onsetfocus)
  (setq gvar_418_c_projet_md_gestsylebord_re_larg_onsetfocus 'block)
  (c:projet_md_gestsylebord_re_rayonmin_onsetfocus entbib-offset)
  (setq entbib-offset (ssget entbib-offset))
  (setq entbib-offset (st_out entbib-offset gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus (blkpoly-lsparams 0 (vla-get-name gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus))))
  (setq gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus (blkpoly-lsparams 0 (vla-get-name gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus)))
  (c:projet_md_metqantprix_bt_ok_onclicked projet_md_gestsylebord_btn_edit gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus)
  (ls_debfinrad '(re_rayonmin))
  (setq gvar_417 'vlax-get)
  (c:projet_md_gestsylebord_re_rayonmin_onsetfocus entbib-offset)
  (setq entbib-offset (ssget entbib-offset))
  (setq entbib-offset (st_out entbib-offset gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus (ld_ldata (st_ray2 entbib-offset) (st_axeid gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus))))
  (setq gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus (ld_ldata (st_ray2 entbib-offset) (st_axeid gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus)))
  (c:projet_md_metqantprix_bt_ok_onclicked projet_md_gestsylebord_btn_edit gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus)
  (ls_debfinrad 'st_int)
  (setq st_int '("0.0" "0.0" "0.0"))
  ;; init-args 3: 'entbib-offset, en_rayon
  (*reactor2* projet_md_gestsylebord_btn_edit)
  (vlr-command-reactor projet_md_gestsylebord_btn_edit (ssget gvar_436))
  (setq entbib-offset (ssget entbib-offset))
  (setq gvar_436 (polybib-lwvertices "Intérieur" entbib-offset))
  (ls_layer entbib-offset)
  (setq gvar_420_c_projet_md_gestsylebord_re_rayonmin_onsetfocus 'vlax-3d-point)
  (*reactor2* projet_md_gestsylebord_btn_edit)
  (vlr-command-reactor projet_md_gestsylebord_btn_edit (ssget gvar_436))
  (c:projet_md_metqantprix_bt_ok_onclicked projet_md_gestsylebord_btn_edit (blkpoly-lsparams 0 (vla-get-name gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus)))
  (setq entbib-offset (ssget entbib-offset))
  (setq entbib-offset (ls_atts gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus entbib-offset))
  (setq entbib-offset (ssget entbib-offset))
  (setq gvar_436 (polybib-lwvertices "Intérieur" entbib-offset))
  (setq gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus (blkpoly-lsparams 0 (vla-get-name gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus)))
  (ls_layer entbib-offset)
  (ls_debfinrad "Exterieur")
  (setq gvar_414 'cdar)
  ;; init-args 5: 'eo_poly, en_rayon, "LinetypeGeneration", local_1
  (vlax-vla-object->ename st_rayonmin (projet_pa_axes_st_desc eo_poly 0))
  (vlax-vla-object->ename gvar_412_c_projet_md_gestsylebord_ls_styles_onselchanged (projet_pa_axes_st_desc eo_poly (vla-get-name (st_ray2 entbib-offset))))
  (ls_layer gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus)
  (setq gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus eo_poly)
  (ls_som0)
  (ls_debfinrad 'c:projet_md_gestsylebord_cb_centre_onselchanged)
  (setq gvar_411_c_projet_md_gestsylebord_cb_centre_onselchanged "\\")
  ;; init-args 3: 'c:projet_md_gestsylebord_st_nom_onsetfocus, en_rayon
  (entdel 'st_layerext)
  (*en_ins* st_layercoubre)
  (setq en_bordt (dcl-grid-addrow gvar_419_c_projet_md_gestsylebord_st_nom_onsetfocus (ssget entbib-offset)))
  (setq gvar_3137 (in_param en_bordt 'blkbib-vlset_att))
  (setq local_1 gvar_3137)
  ;; init-args 3: 'c:projet_md_sivpanoedit_ls_pano_onselchanged, nil
  (foreach gvar_550_c_projet_md_sivpanoedit_ls_pano_onselchanged local_1
    (eo_blkpop st_layercoubre (axedyn-reaccreate gvar_550_c_projet_md_sivpanoedit_ls_pano_onselchanged) (eo_polyabs gvar_550_c_projet_md_sivpanoedit_ls_pano_onselchanged))
  )
  (eo_polyabs (in_param en_bordt 'blkbib-vlset_att))
  (setq gvar_3137 (eo_polyabs (in_param en_bordt 'blkbib-vlset_att)))
  (setq ls_layer "1.0")
  (ls_entnew gvar_409_c_projet_md_gestsylebord_btn_sauver_onclicked 0 255)
  (ls_debfinrad 'c:projet_md_gestsylebord_btn_annuler_onclicked)
  (setq gvar_408_c_projet_md_gestsylebord_btn_annuler_onclicked "0.0")
  ;; init-args 5: 'eq, en_rayon, 'netbib-purgeblock, local_1
  (projet_md_gestsylebord_re_rayon st_layercoubre eq netbib-purgeblock)
  (ls_debfinrad 'projet_md_gestsylebord_st_layerbord)
  (setq projet_md_gestsylebord_st_layerbord 'vla-insertblock)
  (entdel 'c:projet_md_gestsylebord_ls_rays_onselchanged)
  (setq en_bordt (dcl-grid-addrow (eg_entmet0 projet_md_gestsylebord_btn_edit) (ssget entbib-offset)))
  (setq gvar_3137 (in_param en_bordt 'blkbib-vlset_att))
  (setq st_ray2 0)
  (setq gvar_404 gvar_3137)
  (setq en_rayon gvar_3137)
  ;; init-args 3: 'c:projet_md_sivpanoedit_ls_pano_onselchanged, nil
  (foreach gvar_550_c_projet_md_sivpanoedit_ls_pano_onselchanged en_rayon
    (setq projet_md_gestsylebord_ls_rays (ls_absint2 st_layercoubre st_ray2 1))
    (setq gvar_404 (st_rayon gvar_404 (axedyn-reaccreate gvar_550_c_projet_md_sivpanoedit_ls_pano_onselchanged) projet_md_gestsylebord_ls_rays))
    (setq st_ray2 (st_axeid st_ray2))
  )
  (setq gvar_535 (st_rayon en_bordt 'blkbib-vlset_att gvar_404))
  (setq entbib-offset (ha_handle2 gvar_535 en_bordt entbib-offset))
  (ls_layer entbib-offset)
  (ls_debfinrad 'in_ind)
  (setq in_ind 'eo_blk)
  (re_abs1 gvar_401_c_projet_md_gestsylebord_btn_delray_onclicked 1)
  (setq gvar_433 (axedyn-reaccreate (dcl-grid-addrow (ls_props2 projet_md_gestsylebord_btn_copy) styleborddial-edit)))
  (ls_som0)
  (ls_debfinrad "To Do: code must be added to event handler\r\nc:Projet/MD_GestSyleBord/BTN_EditRay#OnClicked")
  (setq gvar_400 'vla-delete)
  (setq gvar_544 (c:projet_md_sivpanoedit_gr_val_onbuttonclicked en_rayon_2))
  (setq entbib-offset (in_param gvar_544 '(st_nom re_rayee re_rayei re_rayie re_rayii)))
  (setq gvar_436 (polybib-lwvertices "Intérieur" entbib-offset))
  (setq bo_trace (polybib-lwvertices 'c:projet_md_gestsylebord_btn_editray_onclicked entbib-offset))
  (if (odclbib-fillcombo (vlax-erased-p gvar_401_c_projet_md_gestsylebord_btn_delray_onclicked) 1)
    (progn
      (entbib-dellist (in_param gvar_544 'dcl-control-settext))
      (st_poly2 en_rayon_2 gvar_544)
      (c:projet_md_gestsylebord_gr_layers_onselchanged (dcl-forcedwgredraw gvar_580) 'vla-get-blocks in_lon0)
      (stylebord-make gvar_580 entbib-offset en_rayon_2)
      (setq gvar_580 (re_ray (in_param gvar_544 'projet_pa_croisdyn_re_rayee)))
      (setq in_lon0 (geombib-raccordmax gvar_433 (c:projet_md_gestsylebord_gr_layers_ondblclicked (dcl-control-setenabled (in_param gvar_544 'ls_axes)) 'st_btn 3)))
      (setq gvar_544 (st_rayon gvar_544 'projet_md_sivpanoedit_cb_gamme gvar_433))
    )
  )
  (ls_visi 'c:projet_md_gestsylebord_oninitialize)
  (ls_som0)
)

;; Original arg hints: IN_LON0
;; Referenced symbols: IN_LON0, PROJET/PA_DETAIL/LS_REP, RE_ANGLE, C:PROJET/MD_GESTSYLEBORD/GR_LAYERS#ONENDLABELEDIT, Projet/MD_GestSyleBord, C:PROJET/MD_GESTSYLEBORD/BTN_OK#ONCLICKED, dcl-tree-getnextsiblingitem, POLYBIB-SUBPOLYBISINV
;; Referenced strings: To Do: code must be added to event handler\r\nc:Projet/MD_GestSyleBord/gr_layers#OnEndLabelEdit, AO-StylesChem, Impossible d'insérer le bloc droit
(defun sivpano-getserie (in_lon0)
  (or (or (or (or (or (or (or (or (or (or (re_angle (projet_pa_detail_ls_rep in_lon0_2 1 2) "To Do: code must be added to event handler\r\nc:Projet/MD_GestSyleBord/gr_layers#OnEndLabelEdit") (re_angle (projet_pa_detail_ls_rep in_lon0_2 1 2) 'c:projet_md_gestsylebord_gr_layers_onendlabeledit)) (re_angle (projet_pa_detail_ls_rep in_lon0_2 1 2) 'projet_md_gestsylebord)) (re_angle (projet_pa_detail_ls_rep in_lon0_2 1 1) 'c:projet_md_gestsylebord_btn_ok_onclicked)) (re_angle (projet_pa_detail_ls_rep in_lon0_2 1 1) "AO-StylesChem")) (re_angle (projet_pa_detail_ls_rep in_lon0_2 1 1) "Impossible d'insérer le bloc droit")) (re_angle (projet_pa_detail_ls_rep in_lon0_2 1 1) "Croisée ")) (re_angle (projet_pa_detail_ls_rep in_lon0_2 1 1) 'dcl-tree-getnextsiblingitem)) (re_angle (projet_pa_detail_ls_rep in_lon0_2 1 1) "Couleur")) (re_angle (projet_pa_detail_ls_rep in_lon0_2 1 1) "Base")) (re_angle (projet_pa_detail_ls_rep in_lon0_2 1 1) '(ls_style ls_elems ls_elem ls_hach ls_bords ls_bordi ls_borde)))
  (setq polybib-subpolybisinv '(ls_style ls_elems ls_elem ls_hach ls_bords ls_bordi ls_borde))
  (setq polybib-subpolybisinv "Base")
  (setq polybib-subpolybisinv "Couleur")
  (setq polybib-subpolybisinv 'dcl-tree-getnextsiblingitem)
  (setq polybib-subpolybisinv "Croisée ")
  (setq polybib-subpolybisinv "Impossible d'insérer le bloc droit")
  (setq polybib-subpolybisinv "AO-StylesChem")
  (setq polybib-subpolybisinv 'c:projet_md_gestsylebord_btn_ok_onclicked)
  (setq polybib-subpolybisinv 'c:projet_md_gestsylebord_btn_ok_onclicked)
  (setq polybib-subpolybisinv 'c:projet_md_gestsylebord_gr_layers_onendlabeledit)
  (setq polybib-subpolybisinv "To Do: code must be added to event handler\r\nc:Projet/MD_GestSyleBord/gr_layers#OnEndLabelEdit")
  polybib-subpolybisinv
)

;; Original arg hints: BLKPOLY-GET
;; Referenced symbols: BLKPOLY-GET, RE_ANGLE, RE_RAYII, STYLECHEM-MAKE, LD_STYLECHEM, STYLECHEM-SET, LS_FILTERED, IN_LON0, ES_EXT
;; Referenced strings: Base, Couleur, Croisée 
(defun sivpano-gettype (blkpoly-get)
  (or (or (or (re_angle blkpoly-get_2 "Base") (re_angle blkpoly-get_2 "Couleur")) (re_angle blkpoly-get_2 "Croisée ")) (re_angle blkpoly-get_2 're_rayii))
  (setq ls_filtered "Chemin de base")
  (setq in_lon0 "-1.5")
  (setq ls_filtered "B6B1")
  (setq in_lon0 'stylechem-make)
  (setq ls_filtered '(eo_sup re_angle_ins pt_ins re_dist re_angle))
  (setq in_lon0 'ld_stylechem)
  (setq ls_filtered '(in_id ld_stylechem))
  (setq in_lon0 'stylechem-set)
  (es_ext ls_filtered in_lon0)
)

;; Original arg hints: PROJET/MD_SIVPANO-SEL/LA_DESC
;; Referenced symbols: PROJET/MD_SIVPANO-SEL/LA_DESC, GESTSTYLECHEM-STYLESFILL, GESTSTYLECHEM-EDITACTIVE, ES_EXT, C:PROJET/MD_GESTSTYLECHEM#ONINITIALIZE, PROJET/MD_GESTSTYLECHEM/LS_STYLES, PROJET/MD_GESTSTYLECHEM/ST_NOM, GESTSTYLECHEM-ELEMFILL, PROJET/MD_GESTSTYLECHEM/BT_STYLEEDIT, PROJET/MD_GESTSTYLECHEM/BT_STYLECOPY
;; Referenced strings: AK, K, J
(defun sivpano-getfin (projet_md_sivpano-sel_la_desc)
  (laybib-newlay projet_md_sivpano-sel_la_desc_2 (st_rayon (es_ext 'geststylechem-stylesfill 'geststylechem-editactive) (es_ext "AK" "K" "J" 'c:projet_md_geststylechem_oninitialize '(ls_style st_nom) "PA D B P M P" "point d'insertion ou type de panneau [PAnneaux/Normal/Potence/Directionnel/Balise/Musoir] ? : " 'projet_md_geststylechem_ls_styles "B1" 'projet_md_geststylechem_st_nom "SIR-VER-Potence" "de la potence" "de la balise" "du panneau directionnel" "du musoir") (es_ext 'geststylechem-elemfill 'projet_md_geststylechem_bt_styleedit 'projet_md_geststylechem_bt_stylecopy)))
)

;; Original arg hints: PROJET/MD_SIVPANO-SEL/LA_DESC
;; Referenced symbols: PROJET/MD_SIVPANO-SEL/LA_DESC, C:PROJET/MD_GESTSTYLECHEM#ONINITIALIZE, PROJET/MD_GESTSTYLECHEM/LS_STYLES, PROJET/MD_GESTSTYLECHEM/ST_NOM, ES_EXT, ST_RAYON
;; Referenced strings: AK, K, J
(defun sivpano-getdebut (projet_md_sivpano-sel_la_desc)
  (laybib-newlay projet_md_sivpano-sel_la_desc_2 (st_rayon (es_ext "AK" "K" "J" 'c:projet_md_geststylechem_oninitialize '(ls_style st_nom) "PA D B P M P" "point d'insertion ou type de panneau [PAnneaux/Normal/Potence/Directionnel/Balise/Musoir] ? : " 'projet_md_geststylechem_ls_styles "B1" 'projet_md_geststylechem_st_nom "SIR-VER-Potence" "de la potence" "de la balise" "du panneau directionnel" "du musoir")))
)

;; Original arg hints: BLKPOLY-GET, IN_LON0
;; Referenced symbols: C:PROJET/MD_GESTSTYLECHEM/LS_STYLES#ONSELCHANGED, ENTDEL, RE_RAYII, vlax-ename->vla-object, BLKPOLY-GET, IN_LON0, ST_UNITE, GEOMBIB-RACCORDMAX, C:PROJET/MD_GESTSTYLECHEM/BT_STYLEADD#ONCLICKED, RE_ANGLE
;; Referenced strings: nom du style
(defun sivpano-getdir (blkpoly-get in_lon0)
  (entdel 'c:projet_md_geststylechem_ls_styles_onselchanged)
  (vlax-ename->vla-object 're_rayii)
  (setq gvar_374_c_projet_md_geststylechem_bt_styleadd_onclicked (st_visi blkpoly-get_2 (geombib-raccordmax "nom du style" in_lon0_2 'st_unite)))
  (if (re_angle gvar_374_c_projet_md_geststylechem_bt_styleadd_onclicked 're_rayii)
    (progn
      (setq gvar_374_c_projet_md_geststylechem_bt_styleadd_onclicked (re_y (axedyn-reaccreate (projet_md_quantite_bt_qtdroite '(st_id st_nom ls_style ls_elems))) blkpoly-get_2))
      (setq gvar_372_c_projet_md_geststylechem_bt_stylecopy_onclicked (st_visi blkpoly-get_2 (geombib-raccordmax "nom du style" in_lon0_2 'st_unite)))
      (setq gvar_592 (blkbib-getvisient blkpoly-get_2 gvar_374_c_projet_md_geststylechem_bt_styleadd_onclicked))
      (if (repdyn-getpoint (pt_ref (getvar blkpoly-get_2 (dcl-grid-addrow gvar_592 (repdyn-isrep gvar_3236 'repdyn-isrep)) 'en_poly) gvar_372_c_projet_md_geststylechem_bt_stylecopy_onclicked) (pt_ref (getvar blkpoly-get_2 (st_syle gvar_592 (repdyn-isrep gvar_3236 'repdyn-isrep)) 'en_poly) gvar_372_c_projet_md_geststylechem_bt_stylecopy_onclicked))
        (progn
          (blkbib-getvisient blkpoly-get_2 gvar_374_c_projet_md_geststylechem_bt_styleadd_onclicked)
        )
        (progn
          (st_syle (blkbib-getvisient blkpoly-get_2 gvar_374_c_projet_md_geststylechem_bt_styleadd_onclicked) gvar_3236)
        )
      )
      (setq gvar_592 nil)
    )
    (progn
      (setq gvar_592 (st_syle (blkbib-getvisient blkpoly-get_2 gvar_374_c_projet_md_geststylechem_bt_styleadd_onclicked) (repdyn-isrep gvar_3236 'repdyn-isrep)))
    )
  )
  gvar_592
)

;; Original arg hints: IN_LON0
;; Referenced symbols: C:PROJET/MD_GESTSTYLECHEM/BT_STYLEEDIT#ONCLICKED, ENTDEL, C:PROJET/MD_GESTSTYLECHEM/BT_STYLEDEL#ONCLICKED, vlax-ename->vla-object, BLKPOLY-GET, RE_ANGLE, RE_RAYII, POLYBIB-VTXJOIN, LS_ELEM0, IN_LON0
;; Referenced strings: Couleur, Impossible d'insérer le bloc droit, Grande
(defun sivpano-getins (in_lon0)
  (entdel 'c:projet_md_geststylechem_bt_styleedit_onclicked)
  (vlax-ename->vla-object 'c:projet_md_geststylechem_bt_styledel_onclicked)
  (setq blkpoly-get (st_visi '(ls_elem0 st_type)))
  (or (or (or (re_angle blkpoly-get "Couleur") (re_angle blkpoly-get 're_rayii)) (re_angle blkpoly-get "Impossible d'insérer le bloc droit")) polybib-vtxjoin)
  (setq ls_filtered "Grande")
  (setq in_lon0_2 '(ls_results ls_result st_panneau st_directory ls_pano))
  (setq in_lon0_2 "-1.5")
  (setq blkpoly-get (st_visi (geombib-raccordmax 'ls_elem0 in_lon0_2 'st_unite)))
  (setq ls_filtered "Chemin de base")
  (setq in_lon0_2 "-1.5")
  (setq blkpoly-get (st_visi (geombib-raccordmax 'ls_elem0 in_lon0_2 'st_unite)))
  (setq ls_filtered "Chemin de base")
  (setq in_lon0_2 'ld_stylechem)
  (setq blkpoly-get (st_visi (geombib-raccordmax 'ls_elem0 in_lon0_2 'st_unite)))
  (setq ls_filtered '(eo_sup re_angle_ins pt_ins re_dist re_angle))
  (es_ext blkpoly-get in_lon0_2 ls_filtered)
)

;; Referenced symbols: POLYBIB-VTXJOIN, STYLEBORD-MAKE, RE_MAX, Projet/MD_GestStyleChem-Signa, RE_ANGLE, Projet/MD_GestStyleChem-Bord, Projet/MD_GestStyleChem-Hach, PROJET/PA_DETAIL/LS_REP
(defun sivpano-getnom ()
  (setq gvar_611 (re_max polybib-vtxjoin 'stylebord-make))
  (if (re_angle gvar_611 'projet_md_geststylechem-signa)
    (progn
      (projet_pa_detail_ls_rep (projet_md_geststylechem-hach 'projet_md_geststylechem-bord) 7)
    )
    (progn
      gvar_611
    )
  )
)

;; Original arg hints: arg_1
;; Referenced symbols: Projet/MD_GestStyleChem-Poly, ENTDEL, dcl-forcedwgredraw, BLKPOLY-GET, LS_PROP, ST_SYLE, PT_REF, GETVAR
;; Referenced strings: B50c, B30, B50b
(defun sivpano-getbase (arg_1)
  (entdel 'projet_md_geststylechem-poly)
  (setq gvar_578 (dcl-forcedwgredraw gvar_580))
  (setq gvar_491 (ls_sup gvar_578 "B50c"))
  (setq blkpoly-get (blkbib-get_ymax (blkbib-get_ymax (ls_sup gvar_578 '(st_nom)))))
  (setq pt_ref (sivpano-getblock gvar_578 "B30"))
  (setq ls_prop (sivpano-getblock gvar_578 "B50b"))
  (getvar blkpoly-get (st_syle ls_prop gvar_491) pt_ref)
)

;; Original arg hints: Projet/MD_SivPanoEdit
;; Referenced symbols: C:PROJET/MD_GESTSTYLECHEM/BT_ELEMEDIT#ONCLICKED, ENTDEL, Projet/MD_SivPanoEdit, C:PROJET/MD_GESTSTYLECHEM/BT_ELEMSUP#ONCLICKED, Projet/MD_GestStyleChem, C:PROJET/MD_GESTSTYLECHEM/BT_OK#ONCLICKED, PROJET/MD_GESTSTYLECHEM/GR_ELEM, ST_LARG, PROJET/MD_GESTSTYLECHEM/BT_HACHADD, PROJET/MD_GESTSTYLECHEM/BT_POLYADD
;; Referenced strings: Croisée 
(defun sivpano-getymax (projet_md_sivpanoedit)
  (entdel 'c:projet_md_geststylechem_bt_elemedit_onclicked)
  (or (or (or (laybib-newlay projet_md_sivpanoedit_2 (es_ext 'c:projet_md_geststylechem_bt_elemsup_onclicked 'projet_md_geststylechem 'c:projet_md_geststylechem_bt_ok_onclicked '(ls_elem st_type) 'projet_md_geststylechem_gr_elem 'st_larg '(ls_ctrl en_ctrl) 'projet_md_geststylechem_bt_hachadd 'projet_md_geststylechem_bt_polyadd 'projet_md_geststylechem_bt_bordadd 'projet_md_geststylechem_bt_signaadd 'projet_md_geststylechem_bt_stylecancel 'projet_md_geststylechem_bt_stylesave 'ls_ctrl 'en_ctrl 'projet_md_geststylechem_bt_elemedit 'projet_md_geststylechem_bt_elemsup)) (re_angle (projet_pa_detail_ls_rep projet_md_sivpanoedit_2 1 1) 'projet_md_geststylechem_bt_styleadd)) (re_angle (projet_pa_detail_ls_rep projet_md_sivpanoedit_2 1 1) "Croisée ")) polybib-vtxjoin)
  (setq gvar_2408 (projet_md_geststylechem_bt_styledel (geombib-raccordmax st_gamme 'c:projet_md_sivpanoedit_bt_panoup_onclicked projet_md_sivpanoedit_2)))
  (setq gvar_2408 'projet_md_geststylechem_bt_ok)
  (setq gvar_2408 'projet_md_geststylechem_bt_ok)
  (setq gvar_2408 (projet_md_geststylechem_bt_styledel (geombib-raccordmax st_gamme 'c:projet_md_sivpanoedit_bt_panoup_onclicked projet_md_sivpanoedit_2)))
  gvar_2408
)

;; Original arg hints: ST_Y, BLKPOLY-GETDISTX, BLKPOLY-GETDISTY
;; Referenced symbols: ENTDEL, ST_Y, BLKPOLY-GETDISTX, PT_VAR, LS_INNER, RE_YORIGIN
(defun sivpano-reac1 (st_y blkpoly-getdistx blkpoly-getdisty)
  (entdel '(re_x re_y pt_var re_abs1 re_abs2 re_dist))
  (rem st_y_2)
  (if (setq cdadr (rem st_y_2))
    (progn
      T
      (setq pt_origin blkpoly-getdistx_2)
      (setq re_xorigin st_y_2)
      (re_yorigin st_y_2 '(en_ctrl))
      (setq pt_var (re_yorigin st_y_2 '(en_ctrl)))
      (and pt_var (ls_inner pt_var))
    )
    (progn
      nil
    )
  )
)

;; Original arg hints: BLKPOLY-GETDISTX
;; Referenced symbols: LS_XYS, ENTDEL, AXEDYN-REACCREATE, LS_STRINGS, RE_ANGLE, C:PROJET/MD_GESTSTYLECHEM/GR_ELEM#ONSELCHANGED, POLYBIB-VTXJOIN, LS_SOM0, RE_XORIGIN, IN_COTE1
(defun sivpano-reac2 (blkpoly-getdistx / bo_flag ls_props ls_xys ls_xy ls_params ls_param ls_strings st_dist st_axe re_sign st_x st_y local_1)
  (entdel 'ls_xys)
  (or (or (re_angle (axedyn-reaccreate ls_xys) 'ls_strings) (re_angle (axedyn-reaccreate ls_xys) 'c:projet_md_geststylechem_gr_elem_onselchanged)) polybib-vtxjoin)
  (ls_som0 (axedyn-reaccreate ls_xys))
  (in_cote1 re_xorigin nil nil)
  (ls_inner pt_origin)
  (dcl-insertblock re_xorigin)
  (c:projet_md_geststylechem_gr_elem_onselchanged)
  (ls_inner pt_origin)
  (c:projet_md_geststylechem_bt_hachadd_onclicked re_xorigin)
  (in_cote1 re_xorigin nil nil)
  (dcl-insertblock re_xorigin)
  T
  nil
  (setq pt_origin nil)
  nil
  (setq re_xorigin nil)
  (and pt_var (ls_inner pt_var) (setq pt_var nil))
)

;; Original arg hints: ST_Y, BLKPOLY-GETDISTX, BLKPOLY-GETDISTY
;; Referenced symbols: C:PROJET/MD_GESTSTYLECHEM/BT_BORDADD#ONCLICKED, BLKPOLY-GETDISTY, AXEDYN-REACCREATE, ES_EXT, ST_Y, BLKPOLY-GETDISTX, PT_VAR, LS_INNER, C:PROJET/MD_GESTSTYLECHEM/BT_POLYADD#ONCLICKED, RE_YORIGIN
(defun sivpano-copy (st_y blkpoly-getdistx blkpoly-getdisty)
  (if gvar_338_c_projet_md_geststylechem_bt_bordadd_onclicked
    (progn
      (setq gvar_338_c_projet_md_geststylechem_bt_bordadd_onclicked (projet_md_metzon_hachures1 gvar_338_c_projet_md_geststylechem_bt_bordadd_onclicked (axedyn-reaccreate blkpoly-getdisty_2)))
    )
    (progn
      (setq gvar_338_c_projet_md_geststylechem_bt_bordadd_onclicked (es_ext (axedyn-reaccreate blkpoly-getdisty_2)))
    )
  )
  (rem st_y_2)
  (if (setq cdadr (rem st_y_2))
    (progn
      T
      (setq pt_origin blkpoly-getdistx_2)
      (setq re_xorigin st_y_2)
      (re_yorigin st_y_2 'c:projet_md_geststylechem_bt_polyadd_onclicked)
      (setq pt_var (re_yorigin st_y_2 'c:projet_md_geststylechem_bt_polyadd_onclicked))
      (and pt_var (ls_inner pt_var))
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: C:PROJET/MD_GESTSTYLECHEM/BT_SIGNAADD#ONCLICKED, ENTDEL, acByLayer, POLYBIB-LWVERTICES, ST_2, RE_XORIGIN, PROJET/PA_AXES/CA_SOMMET, IN_PARAM, EN_RAYON, C:PROJET/MD_SIVPANOEDIT/GR_VAL#ONBUTTONCLICKED
;; Referenced strings: B51, Miniature
(defun sivpano-copyended ( / local_0)
  (entdel 'c:projet_md_geststylechem_bt_signaadd_onclicked)
  (setq st_2 (polybib-lwvertices "B51" (acbylayer)))
  (setq en_rayon (in_param st_2 (projet_pa_axes_ca_sommet re_xorigin)))
  (setq gvar_584 (in_param (c:projet_md_sivpanoedit_gr_val_onbuttonclicked en_rayon) '(st_nom re_rayee re_rayei re_rayie re_rayii)))
  (setq local_0 gvar_338_c_projet_md_geststylechem_bt_bordadd_onclicked)
  ;; init-args 3: "Miniature", nil
  (foreach gvar_580 local_0
    (if (polar gvar_580)
      (progn
        (stylebord-make gvar_580 gvar_584 nil)
      )
    )
  )
  nil
  (setq gvar_338_c_projet_md_geststylechem_bt_bordadd_onclicked nil)
)

;; Referenced symbols: C:PROJET/MD_GESTSTYLECHEM/BT_STYLECANCEL#ONCLICKED, ENTDEL, AXEDYN-SETRAYEXT, CADR, C:PROJET/MD_GESTSTYLECHEM/BT_STYLESAVE#ONCLICKED, ST_BTN, GROUPBIB-LIST, ES_EXT, PROJET/MD_GESTSTYLECHEM-HACH/ST_LAYER, PROJET/MD_GESTSTYLECHEM-HACH/RE_OFFSET
;; Referenced strings: Choix de l'axe des bandes :, OC-axes
(defun stylebord-list ( / local_0 local_1)
  (entdel 'c:projet_md_geststylechem_bt_stylecancel_onclicked)
  (if (cadr (axedyn-setrayext '(st_nom ls_style)))
    (progn
      (projet_md_geststylechem-hach_st_layer 'c:projet_md_geststylechem_bt_stylesave_onclicked '(st_layer re_offset re_offset2) 0 "Choix de l'axe des bandes :" 'st_btn 'st_btn (es_ext (groupbib-list 0 'st_btn)))
    )
  )
  (axedyn-setrayext '(st_nom ls_style))
  ;; init-args 5: 'projet_md_geststylechem-hach_re_offset, local_0, 'projet_md_geststylechem-hach_re_offset2, local_1
  (repdyn-getpoint (ha_polyext projet_md_geststylechem-hach_re_offset) (ha_polyext projet_md_geststylechem-hach_re_offset2))
  (projet_md_geststylechem-bord_st_style (projet_md_geststylechem-hach_re_offset2 "OC-axes"))
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: PROJET/MD_GESTSTYLECHEM-BORD/RE_COTE, ENTDEL, EN_RAYON, RE_COURANT, METBIB-METZGO
(defun stylebord-get (en_rayon)
  (entdel 'projet_md_geststylechem-bord_re_cote)
  (re_courant '(st_nom ls_style) en_rayon_2)
  (if (and en_rayon_2 (setq gvar_2519 (re_courant '(st_nom ls_style) en_rayon_2)))
    (progn
      gvar_2519
    )
    (progn
      (re_courant '(st_nom ls_style) 'metbib-metzgo)
    )
  )
)

;; Original arg hints: IN_LON0, ASSOC, arg_3, LISTBIB-MIN, PROJET/MD_GESTSTYLECHEM-BORD/RE_OFFSET, ST_POS
;; Referenced symbols: PROJET/MD_GESTSTYLECHEM-POLY/RE_OFFSET, ENTDEL, /, ST_AXEID, LS_OBJ, IN_LON0, GROUPBIB-LIST, *ST_AXEDYNID*, ASSOC, INTERSBIB-GETINSIDEVTXS
;; Referenced strings: Impossible de générer les polylignes contours, ls_pano, \n Vérification des panneaux...
(defun stylebord-make (in_lon0 assoc arg_3 listbib-min projet_md_geststylechem-bord_re_offset st_pos / re_cote st_style local_5)
  (entdel 'projet_md_geststylechem-poly_re_offset)
  (rtos '(st_nom ls_style) (dcl-control-setenabled inters) projet_md_geststylechem-poly_st_layer)
  (setq inters (st_axeid (/ '(st_nom ls_style))))
  (setq projet_md_geststylechem-poly_st_layer (es_ext (groupbib-list 'ls_obj in_lon0_2) (groupbib-list '*st_axedynid* assoc_2) (groupbib-list "Impossible de générer les polylignes contours" gvar_2515) (groupbib-list 'intersbib-getinsidevtxs listbib-min_2) (groupbib-list "ls_pano" projet_md_geststylechem-bord_re_offset_2) (groupbib-list "\n Vérification des panneaux..." gvar_324) (groupbib-list 'ls_polyhach st_pos_2)))
  inters
)

;; Referenced symbols: LS_MOD, ENTDEL, PROJET/MD_GESTSTYLECHEM-BORD/RE_COTE, LS_U, *REACTOR2*, EO_POLYABS, LS_OBJ, IN_PARAM, PROJET/MD_GESTSTYLECHEM-SIGNA/RE_U, vlax-ldata-list
;; Referenced strings: Impossible de générer la polyligne contour, ls_pano, \n Vérification des panneaux...
(defun stylebord-go ( / local_0 local_1)
  (entdel 'ls_mod)
  (entdel 'projet_md_geststylechem-bord_re_cote)
  (*reactor2* ls_u)
  (setq local_0 (sivpano-supportupdate))
  ;; init-args 3: "Impossible de générer la polyligne contour", nil
  nil
  (foreach gvar_2519 local_0
    (projet_md_geststylechem-signa_re_u ls_u (in_param (eo_polyabs gvar_2519) 'ls_obj))
  )
  (setq projet_md_geststylechem-signa_st_mod 'vlax-ldata-list)
  (entdel 'projet_md_geststylechem-signa_st_lar)
  (setq gvar_315 (blkpolydial-getpoint (re_angle0 0 projet_md_geststylechem-signa_re_cote) projet_md_geststylechem-signa_re_cote))
  (setq gvar_315 (blkpolydial-getpoint (re_angle0 255 gvar_315) gvar_315))
  (while (st_blkbase (ename projet_md_geststylechem-signa_st_layer) 4)
    (polydyn-get projet_md_geststylechem-signa_st_layer 4)
  )
  (setq local_0 gvar_315)
  ;; init-args 3: 'axedyn-set, nil
  (foreach axedyn-set local_0
    (projet_md_quantite_cb_ltype projet_md_geststylechem-signa_st_layer gvar_3169 1 9)
    (setq gvar_3169 (eo_blkpop projet_md_geststylechem-signa_st_layer 'blkpoly-poly (eo_blkbase (axedyn-reaccreate axedyn-set) 2 2) (dcl-control-setenabled (projet_md_geststylechem-signa_st_layer (eo_polyabs axedyn-set))) (eo_polyabs axedyn-set)))
  )
  (projet_md_quantite_cb_ltype projet_md_geststylechem-signa_st_layer (eo_blkpop projet_md_geststylechem-signa_st_layer 'ls_ext1 'projet_md_geststylechem-signa_re_offset) 2 0)
  (setq gvar_311 'st_id)
  ;; init-args 3: 'covassbib-getmanhole, local_0
  (projet_md_geststylechem-signa_re_offset (cadr covassbib-getmanhole))
  (vlax-vla-object->ename gvar_309 covassbib-getmanhole)
  (vlax-vla-object->ename stylepoly-add covassbib-getmanhole)
  (vlax-vla-object->ename st_typeligne covassbib-getmanhole)
  (vlax-vla-object->ename ld_stylepoly covassbib-getmanhole)
  (vlax-vla-object->ename gvar_305 covassbib-getmanhole)
  (vlax-vla-object->ename projet_md_geststylechem-signa_st_layer covassbib-getmanhole)
  (vlax-vla-object->ename id_combo covassbib-getmanhole)
  (vlax-vla-object->ename gvar_303 (cadr covassbib-getmanhole))
  (vlax-vla-object->ename gvar_302 covassbib-getmanhole)
  (setq stylepolydial-fill 'vlax-ldata-get)
  ;; init-args 3: '(eo_blkbase ss_curv ls_entsnew ls_group ls_entnew en_ent st_group en_group eo_group ls_props ls_hach ls_ent), local_0
  (vlax-vla-object->ename stylepolydial-editgo gvar_3176)
  (vlax-vla-object->ename gvar_299_c_projet_md_geststylepoly_oninitialize gvar_3176)
  (vlax-vla-object->ename gvar_298 gvar_3176)
  (ls_som0)
  (setq gvar_310 'ls_ldata)
  (stylepolydial-fill nil)
  (sivpano-supportupdate)
  (projet_md_geststylechem-signa_st_mod)
  (metquantprix st_typeligne)
  (ls_polys st_typeligne (es_ext 'projet_md_geststylepoly_ls_styles 'projet_md_geststylepoly_st_nom))
  (bo_invpoly1 st_typeligne 0)
  (projet_md_geststylechem-signa_re_offset nil)
  (*en_ins* projet_md_geststylechem-signa_st_layer)
  (projet_md_quantite_cb_ltype projet_md_geststylechem-signa_st_layer (eo_blkpop projet_md_geststylechem-signa_st_layer 'ls_ext1 'projet_md_geststylepoly_st_typeligne) 0 1)
  (eo_blkpop projet_md_geststylechem-signa_st_layer 'ls_ext1 'projet_md_geststylepoly_btn_sauver)
  (eo_blkpop projet_md_geststylechem-signa_st_layer 'ls_ext1 'dcl-tree-getfirstchilditem)
  (setq projet_md_geststylepoly_st_layer (st_rayon (es_ext 'ls_ext1) (projet_pa_polydyn_la_r1)))
  (eo_blkpop projet_md_geststylechem-signa_st_layer 'ls_ext1 'projet_md_geststylepoly_btn_ok)
  (ls_debfinrad 'projet_md_geststylepoly_btn_ajout)
  (setq projet_md_geststylepoly_btn_ajout 'vlax-ldata-put)
  (projet_md_geststylechem-hach_st_layer 'projet_md_geststylepoly_btn_edit 'ls_ext1 0 'pt_4 'st_btn 'st_btn (es_ext (groupbib-list 0 'st_btn)))
  (projet_md_geststylechem-signa_st_mod)
  (stylepolydial-fill polybib-vtxjoin)
  (en_hatch gvar_309)
  (projet_md_geststylechem-signa_re_offset nil)
  (ls_debfinrad 'projet_md_geststylepoly_btn-delete)
  (setq projet_md_geststylepoly_btn-delete 'en_axe)
  (entdel '(ls_style st_nom st_layer st_typeligne))
  (projet_md_geststylechem-hach_st_layer in_lon0 'ls_ext1 gvar_2515 listbib-min projet_md_geststylechem-bord_re_offset gvar_324 vlax-ldata-delete)
  (projet_md_geststylechem-signa_st_mod)
  (setq in_lon0 (in_param gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged 'ls_obj))
  (setq in_lon0 (geombib-raccordmax in_lon0 '(ls_styles in_delete st_delete)))
  (setq projet_md_geststylechem-bord_re_offset (in_param gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged "ls_pano"))
  (setq gvar_324 (in_param gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged "\n Vérification des panneaux..."))
  (setq listbib-min (in_param gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged 'intersbib-getinsidevtxs))
  (setq vlax-ldata-delete (in_param gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged 'ls_polyhach))
  (setq gvar_2515 (in_param gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged "Impossible de générer les polylignes contours"))
  (projet_md_geststylechem-signa_re_offset nil)
  (ls_debfinrad 'c:projet_md_geststylepoly_btn-delete_onclicked)
  (setq gvar_285_c_projet_md_geststylepoly_btn-delete_onclicked 'en_ext)
  (stylepolydial-fill polybib-vtxjoin)
  (en_hatch gvar_309)
  (ls_entnew gvar_309 0 255)
  (ls_debfinrad 'c:projet_md_geststylepoly_btn_edit_onclicked)
  (setq gvar_284_c_projet_md_geststylepoly_btn_edit_onclicked 'ls_ray)
  (projet_md_geststylechem-signa_st_mod)
  (if (cadr (re_angle re_yinv 'metbib-metzgo))
    (progn
      (ls_parentconf '(st_nom ls_style) re_yinv)
      (projet_md_geststylechem-signa_st_mod)
      (projet_md_geststylechem-signa_re_offset)
      (projet_md_geststylechem-signa_re_offset nil)
    )
    (progn
      nil
    )
  )
  (ls_debfinrad 'c:projet_md_geststylepoly_btn_ajout_onclicked)
  (setq gvar_283_c_projet_md_geststylepoly_btn_ajout_onclicked 'ls_ent)
  ;; init-args 3: "LinetypeGeneration", local_0
  (re_hauteur gvar_305 (re_angle gvar_2862 1))
  (ls_som0)
  (ls_debfinrad '(st_layer st_typeligne st_nom ld_stylepoly))
  (setq gvar_282 'st_style)
  (ls_entnew gvar_305 0 255)
  (ls_debfinrad 'c:projet_md_geststylepoly_btn_sauver_onclicked)
  (setq gvar_281_c_projet_md_geststylepoly_btn_sauver_onclicked 'va_deb)
  (ls_entnew gvar_309 0 255)
  (ls_debfinrad 'projet_md_geststylepoly)
  (setq projet_md_geststylepoly 're_abs)
  (ls_entnew stylepoly-add 0 255)
  (ls_debfinrad 'c:projet_md_geststylepoly_btn_ok_onclicked)
  (setq gvar_279_c_projet_md_geststylepoly_btn_ok_onclicked '(ls_som eg_axe ha_ext ha_axe in_id ss_group eo_group ld_axe))
  ;; init-args 5: 'eo_poly, local_0, "LinetypeGeneration", local_1
  (entdel "OC-StylesReps")
  (projet_md_geststylechem-signa_re_offset polybib-vtxjoin)
  (bo_lctabs gvar_309 (in_param gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged 'ls_obj))
  (en_blk projet_md_geststylechem-signa_st_layer 1 3 (in_param gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged "\n Vérification des panneaux..."))
  (en_blk projet_md_geststylechem-signa_st_layer 1 2 (dcl-control-setenabled (projet_md_geststylechem-signa_st_layer (in_param gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged "\n Vérification des panneaux..."))))
  (setq re_yinv (axedyn-reaccreate (dcl-grid-addrow eo_poly (sivpano-supportupdate))))
  (setq gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged (eo_polyabs (dcl-grid-addrow eo_poly (sivpano-supportupdate))))
  (if (projet_pa_axes_st_desc (in_param gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged "ls_pano") 'ls_ext1)
    (progn
      (projet_md_quantite_la_prop projet_md_geststylechem-signa_st_layer 0 0 1)
      (en_blk projet_md_geststylechem-signa_st_layer 0 3 (in_param gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged "ls_pano"))
      (en_blk projet_md_geststylechem-signa_st_layer 0 2 (dcl-control-setenabled (projet_md_geststylechem-signa_st_layer (in_param gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged "ls_pano"))))
    )
    (progn
      (projet_md_quantite_la_prop projet_md_geststylechem-signa_st_layer 0 0 1)
      (en_blk projet_md_geststylechem-signa_st_layer 0 3 'ls_ext1)
      (en_blk projet_md_geststylechem-signa_st_layer 0 2 'ls_ext1)
    )
  )
  (bo_lctabs stylepoly-add (eo_blkbase (in_param gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged 'intersbib-getinsidevtxs) 2))
  (bo_invpoly1 st_typeligne (in_param gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged "Impossible de générer les polylignes contours"))
  (setq projet_md_geststylechem-signa_re_cote (in_param gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged 'ls_polyhach))
  (setq gvar_2515 (in_param gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged "Impossible de générer les polylignes contours"))
  (if (re_angle gvar_2515 0)
    (progn
      (setq gvar_277 'projet_md_geststylepoly_st_typeligne)
      (setq gvar_1339 'projet_md_geststylepoly_btn_sauver)
    )
    (progn
      (setq gvar_277 'stylerep-add)
      (setq gvar_1339 '(in_id ld_stylerep))
    )
  )
  (en_blk projet_md_geststylechem-signa_st_layer 0 1 gvar_277)
  (en_blk projet_md_geststylechem-signa_st_layer 1 1 gvar_1339)
  (en_blk projet_md_geststylechem-signa_st_layer 3 3 'ls_ext1)
  (en_blk projet_md_geststylechem-signa_st_layer 2 3 (in_param projet_md_geststylechem-signa_re_cote 0))
  (en_blk projet_md_geststylechem-signa_st_layer 2 2 (dcl-control-setenabled (projet_md_geststylechem-signa_st_layer (in_param projet_md_geststylechem-signa_re_cote 0))))
  (if (in_param projet_md_geststylechem-signa_re_cote 255)
    (progn
      nil
      (or (in_param gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged "SOLID") 'ha_poly)
      (st_num ld_stylepoly 1)
      (bo_lctabs gvar_305 ld_stylerep)
      (en_blk projet_md_geststylechem-signa_st_layer 3 3 (in_param projet_md_geststylechem-signa_re_cote 255))
      (en_blk projet_md_geststylechem-signa_st_layer 3 2 (dcl-control-setenabled (projet_md_geststylechem-signa_st_layer (in_param projet_md_geststylechem-signa_re_cote 255))))
      (setq ls_offsets nil)
      (setq ld_stylerep (eo_blkbase ls_offsets 2 2))
    )
    (progn
      (st_num ld_stylepoly 0)
      (en_blk projet_md_geststylechem-signa_st_layer 3 3 'ls_ext1)
      (en_blk projet_md_geststylechem-signa_st_layer 3 2 'ls_ext1)
    )
  )
  (projet_md_geststylechem-signa_re_offset)
  (ls_debfinrad '(stylerepdial-fill stylerepdial-editgo projet_md_geststylerep_oninitialize projet_md_geststylerep_ls_styles_onselchanged projet_md_geststylerep_btn_delete_onclicked projet_md_geststylerep_btn_edit_onclicked projet_md_geststylerep_btn_ajout_onclicked projet_md_geststylerep_st_blkname_onselchanged projet_md_geststylerep_btn_sauver_onclicked projet_md_geststylerep_btn_annuler_onclicked projet_md_geststylerep_btn_ok_onclicked))
  (setq gvar_273 'poly-polysom)
  ;; init-args 5: 'eo_poly, local_0, "LinetypeGeneration", local_1
  (if (re_angle eo_poly 0)
    (progn
      (setq gvar_277 'projet_md_geststylepoly_st_typeligne)
      (setq gvar_1339 'projet_md_geststylepoly_btn_sauver)
    )
    (progn
      (setq gvar_277 'stylerep-add)
      (setq gvar_1339 '(in_id ld_stylerep))
    )
  )
  (en_blk projet_md_geststylechem-signa_st_layer 0 1 gvar_277)
  (en_blk projet_md_geststylechem-signa_st_layer 1 1 gvar_1339)
  (ls_debfinrad 'projet_md_geststylerep_ls_styles)
  (setq projet_md_geststylerep_ls_styles 'ls_som)
  (setq gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged (st_rayon gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged "\n Vérification des panneaux..." (ls_absint2 projet_md_geststylechem-signa_st_layer 0 3)))
  (setq gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged (st_rayon gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged 'intersbib-getinsidevtxs (groupbib-listobj (errbib-catchapply stylepoly-add))))
  (setq gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged (st_rayon gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged 'ls_obj (errbib-catchapply gvar_309)))
  (setq gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged (st_rayon gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged "Impossible de générer les polylignes contours" (ls_props2 st_typeligne)))
  (setq gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged (st_rayon gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged "SOLID" (groupbib-listobj (errbib-catchapply gvar_305))))
  (if (re_angle (projet_md_quantite_la_ltype projet_md_geststylechem-signa_st_layer 0 0) 1)
    (progn
      (setq gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged (st_rayon gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged "ls_pano" (ls_absint2 projet_md_geststylechem-signa_st_layer 0 3)))
    )
    (progn
      (setq gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged (st_rayon gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged "ls_pano" 'ls_ext1))
    )
  )
  (setq projet_md_geststylechem-signa_re_cote (st_rayon projet_md_geststylechem-signa_re_cote 0 (ls_absint2 projet_md_geststylechem-signa_st_layer 2 3)))
  (setq projet_md_geststylechem-signa_re_cote (es_ext (groupbib-list 0 (ls_absint2 projet_md_geststylechem-signa_st_layer 2 3))))
  (setq gvar_3169 4)
  (while (repdyn-getpoint gvar_3169 (vla-get-name (ename projet_md_geststylechem-signa_st_layer)))
    (setq gvar_3331 (groupbib-listobj (ls_absint2 projet_md_geststylechem-signa_st_layer gvar_3169 1)))
    (setq blkbib-getparententities (ls_absint2 projet_md_geststylechem-signa_st_layer gvar_3169 3))
    (setq projet_md_geststylechem-signa_re_cote (dcl-grid-setcurcell projet_md_geststylechem-signa_re_cote (groupbib-list gvar_3331 blkbib-getparententities)))
    (setq gvar_3169 (st_axeid gvar_3169))
  )
  (if (re_angle (axe-set ld_stylepoly) 0)
    (progn
      (setq gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged (st_rayon gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged "SOLID" 'ha_poly))
    )
    (progn
      (setq stylerepdial-fill (ls_absint2 projet_md_geststylechem-signa_st_layer 3 3))
      (setq projet_md_geststylechem-signa_re_cote (dcl-grid-setcurcell projet_md_geststylechem-signa_re_cote (groupbib-list 255 stylerepdial-fill)))
      (setq gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged (st_rayon gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged "SOLID" (groupbib-listobj (errbib-catchapply gvar_305))))
    )
  )
  (rtos '(st_nom ls_style) re_yinv gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged)
  (stylepolydial-fill nil)
  (projet_md_geststylechem-signa_st_mod)
  (setq gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged (st_rayon gvar_287_c_projet_md_geststylepoly_ls_styles_onselchanged 'ls_polyhach projet_md_geststylechem-signa_re_cote))
  (projet_md_geststylechem-signa_re_offset)
  (ls_debfinrad 'projet_md_geststylerep_btn_ajout)
  (setq projet_md_geststylerep_btn_ajout 'entget)
  (stylepolydial-fill nil)
  (ls_debfinrad 'projet_md_geststylerep_btn_edit)
  (setq projet_md_geststylerep_btn_edit 'eg_axe)
  ;; init-args 5: 'eq, local_0, 'netbib-purgeblock, local_1
  (entdel 'projet_md_geststylechem-signa_st_lar)
  (bo_lctabs projet_md_geststylerep_btn_delete (eo_blkbase (axedyn-reaccreate axedyn-set) 2 3))
  (setq gvar_315 (blkpolydial-getpoint (re_angle0 0 projet_md_geststylechem-signa_re_cote) projet_md_geststylechem-signa_re_cote))
  (setq gvar_315 (blkpolydial-getpoint (re_angle0 255 gvar_315) gvar_315))
  (setq axedyn-set (dcl-grid-addrow eq gvar_315))
  (bo_lctabs projet_md_geststylerep_btn_ok (eo_polyabs axedyn-set))
  (ls_debfinrad 'projet_md_geststylerep_st_nom)
  (setq projet_md_geststylerep_st_nom 'entbib-gethandle)
  (entdel 'projet_md_geststylerep_st_layer)
  (setq gvar_315 (blkpolydial-getpoint (re_angle0 0 projet_md_geststylechem-signa_re_cote) projet_md_geststylechem-signa_re_cote))
  (setq gvar_315 (blkpolydial-getpoint (re_angle0 255 gvar_315) gvar_315))
  (setq projet_md_geststylerep_btn_sauver (axedyn-reaccreate (blkpoly-ls_entsnew projet_md_geststylerep_st_blkname)))
  (setq axedyn-set (dcl-grid-addrow projet_md_geststylerep_btn_sauver gvar_315))
  (setq projet_md_geststylechem-signa_re_cote (blkpolydial-getpoint axedyn-set projet_md_geststylechem-signa_re_cote))
  (projet_md_geststylechem-signa_re_offset)
  (ls_debfinrad 'projet_md_geststylerep_btn_annuler)
  (setq projet_md_geststylerep_btn_annuler 'ha_ext)
  (ls_ptinint 'stylerepdial-editgo 'close)
  (ls_debfinrad 'c:projet_md_geststylerep_oninitialize)
  (setq gvar_260_c_projet_md_geststylerep_oninitialize 'stylepoly-id2props)
  ;; init-args 5: 'eq, local_0, 'netbib-purgeblock, local_1
  nil
  (re_angle netbib-purgeblock 3)
  (vlax-curve-getstartpoint nil)
  T
  (and (setq blkbib-getparententities (vlax-curve-getstartpoint nil)) (en_blk projet_md_geststylechem-signa_st_layer eq netbib-purgeblock blkbib-getparententities))
  (ls_debfinrad 'projet_md_geststylerep_vb_bloc)
  (setq projet_md_geststylerep_vb_bloc 'listbib-key)
  ;; init-args 5: 'eq, local_0, 'netbib-purgeblock, local_1
  (vlax-curve-getendparam (es_ext eq netbib-purgeblock (ename projet_md_geststylechem-signa_st_layer)))
  nil
  (and (re_angle eq (vla-get-name (ename projet_md_geststylechem-signa_st_layer))) (and (re_angle netbib-purgeblock 255) (st_blkbase eq 3) (repdyn-getpoint eq (vla-get-name (ename projet_md_geststylechem-signa_st_layer)))))
  (polydyn-get projet_md_geststylechem-signa_st_layer eq)
  (en_blk projet_md_geststylechem-signa_st_layer eq 0 'blkpoly-poly)
  (en_blk projet_md_geststylechem-signa_st_layer eq 3 'st_btn)
  (projet_md_quantite_cb_ltype projet_md_geststylechem-signa_st_layer eq 1 9)
  (projet_md_quantite_cb_ltype projet_md_geststylechem-signa_st_layer eq 2 20)
  (eo_blkpop projet_md_geststylechem-signa_st_layer 'ls_ext1 'projet_md_geststylechem-signa_re_offset)
  (setq gvar_3169 (eo_blkpop projet_md_geststylechem-signa_st_layer 'ls_ext1 'projet_md_geststylechem-signa_re_offset))
  (ls_debfinrad "0.85")
  (setq gvar_258 'entbib-mod)
  ;; init-args 5: 'eq, local_0, 'netbib-purgeblock, local_1
  (ls_ptinint 'c:projet_md_geststylerep_ls_styles_onselchanged 'close)
  (ls_debfinrad 'c:projet_md_geststylerep_btn_delete_onclicked)
  (setq gvar_256_c_projet_md_geststylerep_btn_delete_onclicked '(lambda (x) (+ "0.0" "0.0")))
  (re_abs1 gvar_255_c_projet_md_geststylerep_btn_edit_onclicked 1)
  (ls_debfinrad 'c:projet_md_geststylerep_btn_ajout_onclicked)
  (setq gvar_254_c_projet_md_geststylerep_btn_ajout_onclicked 'mapcar)
  (vlax-erased-p gvar_255_c_projet_md_geststylerep_btn_edit_onclicked)
)

;; Referenced symbols: C:PROJET/MD_GESTSTYLECHEM/BT_STYLECANCEL#ONCLICKED, ENTDEL, AXEDYN-SETRAYEXT, CADR, C:PROJET/MD_GESTSTYLECHEM/BT_STYLESAVE#ONCLICKED, C:PROJET/MD_GESTSTYLEREP/BTN_COPY#ONCLICKED, ST_TYPE, RE_RAYII, GROUPBIB-LIST, ST_BTN
;; Referenced strings: Repère, re_rayee, C:\Pliver\bib\900-Développement\0-Blibilothèque métier\Panneaux.csv
(defun stylechem-list ( / local_0 local_1)
  (entdel 'c:projet_md_geststylechem_bt_stylecancel_onclicked)
  (if (cadr (axedyn-setrayext '(ls_style st_nom st_layer st_blkname)))
    (progn
      (c:projet_md_geststylerep_st_blkname_onselchanged 'c:projet_md_geststylechem_bt_stylesave_onclicked 'c:projet_md_geststylerep_btn_copy_onclicked (es_ext (es_ext (groupbib-list 'st_type 're_rayii) (groupbib-list "Repère" 'st_btn) (groupbib-list "re_rayee" '(st_blkname))) (es_ext (groupbib-list 'st_type 're_rayii) (groupbib-list "Repère" 'st_btn) (groupbib-list "re_rayee" "C:\\Pliver\\bib\\900-Développement\\0-Blibilothèque métier\\Panneaux.csv"))))
    )
  )
  (axedyn-setrayext '(ls_style st_nom st_layer st_blkname))
  ;; init-args 5: 'projet_md_geststylechem-hach_re_offset, local_0, 'projet_md_geststylechem-hach_re_offset2, local_1
  (repdyn-getpoint (in_param (eo_polyabs projet_md_geststylechem-hach_re_offset) 'ls_obj) (in_param (eo_polyabs projet_md_geststylechem-hach_re_offset2) 'ls_obj))
  (projet_md_geststylechem-bord_st_style (projet_md_geststylechem-hach_re_offset2 '(lambda (x) nil)))
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: PROJET/MD_GESTSTYLECHEM-BORD/RE_COTE, ENTDEL, EN_RAYON, RE_COURANT, METBIB-METZGO
(defun stylechem-get (en_rayon)
  (entdel 'projet_md_geststylechem-bord_re_cote)
  (re_courant '(ls_style st_nom st_layer st_blkname) en_rayon_2)
  (if (and en_rayon_2 (setq gvar_2519 (re_courant '(ls_style st_nom st_layer st_blkname) en_rayon_2)))
    (progn
      gvar_2519
    )
    (progn
      (re_courant '(ls_style st_nom st_layer st_blkname) 'metbib-metzgo)
    )
  )
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: EN_RAYON, RTOS
(defun stylechem-set (en_rayon / st_layer st_typeligne st_nom ld_stylerep st_msg local_1)
  (rtos '(ls_style st_nom st_layer st_blkname) en_rayon_2 gvar_249)
)

;; Original arg hints: IN_LON0, ASSOC, arg_3
;; Referenced symbols: ENTDEL, /, ST_AXEID, LS_AXES, INTERS, GROUPBIB-LIST, LS_OBJ, IN_LON0, *ST_AXEDYNID*, ASSOC
;; Referenced strings: Bloc non sélectionné !
(defun stylechem-make (in_lon0 assoc arg_3)
  (entdel "Bloc non sélectionné !")
  (c:projet_md_geststylerep_btn_sauver_onclicked (dcl-control-setenabled inters) gvar_249)
  (setq inters (st_axeid (/ '(ls_style st_nom st_layer st_blkname))))
  (setq gvar_249 (es_ext (groupbib-list 'ls_axes inters) (groupbib-list 'ls_obj in_lon0_2) (groupbib-list '*st_axedynid* assoc_2) (groupbib-list 'mpolydyn-set gvar_2431)))
  inters
)

;; Referenced symbols: EN_EXT2DC, VA_PARENT, C:PROJET/MD_GESTSTYLEREP/BTN_SAUVER#ONCLICKED, C:PROJET/MD_GESTSTYLEREP/BTN_ANNULER#ONCLICKED, HA_AXE, Projet/MD_GestStyleRep, LS_DEBFINRAD, C:PROJET/MD_GESTSTYLEREP/BTN_OK#ONCLICKED, ENTDEL, RE_GD
;; Referenced strings: Impossible de générer la polyligne contour, LinetypeGeneration, Talus 
(defun stylechem-go ( / local_0 local_1 local_2)
  (c:projet_md_geststylerep_btn_sauver_onclicked)
  (setq va_parent (en_ext2dc))
  (setq ha_poly2 va_parent)
  (c:projet_md_geststylerep_btn_annuler_onclicked nil)
  (ls_debfinrad 'projet_md_geststylerep)
  (setq projet_md_geststylerep 'ha_axe)
  (entdel 'c:projet_md_geststylerep_btn_ok_onclicked)
  (*reactor2* re_gd)
  (setq local_0 ha_poly2)
  ;; init-args 3: "Impossible de générer la polyligne contour", nil
  nil
  (foreach gvar_2519 local_0
    (setq gvar_2519 (eo_polyabs gvar_2519))
    (setq in_lon0 (in_param gvar_2519 'ls_obj))
    (projet_md_geststylechem-signa_re_u re_gd in_lon0)
  )
  (setq gvar_246_c_projet_md_geststylerep_btn_sauver_onclicked 'ocbib-getmaxid)
  ;; init-args 5: 'eo_poly, local_0, "LinetypeGeneration", local_1
  (bo_lctabs ls_pied in_lon0)
  (re_pas)
  (vlax-vla-object->ename in_pattern polybib-vtxjoin)
  (setq en_rayon (axedyn-reaccreate (dcl-grid-addrow eo_poly ha_poly2)))
  (setq gvar_2519 (eo_polyabs (dcl-grid-addrow eo_poly ha_poly2)))
  (setq in_lon0 (in_param gvar_2519 'ls_obj))
  (setq gvar_2431 (in_param gvar_2519 'mpolydyn-set))
  (vlax-vla-object->ename gvar_238 polybib-vtxjoin)
  (ls_debfinrad "Talus ")
  (setq gvar_237 'in_id)
  (entdel 'ls_zons)
  (in_retour "Coefficient du prix" "re_gd" 'projet_pa_repdyn_va_decx)
  (en_ext2dc)
  T
  (and (setq in_lon0 (in_retour "Coefficient du prix" "re_gd" 'projet_pa_repdyn_va_decx)) (cadr (odclbib-fillcombo in_lon0 'ls_ext1)) (c:projet_md_geststylerep_st_blkname_onselchanged in_lon0 in_lon0 nil) (setq ha_poly2 (en_ext2dc)) (c:projet_md_geststylerep_btn_sauver_onclicked))
  (ls_debfinrad "re_pas")
  (setq gvar_235 'ssadd)
  (entdel "in_pattern")
  (c:projet_md_geststylerep_st_blkname_onselchanged in_lon0 in_lon0 gvar_2431)
  (setq en_rayon (axedyn-reaccreate (dcl-grid-addrow (eg_entmet0 re_gd) ha_poly2)))
  (setq gvar_2519 (eo_polyabs (dcl-grid-addrow (eg_entmet0 re_gd) ha_poly2)))
  (setq in_lon0 (in_param gvar_2519 'ls_obj))
  (setq in_lon0 (geombib-raccordmax in_lon0 '(ls_styles in_delete st_delete)))
  (setq gvar_2431 (in_param gvar_2519 'mpolydyn-set))
  (setq ha_poly2 (en_ext2dc))
  (c:projet_md_geststylerep_btn_sauver_onclicked)
  (ls_debfinrad 'ld_talus)
  (setq ld_talus 'ss_group)
  (c:projet_md_geststylerep_btn_annuler_onclicked polybib-vtxjoin)
  (ls_debfinrad 'taldyn-set)
  (setq taldyn-set 'groupbib-ss2group)
  (ls_parentconf '(ls_style st_nom st_layer st_blkname) en_rayon)
  (setq en_rayon (axedyn-reaccreate (dcl-grid-addrow (eg_entmet0 re_gd) ha_poly2)))
  (setq ha_poly2 (en_ext2dc))
  (c:projet_md_geststylerep_btn_sauver_onclicked)
  (ls_debfinrad 'taldyn-getparents)
  (setq taldyn-getparents 'eo_group)
  (entdel '(ls_group re_long re_abs li_lon inc li_ptabs pt_1 pt_2 re_larg))
  (setq ss_poils re_rayei)
  (setq polybib-subpolybisinv (in_param re_rayei 'st_type))
  nil
  (or (or (or (odclbib-fillcombo polybib-subpolybisinv 're_rayii) (odclbib-fillcombo polybib-subpolybisinv '(st_id ld_crois))) (odclbib-fillcombo polybib-subpolybisinv "Croisée ")) (odclbib-fillcombo polybib-subpolybisinv "TEXTE"))
  (if (odclbib-fillcombo (vlax-erased-p taldyn-get) 1)
    (progn
      (setq gvar_2431 (ha_handle2 re_rayei ss_poils gvar_2431))
      (re_pas)
    )
    (progn
      nil
    )
  )
  (if (odclbib-fillcombo (vlax-erased-p en_poly_som) 1)
    (progn
      (setq gvar_2431 (ha_handle2 re_rayei ss_poils gvar_2431))
      (re_pas)
    )
    (progn
      nil
    )
  )
  (if (odclbib-fillcombo (vlax-erased-p entbib-lshandle2lsent) 1)
    (progn
      (setq gvar_2431 (ha_handle2 re_rayei ss_poils gvar_2431))
      (re_pas)
    )
    (progn
      nil
    )
  )
  (if (odclbib-fillcombo (vlax-erased-p gvar_225) 1)
    (progn
      (setq gvar_2431 (ha_handle2 re_rayei ss_poils gvar_2431))
      (re_pas)
    )
    (progn
      nil
    )
  )
  (ls_debfinrad 'li_lon)
  (setq li_lon 'car)
  (setq gvar_2431 (blkpolydial-getpoint re_rayei gvar_2431))
  (re_pas)
  (ls_debfinrad '(re_long re_abs))
  (setq gvar_223 'last)
  (re_abs1 gvar_222 1)
  (ls_debfinrad 'poly-polypoint)
  (setq poly-polypoint 'ls_ext)
  (entdel 'li_ptabs)
  (*en_ins* polybib-lsintgis)
  (setq local_0 gvar_2431)
  ;; init-args 3: 're_rayei, nil
  nil
  (foreach re_rayei local_0
    (setq polybib-subpolybisinv (in_param re_rayei 'st_type))
    nil
    (or (or (or (odclbib-fillcombo polybib-subpolybisinv 're_rayii) (odclbib-fillcombo polybib-subpolybisinv '(st_id ld_crois))) (odclbib-fillcombo polybib-subpolybisinv "Croisée ")) (odclbib-fillcombo polybib-subpolybisinv "TEXTE"))
    (setq ld_crois (in_param re_rayei "ha_contour"))
    (setq en_polypoil (in_param re_rayei 'croisdyn-set))
    (eo_blkpop polybib-lsintgis "TEXTE" (geombib-raccordmax ld_crois 'projet_md_metprop_bt_special en_polypoil) (eo_blkbase (in_param re_rayei "re_rayee") 2 3) 'ls_ext1)
    (setq ls_axe (in_param re_rayei 'dcl-form-show))
    (setq ls_axe (in_param (ls_vtxsbase2 ls_axe) 'ls_obj))
    (eo_blkpop polybib-lsintgis "Croisée " ls_axe (eo_blkbase (in_param re_rayei "re_rayee") 2 3) 'ls_ext1)
    (eo_blkpop polybib-lsintgis '(st_id ld_crois) (in_param re_rayei "Repère") (eo_blkbase (in_param re_rayei "re_rayee") 2 3) (eo_blkbase (in_param re_rayei '(lambda (ls_elem) (= "B" (listbib-key ls_elem "st_type")))) 2 3))
    (eo_blkpop polybib-lsintgis 're_rayii (in_param re_rayei "Repère") (eo_blkbase (in_param re_rayei "re_rayee") 2 3) 'ls_ext1)
  )
  (setq re_pas "ID")
  ;; init-args 3: '(eo_blkbase ss_curv ls_entsnew ls_group ls_entnew en_ent st_group en_group eo_group ls_props ls_hach ls_ent), local_0
  (entdel 'ss_poil)
  (setq *ld_talus0* (es_ext ls_pied errbib-princ projet_pa_talus gvar_214 projet_pa_talus_st_layer polybib-lsintgis projet_pa_talus_re_pas projet_pa_talus_bt_select))
  (setq local_1 *ld_talus0*)
  ;; init-args 3: '(re_length st_msg), nil
  (foreach gvar_209 local_1
    (vlax-vla-object->ename gvar_209 gvar_3176)
  )
  (setq *ld_talus0* (es_ext gvar_208 gvar_207))
  (setq local_1 *ld_talus0*)
  ;; init-args 3: '(re_length st_msg), nil
  (foreach gvar_209 local_1
    (vlax-vla-object->ename gvar_209 nil)
  )
  (setq *ld_talus0* (es_ext re_gd taldyn-popgo gvar_205 in_pattern gvar_238 projet_md_typeligne))
  (setq local_1 *ld_talus0*)
  ;; init-args 3: '(re_length st_msg), nil
  nil
  (foreach gvar_209 local_1
    (vlax-vla-object->ename gvar_209 (cadr gvar_3176))
  )
  (setq gvar_245_c_projet_md_geststylerep_btn_annuler_onclicked '1+)
  ;; init-args 5: 'eq, local_0, 'netbib-purgeblock, local_1
  (entdel 'projet_md_typeligne_st_txtnom)
  (if (st_blkbase eq 255)
    (progn
      (setq re_rayei (dcl-grid-addrow eq gvar_2431))
      (setq local_2 (es_ext gvar_208 gvar_207))
      ;; init-args 3: '(re_length st_msg), nil
      nil
      (foreach gvar_209 local_2
        (vlax-vla-object->ename gvar_209 polybib-vtxjoin)
      )
    )
    (progn
      nil
    )
  )
  (ls_debfinrad 'textbib-list)
  (setq textbib-list 'cons)
  (entdel "TEXTSTYLE")
  (setq re_rayei nil)
  (if (odclbib-fillcombo (vlax-erased-p entbib-lshandle2lsent) 1)
    (progn
      (setq gvar_2431 (dcl-grid-setcurcell gvar_2431 re_rayei))
      (re_pas)
    )
    (progn
      nil
    )
  )
  (ls_debfinrad 'projet_md_typeligne_st_styleligne)
  (setq projet_md_typeligne_st_styleligne "st_nom")
  (setq re_rayei nil)
  (if (odclbib-fillcombo (vlax-erased-p en_poly_som) 1)
    (progn
      (setq gvar_2431 (dcl-grid-setcurcell gvar_2431 re_rayei))
      (re_pas)
    )
    (progn
      nil
    )
  )
  (ls_debfinrad '(lambda (x) (listbib-key x "TXT")))
  (setq gvar_199 "st_desc")
  (setq re_rayei nil)
  (if (odclbib-fillcombo (vlax-erased-p gvar_225) 1)
    (progn
      (setq gvar_2431 (dcl-grid-setcurcell gvar_2431 re_rayei))
      (re_pas)
    )
    (progn
      nil
    )
  )
  (ls_debfinrad 'ls_lsty)
  (setq ls_lsty "st_style")
  (setq re_rayei nil)
  (if (odclbib-fillcombo (vlax-erased-p taldyn-get) 1)
    (progn
      (setq gvar_2431 (dcl-grid-setcurcell gvar_2431 re_rayei))
      (re_pas)
    )
    (progn
      nil
    )
  )
  (ls_debfinrad 'c:projet_md_typeligne_oninitialize)
  (setq gvar_197_c_projet_md_typeligne_oninitialize "ha_axe")
  (entdel 'ls_zons)
  (bo_lctabs ls_pied in_lon0)
  (re_pas)
  (vlax-vla-object->ename in_pattern polybib-vtxjoin)
  (setq in_lon0 (in_param gvar_2519 'ls_obj))
  (setq gvar_2431 (in_param gvar_2519 'mpolydyn-set))
  (c:projet_md_geststylerep_btn_annuler_onclicked nil)
  (ls_debfinrad '(st_type st_style st_txt st_mod))
  (setq gvar_196 "ls_ext")
  (entdel 'projet_md_typeligne_st_txt)
  (c:projet_md_geststylerep_btn_sauver_onclicked en_rayon gvar_2519)
  (c:projet_md_geststylerep_btn_sauver_onclicked)
  (c:projet_md_geststylerep_btn_annuler_onclicked nil)
  (setq in_lon0 (errbib-catchapply ls_pied))
  (setq gvar_2519 (st_rayon gvar_2519 'ls_obj in_lon0))
  (setq gvar_2519 (st_rayon gvar_2519 'mpolydyn-set gvar_2431))
  (setq ha_poly2 (en_ext2dc))
  (ls_som0)
  (ls_debfinrad 'odclbib-getstring)
  (setq odclbib-getstring "ls_som")
  (vlax-erased-p gvar_222)
)

;; Referenced symbols: PROJET/MD_TYPELIGNE/ST_MOD, ENTDEL, RE_RAYEI, IN_PARAM, ST_BTN, HA_POLY, EN_POLY, BLKBIB-GETPARENTENTITIES, BO_LCTABS, TYPELINEBIB-MAKETYPE
;; Referenced strings: Repère, re_rayee
(defun c:projet_md_geststylechem-hach_oninitialize ()
  (entdel 'projet_md_typeligne_st_mod)
  (if re_rayei
    (progn
      (setq blkbib-getparententities (in_param re_rayei "Repère"))
      (setq gvar_2408 (in_param re_rayei "re_rayee"))
      (setq ls_bords (in_param re_rayei '(lambda (ls_elem) (= "B" (listbib-key ls_elem "st_type")))))
    )
    (progn
      (setq blkbib-getparententities 'st_btn)
      (setq gvar_2408 'ha_poly)
      (setq ls_bords 'en_poly)
    )
  )
  (bo_lctabs gvar_192 blkbib-getparententities)
  (bo_lctabs gvar_191 (eo_blkbase gvar_2408 2 3))
  (bo_lctabs typelinebib-maketype (eo_blkbase ls_bords 2 3))
)

;; Referenced symbols: ENTBIB-LSHANDLE2LSENT
(defun c:projet_md_geststylechem-hach_bt_cancel_onclicked ()
  (re_abs1 entbib-lshandle2lsent 2)
  nil
  (setq re_rayei nil)
)

;; Referenced symbols: ST_TYPE, GROUPBIB-LIST, GROUPBIB-LISTOBJ, TYPELINEBIB-MAKETYPE, ES_EXT, ENTBIB-LSHANDLE2LSENT
;; Referenced strings: re_rayee, Repère
(defun c:projet_md_geststylechem-hach_bt_ok_onclicked ()
  (setq re_rayei (es_ext (groupbib-list 'st_type '(st_id ld_crois)) (groupbib-list "re_rayee" (groupbib-listobj (errbib-catchapply gvar_191))) (groupbib-list '(lambda (ls_elem) (= "B" (listbib-key ls_elem "st_type"))) (groupbib-listobj (errbib-catchapply typelinebib-maketype))) (groupbib-list "Repère" (errbib-catchapply gvar_192))))
  (re_abs1 entbib-lshandle2lsent 1)
)

;; Referenced symbols: ENTDEL, vla-put-LinetypeScale, EN_INT2DC, POLYBIB-LWVERTICES, HA_POLY2, ES_EXT, RE_RAYEI, LS_CROISELEMS, IN_PARAM, ODCLBIB-FILLCOMBO
;; Referenced strings: CANNOSCALEVALUE, \n Vérification des axes..., re_rayee
(defun c:projet_md_geststylechem-bord_oninitialize ()
  (entdel "CANNOSCALEVALUE")
  (metquantprix gvar_188)
  (metquantprix vla-put-linetypescale)
  (ls_polys gvar_188 ha_poly2)
  (ls_polys vla-put-linetypescale (es_ext '(ls_axes ls_axe) "\n Vérification des axes..."))
  (setq ha_poly2 (polybib-lwvertices 'en_int2dc (sivpano-supportupdate)))
  (if re_rayei
    (progn
      (if (odclbib-fillcombo (in_param re_rayei 'ls_croiselems) 1)
        (progn
          1
        )
        (progn
          0
        )
      )
      (setq gvar_2827 nil)
      (setq gvar_2408 (in_param re_rayei "re_rayee"))
      (setq ls_axe (in_param re_rayei 'dcl-form-show))
      (setq gvar_1346 (laybib-newlay ls_axe (polybib-lwvertices 'axedyn-reaccreate (sivpano-supportupdate))))
    )
    (progn
      (setq gvar_2827 0)
      (setq gvar_2408 'ha_poly)
      (setq gvar_1346 0)
    )
  )
  (if (cadr gvar_1346)
    (progn
      (setq gvar_1346 0)
    )
  )
  (bo_lctabs projet_md_apercu (eo_blkbase gvar_2408 2 3))
  (bo_invpoly1 vla-put-linetypescale gvar_2827)
  (bo_invpoly1 gvar_188 gvar_1346)
)

;; Referenced symbols: EN_POLY_SOM
(defun c:projet_md_geststylechem-bord_bt_cancel_onclicked ()
  (re_abs1 en_poly_som 2)
)

;; Referenced symbols: C:PROJET/MD_TYPELIGNE/BT_PREVIEW#ONCLICKED, ENTDEL, Projet/MD_Apercu, GROUPBIB-LISTOBJ, vla-put-LinetypeScale, RE_ANGLE, EN_POLY, AXEDYN-REACCREATE, POLYBIB-LWVERTICES, DCL-GRID-ADDROW
;; Referenced strings: Croisée , re_rayee
(defun c:projet_md_geststylechem-bord_bt_ok_onclicked ()
  (entdel 'c:projet_md_typeligne_bt_preview_onclicked)
  (setq gvar_2408 (groupbib-listobj (errbib-catchapply projet_md_apercu)))
  (if (re_angle 1 (ls_props2 vla-put-linetypescale))
    (progn
      'en_poly
    )
    (progn
      '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2)
    )
  )
  (setq gvar_2827 nil)
  (setq ls_axe (dcl-grid-addrow (ls_props2 gvar_188) (polybib-lwvertices 'axedyn-reaccreate (sivpano-supportupdate))))
  (setq re_rayei (es_ext (groupbib-list 'st_type "Croisée ") (groupbib-list "re_rayee" gvar_2408) (groupbib-list 'ls_croiselems gvar_2827) (groupbib-list 'dcl-form-show ls_axe)))
  (re_abs1 en_poly_som 1)
)

;; Referenced symbols: RE_RAYEI, IN_PARAM, ST_BTN, HA_POLY, BLKBIB-GETPARENTENTITIES, BO_LCTABS
;; Referenced strings: Repère, re_rayee
(defun c:projet_md_geststylechem-poly_oninitialize ()
  (if re_rayei
    (progn
      (setq blkbib-getparententities (in_param re_rayei "Repère"))
      (setq gvar_2408 (in_param re_rayei "re_rayee"))
    )
    (progn
      (setq blkbib-getparententities 'st_btn)
      (setq gvar_2408 'ha_poly)
    )
  )
  (bo_lctabs gvar_192 blkbib-getparententities)
  (bo_lctabs gvar_191 (eo_blkbase gvar_2408 2 3))
)

(defun c:projet_md_geststylechem-poly_bt_cancel_onclicked ()
  (re_abs1 gvar_225 2)
)

;; Referenced symbols: ST_TYPE, RE_RAYII, GROUPBIB-LIST, PROJET/MD_APERCU/VUEBLOCS1, GROUPBIB-LISTOBJ, C:PROJET/MD_APERCU#ONINITIALIZE, ES_EXT
;; Referenced strings: re_rayee, Repère
(defun c:projet_md_geststylechem-poly_bt_ok_onclicked ()
  (setq re_rayei (es_ext (groupbib-list 'st_type 're_rayii) (groupbib-list "re_rayee" (groupbib-listobj (errbib-catchapply projet_md_apercu_vueblocs1))) (groupbib-list "Repère" (errbib-catchapply gvar_183_c_projet_md_apercu_oninitialize))))
  (re_abs1 gvar_225 1)
)

;; Referenced symbols: SIHPP-POPGO, LS_SIR-VER, GROUPBIB-LIST, ST_PANO, FL_FIN, SIVPANO-LISTPANO, *ST_METIER*, *BLOCKPATH*, ES_EXT, PROJET/MD_TYPELIGNE/ST_DESC
;; Referenced strings: \n Vérification des axes..., ha_contour, re_rayie
(defun c:projet_md_geststylechem-signa_oninitialize ()
  (metquantprix projet_md_typeligne_st_desc)
  (metquantprix gvar_179_c_projet_md_typeligne_st_desc_onsetfocus)
  (metquantprix gvar_178_c_projet_md_typeligne_st_txt_onsetfocus)
  (metquantprix gvar_177_c_projet_md_typeligne_st_mod_onsetfocus)
  (ls_polys projet_md_typeligne_st_desc (polybib-lwvertices 'eo_polyabs gvar_181_c_projet_md_typeligne_st_nom_onsetfocus))
  (ls_polys gvar_177_c_projet_md_typeligne_st_mod_onsetfocus (es_ext '(ls_axes ls_axe) 'sivpano-getbase "\n Vérification des axes..."))
  (ls_polys gvar_179_c_projet_md_typeligne_st_desc_onsetfocus (polybib-lwvertices 're_x projet_md_typeligne_st_nom))
  (setq projet_md_typeligne_st_nom (eo_sup))
  (setq gvar_181_c_projet_md_typeligne_st_nom_onsetfocus (es_ext (groupbib-list 'sihpp-popgo 'ls_sir-ver) (groupbib-list 'st_pano 'fl_fin) (groupbib-list 'sivpano-listpano '(en_sup eo_sup pt_base re_offset st_panneau ls_att)) (groupbib-list '*st_metier* '*blockpath*)))
  (if re_rayei
    (progn
      (setq croisdyn-getparents (in_param re_rayei 'croisdyn-set))
      (setq ld_crois (in_param re_rayei "ha_contour"))
      (setq gvar_2406 (in_param re_rayei "re_rayie"))
      (setq blkbib-getparententities (in_param re_rayei "Repère"))
      (setq gvar_2827 (in_param re_rayei 'ls_croiselems))
    )
    (progn
      (setq croisdyn-getparents 'oc-typelignedial-new)
      (setq ld_crois "Support précédent effacé, copie impossible")
      (setq gvar_2406 'st_pano)
      (setq blkbib-getparententities 'st_btn)
      (setq gvar_2827 'en_poly)
    )
  )
  (if gvar_2827
    (progn
      (bo_invpoly1 gvar_177_c_projet_md_typeligne_st_mod_onsetfocus (st_axeid gvar_2827))
    )
    (progn
      (bo_invpoly1 gvar_177_c_projet_md_typeligne_st_mod_onsetfocus 1)
    )
  )
  (bo_invpoly1 gvar_179_c_projet_md_typeligne_st_desc_onsetfocus (laybib-newlay ld_crois (polybib-lwvertices 'axedyn-reaccreate projet_md_typeligne_st_nom)))
  (bo_invpoly1 projet_md_typeligne_st_desc (laybib-newlay gvar_2406 (polybib-lwvertices 'axedyn-reaccreate gvar_181_c_projet_md_typeligne_st_nom_onsetfocus)))
  (ls_polys gvar_178_c_projet_md_typeligne_st_txt_onsetfocus sivpano-getnom)
  (bo_invpoly1 gvar_178_c_projet_md_typeligne_st_txt_onsetfocus (laybib-newlay croisdyn-getparents sivpano-getnom))
  (setq sivpano-getnom (va_bande (dcl-grid-addrow (laybib-newlay ld_crois (polybib-lwvertices 'axedyn-reaccreate projet_md_typeligne_st_nom)) projet_md_typeligne_st_nom)))
  (bo_lctabs gvar_175_c_projet_md_typeligne_bt_new_onclicked blkbib-getparententities)
)

;; Original arg hints: EO_POLY, arg_2
;; Referenced symbols: C:PROJET/MD_TYPELIGNE/ST_TXT#ONSETFOCUS, EO_POLY, PROJET/MD_TYPELIGNE/ST_NOM, DCL-GRID-ADDROW, BO_INVPOLY1, LS_SOM0
(defun c:projet_md_geststylechem-signa_st_mod_onselchanged (eo_poly arg_2)
  (metquantprix gvar_178_c_projet_md_typeligne_st_txt_onsetfocus)
  (ls_polys gvar_178_c_projet_md_typeligne_st_txt_onsetfocus (va_bande (dcl-grid-addrow eo_poly_2 projet_md_typeligne_st_nom)))
  (bo_invpoly1 gvar_178_c_projet_md_typeligne_st_txt_onsetfocus 0)
  (ls_som0)
)

;; Referenced symbols: C:PROJET/MD_TYPELIGNE/BT_OK#ONCLICKED, ENTDEL, GROUPBIB-LISTOBJ, C:PROJET/MD_TYPELIGNE/BT_NEW#ONCLICKED, PROJET/MD_TYPELIGNE/ST_DESC, AXEDYN-REACCREATE, C:PROJET/MD_TYPELIGNE/ST_NOM#ONSETFOCUS, POLYBIB-LWVERTICES, DCL-GRID-ADDROW, C:PROJET/MD_TYPELIGNE/ST_DESC#ONSETFOCUS
;; Referenced strings: TEXTE, re_rayee, Repère
(defun c:projet_md_geststylechem-signa_bt_ok_onclicked ()
  (entdel 'c:projet_md_typeligne_bt_ok_onclicked)
  (setq gvar_2408 (groupbib-listobj (errbib-catchapply gvar_173)))
  (setq blkbib-getparententities (errbib-catchapply gvar_175_c_projet_md_typeligne_bt_new_onclicked))
  (setq gvar_2406 (dcl-grid-addrow (ls_props2 projet_md_typeligne_st_desc) (polybib-lwvertices 'axedyn-reaccreate gvar_181_c_projet_md_typeligne_st_nom_onsetfocus)))
  (setq ld_crois (dcl-grid-addrow (ls_props2 gvar_179_c_projet_md_typeligne_st_desc_onsetfocus) (polybib-lwvertices 'axedyn-reaccreate projet_md_typeligne_st_nom)))
  (setq croisdyn-getparents (dcl-grid-addrow (ls_props2 gvar_178_c_projet_md_typeligne_st_txt_onsetfocus) (va_bande (dcl-grid-addrow (ls_props2 gvar_179_c_projet_md_typeligne_st_desc_onsetfocus) projet_md_typeligne_st_nom))))
  (setq gvar_2827 (dcl-grid-addrow (ls_props2 gvar_177_c_projet_md_typeligne_st_mod_onsetfocus) (es_ext '(va_point re_abs pt_base pt_1 pt_2 re_abs1 re_abs2) 'ha_poly 'en_poly)))
  (setq re_rayei (es_ext (groupbib-list 'st_type "TEXTE") (groupbib-list "re_rayee" gvar_2408) (groupbib-list "Repère" blkbib-getparententities) (groupbib-list 'ls_croiselems gvar_2827) (groupbib-list "re_rayie" gvar_2406) (groupbib-list "ha_contour" ld_crois) (groupbib-list 'croisdyn-set croisdyn-getparents)))
  (re_abs1 taldyn-get 1)
)

;; Referenced symbols: TALDYN-GET
(defun c:projet_md_geststylechem-signa_bt_cancel_onclicked ()
  (re_abs1 taldyn-get 2)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: PROJET/MD_GESTSTYLECHEM-BORD/RE_COTE, ENTDEL, EN_RAYON, RE_COURANT, LS_OBJ, PROJET/MD_TYPELIGNE/ST_MSG, GROUPBIB-LIST, ST_BTN, ES_EXT
;; Referenced strings: LTYPE, Repère, Nom déja existant
(defun stylepoly-get (en_rayon)
  (entdel 'projet_md_geststylechem-bord_re_cote)
  (re_courant "LTYPE" en_rayon_2)
  (if (and en_rayon_2 (setq gvar_2519 (re_courant "LTYPE" en_rayon_2)))
    (progn
      gvar_2519
    )
    (progn
      (es_ext (groupbib-list 'ls_obj 'projet_md_typeligne_st_msg) (groupbib-list "Repère" 'st_btn) (groupbib-list "Nom déja existant" '(lambda (ls_filter) (cons (itoa (car ls_filter)) (cdr ls_filter)))))
    )
  )
)

;; Referenced symbols: AXEDYN-SETRAYEXT, CADR, PROJET/MD_TYPELIGNE/ST_MSG, ST_BTN, PROJET/MD_GESTSTYLECHEM-HACH/RE_OFFSET, PROJET/MD_GESTSTYLECHEM-HACH/RE_OFFSET2, HA_POLYEXT, REPDYN-GETPOINT, PROJET/MD_GESTSTYLECHEM-BORD/ST_STYLE
;; Referenced strings: LTYPE, ls_ray
(defun stylepoly-list ( / local_0 local_1)
  (if (cadr (axedyn-setrayext "LTYPE"))
    (progn
      (projet_md_typeligne_st_msg 'projet_md_typeligne_st_msg 'st_btn '(lambda (ls_filter) (cons (itoa (car ls_filter)) (cdr ls_filter))))
    )
  )
  (axedyn-setrayext "LTYPE")
  ;; init-args 5: 'projet_md_geststylechem-hach_re_offset, local_0, 'projet_md_geststylechem-hach_re_offset2, local_1
  (repdyn-getpoint (ha_polyext projet_md_geststylechem-hach_re_offset) (ha_polyext projet_md_geststylechem-hach_re_offset2))
  (projet_md_geststylechem-bord_st_style (projet_md_geststylechem-hach_re_offset2 "ls_ray"))
)

;; Original arg hints: IN_LON0, BLKBIB-GETPARENTENTITIES, arg_3
;; Referenced symbols: /, ST_AXEID, LS_OBJ, IN_LON0, GROUPBIB-LIST, BLKBIB-GETPARENTENTITIES, ES_EXT, INTERS, dcl-control-setenabled, RTOS
;; Referenced strings: LTYPE, Repère, Nom déja existant
(defun stylepoly-add (in_lon0 blkbib-getparententities arg_3)
  (rtos "LTYPE" (dcl-control-setenabled inters) gvar_167)
  (setq inters (st_axeid (/ "LTYPE")))
  (setq gvar_167 (es_ext (groupbib-list 'ls_obj in_lon0_2) (groupbib-list "Repère" blkbib-getparententities_2) (groupbib-list "Nom déja existant" gvar_168)))
  inters
)

;; Original arg hints: LS_AXE
;; Referenced symbols: C:PROJET/MD_APERCU#ONCLOSE, ENTDEL, LS_AXE, POLYDYN-MAKESOM, IN_PARAM, GROUPBIB-LIST, ES_EXT, POLYBIB_GEOM-BULGE2RADIUS
;; Referenced strings: Repère
(defun stylepoly-id2props (ls_axe)
  (entdel 'c:projet_md_apercu_onclose)
  (setq gvar_2519 (polydyn-makesom ls_axe_2))
  (setq polybib_geom-bulge2radius (es_ext (groupbib-list 8 (in_param gvar_2519 "Repère")) (groupbib-list 62 256)))
  polybib_geom-bulge2radius
)

;; Original arg hints: C:PROJET/MD_APERCU/VUEBLOCS1#ONCLICKED, LS_AXE
;; Referenced symbols: C:PROJET/MD_TYPELIGNE/BT_CLOSE#ONCLICKED, ENTDEL, LS_DIST, C:PROJET/MD_APERCU/VUEBLOCS1#ONCLICKED, HA_POLYEXT, HA_POLY2, POLYBIB-LWVERTICES, LS_AXE, AXEDYN-REACCREATE, BO_INVPOLY1
(defun stylepoly-fillcombo (c_projet_md_apercu_vueblocs1_onclicked ls_axe)
  (entdel 'c:projet_md_typeligne_bt_close_onclicked)
  (metquantprix gvar_165_c_projet_md_apercu_vueblocs1_onclicked)
  (setq ha_poly2 (ls_dist))
  (if gvar_165_c_projet_md_apercu_vueblocs1_onclicked
    (progn
      (ls_polys gvar_165_c_projet_md_apercu_vueblocs1_onclicked (polybib-lwvertices 'ha_polyext ha_poly2))
      (if (and ls_axe_2 (laybib-newlay ls_axe_2 (polybib-lwvertices 'axedyn-reaccreate ha_poly2)))
        (progn
          (bo_invpoly1 gvar_165_c_projet_md_apercu_vueblocs1_onclicked (laybib-newlay ls_axe_2 (polybib-lwvertices 'axedyn-reaccreate ha_poly2)))
        )
        (progn
          (bo_invpoly1 gvar_165_c_projet_md_apercu_vueblocs1_onclicked 0)
        )
      )
    )
    (progn
      nil
    )
  )
)

;; Referenced symbols: ENTDEL, LS_DIST, BO_TAG, LS_SOM0, PROJET/MD_TYPELIGNE/INTITULE7, LS_DEBFINRAD, C:PROJET/MD_TYPELIGNE/ST_STYLELIGNE#ONSELCHANGED, TYPELINEBIB-MAKEPREVIEW, *REACTOR2*, EN_INT2DC
;; Referenced strings: ls_ent, ha_ext, ha_Group
(defun stylepoly-go ( / local_0 local_1)
  (entdel '(bo_tag))
  (bo_tag)
  (bo_tag nil)
  (setq va_parent (ls_dist))
  (ls_som0)
  (ls_debfinrad 'projet_md_typeligne_intitule7)
  (setq projet_md_typeligne_intitule7 "ls_ent")
  (entdel 'c:projet_md_typeligne_st_styleligne_onselchanged)
  (*reactor2* typelinebib-makepreview)
  (vlr-command-reactor typelinebib-makepreview (polybib-lwvertices 'en_int2dc va_parent))
  (setq gvar_162 "ha_ext")
  ;; init-args 3: 'covassbib-getmanhole, local_0
  (vlax-vla-object->ename gvar_157 covassbib-getmanhole)
  (vlax-vla-object->ename gvar_156 covassbib-getmanhole)
  (vlax-vla-object->ename gvar_155 covassbib-getmanhole)
  (vlax-vla-object->ename gvar_154 covassbib-getmanhole)
  (vlax-vla-object->ename gvar_154 covassbib-getmanhole)
  (vlax-vla-object->ename gvar_153 (cadr covassbib-getmanhole))
  (vlax-vla-object->ename gvar_152 (cadr covassbib-getmanhole))
  (vlax-vla-object->ename gvar_151 (cadr covassbib-getmanhole))
  (vlax-vla-object->ename typelinebib-makepreview (cadr covassbib-getmanhole))
  (vlax-vla-object->ename gvar_150 (cadr covassbib-getmanhole))
  (setq bo_tag "ha_Group")
  ;; init-args 5: 'eo_poly, local_0, "LinetypeGeneration", local_1
  (entdel "Tag avec creux")
  (bo_lctabs gvar_156 blkbib-getparententities)
  (ls_lines gvar_155 gvar_168)
  (bo_lctabs gvar_157 in_lon0)
  (vlax-vla-object->ename gvar_151 polybib-vtxjoin)
  (vlax-vla-object->ename gvar_150 (cadr (ls_ext2 re_yinv 'metbib-metzgo)))
  (setq gvar_2519 (dcl-grid-addrow eo_poly va_parent))
  (setq re_yinv (axedyn-reaccreate gvar_2519))
  (setq in_lon0 (in_param (eo_polyabs gvar_2519) 'ls_obj))
  (setq blkbib-getparententities (in_param (eo_polyabs gvar_2519) "Repère"))
  (setq gvar_168 (in_param (eo_polyabs gvar_2519) "Nom déja existant"))
  (ls_som0)
  (ls_debfinrad "Tag sans creux")
  (setq gvar_148 'vla-get-handle)
  (entdel "5")
  (ls_parentconf "LTYPE" re_yinv)
  (bo_tag)
  (setq va_parent (ls_dist))
  (ls_som0)
  (ls_debfinrad "Réseau inconnu")
  (setq gvar_146 "va_deb")
  (bo_tag polybib-vtxjoin)
  (en_hatch gvar_157)
  (ls_entnew gvar_157 0 255)
  (ls_som0)
  (ls_debfinrad "Réseau abandonné")
  (setq gvar_145 "re_abs")
  (bo_tag polybib-vtxjoin)
  (bo_lctabs gvar_157 'projet_md_geststylepoly_btn_edit)
  (ls_lines gvar_156 'st_btn)
  (ls_lines gvar_155 '(lambda (ls_filter) (cons (itoa (car ls_filter)) (cdr ls_filter))))
  (en_hatch gvar_157)
  (ls_entnew gvar_157 0 255)
  (setq re_yinv (dcl-control-setenabled (st_axeid (/ "LTYPE"))))
  (ls_som0)
  (ls_debfinrad "Un texte")
  (setq gvar_144 'ld_axe)
  (entdel "Deux textes")
  (rtos "LTYPE" re_yinv gvar_167)
  (bo_tag)
  (errbib-catchapply gvar_157)
  (errbib-catchapply gvar_156)
  (errbib-catchapply gvar_155)
  (es_ext (groupbib-list 'ls_obj in_lon0) (groupbib-list "Repère" blkbib-getparententities) (groupbib-list "Nom déja existant" gvar_168))
  (setq va_parent (ls_dist))
  T
  (and (setq in_lon0 (errbib-catchapply gvar_157)) (st_blkbase (sivpano-dial-search in_lon0) 1) (setq blkbib-getparententities (errbib-catchapply gvar_156)) (setq gvar_168 (errbib-catchapply gvar_155)) (setq gvar_167 (es_ext (groupbib-list 'ls_obj in_lon0) (groupbib-list "Repère" blkbib-getparententities) (groupbib-list "Nom déja existant" gvar_168))) (bo_tag nil))
  (ls_debfinrad "Réseaux")
  (setq gvar_142 'itoa)
  (re_abs1 gvar_141 1)
  (ls_debfinrad 'ls_theme)
  (vlax-erased-p gvar_141)
  (setq ls_theme '(ld_axe ha_axe ls_ray ls_som ls_ext ls_raymax ls_ent ha_group ls_vtxsaxe inc ss_group re_rayon pt_a pt_b pt_c en_rac))
  (setq va_parent nil)
  (setq re_yinv nil)
  (ls_som0)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: PROJET/MD_GESTSTYLECHEM-BORD/RE_COTE, ENTDEL, EN_RAYON, RE_COURANT, LS_OBJ, PROJET/MD_TYPELIGNE/ST_MSG, GROUPBIB-LIST, ST_BTN, PROJET/MD_SELFORCE/RE_COLOR, C:PROJET/PA_RESDYN/BT_CALQUE#ONCLICKED
;; Referenced strings: Repère
(defun stylerep-get (en_rayon)
  (entdel 'projet_md_geststylechem-bord_re_cote)
  (re_courant '((cons 160057 160136) (cons 160015 160037) (cons 159981 159995) (cons 159872 159961) (cons 159633 159861) (cons 159581 159613) (cons 159550 159561) (cons 159512 159530) (cons 159474 159492) (cons 159436 159454) (cons 159398 159416) (cons 159355 159378) (cons 159125 159335) (cons 159029 159105) (cons 159009 160606) (cons 158980 159009) (cons 158907 158980) (cons 158666 158907) (cons 158636 158666) (cons 158601 158636) (cons 158583 158601) (cons 158359 158583) (cons 158327 158359) (cons 157400 158327) (cons 157242 157400) (cons 156941 157242) (cons 156903 156941) (cons 156874 156903) (cons 156860 156874) (cons 156799 156821) (cons 156767 156779) (cons 156544 156747) (cons 156468 156524) (cons 156305 156448) (cons 156187 156285) (cons 156125 156167) (cons 156076 156105) (cons 155840 156056) (cons 155779 155820) (cons 155623 155768) (cons 155490 155612) (cons 155470 156860) (cons 155350 155470) (cons 155287 155332) (cons 155226 155260) (cons 155168 155350) (cons 155060 155168) (cons 155003 155019) (cons 154805 154983) (cons 154686 154785) (cons 154624 154666) (cons 154554 154604) (cons 154340 154534) (cons 154167 154329) (cons 154109 154156) (cons 154057 154089) (cons 154037 155060) (cons 153872 154037) (cons 153792 153872) (cons 153682 153792) (cons 153622 153667) (cons 153566 153682) (cons 153458 153566) (cons 153442 153458) (cons 153180 153442) (cons 153106 153180) (cons 152653 153106) (cons 152581 152653) (cons 152565 152581) (cons 152474 152565) (cons 152314 152474) (cons 152298 152314) (cons 152030 152298) (cons 151937 152030) (cons 151915 151937) (cons 151770 151915) (cons 151644 151746) (cons 151541 151624) (cons 151466 151521) (cons 151391 151446) (cons 151316 151371) (cons 151228 151296) (cons 151075 151208) (cons 150795 151064) (cons 150355 150784) (cons 150319 150335) (cons 150274 150299) (cons 149934 150254) (cons 149859 149914) (cons 149825 149839) (cons 149668 149805) (cons 149543 149648) (cons 149392 149523) (cons 149272 149381) (cons 149220 149252) (cons 149210 151770) (cons 149082 149210) (cons 149044 149082) (cons 148963 149044) (cons 148884 148945) (cons 148740 148963) (cons 148697 148713) (cons 148642 148677) (cons 148377 148622) (cons 148273 148357) (cons 148236 148253) (cons 148106 148216) (cons 147954 148086) (cons 147922 147934) (cons 147387 147902) (cons 147268 147367) (cons 146513 147248) (cons 146475 146493) (cons 146437 146455) (cons 146399 146417) (cons 146337 146379) (cons 146248 146317) (cons 146192 146228) (cons 146016 146172) (cons 145922 145996) (cons 145729 145902) (cons 145659 145718) (cons 145504 145648) (cons 145254 145493) (cons 145144 145243) (cons 145124 148740) (cons 144936 145124) (cons 144855 144936) (cons 144792 144837) (cons 144703 144855) (cons 144551 144703) (cons 144400 144551) (cons 144169 144400) (cons 144056 144169) (cons 143818 144056) (cons 143691 143818) (cons 143632 143691) (cons 143376 143632) (cons 143067 143376) (cons 142986 143067) (cons 142880 142986) (cons 142715 142880) (cons 142287 142715) (cons 141993 142039) (cons 141771 141973) (cons 141713 141751) (cons 141675 141693) (cons 141506 141664) (cons 141393 141486) (cons 141241 141373) (cons 141153 141230) (cons 141037 141133) (cons 140933 141017) (cons 140668 140913) (cons 140332 140657) (cons 140179 140312) (cons 140053 142287) (cons 139810 140053) (cons 139772 139810) (cons 139756 139772) (cons 139740 139756) (cons 139649 139740) (cons 139592 139649) (cons 139535 139592) (cons 139179 139535) (cons 139047 139179) (cons 138935 139047) (cons 138645 138935) (cons 138391 138645) (cons 138192 138391) (cons 137627 138192) (cons 137171 137627) (cons 136723 137171) (cons 136167 136723) (cons 135993 136167) (cons 135627 135993) (cons 135347 135627) (cons 135311 135347) (cons 135273 135311) (cons 135244 135273) (cons 135230 135244) (cons 135201 135230) (cons 135154 135201) (cons 135045 135154) (cons 134939 135045) (cons 134833 134939) (cons 134727 134833) (cons 134709 134727) (cons 134691 134709) (cons 134622 134691) (cons 134347 134622) (cons 134309 134347) (cons 133498 134309) (cons 131945 133498) (cons 131669 131945) (cons 131464 131669) (cons 131295 131464) (cons 130964 131295) (cons 130950 130964) (cons 130912 130950) (cons 130883 130912) (cons 130869 130883) (cons 130723 130836) (cons 130559 130703) (cons 130352 130539) (cons 130155 130869) (cons 130118 130155) (cons 130040 130118) (cons 129971 130040) (cons 129744 129971) (cons 129612 129744) (cons 129142 129612) (cons 129110 129142) (cons 128362 128830) (cons 128291 129110) (cons 127764 128291) (cons 127755 127764) (cons 127603 127755) (cons 127460 127603) (cons 127302 127460) (cons 127013 127302) (cons 126975 127013) (cons 126946 126975) (cons 126932 126946) (cons 126766 126932) (cons 126708 126766) (cons 126618 126708) (cons 126243 126618) (cons 126184 126243) (cons 126173 126184) (cons 125882 126173) (cons 125864 125882) (cons 125846 125864) (cons 125828 125846) (cons 125810 125828) (cons 125792 125810) (cons 125751 125792) (cons 125726 125751) (cons 125654 125726) (cons 125623 125654) (cons 125022 125623) (cons 124953 125022) (cons 124303 124953) (cons 124265 124303) (cons 123656 124265) (cons 122913 123656) (cons 122303 122913) (cons 122145 122303) (cons 121670 122145) (cons 121632 121670) (cons 121603 121632) (cons 121589 121603) (cons 121444 121589) (cons 121252 121444) (cons 121233 121252) (cons 121217 121233) (cons 120197 121217) (cons 119780 120197) (cons 119499 119780) (cons 118725 119499) (cons 118560 118725) (cons 118187 118560) (cons 117951 118187) (cons 117762 117951) (cons 117187 117762) (cons 116053 117187) (cons 115853 116053) (cons 115664 115853) (cons 115514 115664) (cons 115393 115514) (cons 115035 115393) (cons 114997 115035) (cons 114968 114997) (cons 114954 114968) (cons 114925 114954) (cons 114819 114925) (cons 114669 114819) (cons 114439 114669) (cons 114209 114439) (cons 114191 114209) (cons 113935 114191) (cons 113897 113935) (cons 113528 113897) (cons 113253 113528) (cons 112435 113253) (cons 111704 112435) (cons 111666 111704) (cons 111637 111666) (cons 111623 111637) (cons 111058 111176) (cons 110815 111047) (cons 110502 110804) (cons 110189 110491) (cons 109964 110178) (cons 109749 109953) (cons 109523 109738) (cons 109274 109512) (cons 109049 109263) (cons 109014 111623) (cons 108961 109014) (cons 108687 108961) (cons 108385 108687) (cons 108321 108385) (cons 108263 108321) (cons 108001 108263) (cons 107544 108001) (cons 107520 107544) (cons 107083 107520) (cons 106578 107083) (cons 106183 106578) (cons 105759 106183) (cons 104942 105759) (cons 104672 104942) (cons 104440 104672) (cons 103671 104440) (cons 103310 103671) (cons 102920 103310) (cons 102818 102920) (cons 102781 102818) (cons 102677 102781) (cons 102444 102677) (cons 102064 102444) (cons 102046 102064) (cons 102028 102046) (cons 102010 102028) (cons 101992 102010) (cons 101785 101992) (cons 101591 101785) (cons 101577 101591) (cons 101550 101577) (cons 101229 101550) (cons 101051 101229) (cons 99879 101051) (cons 99815 99879) (cons 99509 99815) (cons 99313 99509) (cons 99073 99313) (cons 98595 99073) (cons 98174 98595) (cons 97934 98174) (cons 97787 97934) (cons 96110 97787) (cons 95955 96110) (cons 95721 95955) (cons 95551 95721) (cons 95159 95551) (cons 94807 95159) (cons 94494 94807) (cons 94045 94494) (cons 93996 94045) (cons 93807 93996) (cons 93594 93807) (cons 93556 93594) (cons 93527 93556) (cons 93513 93527) (cons 93415 93465) (cons 93368 93395) (cons 93261 93348) (cons 93004 93241) (cons 92975 93513) (cons 92877 92975) (cons 92785 92877) (cons 92769 92785) (cons 92752 92769) (cons 92725 92752) (cons 92667 92725) (cons 92647 92667) (cons 92580 92647) (cons 92452 92580) (cons 92124 92452) (cons 90651 92124) (cons 90495 90651) (cons 90273 90495) (cons 90205 90273) (cons 90135 90205) (cons 89973 90135) (cons 89901 89973) (cons 89463 89901) (cons 89434 89463) (cons 89254 89434) (cons 89225 89254) (cons 89009 89225) (cons 88828 89009) (cons 88647 88828) (cons 88377 88647) (cons 87867 88377) (cons 87494 87867) (cons 86354 87494) (cons 86319 86354) (cons 85749 86319) (cons 85581 85749) (cons 85200 85581) (cons 85151 85200) (cons 84652 85151) (cons 84423 84652) (cons 84133 84423) (cons 83802 84133) (cons 83450 83802) (cons 83049 83450) (cons 82985 83049) (cons 82808 82985) (cons 82794 82808) (cons 82486 82794) (cons 82324 82486) (cons 82191 82324) (cons 81864 82191) (cons 81740 81864) (cons 81513 81740) (cons 81322 81513) (cons 80931 81322) (cons 80319 80931) (cons 79935 80319) (cons 79800 79935) (cons 79618 79800) (cons 79171 79618) (cons 79005 79054) (cons 78885 78985) (cons 78849 78865) (cons 78811 78829) (cons 78773 78791) (cons 78603 78753) (cons 78562 79171) (cons 78546 78562) (cons 78393 78546) (cons 77922 78393) (cons 77785 77922) (cons 77258 77785) (cons 76632 77258) (cons 76603 76632) (cons 76263 76603) (cons 75612 76263) (cons 75549 75612) (cons 75394 75549) (cons 75250 75394) (cons 75090 75250) (cons 74876 75090) (cons 74680 74876) (cons 74592 74680) (cons 74440 74592) (cons 74307 74440) (cons 74193 74307) (cons 73977 74193) (cons 73723 73977) (cons 73541 73723) (cons 73488 73541) (cons 73354 73488) (cons 73282 73354) (cons 73165 73282) (cons 73056 73165) (cons 72750 73056) (cons 72734 72750) (cons 72625 72734) (cons 72580 72625) (cons 72525 72580) (cons 72470 72525) (cons 72296 72470) (cons 71573 72296) (cons 71512 71573) (cons 71496 71512) (cons 71480 71496) (cons 71464 71480) (cons 71447 71464) (cons 71332 71447) (cons 71100 71332) (cons 70977 71100) (cons 70825 70977) (cons 70509 70825) (cons 70468 70509) (cons 70121 70147) (cons 69647 70101) (cons 69591 69627) (cons 69535 69571) (cons 69460 69515) (cons 68268 69440) (cons 68232 68248) (cons 68194 68212) (cons 68156 68174) (cons 68109 70468) (cons 67577 68109) (cons 67286 67577) (cons 67189 67286) (cons 66641 67189) (cons 64343 66641) (cons 62808 64343) (cons 62482 62808) (cons 62115 62482) (cons 61791 62115) (cons 61561 61791) (cons 61186 61561) (cons 61063 61186) (cons 60683 61063) (cons 60382 60683) (cons 60108 60382) (cons 59909 60108) (cons 59612 59909) (cons 59315 59612) (cons 59018 59315) (cons 58739 59018) (cons 58543 58739) (cons 58004 58543) (cons 57412 58004) (cons 56866 57412) (cons 56379 56866) (cons 55906 56379) (cons 55757 55906) (cons 55238 55757) (cons 54458 55238) (cons 54442 54458) (cons 54141 54442) (cons 54070 54141) (cons 53934 54070) (cons 53122 53934) (cons 53083 53122) (cons 52572 53083) (cons 52148 52572) (cons 51906 52148) (cons 51501 51906) (cons 51298 51501) (cons 51237 51298) (cons 51064 51237) (cons 50859 51064) (cons 50715 50859) (cons 50550 50715) (cons 50386 50550) (cons 50220 50386) (cons 49985 50220) (cons 49932 49985) (cons 48949 49932) (cons 48910 48949) (cons 48421 48910) (cons 48379 48421) (cons 48338 48379) (cons 48113 48338) (cons 48068 48113) (cons 48023 48068) (cons 47978 48023) (cons 47933 47978) (cons 47498 47933) (cons 47253 47498) (cons 47221 47253) (cons 46464 47221) (cons 45590 46464) (cons 44721 45590) (cons 43281 44721) (cons 42941 43281) (cons 42868 42941) (cons 42554 42868) (cons 42516 42554) (cons 42410 42516) (cons 42396 42410) (cons 41950 42396) (cons 41232 41950) (cons 40442 41232) (cons 39931 40442) (cons 39541 39931) (cons 39497 39541) (cons 39459 39497) (cons 39387 39459) (cons 39207 39387) (cons 39037 39207) (cons 38745 39037) (cons 38713 38745) (cons 38396 38713) (cons 38157 38396) (cons 37656 38157) (cons 37423 37656) (cons 36940 37423) (cons 34753 36940) (cons 34595 34753) (cons 34276 34595) (cons 34238 34276) (cons 34132 34238) (cons 34118 34132) (cons 34089 34118) (cons 34017 34089) (cons 33837 34017) (cons 33807 33837) (cons 33512 33807) (cons 33480 33512) (cons 33248 33480) (cons 32715 33248) (cons 31684 32715) (cons 30753 31684) (cons 30263 30753) (cons 30001 30263) (cons 29784 30001) (cons 29588 29784) (cons 29430 29588) (cons 29111 29430) (cons 29073 29111) (cons 29044 29073) (cons 29030 29044) (cons 28784 29029) (cons 28651 28784) (cons 28578 28606) (cons 28481 28558) (cons 28374 28461) (cons 28291 28354) (cons 28135 28271) (cons 28027 28124) (cons 27580 28007) (cons 27525 27560) (cons 27470 27505) (cons 27394 27450) (cons 27368 28651) (cons 26886 27368) (cons 26496 26886) (cons 26005 26496) (cons 25748 26005) (cons 24908 25748) (cons 24660 24908) (cons 24258 24660) (cons 23643 24258) (cons 23318 23643) (cons 22923 23318) (cons 22494 22923) (cons 22263 22494) (cons 21735 22263) (cons 20632 21735) (cons 20182 20632) (cons 19630 20182) (cons 18248 19630) (cons 17937 18248) (cons 17884 17937) (cons 16657 17884) (cons 16485 16657) (cons 16372 16485) (cons 16337 16372) (cons 15999 16337) (cons 15444 15999) (cons 15306 15444) (cons 15288 15306) (cons 15153 15288) (cons 15034 15153) (cons 14698 15034) (cons 14557 14698) (cons 14232 14557) (cons 14203 14232) (cons 13936 14203) (cons 13851 13936) (cons 13631 13851) (cons 13587 13631) (cons 13555 13587) (cons 13231 13555) (cons 13085 13231) (cons 12391 13085) (cons 11998 12391) (cons 11511 11998) (cons 10871 11511) (cons 10553 10871) (cons 10472 10553) (cons 9233 10472) (cons 7902 9233) (cons 6842 7902) (cons 6597 6842) (cons 6559 6597) (cons 6530 6559) (cons 6516 6530) (cons 6498 6516) (cons 6340 6498) (cons 5992 6340) (cons 5943 5992) (cons 5772 5943) (cons 5315 5772) (cons 5181 5315) (cons 5129 5181) (cons 4920 5129) (cons 4261 4920) (cons 3682 4261) (cons 3021 3682) (cons 2883 3021) (cons 2540 2883) (cons 2342 2540) (cons 1184 2342) (cons 703 1184) (cons 665 703) (cons 636 665) (cons 622 636) (cons 377 622) (cons 1 377)) en_rayon_2)
  (if (and en_rayon_2 (setq gvar_2519 (re_courant '((cons 160057 160136) (cons 160015 160037) (cons 159981 159995) (cons 159872 159961) (cons 159633 159861) (cons 159581 159613) (cons 159550 159561) (cons 159512 159530) (cons 159474 159492) (cons 159436 159454) (cons 159398 159416) (cons 159355 159378) (cons 159125 159335) (cons 159029 159105) (cons 159009 160606) (cons 158980 159009) (cons 158907 158980) (cons 158666 158907) (cons 158636 158666) (cons 158601 158636) (cons 158583 158601) (cons 158359 158583) (cons 158327 158359) (cons 157400 158327) (cons 157242 157400) (cons 156941 157242) (cons 156903 156941) (cons 156874 156903) (cons 156860 156874) (cons 156799 156821) (cons 156767 156779) (cons 156544 156747) (cons 156468 156524) (cons 156305 156448) (cons 156187 156285) (cons 156125 156167) (cons 156076 156105) (cons 155840 156056) (cons 155779 155820) (cons 155623 155768) (cons 155490 155612) (cons 155470 156860) (cons 155350 155470) (cons 155287 155332) (cons 155226 155260) (cons 155168 155350) (cons 155060 155168) (cons 155003 155019) (cons 154805 154983) (cons 154686 154785) (cons 154624 154666) (cons 154554 154604) (cons 154340 154534) (cons 154167 154329) (cons 154109 154156) (cons 154057 154089) (cons 154037 155060) (cons 153872 154037) (cons 153792 153872) (cons 153682 153792) (cons 153622 153667) (cons 153566 153682) (cons 153458 153566) (cons 153442 153458) (cons 153180 153442) (cons 153106 153180) (cons 152653 153106) (cons 152581 152653) (cons 152565 152581) (cons 152474 152565) (cons 152314 152474) (cons 152298 152314) (cons 152030 152298) (cons 151937 152030) (cons 151915 151937) (cons 151770 151915) (cons 151644 151746) (cons 151541 151624) (cons 151466 151521) (cons 151391 151446) (cons 151316 151371) (cons 151228 151296) (cons 151075 151208) (cons 150795 151064) (cons 150355 150784) (cons 150319 150335) (cons 150274 150299) (cons 149934 150254) (cons 149859 149914) (cons 149825 149839) (cons 149668 149805) (cons 149543 149648) (cons 149392 149523) (cons 149272 149381) (cons 149220 149252) (cons 149210 151770) (cons 149082 149210) (cons 149044 149082) (cons 148963 149044) (cons 148884 148945) (cons 148740 148963) (cons 148697 148713) (cons 148642 148677) (cons 148377 148622) (cons 148273 148357) (cons 148236 148253) (cons 148106 148216) (cons 147954 148086) (cons 147922 147934) (cons 147387 147902) (cons 147268 147367) (cons 146513 147248) (cons 146475 146493) (cons 146437 146455) (cons 146399 146417) (cons 146337 146379) (cons 146248 146317) (cons 146192 146228) (cons 146016 146172) (cons 145922 145996) (cons 145729 145902) (cons 145659 145718) (cons 145504 145648) (cons 145254 145493) (cons 145144 145243) (cons 145124 148740) (cons 144936 145124) (cons 144855 144936) (cons 144792 144837) (cons 144703 144855) (cons 144551 144703) (cons 144400 144551) (cons 144169 144400) (cons 144056 144169) (cons 143818 144056) (cons 143691 143818) (cons 143632 143691) (cons 143376 143632) (cons 143067 143376) (cons 142986 143067) (cons 142880 142986) (cons 142715 142880) (cons 142287 142715) (cons 141993 142039) (cons 141771 141973) (cons 141713 141751) (cons 141675 141693) (cons 141506 141664) (cons 141393 141486) (cons 141241 141373) (cons 141153 141230) (cons 141037 141133) (cons 140933 141017) (cons 140668 140913) (cons 140332 140657) (cons 140179 140312) (cons 140053 142287) (cons 139810 140053) (cons 139772 139810) (cons 139756 139772) (cons 139740 139756) (cons 139649 139740) (cons 139592 139649) (cons 139535 139592) (cons 139179 139535) (cons 139047 139179) (cons 138935 139047) (cons 138645 138935) (cons 138391 138645) (cons 138192 138391) (cons 137627 138192) (cons 137171 137627) (cons 136723 137171) (cons 136167 136723) (cons 135993 136167) (cons 135627 135993) (cons 135347 135627) (cons 135311 135347) (cons 135273 135311) (cons 135244 135273) (cons 135230 135244) (cons 135201 135230) (cons 135154 135201) (cons 135045 135154) (cons 134939 135045) (cons 134833 134939) (cons 134727 134833) (cons 134709 134727) (cons 134691 134709) (cons 134622 134691) (cons 134347 134622) (cons 134309 134347) (cons 133498 134309) (cons 131945 133498) (cons 131669 131945) (cons 131464 131669) (cons 131295 131464) (cons 130964 131295) (cons 130950 130964) (cons 130912 130950) (cons 130883 130912) (cons 130869 130883) (cons 130723 130836) (cons 130559 130703) (cons 130352 130539) (cons 130155 130869) (cons 130118 130155) (cons 130040 130118) (cons 129971 130040) (cons 129744 129971) (cons 129612 129744) (cons 129142 129612) (cons 129110 129142) (cons 128362 128830) (cons 128291 129110) (cons 127764 128291) (cons 127755 127764) (cons 127603 127755) (cons 127460 127603) (cons 127302 127460) (cons 127013 127302) (cons 126975 127013) (cons 126946 126975) (cons 126932 126946) (cons 126766 126932) (cons 126708 126766) (cons 126618 126708) (cons 126243 126618) (cons 126184 126243) (cons 126173 126184) (cons 125882 126173) (cons 125864 125882) (cons 125846 125864) (cons 125828 125846) (cons 125810 125828) (cons 125792 125810) (cons 125751 125792) (cons 125726 125751) (cons 125654 125726) (cons 125623 125654) (cons 125022 125623) (cons 124953 125022) (cons 124303 124953) (cons 124265 124303) (cons 123656 124265) (cons 122913 123656) (cons 122303 122913) (cons 122145 122303) (cons 121670 122145) (cons 121632 121670) (cons 121603 121632) (cons 121589 121603) (cons 121444 121589) (cons 121252 121444) (cons 121233 121252) (cons 121217 121233) (cons 120197 121217) (cons 119780 120197) (cons 119499 119780) (cons 118725 119499) (cons 118560 118725) (cons 118187 118560) (cons 117951 118187) (cons 117762 117951) (cons 117187 117762) (cons 116053 117187) (cons 115853 116053) (cons 115664 115853) (cons 115514 115664) (cons 115393 115514) (cons 115035 115393) (cons 114997 115035) (cons 114968 114997) (cons 114954 114968) (cons 114925 114954) (cons 114819 114925) (cons 114669 114819) (cons 114439 114669) (cons 114209 114439) (cons 114191 114209) (cons 113935 114191) (cons 113897 113935) (cons 113528 113897) (cons 113253 113528) (cons 112435 113253) (cons 111704 112435) (cons 111666 111704) (cons 111637 111666) (cons 111623 111637) (cons 111058 111176) (cons 110815 111047) (cons 110502 110804) (cons 110189 110491) (cons 109964 110178) (cons 109749 109953) (cons 109523 109738) (cons 109274 109512) (cons 109049 109263) (cons 109014 111623) (cons 108961 109014) (cons 108687 108961) (cons 108385 108687) (cons 108321 108385) (cons 108263 108321) (cons 108001 108263) (cons 107544 108001) (cons 107520 107544) (cons 107083 107520) (cons 106578 107083) (cons 106183 106578) (cons 105759 106183) (cons 104942 105759) (cons 104672 104942) (cons 104440 104672) (cons 103671 104440) (cons 103310 103671) (cons 102920 103310) (cons 102818 102920) (cons 102781 102818) (cons 102677 102781) (cons 102444 102677) (cons 102064 102444) (cons 102046 102064) (cons 102028 102046) (cons 102010 102028) (cons 101992 102010) (cons 101785 101992) (cons 101591 101785) (cons 101577 101591) (cons 101550 101577) (cons 101229 101550) (cons 101051 101229) (cons 99879 101051) (cons 99815 99879) (cons 99509 99815) (cons 99313 99509) (cons 99073 99313) (cons 98595 99073) (cons 98174 98595) (cons 97934 98174) (cons 97787 97934) (cons 96110 97787) (cons 95955 96110) (cons 95721 95955) (cons 95551 95721) (cons 95159 95551) (cons 94807 95159) (cons 94494 94807) (cons 94045 94494) (cons 93996 94045) (cons 93807 93996) (cons 93594 93807) (cons 93556 93594) (cons 93527 93556) (cons 93513 93527) (cons 93415 93465) (cons 93368 93395) (cons 93261 93348) (cons 93004 93241) (cons 92975 93513) (cons 92877 92975) (cons 92785 92877) (cons 92769 92785) (cons 92752 92769) (cons 92725 92752) (cons 92667 92725) (cons 92647 92667) (cons 92580 92647) (cons 92452 92580) (cons 92124 92452) (cons 90651 92124) (cons 90495 90651) (cons 90273 90495) (cons 90205 90273) (cons 90135 90205) (cons 89973 90135) (cons 89901 89973) (cons 89463 89901) (cons 89434 89463) (cons 89254 89434) (cons 89225 89254) (cons 89009 89225) (cons 88828 89009) (cons 88647 88828) (cons 88377 88647) (cons 87867 88377) (cons 87494 87867) (cons 86354 87494) (cons 86319 86354) (cons 85749 86319) (cons 85581 85749) (cons 85200 85581) (cons 85151 85200) (cons 84652 85151) (cons 84423 84652) (cons 84133 84423) (cons 83802 84133) (cons 83450 83802) (cons 83049 83450) (cons 82985 83049) (cons 82808 82985) (cons 82794 82808) (cons 82486 82794) (cons 82324 82486) (cons 82191 82324) (cons 81864 82191) (cons 81740 81864) (cons 81513 81740) (cons 81322 81513) (cons 80931 81322) (cons 80319 80931) (cons 79935 80319) (cons 79800 79935) (cons 79618 79800) (cons 79171 79618) (cons 79005 79054) (cons 78885 78985) (cons 78849 78865) (cons 78811 78829) (cons 78773 78791) (cons 78603 78753) (cons 78562 79171) (cons 78546 78562) (cons 78393 78546) (cons 77922 78393) (cons 77785 77922) (cons 77258 77785) (cons 76632 77258) (cons 76603 76632) (cons 76263 76603) (cons 75612 76263) (cons 75549 75612) (cons 75394 75549) (cons 75250 75394) (cons 75090 75250) (cons 74876 75090) (cons 74680 74876) (cons 74592 74680) (cons 74440 74592) (cons 74307 74440) (cons 74193 74307) (cons 73977 74193) (cons 73723 73977) (cons 73541 73723) (cons 73488 73541) (cons 73354 73488) (cons 73282 73354) (cons 73165 73282) (cons 73056 73165) (cons 72750 73056) (cons 72734 72750) (cons 72625 72734) (cons 72580 72625) (cons 72525 72580) (cons 72470 72525) (cons 72296 72470) (cons 71573 72296) (cons 71512 71573) (cons 71496 71512) (cons 71480 71496) (cons 71464 71480) (cons 71447 71464) (cons 71332 71447) (cons 71100 71332) (cons 70977 71100) (cons 70825 70977) (cons 70509 70825) (cons 70468 70509) (cons 70121 70147) (cons 69647 70101) (cons 69591 69627) (cons 69535 69571) (cons 69460 69515) (cons 68268 69440) (cons 68232 68248) (cons 68194 68212) (cons 68156 68174) (cons 68109 70468) (cons 67577 68109) (cons 67286 67577) (cons 67189 67286) (cons 66641 67189) (cons 64343 66641) (cons 62808 64343) (cons 62482 62808) (cons 62115 62482) (cons 61791 62115) (cons 61561 61791) (cons 61186 61561) (cons 61063 61186) (cons 60683 61063) (cons 60382 60683) (cons 60108 60382) (cons 59909 60108) (cons 59612 59909) (cons 59315 59612) (cons 59018 59315) (cons 58739 59018) (cons 58543 58739) (cons 58004 58543) (cons 57412 58004) (cons 56866 57412) (cons 56379 56866) (cons 55906 56379) (cons 55757 55906) (cons 55238 55757) (cons 54458 55238) (cons 54442 54458) (cons 54141 54442) (cons 54070 54141) (cons 53934 54070) (cons 53122 53934) (cons 53083 53122) (cons 52572 53083) (cons 52148 52572) (cons 51906 52148) (cons 51501 51906) (cons 51298 51501) (cons 51237 51298) (cons 51064 51237) (cons 50859 51064) (cons 50715 50859) (cons 50550 50715) (cons 50386 50550) (cons 50220 50386) (cons 49985 50220) (cons 49932 49985) (cons 48949 49932) (cons 48910 48949) (cons 48421 48910) (cons 48379 48421) (cons 48338 48379) (cons 48113 48338) (cons 48068 48113) (cons 48023 48068) (cons 47978 48023) (cons 47933 47978) (cons 47498 47933) (cons 47253 47498) (cons 47221 47253) (cons 46464 47221) (cons 45590 46464) (cons 44721 45590) (cons 43281 44721) (cons 42941 43281) (cons 42868 42941) (cons 42554 42868) (cons 42516 42554) (cons 42410 42516) (cons 42396 42410) (cons 41950 42396) (cons 41232 41950) (cons 40442 41232) (cons 39931 40442) (cons 39541 39931) (cons 39497 39541) (cons 39459 39497) (cons 39387 39459) (cons 39207 39387) (cons 39037 39207) (cons 38745 39037) (cons 38713 38745) (cons 38396 38713) (cons 38157 38396) (cons 37656 38157) (cons 37423 37656) (cons 36940 37423) (cons 34753 36940) (cons 34595 34753) (cons 34276 34595) (cons 34238 34276) (cons 34132 34238) (cons 34118 34132) (cons 34089 34118) (cons 34017 34089) (cons 33837 34017) (cons 33807 33837) (cons 33512 33807) (cons 33480 33512) (cons 33248 33480) (cons 32715 33248) (cons 31684 32715) (cons 30753 31684) (cons 30263 30753) (cons 30001 30263) (cons 29784 30001) (cons 29588 29784) (cons 29430 29588) (cons 29111 29430) (cons 29073 29111) (cons 29044 29073) (cons 29030 29044) (cons 28784 29029) (cons 28651 28784) (cons 28578 28606) (cons 28481 28558) (cons 28374 28461) (cons 28291 28354) (cons 28135 28271) (cons 28027 28124) (cons 27580 28007) (cons 27525 27560) (cons 27470 27505) (cons 27394 27450) (cons 27368 28651) (cons 26886 27368) (cons 26496 26886) (cons 26005 26496) (cons 25748 26005) (cons 24908 25748) (cons 24660 24908) (cons 24258 24660) (cons 23643 24258) (cons 23318 23643) (cons 22923 23318) (cons 22494 22923) (cons 22263 22494) (cons 21735 22263) (cons 20632 21735) (cons 20182 20632) (cons 19630 20182) (cons 18248 19630) (cons 17937 18248) (cons 17884 17937) (cons 16657 17884) (cons 16485 16657) (cons 16372 16485) (cons 16337 16372) (cons 15999 16337) (cons 15444 15999) (cons 15306 15444) (cons 15288 15306) (cons 15153 15288) (cons 15034 15153) (cons 14698 15034) (cons 14557 14698) (cons 14232 14557) (cons 14203 14232) (cons 13936 14203) (cons 13851 13936) (cons 13631 13851) (cons 13587 13631) (cons 13555 13587) (cons 13231 13555) (cons 13085 13231) (cons 12391 13085) (cons 11998 12391) (cons 11511 11998) (cons 10871 11511) (cons 10553 10871) (cons 10472 10553) (cons 9233 10472) (cons 7902 9233) (cons 6842 7902) (cons 6597 6842) (cons 6559 6597) (cons 6530 6559) (cons 6516 6530) (cons 6498 6516) (cons 6340 6498) (cons 5992 6340) (cons 5943 5992) (cons 5772 5943) (cons 5315 5772) (cons 5181 5315) (cons 5129 5181) (cons 4920 5129) (cons 4261 4920) (cons 3682 4261) (cons 3021 3682) (cons 2883 3021) (cons 2540 2883) (cons 2342 2540) (cons 1184 2342) (cons 703 1184) (cons 665 703) (cons 636 665) (cons 622 636) (cons 377 622) (cons 1 377)) en_rayon_2)))
    (progn
      gvar_2519
    )
    (progn
      (es_ext (groupbib-list 'ls_obj 'projet_md_typeligne_st_msg) (groupbib-list "Repère" 'st_btn) (groupbib-list 'projet_md_selforce_re_color 'c:projet_pa_resdyn_bt_calque_onclicked))
    )
  )
)

;; Referenced symbols: C:PROJET/MD_GESTSTYLECHEM/BT_STYLECANCEL#ONCLICKED, ENTDEL, AXEDYN-SETRAYEXT, CADR, PROJET/MD_TYPELIGNE/ST_MSG, ST_BTN, C:PROJET/PA_RESDYN/BT_CALQUE#ONCLICKED, RESDYN-PALAPPLY, PROJET/MD_GESTSTYLECHEM-HACH/RE_OFFSET, EO_POLYABS
(defun stylerep-list ( / local_0 local_1)
  (entdel 'c:projet_md_geststylechem_bt_stylecancel_onclicked)
  (if (cadr (axedyn-setrayext '((cons 160057 160136) (cons 160015 160037) (cons 159981 159995) (cons 159872 159961) (cons 159633 159861) (cons 159581 159613) (cons 159550 159561) (cons 159512 159530) (cons 159474 159492) (cons 159436 159454) (cons 159398 159416) (cons 159355 159378) (cons 159125 159335) (cons 159029 159105) (cons 159009 160606) (cons 158980 159009) (cons 158907 158980) (cons 158666 158907) (cons 158636 158666) (cons 158601 158636) (cons 158583 158601) (cons 158359 158583) (cons 158327 158359) (cons 157400 158327) (cons 157242 157400) (cons 156941 157242) (cons 156903 156941) (cons 156874 156903) (cons 156860 156874) (cons 156799 156821) (cons 156767 156779) (cons 156544 156747) (cons 156468 156524) (cons 156305 156448) (cons 156187 156285) (cons 156125 156167) (cons 156076 156105) (cons 155840 156056) (cons 155779 155820) (cons 155623 155768) (cons 155490 155612) (cons 155470 156860) (cons 155350 155470) (cons 155287 155332) (cons 155226 155260) (cons 155168 155350) (cons 155060 155168) (cons 155003 155019) (cons 154805 154983) (cons 154686 154785) (cons 154624 154666) (cons 154554 154604) (cons 154340 154534) (cons 154167 154329) (cons 154109 154156) (cons 154057 154089) (cons 154037 155060) (cons 153872 154037) (cons 153792 153872) (cons 153682 153792) (cons 153622 153667) (cons 153566 153682) (cons 153458 153566) (cons 153442 153458) (cons 153180 153442) (cons 153106 153180) (cons 152653 153106) (cons 152581 152653) (cons 152565 152581) (cons 152474 152565) (cons 152314 152474) (cons 152298 152314) (cons 152030 152298) (cons 151937 152030) (cons 151915 151937) (cons 151770 151915) (cons 151644 151746) (cons 151541 151624) (cons 151466 151521) (cons 151391 151446) (cons 151316 151371) (cons 151228 151296) (cons 151075 151208) (cons 150795 151064) (cons 150355 150784) (cons 150319 150335) (cons 150274 150299) (cons 149934 150254) (cons 149859 149914) (cons 149825 149839) (cons 149668 149805) (cons 149543 149648) (cons 149392 149523) (cons 149272 149381) (cons 149220 149252) (cons 149210 151770) (cons 149082 149210) (cons 149044 149082) (cons 148963 149044) (cons 148884 148945) (cons 148740 148963) (cons 148697 148713) (cons 148642 148677) (cons 148377 148622) (cons 148273 148357) (cons 148236 148253) (cons 148106 148216) (cons 147954 148086) (cons 147922 147934) (cons 147387 147902) (cons 147268 147367) (cons 146513 147248) (cons 146475 146493) (cons 146437 146455) (cons 146399 146417) (cons 146337 146379) (cons 146248 146317) (cons 146192 146228) (cons 146016 146172) (cons 145922 145996) (cons 145729 145902) (cons 145659 145718) (cons 145504 145648) (cons 145254 145493) (cons 145144 145243) (cons 145124 148740) (cons 144936 145124) (cons 144855 144936) (cons 144792 144837) (cons 144703 144855) (cons 144551 144703) (cons 144400 144551) (cons 144169 144400) (cons 144056 144169) (cons 143818 144056) (cons 143691 143818) (cons 143632 143691) (cons 143376 143632) (cons 143067 143376) (cons 142986 143067) (cons 142880 142986) (cons 142715 142880) (cons 142287 142715) (cons 141993 142039) (cons 141771 141973) (cons 141713 141751) (cons 141675 141693) (cons 141506 141664) (cons 141393 141486) (cons 141241 141373) (cons 141153 141230) (cons 141037 141133) (cons 140933 141017) (cons 140668 140913) (cons 140332 140657) (cons 140179 140312) (cons 140053 142287) (cons 139810 140053) (cons 139772 139810) (cons 139756 139772) (cons 139740 139756) (cons 139649 139740) (cons 139592 139649) (cons 139535 139592) (cons 139179 139535) (cons 139047 139179) (cons 138935 139047) (cons 138645 138935) (cons 138391 138645) (cons 138192 138391) (cons 137627 138192) (cons 137171 137627) (cons 136723 137171) (cons 136167 136723) (cons 135993 136167) (cons 135627 135993) (cons 135347 135627) (cons 135311 135347) (cons 135273 135311) (cons 135244 135273) (cons 135230 135244) (cons 135201 135230) (cons 135154 135201) (cons 135045 135154) (cons 134939 135045) (cons 134833 134939) (cons 134727 134833) (cons 134709 134727) (cons 134691 134709) (cons 134622 134691) (cons 134347 134622) (cons 134309 134347) (cons 133498 134309) (cons 131945 133498) (cons 131669 131945) (cons 131464 131669) (cons 131295 131464) (cons 130964 131295) (cons 130950 130964) (cons 130912 130950) (cons 130883 130912) (cons 130869 130883) (cons 130723 130836) (cons 130559 130703) (cons 130352 130539) (cons 130155 130869) (cons 130118 130155) (cons 130040 130118) (cons 129971 130040) (cons 129744 129971) (cons 129612 129744) (cons 129142 129612) (cons 129110 129142) (cons 128362 128830) (cons 128291 129110) (cons 127764 128291) (cons 127755 127764) (cons 127603 127755) (cons 127460 127603) (cons 127302 127460) (cons 127013 127302) (cons 126975 127013) (cons 126946 126975) (cons 126932 126946) (cons 126766 126932) (cons 126708 126766) (cons 126618 126708) (cons 126243 126618) (cons 126184 126243) (cons 126173 126184) (cons 125882 126173) (cons 125864 125882) (cons 125846 125864) (cons 125828 125846) (cons 125810 125828) (cons 125792 125810) (cons 125751 125792) (cons 125726 125751) (cons 125654 125726) (cons 125623 125654) (cons 125022 125623) (cons 124953 125022) (cons 124303 124953) (cons 124265 124303) (cons 123656 124265) (cons 122913 123656) (cons 122303 122913) (cons 122145 122303) (cons 121670 122145) (cons 121632 121670) (cons 121603 121632) (cons 121589 121603) (cons 121444 121589) (cons 121252 121444) (cons 121233 121252) (cons 121217 121233) (cons 120197 121217) (cons 119780 120197) (cons 119499 119780) (cons 118725 119499) (cons 118560 118725) (cons 118187 118560) (cons 117951 118187) (cons 117762 117951) (cons 117187 117762) (cons 116053 117187) (cons 115853 116053) (cons 115664 115853) (cons 115514 115664) (cons 115393 115514) (cons 115035 115393) (cons 114997 115035) (cons 114968 114997) (cons 114954 114968) (cons 114925 114954) (cons 114819 114925) (cons 114669 114819) (cons 114439 114669) (cons 114209 114439) (cons 114191 114209) (cons 113935 114191) (cons 113897 113935) (cons 113528 113897) (cons 113253 113528) (cons 112435 113253) (cons 111704 112435) (cons 111666 111704) (cons 111637 111666) (cons 111623 111637) (cons 111058 111176) (cons 110815 111047) (cons 110502 110804) (cons 110189 110491) (cons 109964 110178) (cons 109749 109953) (cons 109523 109738) (cons 109274 109512) (cons 109049 109263) (cons 109014 111623) (cons 108961 109014) (cons 108687 108961) (cons 108385 108687) (cons 108321 108385) (cons 108263 108321) (cons 108001 108263) (cons 107544 108001) (cons 107520 107544) (cons 107083 107520) (cons 106578 107083) (cons 106183 106578) (cons 105759 106183) (cons 104942 105759) (cons 104672 104942) (cons 104440 104672) (cons 103671 104440) (cons 103310 103671) (cons 102920 103310) (cons 102818 102920) (cons 102781 102818) (cons 102677 102781) (cons 102444 102677) (cons 102064 102444) (cons 102046 102064) (cons 102028 102046) (cons 102010 102028) (cons 101992 102010) (cons 101785 101992) (cons 101591 101785) (cons 101577 101591) (cons 101550 101577) (cons 101229 101550) (cons 101051 101229) (cons 99879 101051) (cons 99815 99879) (cons 99509 99815) (cons 99313 99509) (cons 99073 99313) (cons 98595 99073) (cons 98174 98595) (cons 97934 98174) (cons 97787 97934) (cons 96110 97787) (cons 95955 96110) (cons 95721 95955) (cons 95551 95721) (cons 95159 95551) (cons 94807 95159) (cons 94494 94807) (cons 94045 94494) (cons 93996 94045) (cons 93807 93996) (cons 93594 93807) (cons 93556 93594) (cons 93527 93556) (cons 93513 93527) (cons 93415 93465) (cons 93368 93395) (cons 93261 93348) (cons 93004 93241) (cons 92975 93513) (cons 92877 92975) (cons 92785 92877) (cons 92769 92785) (cons 92752 92769) (cons 92725 92752) (cons 92667 92725) (cons 92647 92667) (cons 92580 92647) (cons 92452 92580) (cons 92124 92452) (cons 90651 92124) (cons 90495 90651) (cons 90273 90495) (cons 90205 90273) (cons 90135 90205) (cons 89973 90135) (cons 89901 89973) (cons 89463 89901) (cons 89434 89463) (cons 89254 89434) (cons 89225 89254) (cons 89009 89225) (cons 88828 89009) (cons 88647 88828) (cons 88377 88647) (cons 87867 88377) (cons 87494 87867) (cons 86354 87494) (cons 86319 86354) (cons 85749 86319) (cons 85581 85749) (cons 85200 85581) (cons 85151 85200) (cons 84652 85151) (cons 84423 84652) (cons 84133 84423) (cons 83802 84133) (cons 83450 83802) (cons 83049 83450) (cons 82985 83049) (cons 82808 82985) (cons 82794 82808) (cons 82486 82794) (cons 82324 82486) (cons 82191 82324) (cons 81864 82191) (cons 81740 81864) (cons 81513 81740) (cons 81322 81513) (cons 80931 81322) (cons 80319 80931) (cons 79935 80319) (cons 79800 79935) (cons 79618 79800) (cons 79171 79618) (cons 79005 79054) (cons 78885 78985) (cons 78849 78865) (cons 78811 78829) (cons 78773 78791) (cons 78603 78753) (cons 78562 79171) (cons 78546 78562) (cons 78393 78546) (cons 77922 78393) (cons 77785 77922) (cons 77258 77785) (cons 76632 77258) (cons 76603 76632) (cons 76263 76603) (cons 75612 76263) (cons 75549 75612) (cons 75394 75549) (cons 75250 75394) (cons 75090 75250) (cons 74876 75090) (cons 74680 74876) (cons 74592 74680) (cons 74440 74592) (cons 74307 74440) (cons 74193 74307) (cons 73977 74193) (cons 73723 73977) (cons 73541 73723) (cons 73488 73541) (cons 73354 73488) (cons 73282 73354) (cons 73165 73282) (cons 73056 73165) (cons 72750 73056) (cons 72734 72750) (cons 72625 72734) (cons 72580 72625) (cons 72525 72580) (cons 72470 72525) (cons 72296 72470) (cons 71573 72296) (cons 71512 71573) (cons 71496 71512) (cons 71480 71496) (cons 71464 71480) (cons 71447 71464) (cons 71332 71447) (cons 71100 71332) (cons 70977 71100) (cons 70825 70977) (cons 70509 70825) (cons 70468 70509) (cons 70121 70147) (cons 69647 70101) (cons 69591 69627) (cons 69535 69571) (cons 69460 69515) (cons 68268 69440) (cons 68232 68248) (cons 68194 68212) (cons 68156 68174) (cons 68109 70468) (cons 67577 68109) (cons 67286 67577) (cons 67189 67286) (cons 66641 67189) (cons 64343 66641) (cons 62808 64343) (cons 62482 62808) (cons 62115 62482) (cons 61791 62115) (cons 61561 61791) (cons 61186 61561) (cons 61063 61186) (cons 60683 61063) (cons 60382 60683) (cons 60108 60382) (cons 59909 60108) (cons 59612 59909) (cons 59315 59612) (cons 59018 59315) (cons 58739 59018) (cons 58543 58739) (cons 58004 58543) (cons 57412 58004) (cons 56866 57412) (cons 56379 56866) (cons 55906 56379) (cons 55757 55906) (cons 55238 55757) (cons 54458 55238) (cons 54442 54458) (cons 54141 54442) (cons 54070 54141) (cons 53934 54070) (cons 53122 53934) (cons 53083 53122) (cons 52572 53083) (cons 52148 52572) (cons 51906 52148) (cons 51501 51906) (cons 51298 51501) (cons 51237 51298) (cons 51064 51237) (cons 50859 51064) (cons 50715 50859) (cons 50550 50715) (cons 50386 50550) (cons 50220 50386) (cons 49985 50220) (cons 49932 49985) (cons 48949 49932) (cons 48910 48949) (cons 48421 48910) (cons 48379 48421) (cons 48338 48379) (cons 48113 48338) (cons 48068 48113) (cons 48023 48068) (cons 47978 48023) (cons 47933 47978) (cons 47498 47933) (cons 47253 47498) (cons 47221 47253) (cons 46464 47221) (cons 45590 46464) (cons 44721 45590) (cons 43281 44721) (cons 42941 43281) (cons 42868 42941) (cons 42554 42868) (cons 42516 42554) (cons 42410 42516) (cons 42396 42410) (cons 41950 42396) (cons 41232 41950) (cons 40442 41232) (cons 39931 40442) (cons 39541 39931) (cons 39497 39541) (cons 39459 39497) (cons 39387 39459) (cons 39207 39387) (cons 39037 39207) (cons 38745 39037) (cons 38713 38745) (cons 38396 38713) (cons 38157 38396) (cons 37656 38157) (cons 37423 37656) (cons 36940 37423) (cons 34753 36940) (cons 34595 34753) (cons 34276 34595) (cons 34238 34276) (cons 34132 34238) (cons 34118 34132) (cons 34089 34118) (cons 34017 34089) (cons 33837 34017) (cons 33807 33837) (cons 33512 33807) (cons 33480 33512) (cons 33248 33480) (cons 32715 33248) (cons 31684 32715) (cons 30753 31684) (cons 30263 30753) (cons 30001 30263) (cons 29784 30001) (cons 29588 29784) (cons 29430 29588) (cons 29111 29430) (cons 29073 29111) (cons 29044 29073) (cons 29030 29044) (cons 28784 29029) (cons 28651 28784) (cons 28578 28606) (cons 28481 28558) (cons 28374 28461) (cons 28291 28354) (cons 28135 28271) (cons 28027 28124) (cons 27580 28007) (cons 27525 27560) (cons 27470 27505) (cons 27394 27450) (cons 27368 28651) (cons 26886 27368) (cons 26496 26886) (cons 26005 26496) (cons 25748 26005) (cons 24908 25748) (cons 24660 24908) (cons 24258 24660) (cons 23643 24258) (cons 23318 23643) (cons 22923 23318) (cons 22494 22923) (cons 22263 22494) (cons 21735 22263) (cons 20632 21735) (cons 20182 20632) (cons 19630 20182) (cons 18248 19630) (cons 17937 18248) (cons 17884 17937) (cons 16657 17884) (cons 16485 16657) (cons 16372 16485) (cons 16337 16372) (cons 15999 16337) (cons 15444 15999) (cons 15306 15444) (cons 15288 15306) (cons 15153 15288) (cons 15034 15153) (cons 14698 15034) (cons 14557 14698) (cons 14232 14557) (cons 14203 14232) (cons 13936 14203) (cons 13851 13936) (cons 13631 13851) (cons 13587 13631) (cons 13555 13587) (cons 13231 13555) (cons 13085 13231) (cons 12391 13085) (cons 11998 12391) (cons 11511 11998) (cons 10871 11511) (cons 10553 10871) (cons 10472 10553) (cons 9233 10472) (cons 7902 9233) (cons 6842 7902) (cons 6597 6842) (cons 6559 6597) (cons 6530 6559) (cons 6516 6530) (cons 6498 6516) (cons 6340 6498) (cons 5992 6340) (cons 5943 5992) (cons 5772 5943) (cons 5315 5772) (cons 5181 5315) (cons 5129 5181) (cons 4920 5129) (cons 4261 4920) (cons 3682 4261) (cons 3021 3682) (cons 2883 3021) (cons 2540 2883) (cons 2342 2540) (cons 1184 2342) (cons 703 1184) (cons 665 703) (cons 636 665) (cons 622 636) (cons 377 622) (cons 1 377))))
    (progn
      (resdyn-palapply 'projet_md_typeligne_st_msg 'st_btn 'c:projet_pa_resdyn_bt_calque_onclicked)
    )
  )
  ;; init-args 3: 'projet_md_geststylechem-hach_re_offset, local_0
  (in_param (eo_polyabs projet_md_geststylechem-hach_re_offset) 'ls_obj)
  (ls_elem (projet_md_geststylechem-hach_re_offset2 '*ld_mod*) (axedyn-setrayext '((cons 160057 160136) (cons 160015 160037) (cons 159981 159995) (cons 159872 159961) (cons 159633 159861) (cons 159581 159613) (cons 159550 159561) (cons 159512 159530) (cons 159474 159492) (cons 159436 159454) (cons 159398 159416) (cons 159355 159378) (cons 159125 159335) (cons 159029 159105) (cons 159009 160606) (cons 158980 159009) (cons 158907 158980) (cons 158666 158907) (cons 158636 158666) (cons 158601 158636) (cons 158583 158601) (cons 158359 158583) (cons 158327 158359) (cons 157400 158327) (cons 157242 157400) (cons 156941 157242) (cons 156903 156941) (cons 156874 156903) (cons 156860 156874) (cons 156799 156821) (cons 156767 156779) (cons 156544 156747) (cons 156468 156524) (cons 156305 156448) (cons 156187 156285) (cons 156125 156167) (cons 156076 156105) (cons 155840 156056) (cons 155779 155820) (cons 155623 155768) (cons 155490 155612) (cons 155470 156860) (cons 155350 155470) (cons 155287 155332) (cons 155226 155260) (cons 155168 155350) (cons 155060 155168) (cons 155003 155019) (cons 154805 154983) (cons 154686 154785) (cons 154624 154666) (cons 154554 154604) (cons 154340 154534) (cons 154167 154329) (cons 154109 154156) (cons 154057 154089) (cons 154037 155060) (cons 153872 154037) (cons 153792 153872) (cons 153682 153792) (cons 153622 153667) (cons 153566 153682) (cons 153458 153566) (cons 153442 153458) (cons 153180 153442) (cons 153106 153180) (cons 152653 153106) (cons 152581 152653) (cons 152565 152581) (cons 152474 152565) (cons 152314 152474) (cons 152298 152314) (cons 152030 152298) (cons 151937 152030) (cons 151915 151937) (cons 151770 151915) (cons 151644 151746) (cons 151541 151624) (cons 151466 151521) (cons 151391 151446) (cons 151316 151371) (cons 151228 151296) (cons 151075 151208) (cons 150795 151064) (cons 150355 150784) (cons 150319 150335) (cons 150274 150299) (cons 149934 150254) (cons 149859 149914) (cons 149825 149839) (cons 149668 149805) (cons 149543 149648) (cons 149392 149523) (cons 149272 149381) (cons 149220 149252) (cons 149210 151770) (cons 149082 149210) (cons 149044 149082) (cons 148963 149044) (cons 148884 148945) (cons 148740 148963) (cons 148697 148713) (cons 148642 148677) (cons 148377 148622) (cons 148273 148357) (cons 148236 148253) (cons 148106 148216) (cons 147954 148086) (cons 147922 147934) (cons 147387 147902) (cons 147268 147367) (cons 146513 147248) (cons 146475 146493) (cons 146437 146455) (cons 146399 146417) (cons 146337 146379) (cons 146248 146317) (cons 146192 146228) (cons 146016 146172) (cons 145922 145996) (cons 145729 145902) (cons 145659 145718) (cons 145504 145648) (cons 145254 145493) (cons 145144 145243) (cons 145124 148740) (cons 144936 145124) (cons 144855 144936) (cons 144792 144837) (cons 144703 144855) (cons 144551 144703) (cons 144400 144551) (cons 144169 144400) (cons 144056 144169) (cons 143818 144056) (cons 143691 143818) (cons 143632 143691) (cons 143376 143632) (cons 143067 143376) (cons 142986 143067) (cons 142880 142986) (cons 142715 142880) (cons 142287 142715) (cons 141993 142039) (cons 141771 141973) (cons 141713 141751) (cons 141675 141693) (cons 141506 141664) (cons 141393 141486) (cons 141241 141373) (cons 141153 141230) (cons 141037 141133) (cons 140933 141017) (cons 140668 140913) (cons 140332 140657) (cons 140179 140312) (cons 140053 142287) (cons 139810 140053) (cons 139772 139810) (cons 139756 139772) (cons 139740 139756) (cons 139649 139740) (cons 139592 139649) (cons 139535 139592) (cons 139179 139535) (cons 139047 139179) (cons 138935 139047) (cons 138645 138935) (cons 138391 138645) (cons 138192 138391) (cons 137627 138192) (cons 137171 137627) (cons 136723 137171) (cons 136167 136723) (cons 135993 136167) (cons 135627 135993) (cons 135347 135627) (cons 135311 135347) (cons 135273 135311) (cons 135244 135273) (cons 135230 135244) (cons 135201 135230) (cons 135154 135201) (cons 135045 135154) (cons 134939 135045) (cons 134833 134939) (cons 134727 134833) (cons 134709 134727) (cons 134691 134709) (cons 134622 134691) (cons 134347 134622) (cons 134309 134347) (cons 133498 134309) (cons 131945 133498) (cons 131669 131945) (cons 131464 131669) (cons 131295 131464) (cons 130964 131295) (cons 130950 130964) (cons 130912 130950) (cons 130883 130912) (cons 130869 130883) (cons 130723 130836) (cons 130559 130703) (cons 130352 130539) (cons 130155 130869) (cons 130118 130155) (cons 130040 130118) (cons 129971 130040) (cons 129744 129971) (cons 129612 129744) (cons 129142 129612) (cons 129110 129142) (cons 128362 128830) (cons 128291 129110) (cons 127764 128291) (cons 127755 127764) (cons 127603 127755) (cons 127460 127603) (cons 127302 127460) (cons 127013 127302) (cons 126975 127013) (cons 126946 126975) (cons 126932 126946) (cons 126766 126932) (cons 126708 126766) (cons 126618 126708) (cons 126243 126618) (cons 126184 126243) (cons 126173 126184) (cons 125882 126173) (cons 125864 125882) (cons 125846 125864) (cons 125828 125846) (cons 125810 125828) (cons 125792 125810) (cons 125751 125792) (cons 125726 125751) (cons 125654 125726) (cons 125623 125654) (cons 125022 125623) (cons 124953 125022) (cons 124303 124953) (cons 124265 124303) (cons 123656 124265) (cons 122913 123656) (cons 122303 122913) (cons 122145 122303) (cons 121670 122145) (cons 121632 121670) (cons 121603 121632) (cons 121589 121603) (cons 121444 121589) (cons 121252 121444) (cons 121233 121252) (cons 121217 121233) (cons 120197 121217) (cons 119780 120197) (cons 119499 119780) (cons 118725 119499) (cons 118560 118725) (cons 118187 118560) (cons 117951 118187) (cons 117762 117951) (cons 117187 117762) (cons 116053 117187) (cons 115853 116053) (cons 115664 115853) (cons 115514 115664) (cons 115393 115514) (cons 115035 115393) (cons 114997 115035) (cons 114968 114997) (cons 114954 114968) (cons 114925 114954) (cons 114819 114925) (cons 114669 114819) (cons 114439 114669) (cons 114209 114439) (cons 114191 114209) (cons 113935 114191) (cons 113897 113935) (cons 113528 113897) (cons 113253 113528) (cons 112435 113253) (cons 111704 112435) (cons 111666 111704) (cons 111637 111666) (cons 111623 111637) (cons 111058 111176) (cons 110815 111047) (cons 110502 110804) (cons 110189 110491) (cons 109964 110178) (cons 109749 109953) (cons 109523 109738) (cons 109274 109512) (cons 109049 109263) (cons 109014 111623) (cons 108961 109014) (cons 108687 108961) (cons 108385 108687) (cons 108321 108385) (cons 108263 108321) (cons 108001 108263) (cons 107544 108001) (cons 107520 107544) (cons 107083 107520) (cons 106578 107083) (cons 106183 106578) (cons 105759 106183) (cons 104942 105759) (cons 104672 104942) (cons 104440 104672) (cons 103671 104440) (cons 103310 103671) (cons 102920 103310) (cons 102818 102920) (cons 102781 102818) (cons 102677 102781) (cons 102444 102677) (cons 102064 102444) (cons 102046 102064) (cons 102028 102046) (cons 102010 102028) (cons 101992 102010) (cons 101785 101992) (cons 101591 101785) (cons 101577 101591) (cons 101550 101577) (cons 101229 101550) (cons 101051 101229) (cons 99879 101051) (cons 99815 99879) (cons 99509 99815) (cons 99313 99509) (cons 99073 99313) (cons 98595 99073) (cons 98174 98595) (cons 97934 98174) (cons 97787 97934) (cons 96110 97787) (cons 95955 96110) (cons 95721 95955) (cons 95551 95721) (cons 95159 95551) (cons 94807 95159) (cons 94494 94807) (cons 94045 94494) (cons 93996 94045) (cons 93807 93996) (cons 93594 93807) (cons 93556 93594) (cons 93527 93556) (cons 93513 93527) (cons 93415 93465) (cons 93368 93395) (cons 93261 93348) (cons 93004 93241) (cons 92975 93513) (cons 92877 92975) (cons 92785 92877) (cons 92769 92785) (cons 92752 92769) (cons 92725 92752) (cons 92667 92725) (cons 92647 92667) (cons 92580 92647) (cons 92452 92580) (cons 92124 92452) (cons 90651 92124) (cons 90495 90651) (cons 90273 90495) (cons 90205 90273) (cons 90135 90205) (cons 89973 90135) (cons 89901 89973) (cons 89463 89901) (cons 89434 89463) (cons 89254 89434) (cons 89225 89254) (cons 89009 89225) (cons 88828 89009) (cons 88647 88828) (cons 88377 88647) (cons 87867 88377) (cons 87494 87867) (cons 86354 87494) (cons 86319 86354) (cons 85749 86319) (cons 85581 85749) (cons 85200 85581) (cons 85151 85200) (cons 84652 85151) (cons 84423 84652) (cons 84133 84423) (cons 83802 84133) (cons 83450 83802) (cons 83049 83450) (cons 82985 83049) (cons 82808 82985) (cons 82794 82808) (cons 82486 82794) (cons 82324 82486) (cons 82191 82324) (cons 81864 82191) (cons 81740 81864) (cons 81513 81740) (cons 81322 81513) (cons 80931 81322) (cons 80319 80931) (cons 79935 80319) (cons 79800 79935) (cons 79618 79800) (cons 79171 79618) (cons 79005 79054) (cons 78885 78985) (cons 78849 78865) (cons 78811 78829) (cons 78773 78791) (cons 78603 78753) (cons 78562 79171) (cons 78546 78562) (cons 78393 78546) (cons 77922 78393) (cons 77785 77922) (cons 77258 77785) (cons 76632 77258) (cons 76603 76632) (cons 76263 76603) (cons 75612 76263) (cons 75549 75612) (cons 75394 75549) (cons 75250 75394) (cons 75090 75250) (cons 74876 75090) (cons 74680 74876) (cons 74592 74680) (cons 74440 74592) (cons 74307 74440) (cons 74193 74307) (cons 73977 74193) (cons 73723 73977) (cons 73541 73723) (cons 73488 73541) (cons 73354 73488) (cons 73282 73354) (cons 73165 73282) (cons 73056 73165) (cons 72750 73056) (cons 72734 72750) (cons 72625 72734) (cons 72580 72625) (cons 72525 72580) (cons 72470 72525) (cons 72296 72470) (cons 71573 72296) (cons 71512 71573) (cons 71496 71512) (cons 71480 71496) (cons 71464 71480) (cons 71447 71464) (cons 71332 71447) (cons 71100 71332) (cons 70977 71100) (cons 70825 70977) (cons 70509 70825) (cons 70468 70509) (cons 70121 70147) (cons 69647 70101) (cons 69591 69627) (cons 69535 69571) (cons 69460 69515) (cons 68268 69440) (cons 68232 68248) (cons 68194 68212) (cons 68156 68174) (cons 68109 70468) (cons 67577 68109) (cons 67286 67577) (cons 67189 67286) (cons 66641 67189) (cons 64343 66641) (cons 62808 64343) (cons 62482 62808) (cons 62115 62482) (cons 61791 62115) (cons 61561 61791) (cons 61186 61561) (cons 61063 61186) (cons 60683 61063) (cons 60382 60683) (cons 60108 60382) (cons 59909 60108) (cons 59612 59909) (cons 59315 59612) (cons 59018 59315) (cons 58739 59018) (cons 58543 58739) (cons 58004 58543) (cons 57412 58004) (cons 56866 57412) (cons 56379 56866) (cons 55906 56379) (cons 55757 55906) (cons 55238 55757) (cons 54458 55238) (cons 54442 54458) (cons 54141 54442) (cons 54070 54141) (cons 53934 54070) (cons 53122 53934) (cons 53083 53122) (cons 52572 53083) (cons 52148 52572) (cons 51906 52148) (cons 51501 51906) (cons 51298 51501) (cons 51237 51298) (cons 51064 51237) (cons 50859 51064) (cons 50715 50859) (cons 50550 50715) (cons 50386 50550) (cons 50220 50386) (cons 49985 50220) (cons 49932 49985) (cons 48949 49932) (cons 48910 48949) (cons 48421 48910) (cons 48379 48421) (cons 48338 48379) (cons 48113 48338) (cons 48068 48113) (cons 48023 48068) (cons 47978 48023) (cons 47933 47978) (cons 47498 47933) (cons 47253 47498) (cons 47221 47253) (cons 46464 47221) (cons 45590 46464) (cons 44721 45590) (cons 43281 44721) (cons 42941 43281) (cons 42868 42941) (cons 42554 42868) (cons 42516 42554) (cons 42410 42516) (cons 42396 42410) (cons 41950 42396) (cons 41232 41950) (cons 40442 41232) (cons 39931 40442) (cons 39541 39931) (cons 39497 39541) (cons 39459 39497) (cons 39387 39459) (cons 39207 39387) (cons 39037 39207) (cons 38745 39037) (cons 38713 38745) (cons 38396 38713) (cons 38157 38396) (cons 37656 38157) (cons 37423 37656) (cons 36940 37423) (cons 34753 36940) (cons 34595 34753) (cons 34276 34595) (cons 34238 34276) (cons 34132 34238) (cons 34118 34132) (cons 34089 34118) (cons 34017 34089) (cons 33837 34017) (cons 33807 33837) (cons 33512 33807) (cons 33480 33512) (cons 33248 33480) (cons 32715 33248) (cons 31684 32715) (cons 30753 31684) (cons 30263 30753) (cons 30001 30263) (cons 29784 30001) (cons 29588 29784) (cons 29430 29588) (cons 29111 29430) (cons 29073 29111) (cons 29044 29073) (cons 29030 29044) (cons 28784 29029) (cons 28651 28784) (cons 28578 28606) (cons 28481 28558) (cons 28374 28461) (cons 28291 28354) (cons 28135 28271) (cons 28027 28124) (cons 27580 28007) (cons 27525 27560) (cons 27470 27505) (cons 27394 27450) (cons 27368 28651) (cons 26886 27368) (cons 26496 26886) (cons 26005 26496) (cons 25748 26005) (cons 24908 25748) (cons 24660 24908) (cons 24258 24660) (cons 23643 24258) (cons 23318 23643) (cons 22923 23318) (cons 22494 22923) (cons 22263 22494) (cons 21735 22263) (cons 20632 21735) (cons 20182 20632) (cons 19630 20182) (cons 18248 19630) (cons 17937 18248) (cons 17884 17937) (cons 16657 17884) (cons 16485 16657) (cons 16372 16485) (cons 16337 16372) (cons 15999 16337) (cons 15444 15999) (cons 15306 15444) (cons 15288 15306) (cons 15153 15288) (cons 15034 15153) (cons 14698 15034) (cons 14557 14698) (cons 14232 14557) (cons 14203 14232) (cons 13936 14203) (cons 13851 13936) (cons 13631 13851) (cons 13587 13631) (cons 13555 13587) (cons 13231 13555) (cons 13085 13231) (cons 12391 13085) (cons 11998 12391) (cons 11511 11998) (cons 10871 11511) (cons 10553 10871) (cons 10472 10553) (cons 9233 10472) (cons 7902 9233) (cons 6842 7902) (cons 6597 6842) (cons 6559 6597) (cons 6530 6559) (cons 6516 6530) (cons 6498 6516) (cons 6340 6498) (cons 5992 6340) (cons 5943 5992) (cons 5772 5943) (cons 5315 5772) (cons 5181 5315) (cons 5129 5181) (cons 4920 5129) (cons 4261 4920) (cons 3682 4261) (cons 3021 3682) (cons 2883 3021) (cons 2540 2883) (cons 2342 2540) (cons 1184 2342) (cons 703 1184) (cons 665 703) (cons 636 665) (cons 622 636) (cons 377 622) (cons 1 377))))
  ;; init-args 5: 'projet_md_geststylechem-hach_re_offset, local_0, 'projet_md_geststylechem-hach_re_offset2, local_1
  (repdyn-getpoint (ha_polyext projet_md_geststylechem-hach_re_offset) (ha_polyext projet_md_geststylechem-hach_re_offset2))
  (projet_md_geststylechem-bord_st_style (projet_md_geststylechem-hach_re_offset2 'projet_pa_axes))
)

;; Original arg hints: IN_LON0, BLKBIB-GETPARENTENTITIES, vlax-curve-getParamAtPoint
;; Referenced symbols: C:PROJET/PA_RESDYN/BTN_RESET#ONCLICKED, ENTDEL, /, ST_AXEID, LS_OBJ, IN_LON0, GROUPBIB-LIST, BLKBIB-GETPARENTENTITIES, PROJET/MD_SELFORCE/RE_COLOR, vlax-curve-getParamAtPoint
;; Referenced strings: Repère
(defun stylerep-add (in_lon0 blkbib-getparententities vlax-curve-getparamatpoint)
  (entdel 'c:projet_pa_resdyn_btn_reset_onclicked)
  (rtos '((cons 160057 160136) (cons 160015 160037) (cons 159981 159995) (cons 159872 159961) (cons 159633 159861) (cons 159581 159613) (cons 159550 159561) (cons 159512 159530) (cons 159474 159492) (cons 159436 159454) (cons 159398 159416) (cons 159355 159378) (cons 159125 159335) (cons 159029 159105) (cons 159009 160606) (cons 158980 159009) (cons 158907 158980) (cons 158666 158907) (cons 158636 158666) (cons 158601 158636) (cons 158583 158601) (cons 158359 158583) (cons 158327 158359) (cons 157400 158327) (cons 157242 157400) (cons 156941 157242) (cons 156903 156941) (cons 156874 156903) (cons 156860 156874) (cons 156799 156821) (cons 156767 156779) (cons 156544 156747) (cons 156468 156524) (cons 156305 156448) (cons 156187 156285) (cons 156125 156167) (cons 156076 156105) (cons 155840 156056) (cons 155779 155820) (cons 155623 155768) (cons 155490 155612) (cons 155470 156860) (cons 155350 155470) (cons 155287 155332) (cons 155226 155260) (cons 155168 155350) (cons 155060 155168) (cons 155003 155019) (cons 154805 154983) (cons 154686 154785) (cons 154624 154666) (cons 154554 154604) (cons 154340 154534) (cons 154167 154329) (cons 154109 154156) (cons 154057 154089) (cons 154037 155060) (cons 153872 154037) (cons 153792 153872) (cons 153682 153792) (cons 153622 153667) (cons 153566 153682) (cons 153458 153566) (cons 153442 153458) (cons 153180 153442) (cons 153106 153180) (cons 152653 153106) (cons 152581 152653) (cons 152565 152581) (cons 152474 152565) (cons 152314 152474) (cons 152298 152314) (cons 152030 152298) (cons 151937 152030) (cons 151915 151937) (cons 151770 151915) (cons 151644 151746) (cons 151541 151624) (cons 151466 151521) (cons 151391 151446) (cons 151316 151371) (cons 151228 151296) (cons 151075 151208) (cons 150795 151064) (cons 150355 150784) (cons 150319 150335) (cons 150274 150299) (cons 149934 150254) (cons 149859 149914) (cons 149825 149839) (cons 149668 149805) (cons 149543 149648) (cons 149392 149523) (cons 149272 149381) (cons 149220 149252) (cons 149210 151770) (cons 149082 149210) (cons 149044 149082) (cons 148963 149044) (cons 148884 148945) (cons 148740 148963) (cons 148697 148713) (cons 148642 148677) (cons 148377 148622) (cons 148273 148357) (cons 148236 148253) (cons 148106 148216) (cons 147954 148086) (cons 147922 147934) (cons 147387 147902) (cons 147268 147367) (cons 146513 147248) (cons 146475 146493) (cons 146437 146455) (cons 146399 146417) (cons 146337 146379) (cons 146248 146317) (cons 146192 146228) (cons 146016 146172) (cons 145922 145996) (cons 145729 145902) (cons 145659 145718) (cons 145504 145648) (cons 145254 145493) (cons 145144 145243) (cons 145124 148740) (cons 144936 145124) (cons 144855 144936) (cons 144792 144837) (cons 144703 144855) (cons 144551 144703) (cons 144400 144551) (cons 144169 144400) (cons 144056 144169) (cons 143818 144056) (cons 143691 143818) (cons 143632 143691) (cons 143376 143632) (cons 143067 143376) (cons 142986 143067) (cons 142880 142986) (cons 142715 142880) (cons 142287 142715) (cons 141993 142039) (cons 141771 141973) (cons 141713 141751) (cons 141675 141693) (cons 141506 141664) (cons 141393 141486) (cons 141241 141373) (cons 141153 141230) (cons 141037 141133) (cons 140933 141017) (cons 140668 140913) (cons 140332 140657) (cons 140179 140312) (cons 140053 142287) (cons 139810 140053) (cons 139772 139810) (cons 139756 139772) (cons 139740 139756) (cons 139649 139740) (cons 139592 139649) (cons 139535 139592) (cons 139179 139535) (cons 139047 139179) (cons 138935 139047) (cons 138645 138935) (cons 138391 138645) (cons 138192 138391) (cons 137627 138192) (cons 137171 137627) (cons 136723 137171) (cons 136167 136723) (cons 135993 136167) (cons 135627 135993) (cons 135347 135627) (cons 135311 135347) (cons 135273 135311) (cons 135244 135273) (cons 135230 135244) (cons 135201 135230) (cons 135154 135201) (cons 135045 135154) (cons 134939 135045) (cons 134833 134939) (cons 134727 134833) (cons 134709 134727) (cons 134691 134709) (cons 134622 134691) (cons 134347 134622) (cons 134309 134347) (cons 133498 134309) (cons 131945 133498) (cons 131669 131945) (cons 131464 131669) (cons 131295 131464) (cons 130964 131295) (cons 130950 130964) (cons 130912 130950) (cons 130883 130912) (cons 130869 130883) (cons 130723 130836) (cons 130559 130703) (cons 130352 130539) (cons 130155 130869) (cons 130118 130155) (cons 130040 130118) (cons 129971 130040) (cons 129744 129971) (cons 129612 129744) (cons 129142 129612) (cons 129110 129142) (cons 128362 128830) (cons 128291 129110) (cons 127764 128291) (cons 127755 127764) (cons 127603 127755) (cons 127460 127603) (cons 127302 127460) (cons 127013 127302) (cons 126975 127013) (cons 126946 126975) (cons 126932 126946) (cons 126766 126932) (cons 126708 126766) (cons 126618 126708) (cons 126243 126618) (cons 126184 126243) (cons 126173 126184) (cons 125882 126173) (cons 125864 125882) (cons 125846 125864) (cons 125828 125846) (cons 125810 125828) (cons 125792 125810) (cons 125751 125792) (cons 125726 125751) (cons 125654 125726) (cons 125623 125654) (cons 125022 125623) (cons 124953 125022) (cons 124303 124953) (cons 124265 124303) (cons 123656 124265) (cons 122913 123656) (cons 122303 122913) (cons 122145 122303) (cons 121670 122145) (cons 121632 121670) (cons 121603 121632) (cons 121589 121603) (cons 121444 121589) (cons 121252 121444) (cons 121233 121252) (cons 121217 121233) (cons 120197 121217) (cons 119780 120197) (cons 119499 119780) (cons 118725 119499) (cons 118560 118725) (cons 118187 118560) (cons 117951 118187) (cons 117762 117951) (cons 117187 117762) (cons 116053 117187) (cons 115853 116053) (cons 115664 115853) (cons 115514 115664) (cons 115393 115514) (cons 115035 115393) (cons 114997 115035) (cons 114968 114997) (cons 114954 114968) (cons 114925 114954) (cons 114819 114925) (cons 114669 114819) (cons 114439 114669) (cons 114209 114439) (cons 114191 114209) (cons 113935 114191) (cons 113897 113935) (cons 113528 113897) (cons 113253 113528) (cons 112435 113253) (cons 111704 112435) (cons 111666 111704) (cons 111637 111666) (cons 111623 111637) (cons 111058 111176) (cons 110815 111047) (cons 110502 110804) (cons 110189 110491) (cons 109964 110178) (cons 109749 109953) (cons 109523 109738) (cons 109274 109512) (cons 109049 109263) (cons 109014 111623) (cons 108961 109014) (cons 108687 108961) (cons 108385 108687) (cons 108321 108385) (cons 108263 108321) (cons 108001 108263) (cons 107544 108001) (cons 107520 107544) (cons 107083 107520) (cons 106578 107083) (cons 106183 106578) (cons 105759 106183) (cons 104942 105759) (cons 104672 104942) (cons 104440 104672) (cons 103671 104440) (cons 103310 103671) (cons 102920 103310) (cons 102818 102920) (cons 102781 102818) (cons 102677 102781) (cons 102444 102677) (cons 102064 102444) (cons 102046 102064) (cons 102028 102046) (cons 102010 102028) (cons 101992 102010) (cons 101785 101992) (cons 101591 101785) (cons 101577 101591) (cons 101550 101577) (cons 101229 101550) (cons 101051 101229) (cons 99879 101051) (cons 99815 99879) (cons 99509 99815) (cons 99313 99509) (cons 99073 99313) (cons 98595 99073) (cons 98174 98595) (cons 97934 98174) (cons 97787 97934) (cons 96110 97787) (cons 95955 96110) (cons 95721 95955) (cons 95551 95721) (cons 95159 95551) (cons 94807 95159) (cons 94494 94807) (cons 94045 94494) (cons 93996 94045) (cons 93807 93996) (cons 93594 93807) (cons 93556 93594) (cons 93527 93556) (cons 93513 93527) (cons 93415 93465) (cons 93368 93395) (cons 93261 93348) (cons 93004 93241) (cons 92975 93513) (cons 92877 92975) (cons 92785 92877) (cons 92769 92785) (cons 92752 92769) (cons 92725 92752) (cons 92667 92725) (cons 92647 92667) (cons 92580 92647) (cons 92452 92580) (cons 92124 92452) (cons 90651 92124) (cons 90495 90651) (cons 90273 90495) (cons 90205 90273) (cons 90135 90205) (cons 89973 90135) (cons 89901 89973) (cons 89463 89901) (cons 89434 89463) (cons 89254 89434) (cons 89225 89254) (cons 89009 89225) (cons 88828 89009) (cons 88647 88828) (cons 88377 88647) (cons 87867 88377) (cons 87494 87867) (cons 86354 87494) (cons 86319 86354) (cons 85749 86319) (cons 85581 85749) (cons 85200 85581) (cons 85151 85200) (cons 84652 85151) (cons 84423 84652) (cons 84133 84423) (cons 83802 84133) (cons 83450 83802) (cons 83049 83450) (cons 82985 83049) (cons 82808 82985) (cons 82794 82808) (cons 82486 82794) (cons 82324 82486) (cons 82191 82324) (cons 81864 82191) (cons 81740 81864) (cons 81513 81740) (cons 81322 81513) (cons 80931 81322) (cons 80319 80931) (cons 79935 80319) (cons 79800 79935) (cons 79618 79800) (cons 79171 79618) (cons 79005 79054) (cons 78885 78985) (cons 78849 78865) (cons 78811 78829) (cons 78773 78791) (cons 78603 78753) (cons 78562 79171) (cons 78546 78562) (cons 78393 78546) (cons 77922 78393) (cons 77785 77922) (cons 77258 77785) (cons 76632 77258) (cons 76603 76632) (cons 76263 76603) (cons 75612 76263) (cons 75549 75612) (cons 75394 75549) (cons 75250 75394) (cons 75090 75250) (cons 74876 75090) (cons 74680 74876) (cons 74592 74680) (cons 74440 74592) (cons 74307 74440) (cons 74193 74307) (cons 73977 74193) (cons 73723 73977) (cons 73541 73723) (cons 73488 73541) (cons 73354 73488) (cons 73282 73354) (cons 73165 73282) (cons 73056 73165) (cons 72750 73056) (cons 72734 72750) (cons 72625 72734) (cons 72580 72625) (cons 72525 72580) (cons 72470 72525) (cons 72296 72470) (cons 71573 72296) (cons 71512 71573) (cons 71496 71512) (cons 71480 71496) (cons 71464 71480) (cons 71447 71464) (cons 71332 71447) (cons 71100 71332) (cons 70977 71100) (cons 70825 70977) (cons 70509 70825) (cons 70468 70509) (cons 70121 70147) (cons 69647 70101) (cons 69591 69627) (cons 69535 69571) (cons 69460 69515) (cons 68268 69440) (cons 68232 68248) (cons 68194 68212) (cons 68156 68174) (cons 68109 70468) (cons 67577 68109) (cons 67286 67577) (cons 67189 67286) (cons 66641 67189) (cons 64343 66641) (cons 62808 64343) (cons 62482 62808) (cons 62115 62482) (cons 61791 62115) (cons 61561 61791) (cons 61186 61561) (cons 61063 61186) (cons 60683 61063) (cons 60382 60683) (cons 60108 60382) (cons 59909 60108) (cons 59612 59909) (cons 59315 59612) (cons 59018 59315) (cons 58739 59018) (cons 58543 58739) (cons 58004 58543) (cons 57412 58004) (cons 56866 57412) (cons 56379 56866) (cons 55906 56379) (cons 55757 55906) (cons 55238 55757) (cons 54458 55238) (cons 54442 54458) (cons 54141 54442) (cons 54070 54141) (cons 53934 54070) (cons 53122 53934) (cons 53083 53122) (cons 52572 53083) (cons 52148 52572) (cons 51906 52148) (cons 51501 51906) (cons 51298 51501) (cons 51237 51298) (cons 51064 51237) (cons 50859 51064) (cons 50715 50859) (cons 50550 50715) (cons 50386 50550) (cons 50220 50386) (cons 49985 50220) (cons 49932 49985) (cons 48949 49932) (cons 48910 48949) (cons 48421 48910) (cons 48379 48421) (cons 48338 48379) (cons 48113 48338) (cons 48068 48113) (cons 48023 48068) (cons 47978 48023) (cons 47933 47978) (cons 47498 47933) (cons 47253 47498) (cons 47221 47253) (cons 46464 47221) (cons 45590 46464) (cons 44721 45590) (cons 43281 44721) (cons 42941 43281) (cons 42868 42941) (cons 42554 42868) (cons 42516 42554) (cons 42410 42516) (cons 42396 42410) (cons 41950 42396) (cons 41232 41950) (cons 40442 41232) (cons 39931 40442) (cons 39541 39931) (cons 39497 39541) (cons 39459 39497) (cons 39387 39459) (cons 39207 39387) (cons 39037 39207) (cons 38745 39037) (cons 38713 38745) (cons 38396 38713) (cons 38157 38396) (cons 37656 38157) (cons 37423 37656) (cons 36940 37423) (cons 34753 36940) (cons 34595 34753) (cons 34276 34595) (cons 34238 34276) (cons 34132 34238) (cons 34118 34132) (cons 34089 34118) (cons 34017 34089) (cons 33837 34017) (cons 33807 33837) (cons 33512 33807) (cons 33480 33512) (cons 33248 33480) (cons 32715 33248) (cons 31684 32715) (cons 30753 31684) (cons 30263 30753) (cons 30001 30263) (cons 29784 30001) (cons 29588 29784) (cons 29430 29588) (cons 29111 29430) (cons 29073 29111) (cons 29044 29073) (cons 29030 29044) (cons 28784 29029) (cons 28651 28784) (cons 28578 28606) (cons 28481 28558) (cons 28374 28461) (cons 28291 28354) (cons 28135 28271) (cons 28027 28124) (cons 27580 28007) (cons 27525 27560) (cons 27470 27505) (cons 27394 27450) (cons 27368 28651) (cons 26886 27368) (cons 26496 26886) (cons 26005 26496) (cons 25748 26005) (cons 24908 25748) (cons 24660 24908) (cons 24258 24660) (cons 23643 24258) (cons 23318 23643) (cons 22923 23318) (cons 22494 22923) (cons 22263 22494) (cons 21735 22263) (cons 20632 21735) (cons 20182 20632) (cons 19630 20182) (cons 18248 19630) (cons 17937 18248) (cons 17884 17937) (cons 16657 17884) (cons 16485 16657) (cons 16372 16485) (cons 16337 16372) (cons 15999 16337) (cons 15444 15999) (cons 15306 15444) (cons 15288 15306) (cons 15153 15288) (cons 15034 15153) (cons 14698 15034) (cons 14557 14698) (cons 14232 14557) (cons 14203 14232) (cons 13936 14203) (cons 13851 13936) (cons 13631 13851) (cons 13587 13631) (cons 13555 13587) (cons 13231 13555) (cons 13085 13231) (cons 12391 13085) (cons 11998 12391) (cons 11511 11998) (cons 10871 11511) (cons 10553 10871) (cons 10472 10553) (cons 9233 10472) (cons 7902 9233) (cons 6842 7902) (cons 6597 6842) (cons 6559 6597) (cons 6530 6559) (cons 6516 6530) (cons 6498 6516) (cons 6340 6498) (cons 5992 6340) (cons 5943 5992) (cons 5772 5943) (cons 5315 5772) (cons 5181 5315) (cons 5129 5181) (cons 4920 5129) (cons 4261 4920) (cons 3682 4261) (cons 3021 3682) (cons 2883 3021) (cons 2540 2883) (cons 2342 2540) (cons 1184 2342) (cons 703 1184) (cons 665 703) (cons 636 665) (cons 622 636) (cons 377 622) (cons 1 377)) (dcl-control-setenabled inters) resdyn-palsave)
  (setq inters (st_axeid (/ '((cons 160057 160136) (cons 160015 160037) (cons 159981 159995) (cons 159872 159961) (cons 159633 159861) (cons 159581 159613) (cons 159550 159561) (cons 159512 159530) (cons 159474 159492) (cons 159436 159454) (cons 159398 159416) (cons 159355 159378) (cons 159125 159335) (cons 159029 159105) (cons 159009 160606) (cons 158980 159009) (cons 158907 158980) (cons 158666 158907) (cons 158636 158666) (cons 158601 158636) (cons 158583 158601) (cons 158359 158583) (cons 158327 158359) (cons 157400 158327) (cons 157242 157400) (cons 156941 157242) (cons 156903 156941) (cons 156874 156903) (cons 156860 156874) (cons 156799 156821) (cons 156767 156779) (cons 156544 156747) (cons 156468 156524) (cons 156305 156448) (cons 156187 156285) (cons 156125 156167) (cons 156076 156105) (cons 155840 156056) (cons 155779 155820) (cons 155623 155768) (cons 155490 155612) (cons 155470 156860) (cons 155350 155470) (cons 155287 155332) (cons 155226 155260) (cons 155168 155350) (cons 155060 155168) (cons 155003 155019) (cons 154805 154983) (cons 154686 154785) (cons 154624 154666) (cons 154554 154604) (cons 154340 154534) (cons 154167 154329) (cons 154109 154156) (cons 154057 154089) (cons 154037 155060) (cons 153872 154037) (cons 153792 153872) (cons 153682 153792) (cons 153622 153667) (cons 153566 153682) (cons 153458 153566) (cons 153442 153458) (cons 153180 153442) (cons 153106 153180) (cons 152653 153106) (cons 152581 152653) (cons 152565 152581) (cons 152474 152565) (cons 152314 152474) (cons 152298 152314) (cons 152030 152298) (cons 151937 152030) (cons 151915 151937) (cons 151770 151915) (cons 151644 151746) (cons 151541 151624) (cons 151466 151521) (cons 151391 151446) (cons 151316 151371) (cons 151228 151296) (cons 151075 151208) (cons 150795 151064) (cons 150355 150784) (cons 150319 150335) (cons 150274 150299) (cons 149934 150254) (cons 149859 149914) (cons 149825 149839) (cons 149668 149805) (cons 149543 149648) (cons 149392 149523) (cons 149272 149381) (cons 149220 149252) (cons 149210 151770) (cons 149082 149210) (cons 149044 149082) (cons 148963 149044) (cons 148884 148945) (cons 148740 148963) (cons 148697 148713) (cons 148642 148677) (cons 148377 148622) (cons 148273 148357) (cons 148236 148253) (cons 148106 148216) (cons 147954 148086) (cons 147922 147934) (cons 147387 147902) (cons 147268 147367) (cons 146513 147248) (cons 146475 146493) (cons 146437 146455) (cons 146399 146417) (cons 146337 146379) (cons 146248 146317) (cons 146192 146228) (cons 146016 146172) (cons 145922 145996) (cons 145729 145902) (cons 145659 145718) (cons 145504 145648) (cons 145254 145493) (cons 145144 145243) (cons 145124 148740) (cons 144936 145124) (cons 144855 144936) (cons 144792 144837) (cons 144703 144855) (cons 144551 144703) (cons 144400 144551) (cons 144169 144400) (cons 144056 144169) (cons 143818 144056) (cons 143691 143818) (cons 143632 143691) (cons 143376 143632) (cons 143067 143376) (cons 142986 143067) (cons 142880 142986) (cons 142715 142880) (cons 142287 142715) (cons 141993 142039) (cons 141771 141973) (cons 141713 141751) (cons 141675 141693) (cons 141506 141664) (cons 141393 141486) (cons 141241 141373) (cons 141153 141230) (cons 141037 141133) (cons 140933 141017) (cons 140668 140913) (cons 140332 140657) (cons 140179 140312) (cons 140053 142287) (cons 139810 140053) (cons 139772 139810) (cons 139756 139772) (cons 139740 139756) (cons 139649 139740) (cons 139592 139649) (cons 139535 139592) (cons 139179 139535) (cons 139047 139179) (cons 138935 139047) (cons 138645 138935) (cons 138391 138645) (cons 138192 138391) (cons 137627 138192) (cons 137171 137627) (cons 136723 137171) (cons 136167 136723) (cons 135993 136167) (cons 135627 135993) (cons 135347 135627) (cons 135311 135347) (cons 135273 135311) (cons 135244 135273) (cons 135230 135244) (cons 135201 135230) (cons 135154 135201) (cons 135045 135154) (cons 134939 135045) (cons 134833 134939) (cons 134727 134833) (cons 134709 134727) (cons 134691 134709) (cons 134622 134691) (cons 134347 134622) (cons 134309 134347) (cons 133498 134309) (cons 131945 133498) (cons 131669 131945) (cons 131464 131669) (cons 131295 131464) (cons 130964 131295) (cons 130950 130964) (cons 130912 130950) (cons 130883 130912) (cons 130869 130883) (cons 130723 130836) (cons 130559 130703) (cons 130352 130539) (cons 130155 130869) (cons 130118 130155) (cons 130040 130118) (cons 129971 130040) (cons 129744 129971) (cons 129612 129744) (cons 129142 129612) (cons 129110 129142) (cons 128362 128830) (cons 128291 129110) (cons 127764 128291) (cons 127755 127764) (cons 127603 127755) (cons 127460 127603) (cons 127302 127460) (cons 127013 127302) (cons 126975 127013) (cons 126946 126975) (cons 126932 126946) (cons 126766 126932) (cons 126708 126766) (cons 126618 126708) (cons 126243 126618) (cons 126184 126243) (cons 126173 126184) (cons 125882 126173) (cons 125864 125882) (cons 125846 125864) (cons 125828 125846) (cons 125810 125828) (cons 125792 125810) (cons 125751 125792) (cons 125726 125751) (cons 125654 125726) (cons 125623 125654) (cons 125022 125623) (cons 124953 125022) (cons 124303 124953) (cons 124265 124303) (cons 123656 124265) (cons 122913 123656) (cons 122303 122913) (cons 122145 122303) (cons 121670 122145) (cons 121632 121670) (cons 121603 121632) (cons 121589 121603) (cons 121444 121589) (cons 121252 121444) (cons 121233 121252) (cons 121217 121233) (cons 120197 121217) (cons 119780 120197) (cons 119499 119780) (cons 118725 119499) (cons 118560 118725) (cons 118187 118560) (cons 117951 118187) (cons 117762 117951) (cons 117187 117762) (cons 116053 117187) (cons 115853 116053) (cons 115664 115853) (cons 115514 115664) (cons 115393 115514) (cons 115035 115393) (cons 114997 115035) (cons 114968 114997) (cons 114954 114968) (cons 114925 114954) (cons 114819 114925) (cons 114669 114819) (cons 114439 114669) (cons 114209 114439) (cons 114191 114209) (cons 113935 114191) (cons 113897 113935) (cons 113528 113897) (cons 113253 113528) (cons 112435 113253) (cons 111704 112435) (cons 111666 111704) (cons 111637 111666) (cons 111623 111637) (cons 111058 111176) (cons 110815 111047) (cons 110502 110804) (cons 110189 110491) (cons 109964 110178) (cons 109749 109953) (cons 109523 109738) (cons 109274 109512) (cons 109049 109263) (cons 109014 111623) (cons 108961 109014) (cons 108687 108961) (cons 108385 108687) (cons 108321 108385) (cons 108263 108321) (cons 108001 108263) (cons 107544 108001) (cons 107520 107544) (cons 107083 107520) (cons 106578 107083) (cons 106183 106578) (cons 105759 106183) (cons 104942 105759) (cons 104672 104942) (cons 104440 104672) (cons 103671 104440) (cons 103310 103671) (cons 102920 103310) (cons 102818 102920) (cons 102781 102818) (cons 102677 102781) (cons 102444 102677) (cons 102064 102444) (cons 102046 102064) (cons 102028 102046) (cons 102010 102028) (cons 101992 102010) (cons 101785 101992) (cons 101591 101785) (cons 101577 101591) (cons 101550 101577) (cons 101229 101550) (cons 101051 101229) (cons 99879 101051) (cons 99815 99879) (cons 99509 99815) (cons 99313 99509) (cons 99073 99313) (cons 98595 99073) (cons 98174 98595) (cons 97934 98174) (cons 97787 97934) (cons 96110 97787) (cons 95955 96110) (cons 95721 95955) (cons 95551 95721) (cons 95159 95551) (cons 94807 95159) (cons 94494 94807) (cons 94045 94494) (cons 93996 94045) (cons 93807 93996) (cons 93594 93807) (cons 93556 93594) (cons 93527 93556) (cons 93513 93527) (cons 93415 93465) (cons 93368 93395) (cons 93261 93348) (cons 93004 93241) (cons 92975 93513) (cons 92877 92975) (cons 92785 92877) (cons 92769 92785) (cons 92752 92769) (cons 92725 92752) (cons 92667 92725) (cons 92647 92667) (cons 92580 92647) (cons 92452 92580) (cons 92124 92452) (cons 90651 92124) (cons 90495 90651) (cons 90273 90495) (cons 90205 90273) (cons 90135 90205) (cons 89973 90135) (cons 89901 89973) (cons 89463 89901) (cons 89434 89463) (cons 89254 89434) (cons 89225 89254) (cons 89009 89225) (cons 88828 89009) (cons 88647 88828) (cons 88377 88647) (cons 87867 88377) (cons 87494 87867) (cons 86354 87494) (cons 86319 86354) (cons 85749 86319) (cons 85581 85749) (cons 85200 85581) (cons 85151 85200) (cons 84652 85151) (cons 84423 84652) (cons 84133 84423) (cons 83802 84133) (cons 83450 83802) (cons 83049 83450) (cons 82985 83049) (cons 82808 82985) (cons 82794 82808) (cons 82486 82794) (cons 82324 82486) (cons 82191 82324) (cons 81864 82191) (cons 81740 81864) (cons 81513 81740) (cons 81322 81513) (cons 80931 81322) (cons 80319 80931) (cons 79935 80319) (cons 79800 79935) (cons 79618 79800) (cons 79171 79618) (cons 79005 79054) (cons 78885 78985) (cons 78849 78865) (cons 78811 78829) (cons 78773 78791) (cons 78603 78753) (cons 78562 79171) (cons 78546 78562) (cons 78393 78546) (cons 77922 78393) (cons 77785 77922) (cons 77258 77785) (cons 76632 77258) (cons 76603 76632) (cons 76263 76603) (cons 75612 76263) (cons 75549 75612) (cons 75394 75549) (cons 75250 75394) (cons 75090 75250) (cons 74876 75090) (cons 74680 74876) (cons 74592 74680) (cons 74440 74592) (cons 74307 74440) (cons 74193 74307) (cons 73977 74193) (cons 73723 73977) (cons 73541 73723) (cons 73488 73541) (cons 73354 73488) (cons 73282 73354) (cons 73165 73282) (cons 73056 73165) (cons 72750 73056) (cons 72734 72750) (cons 72625 72734) (cons 72580 72625) (cons 72525 72580) (cons 72470 72525) (cons 72296 72470) (cons 71573 72296) (cons 71512 71573) (cons 71496 71512) (cons 71480 71496) (cons 71464 71480) (cons 71447 71464) (cons 71332 71447) (cons 71100 71332) (cons 70977 71100) (cons 70825 70977) (cons 70509 70825) (cons 70468 70509) (cons 70121 70147) (cons 69647 70101) (cons 69591 69627) (cons 69535 69571) (cons 69460 69515) (cons 68268 69440) (cons 68232 68248) (cons 68194 68212) (cons 68156 68174) (cons 68109 70468) (cons 67577 68109) (cons 67286 67577) (cons 67189 67286) (cons 66641 67189) (cons 64343 66641) (cons 62808 64343) (cons 62482 62808) (cons 62115 62482) (cons 61791 62115) (cons 61561 61791) (cons 61186 61561) (cons 61063 61186) (cons 60683 61063) (cons 60382 60683) (cons 60108 60382) (cons 59909 60108) (cons 59612 59909) (cons 59315 59612) (cons 59018 59315) (cons 58739 59018) (cons 58543 58739) (cons 58004 58543) (cons 57412 58004) (cons 56866 57412) (cons 56379 56866) (cons 55906 56379) (cons 55757 55906) (cons 55238 55757) (cons 54458 55238) (cons 54442 54458) (cons 54141 54442) (cons 54070 54141) (cons 53934 54070) (cons 53122 53934) (cons 53083 53122) (cons 52572 53083) (cons 52148 52572) (cons 51906 52148) (cons 51501 51906) (cons 51298 51501) (cons 51237 51298) (cons 51064 51237) (cons 50859 51064) (cons 50715 50859) (cons 50550 50715) (cons 50386 50550) (cons 50220 50386) (cons 49985 50220) (cons 49932 49985) (cons 48949 49932) (cons 48910 48949) (cons 48421 48910) (cons 48379 48421) (cons 48338 48379) (cons 48113 48338) (cons 48068 48113) (cons 48023 48068) (cons 47978 48023) (cons 47933 47978) (cons 47498 47933) (cons 47253 47498) (cons 47221 47253) (cons 46464 47221) (cons 45590 46464) (cons 44721 45590) (cons 43281 44721) (cons 42941 43281) (cons 42868 42941) (cons 42554 42868) (cons 42516 42554) (cons 42410 42516) (cons 42396 42410) (cons 41950 42396) (cons 41232 41950) (cons 40442 41232) (cons 39931 40442) (cons 39541 39931) (cons 39497 39541) (cons 39459 39497) (cons 39387 39459) (cons 39207 39387) (cons 39037 39207) (cons 38745 39037) (cons 38713 38745) (cons 38396 38713) (cons 38157 38396) (cons 37656 38157) (cons 37423 37656) (cons 36940 37423) (cons 34753 36940) (cons 34595 34753) (cons 34276 34595) (cons 34238 34276) (cons 34132 34238) (cons 34118 34132) (cons 34089 34118) (cons 34017 34089) (cons 33837 34017) (cons 33807 33837) (cons 33512 33807) (cons 33480 33512) (cons 33248 33480) (cons 32715 33248) (cons 31684 32715) (cons 30753 31684) (cons 30263 30753) (cons 30001 30263) (cons 29784 30001) (cons 29588 29784) (cons 29430 29588) (cons 29111 29430) (cons 29073 29111) (cons 29044 29073) (cons 29030 29044) (cons 28784 29029) (cons 28651 28784) (cons 28578 28606) (cons 28481 28558) (cons 28374 28461) (cons 28291 28354) (cons 28135 28271) (cons 28027 28124) (cons 27580 28007) (cons 27525 27560) (cons 27470 27505) (cons 27394 27450) (cons 27368 28651) (cons 26886 27368) (cons 26496 26886) (cons 26005 26496) (cons 25748 26005) (cons 24908 25748) (cons 24660 24908) (cons 24258 24660) (cons 23643 24258) (cons 23318 23643) (cons 22923 23318) (cons 22494 22923) (cons 22263 22494) (cons 21735 22263) (cons 20632 21735) (cons 20182 20632) (cons 19630 20182) (cons 18248 19630) (cons 17937 18248) (cons 17884 17937) (cons 16657 17884) (cons 16485 16657) (cons 16372 16485) (cons 16337 16372) (cons 15999 16337) (cons 15444 15999) (cons 15306 15444) (cons 15288 15306) (cons 15153 15288) (cons 15034 15153) (cons 14698 15034) (cons 14557 14698) (cons 14232 14557) (cons 14203 14232) (cons 13936 14203) (cons 13851 13936) (cons 13631 13851) (cons 13587 13631) (cons 13555 13587) (cons 13231 13555) (cons 13085 13231) (cons 12391 13085) (cons 11998 12391) (cons 11511 11998) (cons 10871 11511) (cons 10553 10871) (cons 10472 10553) (cons 9233 10472) (cons 7902 9233) (cons 6842 7902) (cons 6597 6842) (cons 6559 6597) (cons 6530 6559) (cons 6516 6530) (cons 6498 6516) (cons 6340 6498) (cons 5992 6340) (cons 5943 5992) (cons 5772 5943) (cons 5315 5772) (cons 5181 5315) (cons 5129 5181) (cons 4920 5129) (cons 4261 4920) (cons 3682 4261) (cons 3021 3682) (cons 2883 3021) (cons 2540 2883) (cons 2342 2540) (cons 1184 2342) (cons 703 1184) (cons 665 703) (cons 636 665) (cons 622 636) (cons 377 622) (cons 1 377)))))
  (setq resdyn-palsave (es_ext (groupbib-list 'ls_obj in_lon0_2) (groupbib-list "Repère" blkbib-getparententities_2) (groupbib-list 'projet_md_selforce_re_color vlax-curve-getparamatpoint_2)))
  inters
)

;; Referenced symbols: RESDYN-PALCLOSE, ENTDEL, C:PROJET/MD_TYPELIGNE/ST_STYLELIGNE#ONSELCHANGED, C:PROJET/PA_RESDYN/LS_BLKNAME#ONSELCHANGED, *REACTOR2*, HA_POLY2, AXEDYN-REACCREATE, EO_POLYABS, LS_OBJ, IN_PARAM
;; Referenced strings: Impossible de générer la polyligne contour, LinetypeGeneration, Repère
(defun stylerep-go ( / local_0 local_1)
  (entdel 'resdyn-palclose)
  (entdel 'c:projet_md_typeligne_st_styleligne_onselchanged)
  (*reactor2* gvar_133_c_projet_pa_resdyn_ls_blkname_onselchanged)
  (setq ha_poly2 (typelinebib-list))
  (setq local_0 ha_poly2)
  ;; init-args 3: "Impossible de générer la polyligne contour", nil
  nil
  (foreach gvar_2519 local_0
    (setq en_rayon (axedyn-reaccreate gvar_2519))
    (setq in_lon0 (in_param (eo_polyabs gvar_2519) 'ls_obj))
    (projet_md_geststylechem-signa_re_u gvar_133_c_projet_pa_resdyn_ls_blkname_onselchanged in_lon0)
  )
  (setq gvar_132_c_projet_pa_resdyn_re_long_onsetfocus 'dcl-form-isactive)
  ;; init-args 3: 'covassbib-getmanhole, local_0
  (vlax-vla-object->ename gvar_131_c_projet_pa_resdyn_re_gap_onsetfocus (cadr covassbib-getmanhole))
  (vlax-vla-object->ename gvar_130_c_projet_pa_resdyn_re_decy_onsetfocus (cadr covassbib-getmanhole))
  (vlax-vla-object->ename gvar_129_c_projet_pa_resdyn_re_amont_onsetfocus (cadr covassbib-getmanhole))
  (vlax-vla-object->ename gvar_128_c_projet_pa_resdyn_re_aval_onsetfocus (cadr covassbib-getmanhole))
  (vlax-vla-object->ename gvar_127_c_projet_md_selforce_bt_ok_onclicked covassbib-getmanhole)
  (vlax-vla-object->ename gvar_126_c_projet_md_selforce_bt_color_onclicked covassbib-getmanhole)
  (vlax-vla-object->ename selforcedial_bt_color covassbib-getmanhole)
  (vlax-vla-object->ename gvar_124_c_projet_md_selforce_oninitialize covassbib-getmanhole)
  (vlax-vla-object->ename gvar_123_c_projet_md_selforce_cb_couleur_onselchanged covassbib-getmanhole)
  (setq gvar_122_c_projet_md_selforce_bt_reset_onclicked 'handent)
  (c:projet_pa_resdyn_re_long_onsetfocus)
  (c:projet_md_selforce_bt_reset_onclicked nil)
  (ls_polys selforcedial_bt_color (*reactor2*))
  (re_largbande gvar_126_c_projet_md_selforce_bt_color_onclicked)
  (ls_debfinrad 'selforce)
  (setq selforce 'axedyn-getmaxray)
  ;; init-args 5: 'eo_poly, local_0, "LinetypeGeneration", local_1
  (vlax-vla-object->ename gvar_129_c_projet_pa_resdyn_re_amont_onsetfocus (cadr (re_angle re_yinv 'metbib-metzgo)))
  (bo_lctabs gvar_126_c_projet_md_selforce_bt_color_onclicked blkbib-getparententities)
  (bo_lctabs selforcedial_bt_color vlax-curve-getparamatpoint)
  (pt_poly sihlin-list vlax-curve-getparamatpoint)
  (*ls_style* sihlin-list 'sihlin-get)
  (bo_lctabs gvar_127_c_projet_md_selforce_bt_ok_onclicked in_lon0)
  (vlax-vla-object->ename gvar_130_c_projet_pa_resdyn_re_decy_onsetfocus polybib-vtxjoin)
  (setq ha_poly2 (typelinebib-list))
  (setq gvar_2519 (dcl-grid-addrow eo_poly ha_poly2))
  (setq re_yinv (axedyn-reaccreate gvar_2519))
  (setq in_lon0 (in_param (eo_polyabs gvar_2519) 'ls_obj))
  (setq blkbib-getparententities (in_param (eo_polyabs gvar_2519) "Repère"))
  (setq vlax-curve-getparamatpoint (in_param (eo_polyabs gvar_2519) 'projet_md_selforce_re_color))
  (ls_som0)
  (ls_debfinrad 'sihlin-set)
  (setq sihlin-set 'ls_raymax)
  (ls_parentconf '((cons 160057 160136) (cons 160015 160037) (cons 159981 159995) (cons 159872 159961) (cons 159633 159861) (cons 159581 159613) (cons 159550 159561) (cons 159512 159530) (cons 159474 159492) (cons 159436 159454) (cons 159398 159416) (cons 159355 159378) (cons 159125 159335) (cons 159029 159105) (cons 159009 160606) (cons 158980 159009) (cons 158907 158980) (cons 158666 158907) (cons 158636 158666) (cons 158601 158636) (cons 158583 158601) (cons 158359 158583) (cons 158327 158359) (cons 157400 158327) (cons 157242 157400) (cons 156941 157242) (cons 156903 156941) (cons 156874 156903) (cons 156860 156874) (cons 156799 156821) (cons 156767 156779) (cons 156544 156747) (cons 156468 156524) (cons 156305 156448) (cons 156187 156285) (cons 156125 156167) (cons 156076 156105) (cons 155840 156056) (cons 155779 155820) (cons 155623 155768) (cons 155490 155612) (cons 155470 156860) (cons 155350 155470) (cons 155287 155332) (cons 155226 155260) (cons 155168 155350) (cons 155060 155168) (cons 155003 155019) (cons 154805 154983) (cons 154686 154785) (cons 154624 154666) (cons 154554 154604) (cons 154340 154534) (cons 154167 154329) (cons 154109 154156) (cons 154057 154089) (cons 154037 155060) (cons 153872 154037) (cons 153792 153872) (cons 153682 153792) (cons 153622 153667) (cons 153566 153682) (cons 153458 153566) (cons 153442 153458) (cons 153180 153442) (cons 153106 153180) (cons 152653 153106) (cons 152581 152653) (cons 152565 152581) (cons 152474 152565) (cons 152314 152474) (cons 152298 152314) (cons 152030 152298) (cons 151937 152030) (cons 151915 151937) (cons 151770 151915) (cons 151644 151746) (cons 151541 151624) (cons 151466 151521) (cons 151391 151446) (cons 151316 151371) (cons 151228 151296) (cons 151075 151208) (cons 150795 151064) (cons 150355 150784) (cons 150319 150335) (cons 150274 150299) (cons 149934 150254) (cons 149859 149914) (cons 149825 149839) (cons 149668 149805) (cons 149543 149648) (cons 149392 149523) (cons 149272 149381) (cons 149220 149252) (cons 149210 151770) (cons 149082 149210) (cons 149044 149082) (cons 148963 149044) (cons 148884 148945) (cons 148740 148963) (cons 148697 148713) (cons 148642 148677) (cons 148377 148622) (cons 148273 148357) (cons 148236 148253) (cons 148106 148216) (cons 147954 148086) (cons 147922 147934) (cons 147387 147902) (cons 147268 147367) (cons 146513 147248) (cons 146475 146493) (cons 146437 146455) (cons 146399 146417) (cons 146337 146379) (cons 146248 146317) (cons 146192 146228) (cons 146016 146172) (cons 145922 145996) (cons 145729 145902) (cons 145659 145718) (cons 145504 145648) (cons 145254 145493) (cons 145144 145243) (cons 145124 148740) (cons 144936 145124) (cons 144855 144936) (cons 144792 144837) (cons 144703 144855) (cons 144551 144703) (cons 144400 144551) (cons 144169 144400) (cons 144056 144169) (cons 143818 144056) (cons 143691 143818) (cons 143632 143691) (cons 143376 143632) (cons 143067 143376) (cons 142986 143067) (cons 142880 142986) (cons 142715 142880) (cons 142287 142715) (cons 141993 142039) (cons 141771 141973) (cons 141713 141751) (cons 141675 141693) (cons 141506 141664) (cons 141393 141486) (cons 141241 141373) (cons 141153 141230) (cons 141037 141133) (cons 140933 141017) (cons 140668 140913) (cons 140332 140657) (cons 140179 140312) (cons 140053 142287) (cons 139810 140053) (cons 139772 139810) (cons 139756 139772) (cons 139740 139756) (cons 139649 139740) (cons 139592 139649) (cons 139535 139592) (cons 139179 139535) (cons 139047 139179) (cons 138935 139047) (cons 138645 138935) (cons 138391 138645) (cons 138192 138391) (cons 137627 138192) (cons 137171 137627) (cons 136723 137171) (cons 136167 136723) (cons 135993 136167) (cons 135627 135993) (cons 135347 135627) (cons 135311 135347) (cons 135273 135311) (cons 135244 135273) (cons 135230 135244) (cons 135201 135230) (cons 135154 135201) (cons 135045 135154) (cons 134939 135045) (cons 134833 134939) (cons 134727 134833) (cons 134709 134727) (cons 134691 134709) (cons 134622 134691) (cons 134347 134622) (cons 134309 134347) (cons 133498 134309) (cons 131945 133498) (cons 131669 131945) (cons 131464 131669) (cons 131295 131464) (cons 130964 131295) (cons 130950 130964) (cons 130912 130950) (cons 130883 130912) (cons 130869 130883) (cons 130723 130836) (cons 130559 130703) (cons 130352 130539) (cons 130155 130869) (cons 130118 130155) (cons 130040 130118) (cons 129971 130040) (cons 129744 129971) (cons 129612 129744) (cons 129142 129612) (cons 129110 129142) (cons 128362 128830) (cons 128291 129110) (cons 127764 128291) (cons 127755 127764) (cons 127603 127755) (cons 127460 127603) (cons 127302 127460) (cons 127013 127302) (cons 126975 127013) (cons 126946 126975) (cons 126932 126946) (cons 126766 126932) (cons 126708 126766) (cons 126618 126708) (cons 126243 126618) (cons 126184 126243) (cons 126173 126184) (cons 125882 126173) (cons 125864 125882) (cons 125846 125864) (cons 125828 125846) (cons 125810 125828) (cons 125792 125810) (cons 125751 125792) (cons 125726 125751) (cons 125654 125726) (cons 125623 125654) (cons 125022 125623) (cons 124953 125022) (cons 124303 124953) (cons 124265 124303) (cons 123656 124265) (cons 122913 123656) (cons 122303 122913) (cons 122145 122303) (cons 121670 122145) (cons 121632 121670) (cons 121603 121632) (cons 121589 121603) (cons 121444 121589) (cons 121252 121444) (cons 121233 121252) (cons 121217 121233) (cons 120197 121217) (cons 119780 120197) (cons 119499 119780) (cons 118725 119499) (cons 118560 118725) (cons 118187 118560) (cons 117951 118187) (cons 117762 117951) (cons 117187 117762) (cons 116053 117187) (cons 115853 116053) (cons 115664 115853) (cons 115514 115664) (cons 115393 115514) (cons 115035 115393) (cons 114997 115035) (cons 114968 114997) (cons 114954 114968) (cons 114925 114954) (cons 114819 114925) (cons 114669 114819) (cons 114439 114669) (cons 114209 114439) (cons 114191 114209) (cons 113935 114191) (cons 113897 113935) (cons 113528 113897) (cons 113253 113528) (cons 112435 113253) (cons 111704 112435) (cons 111666 111704) (cons 111637 111666) (cons 111623 111637) (cons 111058 111176) (cons 110815 111047) (cons 110502 110804) (cons 110189 110491) (cons 109964 110178) (cons 109749 109953) (cons 109523 109738) (cons 109274 109512) (cons 109049 109263) (cons 109014 111623) (cons 108961 109014) (cons 108687 108961) (cons 108385 108687) (cons 108321 108385) (cons 108263 108321) (cons 108001 108263) (cons 107544 108001) (cons 107520 107544) (cons 107083 107520) (cons 106578 107083) (cons 106183 106578) (cons 105759 106183) (cons 104942 105759) (cons 104672 104942) (cons 104440 104672) (cons 103671 104440) (cons 103310 103671) (cons 102920 103310) (cons 102818 102920) (cons 102781 102818) (cons 102677 102781) (cons 102444 102677) (cons 102064 102444) (cons 102046 102064) (cons 102028 102046) (cons 102010 102028) (cons 101992 102010) (cons 101785 101992) (cons 101591 101785) (cons 101577 101591) (cons 101550 101577) (cons 101229 101550) (cons 101051 101229) (cons 99879 101051) (cons 99815 99879) (cons 99509 99815) (cons 99313 99509) (cons 99073 99313) (cons 98595 99073) (cons 98174 98595) (cons 97934 98174) (cons 97787 97934) (cons 96110 97787) (cons 95955 96110) (cons 95721 95955) (cons 95551 95721) (cons 95159 95551) (cons 94807 95159) (cons 94494 94807) (cons 94045 94494) (cons 93996 94045) (cons 93807 93996) (cons 93594 93807) (cons 93556 93594) (cons 93527 93556) (cons 93513 93527) (cons 93415 93465) (cons 93368 93395) (cons 93261 93348) (cons 93004 93241) (cons 92975 93513) (cons 92877 92975) (cons 92785 92877) (cons 92769 92785) (cons 92752 92769) (cons 92725 92752) (cons 92667 92725) (cons 92647 92667) (cons 92580 92647) (cons 92452 92580) (cons 92124 92452) (cons 90651 92124) (cons 90495 90651) (cons 90273 90495) (cons 90205 90273) (cons 90135 90205) (cons 89973 90135) (cons 89901 89973) (cons 89463 89901) (cons 89434 89463) (cons 89254 89434) (cons 89225 89254) (cons 89009 89225) (cons 88828 89009) (cons 88647 88828) (cons 88377 88647) (cons 87867 88377) (cons 87494 87867) (cons 86354 87494) (cons 86319 86354) (cons 85749 86319) (cons 85581 85749) (cons 85200 85581) (cons 85151 85200) (cons 84652 85151) (cons 84423 84652) (cons 84133 84423) (cons 83802 84133) (cons 83450 83802) (cons 83049 83450) (cons 82985 83049) (cons 82808 82985) (cons 82794 82808) (cons 82486 82794) (cons 82324 82486) (cons 82191 82324) (cons 81864 82191) (cons 81740 81864) (cons 81513 81740) (cons 81322 81513) (cons 80931 81322) (cons 80319 80931) (cons 79935 80319) (cons 79800 79935) (cons 79618 79800) (cons 79171 79618) (cons 79005 79054) (cons 78885 78985) (cons 78849 78865) (cons 78811 78829) (cons 78773 78791) (cons 78603 78753) (cons 78562 79171) (cons 78546 78562) (cons 78393 78546) (cons 77922 78393) (cons 77785 77922) (cons 77258 77785) (cons 76632 77258) (cons 76603 76632) (cons 76263 76603) (cons 75612 76263) (cons 75549 75612) (cons 75394 75549) (cons 75250 75394) (cons 75090 75250) (cons 74876 75090) (cons 74680 74876) (cons 74592 74680) (cons 74440 74592) (cons 74307 74440) (cons 74193 74307) (cons 73977 74193) (cons 73723 73977) (cons 73541 73723) (cons 73488 73541) (cons 73354 73488) (cons 73282 73354) (cons 73165 73282) (cons 73056 73165) (cons 72750 73056) (cons 72734 72750) (cons 72625 72734) (cons 72580 72625) (cons 72525 72580) (cons 72470 72525) (cons 72296 72470) (cons 71573 72296) (cons 71512 71573) (cons 71496 71512) (cons 71480 71496) (cons 71464 71480) (cons 71447 71464) (cons 71332 71447) (cons 71100 71332) (cons 70977 71100) (cons 70825 70977) (cons 70509 70825) (cons 70468 70509) (cons 70121 70147) (cons 69647 70101) (cons 69591 69627) (cons 69535 69571) (cons 69460 69515) (cons 68268 69440) (cons 68232 68248) (cons 68194 68212) (cons 68156 68174) (cons 68109 70468) (cons 67577 68109) (cons 67286 67577) (cons 67189 67286) (cons 66641 67189) (cons 64343 66641) (cons 62808 64343) (cons 62482 62808) (cons 62115 62482) (cons 61791 62115) (cons 61561 61791) (cons 61186 61561) (cons 61063 61186) (cons 60683 61063) (cons 60382 60683) (cons 60108 60382) (cons 59909 60108) (cons 59612 59909) (cons 59315 59612) (cons 59018 59315) (cons 58739 59018) (cons 58543 58739) (cons 58004 58543) (cons 57412 58004) (cons 56866 57412) (cons 56379 56866) (cons 55906 56379) (cons 55757 55906) (cons 55238 55757) (cons 54458 55238) (cons 54442 54458) (cons 54141 54442) (cons 54070 54141) (cons 53934 54070) (cons 53122 53934) (cons 53083 53122) (cons 52572 53083) (cons 52148 52572) (cons 51906 52148) (cons 51501 51906) (cons 51298 51501) (cons 51237 51298) (cons 51064 51237) (cons 50859 51064) (cons 50715 50859) (cons 50550 50715) (cons 50386 50550) (cons 50220 50386) (cons 49985 50220) (cons 49932 49985) (cons 48949 49932) (cons 48910 48949) (cons 48421 48910) (cons 48379 48421) (cons 48338 48379) (cons 48113 48338) (cons 48068 48113) (cons 48023 48068) (cons 47978 48023) (cons 47933 47978) (cons 47498 47933) (cons 47253 47498) (cons 47221 47253) (cons 46464 47221) (cons 45590 46464) (cons 44721 45590) (cons 43281 44721) (cons 42941 43281) (cons 42868 42941) (cons 42554 42868) (cons 42516 42554) (cons 42410 42516) (cons 42396 42410) (cons 41950 42396) (cons 41232 41950) (cons 40442 41232) (cons 39931 40442) (cons 39541 39931) (cons 39497 39541) (cons 39459 39497) (cons 39387 39459) (cons 39207 39387) (cons 39037 39207) (cons 38745 39037) (cons 38713 38745) (cons 38396 38713) (cons 38157 38396) (cons 37656 38157) (cons 37423 37656) (cons 36940 37423) (cons 34753 36940) (cons 34595 34753) (cons 34276 34595) (cons 34238 34276) (cons 34132 34238) (cons 34118 34132) (cons 34089 34118) (cons 34017 34089) (cons 33837 34017) (cons 33807 33837) (cons 33512 33807) (cons 33480 33512) (cons 33248 33480) (cons 32715 33248) (cons 31684 32715) (cons 30753 31684) (cons 30263 30753) (cons 30001 30263) (cons 29784 30001) (cons 29588 29784) (cons 29430 29588) (cons 29111 29430) (cons 29073 29111) (cons 29044 29073) (cons 29030 29044) (cons 28784 29029) (cons 28651 28784) (cons 28578 28606) (cons 28481 28558) (cons 28374 28461) (cons 28291 28354) (cons 28135 28271) (cons 28027 28124) (cons 27580 28007) (cons 27525 27560) (cons 27470 27505) (cons 27394 27450) (cons 27368 28651) (cons 26886 27368) (cons 26496 26886) (cons 26005 26496) (cons 25748 26005) (cons 24908 25748) (cons 24660 24908) (cons 24258 24660) (cons 23643 24258) (cons 23318 23643) (cons 22923 23318) (cons 22494 22923) (cons 22263 22494) (cons 21735 22263) (cons 20632 21735) (cons 20182 20632) (cons 19630 20182) (cons 18248 19630) (cons 17937 18248) (cons 17884 17937) (cons 16657 17884) (cons 16485 16657) (cons 16372 16485) (cons 16337 16372) (cons 15999 16337) (cons 15444 15999) (cons 15306 15444) (cons 15288 15306) (cons 15153 15288) (cons 15034 15153) (cons 14698 15034) (cons 14557 14698) (cons 14232 14557) (cons 14203 14232) (cons 13936 14203) (cons 13851 13936) (cons 13631 13851) (cons 13587 13631) (cons 13555 13587) (cons 13231 13555) (cons 13085 13231) (cons 12391 13085) (cons 11998 12391) (cons 11511 11998) (cons 10871 11511) (cons 10553 10871) (cons 10472 10553) (cons 9233 10472) (cons 7902 9233) (cons 6842 7902) (cons 6597 6842) (cons 6559 6597) (cons 6530 6559) (cons 6516 6530) (cons 6498 6516) (cons 6340 6498) (cons 5992 6340) (cons 5943 5992) (cons 5772 5943) (cons 5315 5772) (cons 5181 5315) (cons 5129 5181) (cons 4920 5129) (cons 4261 4920) (cons 3682 4261) (cons 3021 3682) (cons 2883 3021) (cons 2540 2883) (cons 2342 2540) (cons 1184 2342) (cons 703 1184) (cons 665 703) (cons 636 665) (cons 622 636) (cons 377 622) (cons 1 377)) re_yinv)
  (c:projet_pa_resdyn_re_long_onsetfocus)
  (ls_som0)
  (ls_debfinrad 'sihlin-create)
  (setq sihlin-create 'axedyn-getfinalray)
  (c:projet_md_selforce_bt_reset_onclicked polybib-vtxjoin)
  (en_hatch gvar_127_c_projet_md_selforce_bt_ok_onclicked)
  (ls_entnew gvar_127_c_projet_md_selforce_bt_ok_onclicked 0 255)
  (ls_som0)
  (ls_debfinrad 'sihlin-getparents)
  (setq sihlin-getparents 'ha_group)
  (c:projet_md_selforce_bt_reset_onclicked polybib-vtxjoin)
  (bo_lctabs gvar_127_c_projet_md_selforce_bt_ok_onclicked 'projet_md_geststylepoly_btn_edit)
  (bo_lctabs gvar_126_c_projet_md_selforce_bt_color_onclicked 'st_btn)
  (bo_invpoly1 selforcedial_bt_color 255)
  (en_hatch gvar_127_c_projet_md_selforce_bt_ok_onclicked)
  (ls_entnew gvar_127_c_projet_md_selforce_bt_ok_onclicked 0 255)
  (setq re_yinv (dcl-control-setenabled (st_axeid (/ '((cons 160057 160136) (cons 160015 160037) (cons 159981 159995) (cons 159872 159961) (cons 159633 159861) (cons 159581 159613) (cons 159550 159561) (cons 159512 159530) (cons 159474 159492) (cons 159436 159454) (cons 159398 159416) (cons 159355 159378) (cons 159125 159335) (cons 159029 159105) (cons 159009 160606) (cons 158980 159009) (cons 158907 158980) (cons 158666 158907) (cons 158636 158666) (cons 158601 158636) (cons 158583 158601) (cons 158359 158583) (cons 158327 158359) (cons 157400 158327) (cons 157242 157400) (cons 156941 157242) (cons 156903 156941) (cons 156874 156903) (cons 156860 156874) (cons 156799 156821) (cons 156767 156779) (cons 156544 156747) (cons 156468 156524) (cons 156305 156448) (cons 156187 156285) (cons 156125 156167) (cons 156076 156105) (cons 155840 156056) (cons 155779 155820) (cons 155623 155768) (cons 155490 155612) (cons 155470 156860) (cons 155350 155470) (cons 155287 155332) (cons 155226 155260) (cons 155168 155350) (cons 155060 155168) (cons 155003 155019) (cons 154805 154983) (cons 154686 154785) (cons 154624 154666) (cons 154554 154604) (cons 154340 154534) (cons 154167 154329) (cons 154109 154156) (cons 154057 154089) (cons 154037 155060) (cons 153872 154037) (cons 153792 153872) (cons 153682 153792) (cons 153622 153667) (cons 153566 153682) (cons 153458 153566) (cons 153442 153458) (cons 153180 153442) (cons 153106 153180) (cons 152653 153106) (cons 152581 152653) (cons 152565 152581) (cons 152474 152565) (cons 152314 152474) (cons 152298 152314) (cons 152030 152298) (cons 151937 152030) (cons 151915 151937) (cons 151770 151915) (cons 151644 151746) (cons 151541 151624) (cons 151466 151521) (cons 151391 151446) (cons 151316 151371) (cons 151228 151296) (cons 151075 151208) (cons 150795 151064) (cons 150355 150784) (cons 150319 150335) (cons 150274 150299) (cons 149934 150254) (cons 149859 149914) (cons 149825 149839) (cons 149668 149805) (cons 149543 149648) (cons 149392 149523) (cons 149272 149381) (cons 149220 149252) (cons 149210 151770) (cons 149082 149210) (cons 149044 149082) (cons 148963 149044) (cons 148884 148945) (cons 148740 148963) (cons 148697 148713) (cons 148642 148677) (cons 148377 148622) (cons 148273 148357) (cons 148236 148253) (cons 148106 148216) (cons 147954 148086) (cons 147922 147934) (cons 147387 147902) (cons 147268 147367) (cons 146513 147248) (cons 146475 146493) (cons 146437 146455) (cons 146399 146417) (cons 146337 146379) (cons 146248 146317) (cons 146192 146228) (cons 146016 146172) (cons 145922 145996) (cons 145729 145902) (cons 145659 145718) (cons 145504 145648) (cons 145254 145493) (cons 145144 145243) (cons 145124 148740) (cons 144936 145124) (cons 144855 144936) (cons 144792 144837) (cons 144703 144855) (cons 144551 144703) (cons 144400 144551) (cons 144169 144400) (cons 144056 144169) (cons 143818 144056) (cons 143691 143818) (cons 143632 143691) (cons 143376 143632) (cons 143067 143376) (cons 142986 143067) (cons 142880 142986) (cons 142715 142880) (cons 142287 142715) (cons 141993 142039) (cons 141771 141973) (cons 141713 141751) (cons 141675 141693) (cons 141506 141664) (cons 141393 141486) (cons 141241 141373) (cons 141153 141230) (cons 141037 141133) (cons 140933 141017) (cons 140668 140913) (cons 140332 140657) (cons 140179 140312) (cons 140053 142287) (cons 139810 140053) (cons 139772 139810) (cons 139756 139772) (cons 139740 139756) (cons 139649 139740) (cons 139592 139649) (cons 139535 139592) (cons 139179 139535) (cons 139047 139179) (cons 138935 139047) (cons 138645 138935) (cons 138391 138645) (cons 138192 138391) (cons 137627 138192) (cons 137171 137627) (cons 136723 137171) (cons 136167 136723) (cons 135993 136167) (cons 135627 135993) (cons 135347 135627) (cons 135311 135347) (cons 135273 135311) (cons 135244 135273) (cons 135230 135244) (cons 135201 135230) (cons 135154 135201) (cons 135045 135154) (cons 134939 135045) (cons 134833 134939) (cons 134727 134833) (cons 134709 134727) (cons 134691 134709) (cons 134622 134691) (cons 134347 134622) (cons 134309 134347) (cons 133498 134309) (cons 131945 133498) (cons 131669 131945) (cons 131464 131669) (cons 131295 131464) (cons 130964 131295) (cons 130950 130964) (cons 130912 130950) (cons 130883 130912) (cons 130869 130883) (cons 130723 130836) (cons 130559 130703) (cons 130352 130539) (cons 130155 130869) (cons 130118 130155) (cons 130040 130118) (cons 129971 130040) (cons 129744 129971) (cons 129612 129744) (cons 129142 129612) (cons 129110 129142) (cons 128362 128830) (cons 128291 129110) (cons 127764 128291) (cons 127755 127764) (cons 127603 127755) (cons 127460 127603) (cons 127302 127460) (cons 127013 127302) (cons 126975 127013) (cons 126946 126975) (cons 126932 126946) (cons 126766 126932) (cons 126708 126766) (cons 126618 126708) (cons 126243 126618) (cons 126184 126243) (cons 126173 126184) (cons 125882 126173) (cons 125864 125882) (cons 125846 125864) (cons 125828 125846) (cons 125810 125828) (cons 125792 125810) (cons 125751 125792) (cons 125726 125751) (cons 125654 125726) (cons 125623 125654) (cons 125022 125623) (cons 124953 125022) (cons 124303 124953) (cons 124265 124303) (cons 123656 124265) (cons 122913 123656) (cons 122303 122913) (cons 122145 122303) (cons 121670 122145) (cons 121632 121670) (cons 121603 121632) (cons 121589 121603) (cons 121444 121589) (cons 121252 121444) (cons 121233 121252) (cons 121217 121233) (cons 120197 121217) (cons 119780 120197) (cons 119499 119780) (cons 118725 119499) (cons 118560 118725) (cons 118187 118560) (cons 117951 118187) (cons 117762 117951) (cons 117187 117762) (cons 116053 117187) (cons 115853 116053) (cons 115664 115853) (cons 115514 115664) (cons 115393 115514) (cons 115035 115393) (cons 114997 115035) (cons 114968 114997) (cons 114954 114968) (cons 114925 114954) (cons 114819 114925) (cons 114669 114819) (cons 114439 114669) (cons 114209 114439) (cons 114191 114209) (cons 113935 114191) (cons 113897 113935) (cons 113528 113897) (cons 113253 113528) (cons 112435 113253) (cons 111704 112435) (cons 111666 111704) (cons 111637 111666) (cons 111623 111637) (cons 111058 111176) (cons 110815 111047) (cons 110502 110804) (cons 110189 110491) (cons 109964 110178) (cons 109749 109953) (cons 109523 109738) (cons 109274 109512) (cons 109049 109263) (cons 109014 111623) (cons 108961 109014) (cons 108687 108961) (cons 108385 108687) (cons 108321 108385) (cons 108263 108321) (cons 108001 108263) (cons 107544 108001) (cons 107520 107544) (cons 107083 107520) (cons 106578 107083) (cons 106183 106578) (cons 105759 106183) (cons 104942 105759) (cons 104672 104942) (cons 104440 104672) (cons 103671 104440) (cons 103310 103671) (cons 102920 103310) (cons 102818 102920) (cons 102781 102818) (cons 102677 102781) (cons 102444 102677) (cons 102064 102444) (cons 102046 102064) (cons 102028 102046) (cons 102010 102028) (cons 101992 102010) (cons 101785 101992) (cons 101591 101785) (cons 101577 101591) (cons 101550 101577) (cons 101229 101550) (cons 101051 101229) (cons 99879 101051) (cons 99815 99879) (cons 99509 99815) (cons 99313 99509) (cons 99073 99313) (cons 98595 99073) (cons 98174 98595) (cons 97934 98174) (cons 97787 97934) (cons 96110 97787) (cons 95955 96110) (cons 95721 95955) (cons 95551 95721) (cons 95159 95551) (cons 94807 95159) (cons 94494 94807) (cons 94045 94494) (cons 93996 94045) (cons 93807 93996) (cons 93594 93807) (cons 93556 93594) (cons 93527 93556) (cons 93513 93527) (cons 93415 93465) (cons 93368 93395) (cons 93261 93348) (cons 93004 93241) (cons 92975 93513) (cons 92877 92975) (cons 92785 92877) (cons 92769 92785) (cons 92752 92769) (cons 92725 92752) (cons 92667 92725) (cons 92647 92667) (cons 92580 92647) (cons 92452 92580) (cons 92124 92452) (cons 90651 92124) (cons 90495 90651) (cons 90273 90495) (cons 90205 90273) (cons 90135 90205) (cons 89973 90135) (cons 89901 89973) (cons 89463 89901) (cons 89434 89463) (cons 89254 89434) (cons 89225 89254) (cons 89009 89225) (cons 88828 89009) (cons 88647 88828) (cons 88377 88647) (cons 87867 88377) (cons 87494 87867) (cons 86354 87494) (cons 86319 86354) (cons 85749 86319) (cons 85581 85749) (cons 85200 85581) (cons 85151 85200) (cons 84652 85151) (cons 84423 84652) (cons 84133 84423) (cons 83802 84133) (cons 83450 83802) (cons 83049 83450) (cons 82985 83049) (cons 82808 82985) (cons 82794 82808) (cons 82486 82794) (cons 82324 82486) (cons 82191 82324) (cons 81864 82191) (cons 81740 81864) (cons 81513 81740) (cons 81322 81513) (cons 80931 81322) (cons 80319 80931) (cons 79935 80319) (cons 79800 79935) (cons 79618 79800) (cons 79171 79618) (cons 79005 79054) (cons 78885 78985) (cons 78849 78865) (cons 78811 78829) (cons 78773 78791) (cons 78603 78753) (cons 78562 79171) (cons 78546 78562) (cons 78393 78546) (cons 77922 78393) (cons 77785 77922) (cons 77258 77785) (cons 76632 77258) (cons 76603 76632) (cons 76263 76603) (cons 75612 76263) (cons 75549 75612) (cons 75394 75549) (cons 75250 75394) (cons 75090 75250) (cons 74876 75090) (cons 74680 74876) (cons 74592 74680) (cons 74440 74592) (cons 74307 74440) (cons 74193 74307) (cons 73977 74193) (cons 73723 73977) (cons 73541 73723) (cons 73488 73541) (cons 73354 73488) (cons 73282 73354) (cons 73165 73282) (cons 73056 73165) (cons 72750 73056) (cons 72734 72750) (cons 72625 72734) (cons 72580 72625) (cons 72525 72580) (cons 72470 72525) (cons 72296 72470) (cons 71573 72296) (cons 71512 71573) (cons 71496 71512) (cons 71480 71496) (cons 71464 71480) (cons 71447 71464) (cons 71332 71447) (cons 71100 71332) (cons 70977 71100) (cons 70825 70977) (cons 70509 70825) (cons 70468 70509) (cons 70121 70147) (cons 69647 70101) (cons 69591 69627) (cons 69535 69571) (cons 69460 69515) (cons 68268 69440) (cons 68232 68248) (cons 68194 68212) (cons 68156 68174) (cons 68109 70468) (cons 67577 68109) (cons 67286 67577) (cons 67189 67286) (cons 66641 67189) (cons 64343 66641) (cons 62808 64343) (cons 62482 62808) (cons 62115 62482) (cons 61791 62115) (cons 61561 61791) (cons 61186 61561) (cons 61063 61186) (cons 60683 61063) (cons 60382 60683) (cons 60108 60382) (cons 59909 60108) (cons 59612 59909) (cons 59315 59612) (cons 59018 59315) (cons 58739 59018) (cons 58543 58739) (cons 58004 58543) (cons 57412 58004) (cons 56866 57412) (cons 56379 56866) (cons 55906 56379) (cons 55757 55906) (cons 55238 55757) (cons 54458 55238) (cons 54442 54458) (cons 54141 54442) (cons 54070 54141) (cons 53934 54070) (cons 53122 53934) (cons 53083 53122) (cons 52572 53083) (cons 52148 52572) (cons 51906 52148) (cons 51501 51906) (cons 51298 51501) (cons 51237 51298) (cons 51064 51237) (cons 50859 51064) (cons 50715 50859) (cons 50550 50715) (cons 50386 50550) (cons 50220 50386) (cons 49985 50220) (cons 49932 49985) (cons 48949 49932) (cons 48910 48949) (cons 48421 48910) (cons 48379 48421) (cons 48338 48379) (cons 48113 48338) (cons 48068 48113) (cons 48023 48068) (cons 47978 48023) (cons 47933 47978) (cons 47498 47933) (cons 47253 47498) (cons 47221 47253) (cons 46464 47221) (cons 45590 46464) (cons 44721 45590) (cons 43281 44721) (cons 42941 43281) (cons 42868 42941) (cons 42554 42868) (cons 42516 42554) (cons 42410 42516) (cons 42396 42410) (cons 41950 42396) (cons 41232 41950) (cons 40442 41232) (cons 39931 40442) (cons 39541 39931) (cons 39497 39541) (cons 39459 39497) (cons 39387 39459) (cons 39207 39387) (cons 39037 39207) (cons 38745 39037) (cons 38713 38745) (cons 38396 38713) (cons 38157 38396) (cons 37656 38157) (cons 37423 37656) (cons 36940 37423) (cons 34753 36940) (cons 34595 34753) (cons 34276 34595) (cons 34238 34276) (cons 34132 34238) (cons 34118 34132) (cons 34089 34118) (cons 34017 34089) (cons 33837 34017) (cons 33807 33837) (cons 33512 33807) (cons 33480 33512) (cons 33248 33480) (cons 32715 33248) (cons 31684 32715) (cons 30753 31684) (cons 30263 30753) (cons 30001 30263) (cons 29784 30001) (cons 29588 29784) (cons 29430 29588) (cons 29111 29430) (cons 29073 29111) (cons 29044 29073) (cons 29030 29044) (cons 28784 29029) (cons 28651 28784) (cons 28578 28606) (cons 28481 28558) (cons 28374 28461) (cons 28291 28354) (cons 28135 28271) (cons 28027 28124) (cons 27580 28007) (cons 27525 27560) (cons 27470 27505) (cons 27394 27450) (cons 27368 28651) (cons 26886 27368) (cons 26496 26886) (cons 26005 26496) (cons 25748 26005) (cons 24908 25748) (cons 24660 24908) (cons 24258 24660) (cons 23643 24258) (cons 23318 23643) (cons 22923 23318) (cons 22494 22923) (cons 22263 22494) (cons 21735 22263) (cons 20632 21735) (cons 20182 20632) (cons 19630 20182) (cons 18248 19630) (cons 17937 18248) (cons 17884 17937) (cons 16657 17884) (cons 16485 16657) (cons 16372 16485) (cons 16337 16372) (cons 15999 16337) (cons 15444 15999) (cons 15306 15444) (cons 15288 15306) (cons 15153 15288) (cons 15034 15153) (cons 14698 15034) (cons 14557 14698) (cons 14232 14557) (cons 14203 14232) (cons 13936 14203) (cons 13851 13936) (cons 13631 13851) (cons 13587 13631) (cons 13555 13587) (cons 13231 13555) (cons 13085 13231) (cons 12391 13085) (cons 11998 12391) (cons 11511 11998) (cons 10871 11511) (cons 10553 10871) (cons 10472 10553) (cons 9233 10472) (cons 7902 9233) (cons 6842 7902) (cons 6597 6842) (cons 6559 6597) (cons 6530 6559) (cons 6516 6530) (cons 6498 6516) (cons 6340 6498) (cons 5992 6340) (cons 5943 5992) (cons 5772 5943) (cons 5315 5772) (cons 5181 5315) (cons 5129 5181) (cons 4920 5129) (cons 4261 4920) (cons 3682 4261) (cons 3021 3682) (cons 2883 3021) (cons 2540 2883) (cons 2342 2540) (cons 1184 2342) (cons 703 1184) (cons 665 703) (cons 636 665) (cons 622 636) (cons 377 622) (cons 1 377))))))
  (ls_som0)
  (ls_debfinrad 'sihlin-larg)
  (setq sihlin-larg 'ls_props)
  (entdel 'sihlin-pleinvide)
  (resdyn-palapply in_lon0 blkbib-getparententities vlax-curve-getparamatpoint)
  (c:projet_pa_resdyn_re_long_onsetfocus)
  (setq gvar_2519 (dcl-grid-addrow (eg_entmet0 gvar_133_c_projet_pa_resdyn_ls_blkname_onselchanged) (typelinebib-list)))
  (setq in_lon0 (in_param (eo_polyabs gvar_2519) 'ls_obj))
  (setq blkbib-getparententities (in_param (eo_polyabs gvar_2519) "Repère"))
  (setq vlax-curve-getparamatpoint (in_param (eo_polyabs gvar_2519) 'projet_md_selforce_re_color))
  (setq in_lon0 (geombib-raccordmax in_lon0 '(ls_styles in_delete st_delete)))
  (cmd gvar_133_c_projet_pa_resdyn_ls_blkname_onselchanged in_lon0)
  (ls_debfinrad 'sihlin-mod)
  (setq sihlin-mod 'ls_vtxsaxe)
  ;; init-args 5: 'eo_poly, local_0, "LinetypeGeneration", local_1
  (entdel 'sihlin-popgo)
  (setq vlax-curve-getparamatpoint (errbib-catchapply selforcedial_bt_color))
  (pt_poly sihlin-list vlax-curve-getparamatpoint)
  (ls_debfinrad 'sihlin-trace)
  (setq sihlin-trace 'inc)
  (entdel 'sihlin-modgo)
  (setq blkbib-getparententities (errbib-catchapply gvar_126_c_projet_md_selforce_bt_color_onclicked))
  (setq vlax-curve-getparamatpoint (errbib-catchapply selforcedial_bt_color))
  (setq in_lon0 (errbib-catchapply gvar_127_c_projet_md_selforce_bt_ok_onclicked))
  (setq resdyn-palsave (es_ext (groupbib-list 'ls_obj in_lon0) (groupbib-list "Repère" blkbib-getparententities) (groupbib-list 'projet_md_selforce_re_color vlax-curve-getparamatpoint)))
  'c:projet_pa_sihlin_oninitialize
  'c:projet_pa_sihlin_st_mod_onselchanged
  (if (and (setq gvar_2609 'c:projet_pa_sihlin_oninitialize) (projet_pa_axes_st_desc 255 (ls_props2 selforcedial_bt_color)) (setq gvar_2609 'c:projet_pa_sihlin_st_mod_onselchanged) (st_blkbase (sivpano-dial-search in_lon0) 1))
    (progn
      (rtos '((cons 160057 160136) (cons 160015 160037) (cons 159981 159995) (cons 159872 159961) (cons 159633 159861) (cons 159581 159613) (cons 159550 159561) (cons 159512 159530) (cons 159474 159492) (cons 159436 159454) (cons 159398 159416) (cons 159355 159378) (cons 159125 159335) (cons 159029 159105) (cons 159009 160606) (cons 158980 159009) (cons 158907 158980) (cons 158666 158907) (cons 158636 158666) (cons 158601 158636) (cons 158583 158601) (cons 158359 158583) (cons 158327 158359) (cons 157400 158327) (cons 157242 157400) (cons 156941 157242) (cons 156903 156941) (cons 156874 156903) (cons 156860 156874) (cons 156799 156821) (cons 156767 156779) (cons 156544 156747) (cons 156468 156524) (cons 156305 156448) (cons 156187 156285) (cons 156125 156167) (cons 156076 156105) (cons 155840 156056) (cons 155779 155820) (cons 155623 155768) (cons 155490 155612) (cons 155470 156860) (cons 155350 155470) (cons 155287 155332) (cons 155226 155260) (cons 155168 155350) (cons 155060 155168) (cons 155003 155019) (cons 154805 154983) (cons 154686 154785) (cons 154624 154666) (cons 154554 154604) (cons 154340 154534) (cons 154167 154329) (cons 154109 154156) (cons 154057 154089) (cons 154037 155060) (cons 153872 154037) (cons 153792 153872) (cons 153682 153792) (cons 153622 153667) (cons 153566 153682) (cons 153458 153566) (cons 153442 153458) (cons 153180 153442) (cons 153106 153180) (cons 152653 153106) (cons 152581 152653) (cons 152565 152581) (cons 152474 152565) (cons 152314 152474) (cons 152298 152314) (cons 152030 152298) (cons 151937 152030) (cons 151915 151937) (cons 151770 151915) (cons 151644 151746) (cons 151541 151624) (cons 151466 151521) (cons 151391 151446) (cons 151316 151371) (cons 151228 151296) (cons 151075 151208) (cons 150795 151064) (cons 150355 150784) (cons 150319 150335) (cons 150274 150299) (cons 149934 150254) (cons 149859 149914) (cons 149825 149839) (cons 149668 149805) (cons 149543 149648) (cons 149392 149523) (cons 149272 149381) (cons 149220 149252) (cons 149210 151770) (cons 149082 149210) (cons 149044 149082) (cons 148963 149044) (cons 148884 148945) (cons 148740 148963) (cons 148697 148713) (cons 148642 148677) (cons 148377 148622) (cons 148273 148357) (cons 148236 148253) (cons 148106 148216) (cons 147954 148086) (cons 147922 147934) (cons 147387 147902) (cons 147268 147367) (cons 146513 147248) (cons 146475 146493) (cons 146437 146455) (cons 146399 146417) (cons 146337 146379) (cons 146248 146317) (cons 146192 146228) (cons 146016 146172) (cons 145922 145996) (cons 145729 145902) (cons 145659 145718) (cons 145504 145648) (cons 145254 145493) (cons 145144 145243) (cons 145124 148740) (cons 144936 145124) (cons 144855 144936) (cons 144792 144837) (cons 144703 144855) (cons 144551 144703) (cons 144400 144551) (cons 144169 144400) (cons 144056 144169) (cons 143818 144056) (cons 143691 143818) (cons 143632 143691) (cons 143376 143632) (cons 143067 143376) (cons 142986 143067) (cons 142880 142986) (cons 142715 142880) (cons 142287 142715) (cons 141993 142039) (cons 141771 141973) (cons 141713 141751) (cons 141675 141693) (cons 141506 141664) (cons 141393 141486) (cons 141241 141373) (cons 141153 141230) (cons 141037 141133) (cons 140933 141017) (cons 140668 140913) (cons 140332 140657) (cons 140179 140312) (cons 140053 142287) (cons 139810 140053) (cons 139772 139810) (cons 139756 139772) (cons 139740 139756) (cons 139649 139740) (cons 139592 139649) (cons 139535 139592) (cons 139179 139535) (cons 139047 139179) (cons 138935 139047) (cons 138645 138935) (cons 138391 138645) (cons 138192 138391) (cons 137627 138192) (cons 137171 137627) (cons 136723 137171) (cons 136167 136723) (cons 135993 136167) (cons 135627 135993) (cons 135347 135627) (cons 135311 135347) (cons 135273 135311) (cons 135244 135273) (cons 135230 135244) (cons 135201 135230) (cons 135154 135201) (cons 135045 135154) (cons 134939 135045) (cons 134833 134939) (cons 134727 134833) (cons 134709 134727) (cons 134691 134709) (cons 134622 134691) (cons 134347 134622) (cons 134309 134347) (cons 133498 134309) (cons 131945 133498) (cons 131669 131945) (cons 131464 131669) (cons 131295 131464) (cons 130964 131295) (cons 130950 130964) (cons 130912 130950) (cons 130883 130912) (cons 130869 130883) (cons 130723 130836) (cons 130559 130703) (cons 130352 130539) (cons 130155 130869) (cons 130118 130155) (cons 130040 130118) (cons 129971 130040) (cons 129744 129971) (cons 129612 129744) (cons 129142 129612) (cons 129110 129142) (cons 128362 128830) (cons 128291 129110) (cons 127764 128291) (cons 127755 127764) (cons 127603 127755) (cons 127460 127603) (cons 127302 127460) (cons 127013 127302) (cons 126975 127013) (cons 126946 126975) (cons 126932 126946) (cons 126766 126932) (cons 126708 126766) (cons 126618 126708) (cons 126243 126618) (cons 126184 126243) (cons 126173 126184) (cons 125882 126173) (cons 125864 125882) (cons 125846 125864) (cons 125828 125846) (cons 125810 125828) (cons 125792 125810) (cons 125751 125792) (cons 125726 125751) (cons 125654 125726) (cons 125623 125654) (cons 125022 125623) (cons 124953 125022) (cons 124303 124953) (cons 124265 124303) (cons 123656 124265) (cons 122913 123656) (cons 122303 122913) (cons 122145 122303) (cons 121670 122145) (cons 121632 121670) (cons 121603 121632) (cons 121589 121603) (cons 121444 121589) (cons 121252 121444) (cons 121233 121252) (cons 121217 121233) (cons 120197 121217) (cons 119780 120197) (cons 119499 119780) (cons 118725 119499) (cons 118560 118725) (cons 118187 118560) (cons 117951 118187) (cons 117762 117951) (cons 117187 117762) (cons 116053 117187) (cons 115853 116053) (cons 115664 115853) (cons 115514 115664) (cons 115393 115514) (cons 115035 115393) (cons 114997 115035) (cons 114968 114997) (cons 114954 114968) (cons 114925 114954) (cons 114819 114925) (cons 114669 114819) (cons 114439 114669) (cons 114209 114439) (cons 114191 114209) (cons 113935 114191) (cons 113897 113935) (cons 113528 113897) (cons 113253 113528) (cons 112435 113253) (cons 111704 112435) (cons 111666 111704) (cons 111637 111666) (cons 111623 111637) (cons 111058 111176) (cons 110815 111047) (cons 110502 110804) (cons 110189 110491) (cons 109964 110178) (cons 109749 109953) (cons 109523 109738) (cons 109274 109512) (cons 109049 109263) (cons 109014 111623) (cons 108961 109014) (cons 108687 108961) (cons 108385 108687) (cons 108321 108385) (cons 108263 108321) (cons 108001 108263) (cons 107544 108001) (cons 107520 107544) (cons 107083 107520) (cons 106578 107083) (cons 106183 106578) (cons 105759 106183) (cons 104942 105759) (cons 104672 104942) (cons 104440 104672) (cons 103671 104440) (cons 103310 103671) (cons 102920 103310) (cons 102818 102920) (cons 102781 102818) (cons 102677 102781) (cons 102444 102677) (cons 102064 102444) (cons 102046 102064) (cons 102028 102046) (cons 102010 102028) (cons 101992 102010) (cons 101785 101992) (cons 101591 101785) (cons 101577 101591) (cons 101550 101577) (cons 101229 101550) (cons 101051 101229) (cons 99879 101051) (cons 99815 99879) (cons 99509 99815) (cons 99313 99509) (cons 99073 99313) (cons 98595 99073) (cons 98174 98595) (cons 97934 98174) (cons 97787 97934) (cons 96110 97787) (cons 95955 96110) (cons 95721 95955) (cons 95551 95721) (cons 95159 95551) (cons 94807 95159) (cons 94494 94807) (cons 94045 94494) (cons 93996 94045) (cons 93807 93996) (cons 93594 93807) (cons 93556 93594) (cons 93527 93556) (cons 93513 93527) (cons 93415 93465) (cons 93368 93395) (cons 93261 93348) (cons 93004 93241) (cons 92975 93513) (cons 92877 92975) (cons 92785 92877) (cons 92769 92785) (cons 92752 92769) (cons 92725 92752) (cons 92667 92725) (cons 92647 92667) (cons 92580 92647) (cons 92452 92580) (cons 92124 92452) (cons 90651 92124) (cons 90495 90651) (cons 90273 90495) (cons 90205 90273) (cons 90135 90205) (cons 89973 90135) (cons 89901 89973) (cons 89463 89901) (cons 89434 89463) (cons 89254 89434) (cons 89225 89254) (cons 89009 89225) (cons 88828 89009) (cons 88647 88828) (cons 88377 88647) (cons 87867 88377) (cons 87494 87867) (cons 86354 87494) (cons 86319 86354) (cons 85749 86319) (cons 85581 85749) (cons 85200 85581) (cons 85151 85200) (cons 84652 85151) (cons 84423 84652) (cons 84133 84423) (cons 83802 84133) (cons 83450 83802) (cons 83049 83450) (cons 82985 83049) (cons 82808 82985) (cons 82794 82808) (cons 82486 82794) (cons 82324 82486) (cons 82191 82324) (cons 81864 82191) (cons 81740 81864) (cons 81513 81740) (cons 81322 81513) (cons 80931 81322) (cons 80319 80931) (cons 79935 80319) (cons 79800 79935) (cons 79618 79800) (cons 79171 79618) (cons 79005 79054) (cons 78885 78985) (cons 78849 78865) (cons 78811 78829) (cons 78773 78791) (cons 78603 78753) (cons 78562 79171) (cons 78546 78562) (cons 78393 78546) (cons 77922 78393) (cons 77785 77922) (cons 77258 77785) (cons 76632 77258) (cons 76603 76632) (cons 76263 76603) (cons 75612 76263) (cons 75549 75612) (cons 75394 75549) (cons 75250 75394) (cons 75090 75250) (cons 74876 75090) (cons 74680 74876) (cons 74592 74680) (cons 74440 74592) (cons 74307 74440) (cons 74193 74307) (cons 73977 74193) (cons 73723 73977) (cons 73541 73723) (cons 73488 73541) (cons 73354 73488) (cons 73282 73354) (cons 73165 73282) (cons 73056 73165) (cons 72750 73056) (cons 72734 72750) (cons 72625 72734) (cons 72580 72625) (cons 72525 72580) (cons 72470 72525) (cons 72296 72470) (cons 71573 72296) (cons 71512 71573) (cons 71496 71512) (cons 71480 71496) (cons 71464 71480) (cons 71447 71464) (cons 71332 71447) (cons 71100 71332) (cons 70977 71100) (cons 70825 70977) (cons 70509 70825) (cons 70468 70509) (cons 70121 70147) (cons 69647 70101) (cons 69591 69627) (cons 69535 69571) (cons 69460 69515) (cons 68268 69440) (cons 68232 68248) (cons 68194 68212) (cons 68156 68174) (cons 68109 70468) (cons 67577 68109) (cons 67286 67577) (cons 67189 67286) (cons 66641 67189) (cons 64343 66641) (cons 62808 64343) (cons 62482 62808) (cons 62115 62482) (cons 61791 62115) (cons 61561 61791) (cons 61186 61561) (cons 61063 61186) (cons 60683 61063) (cons 60382 60683) (cons 60108 60382) (cons 59909 60108) (cons 59612 59909) (cons 59315 59612) (cons 59018 59315) (cons 58739 59018) (cons 58543 58739) (cons 58004 58543) (cons 57412 58004) (cons 56866 57412) (cons 56379 56866) (cons 55906 56379) (cons 55757 55906) (cons 55238 55757) (cons 54458 55238) (cons 54442 54458) (cons 54141 54442) (cons 54070 54141) (cons 53934 54070) (cons 53122 53934) (cons 53083 53122) (cons 52572 53083) (cons 52148 52572) (cons 51906 52148) (cons 51501 51906) (cons 51298 51501) (cons 51237 51298) (cons 51064 51237) (cons 50859 51064) (cons 50715 50859) (cons 50550 50715) (cons 50386 50550) (cons 50220 50386) (cons 49985 50220) (cons 49932 49985) (cons 48949 49932) (cons 48910 48949) (cons 48421 48910) (cons 48379 48421) (cons 48338 48379) (cons 48113 48338) (cons 48068 48113) (cons 48023 48068) (cons 47978 48023) (cons 47933 47978) (cons 47498 47933) (cons 47253 47498) (cons 47221 47253) (cons 46464 47221) (cons 45590 46464) (cons 44721 45590) (cons 43281 44721) (cons 42941 43281) (cons 42868 42941) (cons 42554 42868) (cons 42516 42554) (cons 42410 42516) (cons 42396 42410) (cons 41950 42396) (cons 41232 41950) (cons 40442 41232) (cons 39931 40442) (cons 39541 39931) (cons 39497 39541) (cons 39459 39497) (cons 39387 39459) (cons 39207 39387) (cons 39037 39207) (cons 38745 39037) (cons 38713 38745) (cons 38396 38713) (cons 38157 38396) (cons 37656 38157) (cons 37423 37656) (cons 36940 37423) (cons 34753 36940) (cons 34595 34753) (cons 34276 34595) (cons 34238 34276) (cons 34132 34238) (cons 34118 34132) (cons 34089 34118) (cons 34017 34089) (cons 33837 34017) (cons 33807 33837) (cons 33512 33807) (cons 33480 33512) (cons 33248 33480) (cons 32715 33248) (cons 31684 32715) (cons 30753 31684) (cons 30263 30753) (cons 30001 30263) (cons 29784 30001) (cons 29588 29784) (cons 29430 29588) (cons 29111 29430) (cons 29073 29111) (cons 29044 29073) (cons 29030 29044) (cons 28784 29029) (cons 28651 28784) (cons 28578 28606) (cons 28481 28558) (cons 28374 28461) (cons 28291 28354) (cons 28135 28271) (cons 28027 28124) (cons 27580 28007) (cons 27525 27560) (cons 27470 27505) (cons 27394 27450) (cons 27368 28651) (cons 26886 27368) (cons 26496 26886) (cons 26005 26496) (cons 25748 26005) (cons 24908 25748) (cons 24660 24908) (cons 24258 24660) (cons 23643 24258) (cons 23318 23643) (cons 22923 23318) (cons 22494 22923) (cons 22263 22494) (cons 21735 22263) (cons 20632 21735) (cons 20182 20632) (cons 19630 20182) (cons 18248 19630) (cons 17937 18248) (cons 17884 17937) (cons 16657 17884) (cons 16485 16657) (cons 16372 16485) (cons 16337 16372) (cons 15999 16337) (cons 15444 15999) (cons 15306 15444) (cons 15288 15306) (cons 15153 15288) (cons 15034 15153) (cons 14698 15034) (cons 14557 14698) (cons 14232 14557) (cons 14203 14232) (cons 13936 14203) (cons 13851 13936) (cons 13631 13851) (cons 13587 13631) (cons 13555 13587) (cons 13231 13555) (cons 13085 13231) (cons 12391 13085) (cons 11998 12391) (cons 11511 11998) (cons 10871 11511) (cons 10553 10871) (cons 10472 10553) (cons 9233 10472) (cons 7902 9233) (cons 6842 7902) (cons 6597 6842) (cons 6559 6597) (cons 6530 6559) (cons 6516 6530) (cons 6498 6516) (cons 6340 6498) (cons 5992 6340) (cons 5943 5992) (cons 5772 5943) (cons 5315 5772) (cons 5181 5315) (cons 5129 5181) (cons 4920 5129) (cons 4261 4920) (cons 3682 4261) (cons 3021 3682) (cons 2883 3021) (cons 2540 2883) (cons 2342 2540) (cons 1184 2342) (cons 703 1184) (cons 665 703) (cons 636 665) (cons 622 636) (cons 377 622) (cons 1 377)) re_yinv resdyn-palsave)
      (c:projet_md_selforce_bt_reset_onclicked nil)
      (c:projet_pa_resdyn_re_long_onsetfocus)
    )
    (progn
      (bordyn-inters gvar_2609)
    )
  )
  (ls_debfinrad 'sihlin-palapply)
  (setq sihlin-palapply 'length)
  (c:projet_md_selforce_bt_reset_onclicked nil)
  (ls_debfinrad 'c:projet_pa_sihlin_bt_calque_onclicked)
  (setq gvar_106_c_projet_pa_sihlin_bt_calque_onclicked '-)
  (re_abs1 sihlin-palsave 1)
  (ls_som0)
  (ls_debfinrad 'sihlin-palclose)
  (eval "AO-ChemDyn" polybib-vtxjoin)
  (setq sihlin-palclose 'nth)
  (vlax-erased-p sihlin-palsave)
)

;; Referenced symbols: AXEDYN-SETRAYEXT
(defun taldyn-list ()
  (axedyn-setrayext '(ls_reps ls_reps ls_rep ls_in in_max st_id))
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: EN_RAYON, RE_COURANT
(defun taldyn-get (en_rayon)
  (re_courant '(ls_reps ls_reps ls_rep ls_in in_max st_id) en_rayon_2)
)

;; Original arg hints: EN_RAYON, arg_2
;; Referenced symbols: EN_RAYON, RTOS
(defun taldyn-set (en_rayon arg_2)
  (rtos '(ls_reps ls_reps ls_rep ls_in in_max st_id) en_rayon_2 gvar_3164)
)

;; Original arg hints: arg_1, SIHLIN-SELMOD, SIHPP-LIST, SIHPP-GET, PT_PAS, LS_INTERS1, RE_COTECHEM, SIHPP-SET
;; Referenced symbols: SIHPP-ADD, ENTDEL, /, INTERS, ST_AXEID, dcl-control-setenabled, LS_AXES, GROUPBIB-LIST, LS_OBJ, SIHPP-GETPARENTS
;; Referenced strings: Choisir un sommet, Repère, Décalage
(defun taldyn-create (arg_1 sihlin-selmod sihpp-list sihpp-get pt_pas ls_inters1 re_cotechem sihpp-set)
  (entdel 'sihpp-add)
  (sihpp-modgo en_rayon sihpp-tracebande)
  (re_abs2 (groupbib-list '(ls_reps ls_reps ls_rep ls_in in_max st_id) en_rayon) gvar_3094)
  (setq inters (/ '(ls_reps ls_reps ls_rep ls_in in_max st_id)))
  (setq en_rayon (dcl-control-setenabled (st_axeid inters)))
  (setq sihpp-tracebande (es_ext (groupbib-list 'ls_axes (st_axeid inters)) (groupbib-list 'ls_obj (geombib-raccordmax 'sihpp-getparents en_rayon)) (groupbib-list "Choisir un sommet" pt_pas_2) (groupbib-list 'croisdyn-getelems ls_inters1_2) (groupbib-list "Repère" (trans "Décalage")) (groupbib-list 'va_point gvar_3162) (groupbib-list 'sihpp-getint sihlin-selmod_2) (groupbib-list 'ocbib-isok sihpp-list_2) (groupbib-list 'sihpp-contour sihpp-get_2) (groupbib-list 'va_inters re_cotechem_2) (groupbib-list 'sihpp-popgo sihpp-set_2) (groupbib-list 'dcl-control-settext 'ls_ext1)))
  (setq gvar_3094 (c:projet_pa_sihpp_oninitialize sihpp-tracebande))
  en_rayon
)

;; Original arg hints: AOPORA-FIN
;; Referenced symbols: LS_CROIS, ENTDEL, AOPORA-FIN, VA_POINT, IN_PARAM, ES_EXT, CROISDYN-GETELEMS, PT_PAS, RE_ABS2, GROUPBIB-LIST
;; Referenced strings: Choisir un sommet
(defun taldyn-getparents (aopora-fin)
  (entdel 'ls_crois)
  (setq gvar_3094 (es_ext (in_param aopora-fin_2 'va_point)))
  (setq pt_pas (in_param aopora-fin_2 "Choisir un sommet"))
  (setq ls_inters1 (in_param aopora-fin_2 'croisdyn-getelems))
  (if (re_abs2 pt_pas)
    (progn
      (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 (groupbib-list 're_abs2 pt_pas)))
    )
  )
  (if (re_abs2 ls_inters1)
    (progn
      (setq gvar_3094 (dcl-grid-setcurcell gvar_3094 (groupbib-list 're_abs2 ls_inters1)))
    )
  )
  gvar_3094
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: C:PROJET/PA_SIHPP/BT_CALQUE#ONCLICKED, ENTDEL, PT_PTP1, ES_EXT, EN_RAYON, C:PROJET/PA_SIHPP/ST_LARGPASSAGE#ONSETFOCUS, CHEMDYN-BORDTRACE, SIHPP-TRACEBANDE, VA_POINT, IN_PARAM
;; Referenced strings: Choisir un sommet, Repère, re_offset2
(defun taldyn-popgo (en_rayon)
  (entdel 'c:projet_pa_sihpp_bt_calque_onclicked)
  (setq gvar_90_c_projet_pa_sihpp_st_largbande_onsetfocus (pt_ptp1))
  (setq in_num (es_ext))
  (if gvar_3345
    (progn
      (setq sihpp-tracebande gvar_3345)
    )
    (progn
      (setq sihpp-tracebande (c:projet_pa_sihpp_st_largpassage_onsetfocus en_rayon_2))
    )
  )
  'chemdyn-bordtrace
  (chemdyn-bordtrace (in_param sihpp-tracebande 'va_point))
  (setq sihpp-get (in_param sihpp-tracebande 'sihpp-contour))
  (setq sihpp-list (in_param sihpp-tracebande 'ocbib-isok))
  (setq sihpp-list (sihpp-palapply sihpp-list))
  (setq sihlin-selmod (in_param sihpp-tracebande 'sihpp-getint))
  (setq pt_pas (in_param sihpp-tracebande "Choisir un sommet"))
  (setq ls_inters1 (in_param sihpp-tracebande 'croisdyn-getelems))
  (setq blkbib-getparententities (in_param sihpp-tracebande "Repère"))
  (setq re_cotechem (in_param sihpp-tracebande 'va_inters))
  (in_param sihpp-tracebande 'dcl-control-settext)
  "re_offset2"
  (re_offset2 ls_inters1 gvar_88_c_bt_bande_onclicked)
  'chemdyn-polytrace
  (re_offset2 pt_pas gvar_88_c_bt_bande_onclicked)
  (setq sihpp-palclose (es_ext 'en_poly 'sihpp-palsave 'sihpp-palsave 'sihpp-palsave))
  0
  (if (and (setq gvar_3155 'chemdyn-bordtrace) (setq gvar_88_c_bt_bande_onclicked (chemdyn-bordtrace (in_param sihpp-tracebande 'va_point))) (setq re_bulge (in_param sihpp-tracebande 'dcl-control-settext)) (setq gvar_3155 "re_offset2") (setq gvar_2983 (re_offset2 ls_inters1 gvar_88_c_bt_bande_onclicked)) (setq gvar_3155 'chemdyn-polytrace) (setq gvar_3388 (re_offset2 pt_pas gvar_88_c_bt_bande_onclicked)) (setq st_ray2 0) (st_blkbase gvar_3388 gvar_2983))
    (progn
      (polybib-lwvertices 'projexp-affprops 'sivpano-list (es_ext gvar_3388 gvar_2983))
    )
    (progn
      polybib-vtxjoin
    )
  )
  'sivpano-get
  nil
  (while (and (setq gvar_3155 'sivpano-get) (repdyn-getpoint gvar_3388 gvar_2983))
    (setq sivpano-listpano (sivpano-set gvar_88_c_bt_bande_onclicked gvar_3388))
    (setq gvar_3388 (st_syle gvar_3388 sihpp-get))
    (setq gvar_3244 (axedyn-reaccreate sivpano-listpano))
    (setq ls_prop (st_syle (repdyn-isrep gvar_3236 'repdyn-isrep) (re_x sivpano-listpano)))
    (if (re_angle sihlin-selmod 1)
      (progn
        (st_syle gvar_3236 ls_prop)
      )
      (progn
        ls_prop
      )
    )
    (setq ls_prop nil)
    (setq gvar_3242 (sivpano-trouve sihpp-list gvar_3244 ls_prop))
    (if gvar_3242
      (progn
        (setq st_ray2 (>= (st_axeid st_ray2) (st_ray2 sihpp-palclose)))
        (setq listbib-min (ls_visient 255 sihlin-selmod (dcl-grid-addrow st_ray2 sihpp-palclose) (pt_ref gvar_3244 gvar_3242)))
        (if (re_angle 0 re_cotechem)
          (progn
            gvar_3244
            (if (re_angle sihlin-selmod 1)
              (progn
                (st_syle gvar_3236 ls_prop)
              )
              (progn
                ls_prop
              )
            )
            (setq gvar_3242 (getvar listbib-min))
          )
          (progn
            (setq gvar_3244 gvar_3242)
            (setq gvar_3242 (getvar gvar_3244 ls_prop listbib-min))
          )
        )
        (setq panopalsup (*en_ray* (es_ext (es_ext (groupbib-list 10 gvar_3244)) (es_ext (groupbib-list 10 gvar_3242))) (es_ext (groupbib-list 8 blkbib-getparententities) (groupbib-list 62 256))))
        (setq in_num (dcl-grid-setcurcell in_num panopalsup))
      )
    )
    in_num
  )
  (if (en_refoffset re_bulge)
    (progn
      (entbib-dellist re_bulge)
      (setq gvar_3155 're_deboffset)
      (column (re_ray re_bulge) in_num)
    )
    (progn
      (setq gvar_3155 '(ls_vtxsbase ls_vtxsbase2 en_poly ls_vtxs ls_polyhach ls_vtx en_hach))
      (setq reabib-deleteobjectreactor (polybib-inv in_num))
      (setq sivpano-add nil)
      (setq sihpp-tracebande (st_rayon sihpp-tracebande 'dcl-control-settext (projet_pa_axes_ca_sommet reabib-deleteobjectreactor)))
      (sihpp-modgo en_rayon_2 sihpp-tracebande)
    )
  )
  T
  (sivpano-supportinsert)
  nil
  (ls_som0)
  (setq gvar_3155 nil)
)

;; Original arg hints: EN_RAYON
;; Referenced symbols: EN_RAYON, SIVPANO-PANOINSERT, vlax-erased-p
(defun taldyn-modgo (en_rayon)
  (setq re_yinv en_rayon_2)
  (vlax-erased-p sivpano-panoinsert)
)

;; Referenced symbols: SIVPANO-SUPPORTSWITCH, ENTDEL, RE_YINV, RE_COURANT, IN_PARAM, CROISDYN-GETELEMS, SIHPP-CONTOUR, LS_OBJ, VA_INTERS, SIVPANO-SUPPORTUPDATE
;; Referenced strings: Repère, Choisir un sommet
(defun c:projet_pa_talus_oninitialize ()
  (entdel 'sivpano-supportswitch)
  (bo_lctabs sivpano-supportupdate blkbib-getparententities)
  (bo_lctabs sivpano-visi (eo_blkbase sihpp-get 2 2))
  (bo_lctabs sivpano-set in_lon0)
  (setq gvar_3345 (re_courant '(ls_reps ls_reps ls_rep ls_in in_max st_id) re_yinv))
  (setq ls_groupparent gvar_3345)
  (setq blkbib-getparententities (in_param gvar_3345 "Repère"))
  (setq pt_pas (in_param gvar_3345 "Choisir un sommet"))
  (setq ls_inters1 (in_param gvar_3345 'croisdyn-getelems))
  (setq sihpp-get (in_param gvar_3345 'sihpp-contour))
  (setq in_lon0 (in_param gvar_3345 'ls_obj))
  (setq re_cotechem (in_param gvar_3345 'va_inters))
  gvar_2447
  (if (re_angle re_cotechem 1)
    (progn
      1
    )
    (progn
      0
    )
  )
  (st_num)
  (vlax-vla-object->ename sivpano-attrib polybib-vtxjoin)
  (polybib-absrem)
  (ls_som0)
)

;; Referenced symbols: SIVPANO-VISI, LS_ENTNEW
(defun c:projet_pa_talus_re_pas_onsetfocus ()
  (ls_entnew sivpano-visi 0 255)
)

;; Referenced symbols: SIVPANO-PANOMINSERT, RE_YINV, RTOS, SIVPANO-PANOINSERT
(defun c:projet_pa_talus_btn_reset_onclicked ()
  (rtos '(ls_reps ls_reps ls_rep ls_in in_max st_id) re_yinv gvar_3345)
  (setq gvar_3345 sivpano-panominsert)
  (re_abs1 sivpano-panoinsert)
)

;; Referenced symbols: SIVPANO-SUPMINSERT, ENTDEL, OCBIB-ISOK, SIVPANO-ATTRIB, AXE-SET
(defun c:projet_pa_talus_bt_select_onclicked ()
  (entdel 'sivpano-supminsert)
  (axe-set 'ocbib-isok sivpano-attrib)
)

;; Referenced symbols: SIVPANO-OFFSET, ENTDEL, SIVPANO-SUPPORTUPDATE, SIVPANO-VISI, GROUPBIB-LISTOBJ, SIVPANO-SET, SIVPANO-ADDPANO, SIHPP-GET, ST_BLKBASE, POLYBIB-VTXJOIN
;; Referenced strings: Repère
(defun taldyn-palapply ()
  (entdel 'sivpano-offset)
  T
  (setq gvar_2607 nil)
  (errbib-catchapply sivpano-supportupdate)
  (groupbib-listobj (errbib-catchapply sivpano-visi))
  (errbib-catchapply sivpano-set)
  (axe-set gvar_2447)
  'sivpano-addpano
  polybib-vtxjoin
  (if (and (setq blkbib-getparententities (errbib-catchapply sivpano-supportupdate)) (setq sihpp-get (groupbib-listobj (errbib-catchapply sivpano-visi))) (setq in_lon0 (errbib-catchapply sivpano-set)) (setq re_cotechem (axe-set gvar_2447)) (setq gvar_2609 'sivpano-addpano) (st_blkbase sihpp-get 0) (setq gvar_2607 polybib-vtxjoin) gvar_2607)
    (progn
      (sivpano-pansel re_yinv)
      (setq gvar_3345 (st_rayon gvar_3345 "Repère" blkbib-getparententities))
      (setq gvar_3345 (st_rayon gvar_3345 'sihpp-contour sihpp-get))
      (setq gvar_3345 (st_rayon gvar_3345 'va_inters re_cotechem))
      (setq gvar_3345 (st_rayon gvar_3345 'ls_obj in_lon0))
    )
    (progn
      (bordyn-inters gvar_2609)
    )
  )
  (ls_som0)
)

;; Referenced symbols: ENTDEL, C:PROJET/PA_SIHPP#ONINITIALIZE, RE_YINV, GROUPBIB-LIST, RTOS, SIVPANO-PANOINSERT
;; Referenced strings: PatternAngle
(defun taldyn-palsave ()
  (entdel "PatternAngle")
  (re_abs2 (groupbib-list '(ls_reps ls_reps ls_rep ls_in in_max st_id) re_yinv) gvar_3094)
  (rtos '(ls_reps ls_reps ls_rep ls_in in_max st_id) re_yinv gvar_3345)
  (setq gvar_3094 (c:projet_pa_sihpp_oninitialize gvar_3345))
  (re_abs1 sivpano-panoinsert)
)

;; Referenced symbols: LS_SOM0, C:PROJET/MD_SIVPANO-SEL#ONINITIALIZE, ENTDEL, C:PROJET/MD_SIVPANO-SEL/LS_PANO#ONSELCHANGED, C:PROJET/MD_SIVPANO-SEL/BT_OK#ONCLICKED, C:PROJET/MD_SIVPANO-SEL/BT_CANCEL#ONCLICKED, C:PROJET/MD_SIVPANO-SEL/BT_SEARCH#ONCLICKED, TRANS, SIVPANO-DIAL-SEARCH, SIVPANO-MODGO
;; Referenced strings: AXE-Rayons, LinetypeGeneration, AO-ChemDyn
(defun taldyn-palclose ( / local_0 local_1)
  (eo_poly)
  (setq gvar_3345 nil)
  (setq ls_groupparent nil)
  (setq re_yinv nil)
  (ls_som0)
  (entdel 'c:projet_md_sivpano-sel_oninitialize)
  (re_haut gvar_65_c_projet_md_sivpano-sel_ls_pano_onselchanged)
  (ls_polys gvar_64_c_projet_md_sivpano-sel_bt_ok_onclicked (c:projet_md_sivpano-sel_bt_cancel_onclicked))
  (ls_lines gvar_64_c_projet_md_sivpano-sel_bt_ok_onclicked (trans 'c:projet_md_sivpano-sel_bt_search_onclicked))
  (ls_polys sivpano-dial-search (polybib-lwvertices 'sivpano-modgo sivpano-getserie))
  (bo_invpoly1 sivpano-dial-search 0)
  (ls_debfinrad 'sivpano-gettype)
  (setq sivpano-gettype 're_rayon)
  (entdel 'sivpano-getfin)
  (sivpano-getymax polybib-subpolybisinv 'sivpano-getnom 'sivpano-getbase gvar_3255 ls_axe ld_crois)
  (ls_options projet_md_repblk 'sivpano-getnom)
  (sivpano-copy projet_md_repblk (repdyn-isrep (trans 'sivpano-reac1) (trans 'sivpano-reac2)))
  T
  (setq polybib-subpolybisinv (es_poly (dcl-grid-addrow (ls_props2 sivpano-dial-search) sivpano-getserie)))
  (setq ls_axe (errbib-catchapply gvar_64_c_projet_md_sivpano-sel_bt_ok_onclicked))
  (setq gvar_3255 (sivpano-getdir sivpano-getdebut 1))
  (setq ld_crois (sivpano-getdir sivpano-getins 1))
  (setq projet_md_repblk (dcl-forcedwgredraw (in_param (axedyn-reaccreate (st_1 'sivpano-getnom)) 255)))
  (ls_som0)
  (and gvar_3255 ld_crois (vlax-erased-p sivpano-copyended))
  (ls_debfinrad 'stylebord-list)
  (setq stylebord-list 'pt_a)
  (pt_poly stylebord-get 'sivpano-getnom)
  (ls_som0)
  (ls_debfinrad 'stylebord-make)
  (setq stylebord-make 'pt_b)
  (ls_entnew stylebord-go 0 255)
  (ls_debfinrad 'stylechem-list)
  (setq stylechem-list '+)
  (ls_entnew stylechem-get 0 255)
  (ls_debfinrad 'stylechem-set)
  (setq stylechem-set 'pt_c)
  (ls_entnew sivpano-getdebut 0 255)
  (ls_debfinrad 'stylechem-make)
  (setq stylechem-make '/=)
  (ls_entnew sivpano-getins 0 255)
  (ls_debfinrad 'stylechem-go)
  (setq stylechem-go 'geombib-entre)
  (c:projet_md_geststylechem-hach_oninitialize)
  (ls_debfinrad 'c:projet_md_geststylechem-hach_bt_cancel_onclicked)
  (setq gvar_36_c_projet_md_geststylechem-hach_bt_cancel_onclicked 'geombib-raccord)
  (if (c:projet_md_geststylechem-hach_oninitialize)
    (progn
      (re_abs1 gvar_65_c_projet_md_sivpano-sel_ls_pano_onselchanged 1)
    )
    (progn
      nil
    )
  )
  (ls_debfinrad 'c:projet_md_geststylechem-hach_bt_ok_onclicked)
  (setq gvar_35_c_projet_md_geststylechem-hach_bt_ok_onclicked 'ls_vtxs)
  (entdel 'c:projet_md_geststylechem-bord_oninitialize)
  (setq polybib-subpolybisinv (es_poly (dcl-grid-addrow (ls_props2 sivpano-dial-search) sivpano-getserie)))
  (setq in_lon0 (sivpano-getdir stylebord-go 4))
  (setq assoc (sivpano-getdir stylechem-get 4))
  (setq ls_axe (errbib-catchapply gvar_64_c_projet_md_sivpano-sel_bt_ok_onclicked))
  (setq gvar_3255 (sivpano-getdir sivpano-getdebut 1))
  (setq ld_crois (sivpano-getdir sivpano-getins 1))
  (if (and in_lon0 assoc gvar_3255 ld_crois (ocbib-ename2id 'c:projet_md_geststylechem-bord_bt_cancel_onclicked in_lon0))
    (progn
      (vlax-invoke gvar_32_c_projet_md_geststylechem-bord_bt_ok_onclicked 'c:projet_md_geststylechem-poly_oninitialize)
      nil
    )
    (progn
      (sivpano-getymax polybib-subpolybisinv in_lon0 assoc gvar_3255 ls_axe ld_crois)
      (vlax-invoke gvar_32_c_projet_md_geststylechem-bord_bt_ok_onclicked (geombib-raccordmax 'c:projet_md_geststylechem-poly_bt_cancel_onclicked in_lon0 'c:projet_md_geststylechem-poly_bt_ok_onclicked))
      polybib-vtxjoin
    )
  )
  T
  T
  (setq gvar_37_c_projet_md_geststylechem-hach_oninitialize 'en_rac)
  ;; init-args 5: 'blkpoly-proj, local_0, 'st_grouphandle, local_1
  (entdel 'c:projet_md_geststylechem-signa_oninitialize)
  (ls_options (dcl-forcedwgredraw (in_param (axedyn-reaccreate (st_1 'sivpano-getnom)) 255)) 're_long)
  (member (dcl-forcedwgredraw (ocbib-ename2id 'c:projet_md_geststylechem-bord_bt_cancel_onclicked 'sivpano-getnom)))
  (ls_debfinrad 'c:projet_md_geststylechem-signa_st_mod_onselchanged)
  (setq gvar_27_c_projet_md_geststylechem-signa_st_mod_onselchanged "AXE-Rayons")
  (re_abs1 sivpano-copyended)
  (ls_debfinrad 'c:projet_md_geststylechem-signa_bt_ok_onclicked)
  (setq gvar_26_c_projet_md_geststylechem-signa_bt_ok_onclicked 'polybib-polymod)
  (re_abs1 gvar_65_c_projet_md_sivpano-sel_ls_pano_onselchanged 2)
  (ls_som0)
  (ls_debfinrad 'c:projet_md_geststylechem-signa_bt_cancel_onclicked)
  (setq gvar_25_c_projet_md_geststylechem-signa_bt_cancel_onclicked 'poly-lwpolytrace)
  ;; init-args 5: 'eo_poly, local_0, "LinetypeGeneration", local_1
  (entdel 'stylepoly-get)
  (re_hauteur stylepoly-id2props stylepoly-add)
  (setq stylepoly-add (in_param (dcl-grid-addrow eo_poly sivpano-getserie) 'stylepoly-list))
  (re_hauteur sivpano-getins stylepoly-add)
  (ls_debfinrad 'stylepoly-fillcombo)
  (stylepoly-go)
  (eval "AO-ChemDyn" polybib-vtxjoin)
  (vlax-erased-p gvar_65_c_projet_md_sivpano-sel_ls_pano_onselchanged)
  (ls_visi 'sivpano-getnom)
  (setq stylepoly-fillcombo 'listbib_subst-i)
  (setq ha_rac (c:projet_md_sivpano-sel_bt_cancel_onclicked))
  (setq ha_rac (polybib-lwvertices 'stylerep-get ha_rac))
  (setq sivpano-getserie (es_ext (es_ext (groupbib-list 'ls_axes 'st_btn) (groupbib-list 'stringbib-prefix 'stylerep-list) (groupbib-list 'stylepoly-list nil)) (es_ext (groupbib-list 'ls_axes 'metbib-metzgo) (groupbib-list 'stringbib-prefix 'stylerep-add) (groupbib-list 'stylepoly-list nil)) (es_ext (groupbib-list 'ls_axes '*ls_temp*) (groupbib-list 'stringbib-prefix 'stylerep-go) (groupbib-list 'stylepoly-list nil)) (es_ext (groupbib-list 'ls_axes '(in_amont in_aval ls_deb ls_ent ls_fin st_amont st_aval)) (groupbib-list 'stringbib-prefix 'taldyn-list) (groupbib-list 'stylepoly-list nil)) (es_ext (groupbib-list 'ls_axes 'taldyn-get) (groupbib-list 'stringbib-prefix 'taldyn-set) (groupbib-list 'stylepoly-list nil)) (es_ext (groupbib-list 'ls_axes 'taldyn-create) (groupbib-list 'stringbib-prefix 'taldyn-getparents) (groupbib-list 'stylepoly-list polybib-vtxjoin)) (es_ext (groupbib-list 'ls_axes 'ls_propvals) (groupbib-list 'stringbib-prefix 'taldyn-popgo) (groupbib-list 'stylepoly-list polybib-vtxjoin)) (es_ext (groupbib-list 'ls_axes 'taldyn-modgo) (groupbib-list 'stringbib-prefix 'c:projet_pa_talus_oninitialize) (groupbib-list 'stylepoly-list nil)) (es_ext (groupbib-list 'ls_axes 'ls_propval) (groupbib-list 'stringbib-prefix 'c:projet_pa_talus_re_pas_onsetfocus) (groupbib-list 'stylepoly-list nil))))
  (setq taldyn-palclose (es_ext (groupbib-list 'metbib-metzgo 'c:projet_pa_talus_btn_reset_onclicked) (groupbib-list '*ls_temp* 'c:projet_pa_talus_bt_select_onclicked) (groupbib-list '(re_x re_y pt_poly re_anglepoly re_angle) 'taldyn-palapply) (groupbib-list "Impossible d'insérer le bloc droit" 'taldyn-palsave)))
  (taldyn-palclose)
)
