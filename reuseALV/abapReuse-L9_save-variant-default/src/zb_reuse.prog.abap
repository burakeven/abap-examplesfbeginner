*&---------------------------------------------------------------------*
*& Report ZB_REUSE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZB_REUSE.

INCLUDE zb_reuse_top.
INCLUDE zb_reuse_frm.

INITIALIZATION.
gs_variant_get-report = sy-repid. "sy-repid ile hangi programda calistigini belirtmem gerekiyor.
CALL FUNCTION 'REUSE_ALV_VARIANT_DEFAULT_GET'
  CHANGING
    cs_variant          = gs_variant_get
 EXCEPTIONS
   WRONG_INPUT         = 1
   NOT_FOUND           = 2
   PROGRAM_ERROR       = 3
   OTHERS              = 4
          .
IF sy-subrc eq 0. "defaullta tanimlanmis bir sey bulabilmisse..
  p_vari = gs_variant_get-variant. "p_vari gs_variant-variant'ını alip kendisine atiyor.
* Implement suitable error handling here
ENDIF.

at SELECTION-SCREEN on VALUE-REQUEST FOR p_vari.
  gs_variant_get-report = sy-repid.
  CALL FUNCTION 'REUSE_ALV_VARIANT_F4'
    EXPORTING
      is_variant                = gs_variant_get
   IMPORTING
     E_EXIT                    = gv_exit
     ES_VARIANT                = gs_variant_get
   EXCEPTIONS
     NOT_FOUND                 = 1
     PROGRAM_ERROR             = 2
     OTHERS                    = 3
            .
  IF sy-subrc eq 0.
    IF gv_exit IS INITIAL.
        p_vari = gs_variant_get-variant.
    ENDIF.
* Implement suitable error handling here
  ENDIF.


START-OF-SELECTION.

PERFORM set_getdata.
PERFORM set_fc.
PERFORM set_lay.
PERFORM display_alv.
*gt_list = CORRESPONDING(gt_test). "Bu da testten sonra list tablosuna
*alma gibi dusun, bunu arastir, kod yapisi tam hatirlanmiyor.
*  SELECT * FROM gt_test INTO gt_list.


*SELECT sbook~carrid,
*       sbook~connid,
*       sflight~fldate,
*       sflight~price,
*       sflight~currency,
*       sflight~seatsmax,
*       sflight~seatsocc
*  FROM sbook
*  INNER JOIN sflight
*  ON sbook~carrid = sflight~carrid
*  AND sbook~connid = sflight~connid
*  WHERE sbook~carrid = 'LH'
*  AND sbook~customid = '000001'
*  INTO TABLE @DATA(lt_data).

*SELECT
*  sbook~customid
*  sflight~connid
*  sbook~countnum
*  sbook~custtype
*  sflight~planettype
*  sflight~seatsoc
*  FROM sbook
*  INNER JOIN sflight ON sflight~connid EQ sbook~customid
*  INTO TABLE gt_list.

*SELECT * FROM sbook
*INNER JOIN sflight ON sflight~connid EQ sbook~customid INTO TABLE
*gt_list.
