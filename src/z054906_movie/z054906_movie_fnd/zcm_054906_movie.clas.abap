CLASS zcm_054906_movie DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    "Interfaces
    INTERFACES if_abap_behv_message.
    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.

    "Message Constants
    CONSTANTS:
      BEGIN OF average_rating,
        msgid TYPE symsgid VALUE 'Z054906_MOVIE',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'MOVIE_TITLE',
        attr2 TYPE scx_attrname VALUE 'AVG_RATING',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF average_rating.

    CONSTANTS:
      BEGIN OF button_oppressed,
        msgid TYPE symsgid VALUE 'Z054906_MOVIE',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'USER_NAME',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF button_oppressed.

    CONSTANTS:
      BEGIN OF invalid_value_for_genre,
        msgid TYPE symsgid VALUE 'Z054906_MOVIE',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF invalid_value_for_genre.

    "Attributs
    DATA movie_title TYPE zdap_movie_title.
    DATA avg_rating TYPE zdap_rating.
    DATA user_name TYPE z054906_user_name.

    "Constructor
    METHODS constructor
      IMPORTING
        severity    TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid      LIKE if_t100_message=>t100key DEFAULT if_t100_message=>default_textid
        previous    LIKE previous OPTIONAL
        movie_title TYPE zdap_movie_title OPTIONAL
        avg_rating  TYPE zdap_rating OPTIONAL
        user_name   TYPE z054906_user_name OPTIONAL.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcm_054906_movie IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).

    if_t100_message~t100key = textid.
    me->if_abap_behv_message~m_severity = severity.
    me->movie_title = movie_title.
    me->avg_rating = avg_rating.
    me->user_name = user_name.
  ENDMETHOD.

ENDCLASS.
