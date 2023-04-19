CLASS lhc_Movie DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.
    METHODS show_message FOR MODIFY
      IMPORTING keys FOR ACTION movie~show_message.
    METHODS validate_genre FOR VALIDATE ON SAVE
      IMPORTING keys FOR movie~validate_genre.
    METHODS rate_movie FOR MODIFY
      IMPORTING keys FOR ACTION movie~rate_movie.

ENDCLASS.

CLASS lhc_Movie IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD show_message.
    DATA message TYPE REF TO zcm_rws1623_movie.

    message = NEW zcm_rws1623_movie( i_severity    = if_abap_behv_message=>severity-information
                                     i_textid      = zcm_rws1623_movie=>co_button_pressed
                                     i_button_name = 'Show Message'
                                     i_user_name   = sy-uname ).

    APPEND message TO reported-%other.
  ENDMETHOD.

  METHOD validate_genre.
    READ ENTITY IN LOCAL MODE ZI_RWS1623_Movie
         FIELDS ( Genre ) " ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT DATA(movies).

    LOOP AT movies REFERENCE INTO DATA(movie).

      SELECT SINGLE FROM ddcds_customer_domain_value( p_domain_name = 'Z054906_MOVIE_GENRE' )
       FIELDS @abap_true
       WHERE value_low = @movie->Genre
       INTO @DATA(genre_exists).
      IF genre_exists = abap_false.
        DATA(message) = NEW zcm_rws1623_movie( i_textid = zcm_rws1623_movie=>co_invalid_field
                                               i_value  = CONV #( movie->Genre )
                                               i_field  = 'Genre' ).
        APPEND VALUE #( %tky = movie->%tky %msg = message ) TO reported-movie.
        APPEND VALUE #( %tky = movie->%tky %fail = VALUE #( cause = if_abap_behv=>cause-not_found ) ) TO failed-movie.
        CONTINUE.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.

  METHOD rate_movie.
    DATA rating TYPE ZI_RWS1623_Rating.

    READ ENTITY IN LOCAL MODE ZI_RWS1623_Movie
         ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT DATA(movies).

    LOOP AT movies REFERENCE INTO DATA(movie).

      rating-UserName = keys[ sy-tabix ]-%param-UserName.
      rating-Rating   = keys[ KEY entity COMPONENTS MovieUuid = movie->MovieUuid ]-%param-Rating.

      MODIFY ENTITY IN LOCAL MODE ZI_RWS1623_Movie
             CREATE BY \_Ratings
             FIELDS ( UserName Rating )
             WITH VALUE #( ( %tky    = movie->%tky
                             %target = VALUE #( ( %cid     = 'X'
                                                  UserName = rating-UserName
                                                  Rating   = rating-Rating ) ) ) )
             MAPPED mapped
             FAILED failed
             REPORTED reported.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
