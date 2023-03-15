CLASS lhc_Movie DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.
    METHODS show_message FOR MODIFY
      IMPORTING keys FOR ACTION movie~show_message.

ENDCLASS.

CLASS lhc_Movie IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD show_message.

    READ ENTITY IN LOCAL MODE ZI_RDVT2_Movie
      BY \_Ratings
      ALL FIELDS
      WITH CORRESPONDING #( keys )
      RESULT DATA(ratings)

      FIELDS ( Title PublishingYear )
      WITH CORRESPONDING #( keys )
      RESULT DATA(movies).

    LOOP AT movies INTO DATA(movie).

      DATA(message) = NEW zcm_054906_movie(
        severity    = if_abap_behv_message=>severity-success
        textid      = zcm_054906_movie=>button_oppressed
        user_name   = CONV #( sy-uname ) ).

      APPEND message TO reported-%other.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
