*&---------------------------------------------------------------------*
*& Report ZB_SSASUTR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zb_ssasutr.

DATA: gt_scarr    TYPE TABLE OF scarr,
      gs_scarr    TYPE scarr,
      gv_currcode TYPE s_currcode.

START-OF-SELECTION.

*  SELECT * FROM scarr
*     INTO TABLE gt_scarr WHERE carrid EQ 'AC'.
*
*READ TABLE gt_scarr INTO gs_scarr INDEX 1.
*WRITE: gs_scarr-currcode.

  "CARRID, CURRCODE


  "SELECT * UP TO n ROWS
  "Istenen satir sayisina gore tablodan veri ceker.
*  SELECT * UP TO 5 ROWS FROM scarr INTO TABLE gt_scarr WHERE carrid EQ 'AC'.
*  READ TABLE gt_scarr INTO gs_scarr INDEX 1.
*  WRITE: gs_scarr-currcode.

  "se16'da gorulen kayit sirasiyla burada cikacak olan sira her zaman
  ".. ayni olmayabilir.

  "SELECT SINGLE
  "internal structure'a atamamizi bekler, table'a degil.
  "cogunlukla where kosulu kullanilmadan yazilmaz, cunku fazlaca veri icerisinden
  ".. belirli bir parametreyi almamiz gerekiyor.

*  SELECT SINGLE * FROM scarr INTO gs_scarr WHERE carrid EQ 'AC'.
  "tekrar read table yapmamiza gerek yok, zaten structure'a atadik.

*  WRITE: gs_scarr-currcode.

  SELECT SINGLE currcode FROM scarr INTO gv_currcode
    WHERE carrid EQ 'AC'.

  WRITE: gv_currcode.
