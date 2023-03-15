CLASS zcm_054906_2_travel DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    "Interfaces
    INTERFACES if_abap_behv_message.
    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.

    TYPES: ty_user TYPE c LENGTH 12.

    "Message Constants
    CONSTANTS:
      BEGIN OF button_pressed,
        msgid TYPE symsgid VALUE 'Z054906_2_TRAVEL',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'USER',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF button_pressed.

    CONSTANTS:
      BEGIN OF booking_already_cancelled,
        msgid TYPE symsgid VALUE 'Z054906_2_TRAVEL',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'BOOKING_ID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF booking_already_cancelled.

    CONSTANTS:
      BEGIN OF booking_cancelled_successfully,
        msgid TYPE symsgid VALUE 'Z054906_2_TRAVEL',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE 'BOOKING_ID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF booking_cancelled_successfully.

    CONSTANTS:
      BEGIN OF invalid_end_date,
        msgid TYPE symsgid VALUE 'Z054906_2_TRAVEL',
        msgno TYPE symsgno VALUE '004',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF invalid_end_date.

    "Attributs
    DATA user TYPE ty_user.
    DATA booking_id TYPE /dmo/booking_id.

    "Constructor
    METHODS constructor
      IMPORTING
        severity   TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid     LIKE if_t100_message=>t100key DEFAULT if_t100_message=>default_textid
        previous   LIKE previous OPTIONAL
        user       TYPE ty_user OPTIONAL
        booking_id TYPE /dmo/booking_id OPTIONAL.

    "public Travel(Severity severity, String textId, Object previous, User user){
    "  super(previous);
    "  this.severity = severity;
    "  this.textId = textId
    "  this.user = user;
    "}

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcm_054906_2_travel IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).

    if_t100_message~t100key = textid.
    me->if_abap_behv_message~m_severity = severity.
    me->user = user.
    me->booking_id = booking_id.
  ENDMETHOD.

ENDCLASS.
