CLASS lhc_Movie DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.
    METHODS show_message FOR MODIFY
      IMPORTING keys FOR ACTION movie~show_message.

    METHODS validate_genre FOR VALIDATE ON SAVE
      IMPORTING keys FOR movie~validate_genre.

ENDCLASS.

CLASS lhc_Movie IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD show_message.

    DATA(message) = NEW zcm_054906_movie(
      severity    = if_abap_behv_message=>severity-success
      textid      = zcm_054906_movie=>button_oppressed
      user_name   = CONV #( sy-uname ) ).

    APPEND message TO reported-%other.

  ENDMETHOD.

  METHOD validate_genre.

    READ ENTITY IN LOCAL MODE ZI_054906_Movie_3
      FIELDS ( Genre )
      WITH CORRESPONDING #( keys )
      RESULT DATA(movies).

    LOOP AT movies INTO DATA(movie).

      SELECT SINGLE FROM ddcds_customer_domain_value_t( p_domain_name = 'Z054906_MOVIE_GENRE' )
        FIELDS *
        WHERE language = @sy-langu AND value_low = @movie-Genre
        INTO @DATA(genre).
      IF sy-subrc <> 0.
        DATA(message) = NEW zcm_054906_movie(
          severity    = if_abap_behv_message=>severity-error
          textid      = zcm_054906_movie=>invalid_value_for_genre ).

        APPEND message TO reported-%other.
        APPEND CORRESPONDING #( movie ) TO failed-movie.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
