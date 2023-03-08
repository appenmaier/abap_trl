CLASS zcm_dap_behv_message DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    "Interfaces
    INTERFACES if_abap_behv_message.
    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.

    "TODO: Define Message Constants
    CONSTANTS:
      BEGIN OF travel_message_1,
        msgid TYPE symsgid VALUE 'ZDAP_TRAVEL',
        msgno TYPE symsgno VALUE '000',
        attr1 TYPE scx_attrname VALUE 'TRAVEL_ID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF travel_message_1.

    CONSTANTS:
      BEGIN OF travel_message_2,
        msgid TYPE symsgid VALUE 'ZDAP_TRAVEL',
        msgno TYPE symsgno VALUE '000',
        attr1 TYPE scx_attrname VALUE 'CUSTOMER_ID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF travel_message_2.

    "TODO: Define Attributs
    DATA travel_id TYPE /dmo/travel_id.
    DATA customer_id TYPE /dmo/customer_id.

    "Constructor
    METHODS constructor
      IMPORTING
        severity    TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid      LIKE if_t100_message=>t100key DEFAULT if_t100_message=>default_textid
        previous    LIKE previous OPTIONAL
        travel_id   TYPE /dmo/travel_id OPTIONAL
        customer_id TYPE /dmo/customer_id OPTIONAL. "TODO: Add Parameters

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcm_dap_behv_message IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).

    if_t100_message~t100key = textid.
    me->if_abap_behv_message~m_severity = severity.

    "TODO: Set Attributs
    me->travel_id = travel_id.
    me->customer_id = customer_id.
  ENDMETHOD.

ENDCLASS.
