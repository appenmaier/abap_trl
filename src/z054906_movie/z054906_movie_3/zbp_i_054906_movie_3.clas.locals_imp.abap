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

    DATA message TYPE REF TO zcm_054906_movie.

    message = NEW zcm_054906_movie(
      severity  = if_abap_behv_message=>severity-success
      textid    = zcm_054906_movie=>button_oppressed
      user_name = CONV #( sy-uname ) ).

    APPEND message TO reported-%other.

  ENDMETHOD.

  METHOD validate_genre.
    DATA message TYPE REF TO zcm_054906_movie.

    READ ENTITY IN LOCAL MODE ZI_054906_Movie_3
         FIELDS ( Genre )
         WITH CORRESPONDING #( keys )
         RESULT DATA(movies).

    LOOP AT movies INTO DATA(movie).

      SELECT SINGLE
        FROM ddcds_customer_domain_value_t( p_domain_name = 'Z054906_MOVIE_GENRE' )
        FIELDS *
        WHERE language = @sy-langu AND value_low = @movie-Genre
        " TODO: variable is assigned but never used (ABAP cleaner)
        INTO @DATA(genre).

      IF sy-subrc <> 0.
        message = NEW zcm_054906_movie( severity = if_abap_behv_message=>severity-error
                                        textid   = zcm_054906_movie=>invalid_value_for_genre ).
        APPEND VALUE #( %tky = movie-%tky %msg = message %create = if_abap_behv=>mk-on ) TO reported-movie.
        APPEND CORRESPONDING #( movie ) TO failed-movie.

      ENDIF.

    ENDLOOP.
  ENDMETHOD.


  METHOD rate_movie.
    DATA rating TYPE ZI_054906_Rating_3.

    READ ENTITY IN LOCAL MODE ZI_054906_Movie_3
         FIELDS ( Title )
         WITH CORRESPONDING #( keys )
         RESULT DATA(movies).

    LOOP AT movies INTO DATA(movie).

      rating-MovieUuid = movie-MovieUuid.
      rating-UserName  = keys[ %tky = movie-%tky ]-%param-UserName.
      rating-Rating    = keys[ %tky = movie-%tky ]-%param-Rating.

      MODIFY ENTITY IN LOCAL MODE ZI_054906_Movie_3
             CREATE BY \_Ratings
             FIELDS ( MovieUuid UserName Rating )
             WITH VALUE #( ( %tky    = movie-%tky
                             %target = VALUE #( ( %cid      = 'X'
                                                  MovieUuid = movie-MovieUuid
                                                  UserName  = rating-UserName
                                                  Rating    = rating-Rating ) ) ) ).

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
