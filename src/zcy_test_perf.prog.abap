*&---------------------------------------------------------------------*
*& Report ZCY_TEST_PERF
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCY_TEST_PERF.

DATA:
      LT_TAB TYPE ZCY_T_PERF.

*DELETE LT_TAB USING KEY BKEY WHERE AKEY = 'ABC'.
data lt_tab1 LIKE STANDARD TABLE OF zcy_s_perf
               WITH UNIQUE HASHED KEY bkey COMPONENTS akey.

data lv_key type /bobf/conf_key.

"where condition must be optimizable. So the following one is incorrect.
*delete lt_tab1 using key bkey where akey = 'abc'.

"this one is correct
delete lt_tab1 using key bkey where akey = lv_key.
