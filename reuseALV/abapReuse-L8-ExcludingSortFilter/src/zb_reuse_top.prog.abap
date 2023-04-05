*&---------------------------------------------------------------------*
*& Include          ZB_REUSE_TOP
*&---------------------------------------------------------------------*

*DATA: BEGIN OF gt_list OCCURS 0,
*  connid LIKE sbook-connid,
*  carrid LIKE sbook-carrid,
*  price LIKE sflight-price,
*  fldate LIKE sbook-fldate,
*  END OF gt_list.

  "connid LIKE sbook-s_conn_id,
*  carrid LIKE sbook-s_carr_id,
*  price LIKE sflight-s_price,
*  fldate LIKE sflight-s_date.

  TYPES: BEGIN OF gty_list, "global type list
         connid TYPE s_conn_id, "sbook
         selkz TYPE char1,
         carrid TYPE s_carr_id, "sbook
         price  TYPE s_price, "sflight
         fldate TYPE s_date, "sflight
         loccurkey type S_CURRCODE, "sbook
         line_color type char4,
         cell_color type slis_t_specialcol_alv,
       END OF gty_list.

DATA: gs_cell_color type slis_specialcol_alv.

DATA: gt_list TYPE TABLE OF gty_list,
      gs_list TYPE gty_list.

DATA: gt_field_catalog TYPE slis_t_fieldcat_alv,
      gs_field_catalog TYPE slis_fieldcat_alv.

data: gs_layout type SLIS_LAYOUT_ALV.
data: gt_events type SLIS_T_EVENT,
      gs_event type slis_alv_event.

data: gt_exclude type SLIS_T_EXTAB,
      gs_exclude type slis_extab.

data: gt_sort type SLIS_T_SORTINFO_ALV,
      gs_sort type slis_sortinfo_alv.

data: gt_filter type SLIS_T_FILTER_ALV,
      gs_filter type slis_filter_alv.
