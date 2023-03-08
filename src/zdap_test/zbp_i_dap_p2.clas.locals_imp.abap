CLASS lhc_ZI_DAP_P2 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_dap_p2 RESULT result.
    METHODS set_description FOR MODIFY
      IMPORTING keys FOR ACTION zi_dap_p2~set_description.

ENDCLASS.

CLASS lhc_ZI_DAP_P2 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD set_description.
  ENDMETHOD.

ENDCLASS.
