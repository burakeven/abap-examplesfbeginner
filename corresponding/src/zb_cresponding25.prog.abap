*&---------------------------------------------------------------------*
*& Report ZB_CRESPONDING25
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zb_cresponding25.

"MOVE-CORRESPONDING

types: BEGIN OF gty_type1,
  col1 type char10,
  col2 type char10,
  col3 type char10,
  col4 type char10,
  END OF gty_type1.
START-OF-SELECTION.

types: BEGIN OF gty_type2,
    col2 type char10,
    col3 type char10,
  END OF gty_type2.

data: gs_st1 type gty_type1,
      gs_st2 type gty_type2.

START-OF-SELECTION.

gs_st1-col1 = 'aaaa'.
gs_st1-col2 = 'bbbb'.
gs_st1-col3 = 'cccc'.
gs_st1-col4 = 'dddd'.

*gs_st2 = gs_st1.

*MOVE gs_st1 to gs_st2.

MOVE-CORRESPONDING gs_st1 to gs_st2.

WRITE: gs_st2.


























*DATA: gt_scarr  TYPE TABLE OF scarr,
*      gt_scarr2 TYPE TABLE OF scarr.

*START-OF-SELECTION.

*  TYPES: BEGIN OF gty_scarr,
**           mandt     TYPE s_mandt,
**           carrid   TYPE s_carr_id,
*           carrname TYPE  s_carrname,
*           currcode TYPE  s_currcode, "currcode'u currcode2 seklinde cevirirsek orada sutun basligi currcode2 olarak gozukur fakat icerisinde bir veri olmaz.
**           url       TYPE s_carrurl,
*         END OF gty_scarr.

*data: gt_scarr type table of gty_scarr.
*  SELECT carrid carrname FROM scarr INTO TABLE gt_scarr.
  "su an goruldugu gibi 2 kolon cekmeye calisiliyor fakat 5 kolonlu
  "... tabloya atilmak isteniyor. Bundan dolayi sorun. Atama duzgun sekilde..
  "... gerceklesmedi.

*  SELECT carrid carrname FROM scarr INTO CORRESPONDING FIELDS OF TABLE gt_scarr2.

*select * from scarr INTO TABLE gt_scarr.

*select * from scarr INTO CORRESPONDING FIELDS OF TABLE gt_scarr.
