*&---------------------------------------------------------------------*
*& Report ZB_FORALLENTRIESIN27
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zb_forallentriesin27.

DATA: gt_table2     TYPE TABLE OF zbe_egt_002,
      gt_table2_tmp TYPE TABLE OF zbe_egt_002,
      gt_table3     TYPE TABLE OF zbe_egt_003,
      gt_table3_tmp TYPE TABLE OF zbe_egt_003.

START-OF-SELECTION.

  SELECT * FROM zbe_egt_002 INTO TABLE gt_table2.

  IF gt_table2 IS NOT INITIAL. "gt_table2 boşsa bunun icerisine girmeyecek.
    SELECT * FROM zbe_egt_003 INTO TABLE gt_table3
        FOR ALL ENTRIES IN gt_table2 WHERE ekipman_id EQ gt_table2-ekipman_id.
  ENDIF.


*  SELECT * FROM zbe_egt_003 INTO TABLE gt_table3_tmp
*    FOR ALL ENTRIES IN gt_table2_tmp WHERE ekipman_id EQ gt_table2_tmp-ekipman_id.

  BREAK-POINT.
*TYPES: BEGIN OF gty_ekipman,
*         ekipman_id   TYPE z_ekpid_egt_002_de,
*         ekipman_ad   TYPE z_ekpad_egt_002_de,
*         stok TYPE Z_STOK_EGT_002_DE,
*       END OF gty_ekipman.
*
*DATA: gt_ekipman TYPE TABLE OF gty_ekipman.
*
*START-OF-SELECTION.
*
*SELECT * FROM ZBE_EGT_002 as z2
*    INNER JOIN ZBE_EGT_003 as z3 on z3~ekipman_id eq z2~ekipman_id
*    INTO CORRESPONDING FIELDS OF TABLE gt_ekipman.
*BREAK-POINT.
*DATA: gt_ekipman_temp TYPE TABLE OF gty_ekipman. " Geçici tablo
*
*APPEND LINES OF gt_ekipman TO gt_ekipman_temp. " gt_ekipman tablosunu gt_ekipman_temp tablosuna kopyala
*
*BREAK-POINT. " Debugging için breakpoint
