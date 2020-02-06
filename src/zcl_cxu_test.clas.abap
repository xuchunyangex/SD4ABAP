class ZCL_CXU_TEST definition
  public
  final
  create public .

public section.

  class-data SV_NAME type NAME .

  class-methods DISPLAY_NAME
    importing
      !IV_NAME type NAME default 'CXU'
    exporting
      !EV_NAME type NAME .
protected section.
private section.
ENDCLASS.



CLASS ZCL_CXU_TEST IMPLEMENTATION.


  METHOD display_name.
    ASSERT 0 = 0.
    ev_name = iv_name.

  ENDMETHOD.
ENDCLASS.
