*&---------------------------------------------------------------------*
*& Report ZB_RT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zb_rt.

DATA: gt_scarr TYPE TABLE OF scarr,
      gs_scarr TYPE scarr.

START-OF-SELECTION.

  SELECT * FROM scarr INTO TABLE gt_scarr.


*READ TABLE gt_scarr INTO gs_scarr INDEX 4. "indexli kullanim.
*  WRITE: gs_scarr.

*  READ TABLE gt_scarr INTO gs_scarr WITH KEY carrid = 'AZ'. "with key'den sonra kosulumuzu belirtiyoruz.
*  READ TABLE gt_scarr INTO gs_scarr WITH KEY carrname = 'Alitalia'.

*READ TABLE gt_scarr INTO gs_scarr WITH KEY currcode = 'EUR'
*                                           carrname = 'Alitalia'.
*LOOP AT gt_scarr INTO gs_scarr WHERE currcode = 'EUR'.
*WRITE: gs_scarr.
*ENDLOOP.

READ TABLE gt_scarr INTO gs_scarr WITH key currcode = 'EUR'.

  WRITE: gs_scarr.
