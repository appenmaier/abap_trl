CLASS lhc_Movie DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.
    METHODS show_average_rating FOR MODIFY
      IMPORTING keys FOR ACTION movie~show_average_rating.

ENDCLASS.

CLASS lhc_Movie IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD show_average_rating.

    DATA total_rating TYPE p LENGTH 8 DECIMALS 2.
    DATA number_of_ratings TYPE i.
    DATA average_rating TYPE zdap_rating.

    " Lesen der Entitätsdaten
    READ ENTITY IN LOCAL MODE zi_054906_movie
      BY \_Ratings
      ALL FIELDS
      WITH CORRESPONDING #( keys )
      RESULT DATA(ratings)

      ALL FIELDS
      WITH CORRESPONDING #( keys )
      RESULT DATA(movies).

    " Entitätsdaten sequentiell verarbeiten
    " Bei Validierung: Prüfungen durchführen + Nachrichten erzeugen
    " Bei Ermittlung: Daten ermittlen + Daten zurückschreiben
    " Bei Actions: sowohl als auch
    LOOP AT movies INTO DATA(movie).
      CLEAR total_rating.
      CLEAR number_of_ratings.

      LOOP AT ratings INTO DATA(rating) WHERE MovieUuid = movie-MovieUuid.
        total_rating += rating-rating.
        number_of_ratings += 1.
      ENDLOOP.
      average_rating = total_rating / number_of_ratings.

      DATA message TYPE REF TO zcm_054906_movie.
      message = NEW zcm_054906_movie(
        severity = if_abap_behv_message=>severity-information
        textid   = zcm_054906_movie=>average_rating
        movie_title = movie-Title
        avg_rating = average_rating ).
      APPEND message TO reported-%other.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
