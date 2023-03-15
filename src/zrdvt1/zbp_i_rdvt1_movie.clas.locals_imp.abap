CLASS lhc_Movie DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.
    METHODS show_avg_rating FOR MODIFY
      IMPORTING keys FOR ACTION movie~show_avg_rating.

ENDCLASS.

CLASS lhc_Movie IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD show_avg_rating.

    READ ENTITY IN LOCAL MODE zi_rdvt1_movie
      FIELDS ( PublishingYear )
      WITH CORRESPONDING #( keys )
      RESULT DATA(movies).

    LOOP AT movies INTO DATA(movie).

      DATA x TYPE n LENGTH 4.
      x = movie-PublishingYear.

      DATA(message) = NEW zcm_054906_1_travel(
        severity   = if_abap_behv_message=>severity-success
        textid     = zcm_054906_1_travel=>booking_already_cancelled
        booking_id = x ).

      APPEND message TO reported-%other.

    ENDLOOP.


  ENDMETHOD.

ENDCLASS.
