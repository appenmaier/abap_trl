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

    "Attributs
    DATA movie_title TYPE zdap_movie_title.
    DATA avg_rating TYPE zdap_rating.

    "Constructor
    METHODS constructor
      IMPORTING
        severity    TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid      LIKE if_t100_message=>t100key DEFAULT if_t100_message=>default_textid
        previous    LIKE previous OPTIONAL
        user        TYPE string OPTIONAL
        movie_title TYPE zdap_movie_title OPTIONAL
        avg_rating  TYPE zdap_rating OPTIONAL.

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
  ENDMETHOD.

ENDCLASS.
