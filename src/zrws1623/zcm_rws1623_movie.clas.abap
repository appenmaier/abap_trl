CLASS zcm_rws1623_movie DEFINITION PUBLIC INHERITING FROM cx_static_check
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_abap_behv_message.

    ALIASES severity FOR if_abap_behv_message~severity.

    TYPES ty_character_12 TYPE c LENGTH 12.

    METHODS constructor IMPORTING i_severity    TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
                                  i_textid      LIKE if_t100_message=>t100key         OPTIONAL
                                  i_previous    LIKE previous                         OPTIONAL
                                  i_button_name TYPE ty_character_12                  OPTIONAL
                                  i_user_name   TYPE ty_character_12                  OPTIONAL
                                  i_value       TYPE ty_character_12                  OPTIONAL
                                  i_field       TYPE ty_character_12                  OPTIONAL.

    CONSTANTS:
      BEGIN OF co_button_pressed,
        msgid TYPE symsgid      VALUE 'ZRWS1623_MOVIE',
        msgno TYPE symsgno      VALUE '000',
        attr1 TYPE scx_attrname VALUE 'BUTTON_NAME',
        attr2 TYPE scx_attrname VALUE 'USER_NAME',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF co_button_pressed.

    CONSTANTS:
      BEGIN OF co_invalid_field,
        msgid TYPE symsgid      VALUE 'ZRWS1623_MOVIE',
        msgno TYPE symsgno      VALUE '001',
        attr1 TYPE scx_attrname VALUE 'VALUE',
        attr2 TYPE scx_attrname VALUE 'FIELD',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF co_invalid_field.

    DATA button_name TYPE ty_character_12.
    DATA user_name   TYPE ty_character_12.
    DATA value       TYPE ty_character_12.
    DATA field       TYPE ty_character_12.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcm_rws1623_movie IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = i_previous ).

    if_abap_behv_message~m_severity = i_severity.

    CLEAR me->textid.
    IF i_textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = i_textid.
    ENDIF.

    button_name = i_button_name.
    user_name = i_user_name.
    value = i_value.
    field = i_field.
  ENDMETHOD.
ENDCLASS.
