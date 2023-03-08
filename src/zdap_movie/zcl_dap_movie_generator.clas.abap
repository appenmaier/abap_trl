CLASS zcl_dap_movie_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dap_movie_generator IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA movie TYPE zdap_movie.
    DATA rating TYPE zdap_movierating.
    DATA movies TYPE TABLE OF zdap_movie.
    DATA ratings TYPE TABLE OF zdap_movierating.

    DELETE FROM zdap_movie.
    IF sy-subrc <> 0.
      out->write( |Error: DELETE FROM zdap_movie| ).
    ENDIF.
    out->write( |Deleted: { sy-dbcnt } movies| ).

    DELETE FROM zdap_movierating.
    IF sy-subrc <> 0.
      out->write( |Error: DELETE FROM zdap_movierating| ).
    ENDIF.
    out->write( |Deleted: { sy-dbcnt } ratings| ).

    " Movie
    movie-client = sy-mandt.
    movie-movie_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    movie-title = 'Die Verurteilten'.
    movie-genre = 'DRAMA'.
    movie-publishing_year = '1994'.
    movie-url = 'https://m.media-amazon.com/images/I/517SDGYY26L._SX300_SY300_QL70_ML2_.jpg'.
    APPEND movie TO movies.

    rating-client = sy-mandt.
    rating-movie_rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid = movie-movie_uuid.
    rating-user_name = 'Hans Maier'.
    rating-rating = '4.5'.
    APPEND rating TO ratings.

    rating-client = sy-mandt.
    rating-movie_rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid = movie-movie_uuid.
    rating-user_name = 'Peter Schmid'.
    rating-rating = '5'.
    APPEND rating TO ratings.

    " Movie
    movie-client = sy-mandt.
    movie-movie_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    movie-title = 'Der Pate'.
    movie-genre = 'DRAMA'.
    movie-publishing_year = '1972'.
    movie-url = 'https://m.media-amazon.com/images/I/61CmuSlouPL._SY445_.jpg'.
    APPEND movie TO movies.

    rating-client = sy-mandt.
    rating-movie_rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid = movie-movie_uuid.
    rating-user_name = 'Max Müller'.
    rating-rating = '3'.
    APPEND rating TO ratings.

    rating-client = sy-mandt.
    rating-movie_rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid = movie-movie_uuid.
    rating-user_name = 'Heidi Meier'.
    rating-rating = '5'.
    APPEND rating TO ratings.

    rating-client = sy-mandt.
    rating-movie_rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid = movie-movie_uuid.
    rating-user_name = 'Peter Schmid'.
    rating-rating = '4.5'.
    APPEND rating TO ratings.

    " Movie
    movie-client = sy-mandt.
    movie-movie_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    movie-title = 'The Dark Knight'.
    movie-genre = 'FANTASY'.
    movie-publishing_year = '2008'.
    movie-url = 'https://m.media-amazon.com/images/I/71NiWjOPZ1L._SX342_.jpg'.
    APPEND movie TO movies.

    rating-client = sy-mandt.
    rating-movie_rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid = movie-movie_uuid.
    rating-user_name = 'Franz Xaver'.
    rating-rating = '4'.
    APPEND rating TO ratings.

    rating-client = sy-mandt.
    rating-movie_rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid = movie-movie_uuid.
    rating-user_name = 'Luisa Rodriguez'.
    rating-rating = '4.5'.
    APPEND rating TO ratings.

    rating-client = sy-mandt.
    rating-movie_rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid = movie-movie_uuid.
    rating-user_name = 'Peter Schmid'.
    rating-rating = '5'.
    APPEND rating TO ratings.

    " Movie
    movie-client = sy-mandt.
    movie-movie_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    movie-title = 'Der Pate 2'.
    movie-genre = 'DRAMA'.
    movie-publishing_year = '1974'.
    movie-url = 'https://m.media-amazon.com/images/I/812R0xUnGAL._SY445_.jpg'.
    APPEND movie TO movies.

    rating-client = sy-mandt.
    rating-movie_rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid = movie-movie_uuid.
    rating-user_name = 'Petra Huber'.
    rating-rating = '3'.
    APPEND rating TO ratings.

    " Movie
    movie-client = sy-mandt.
    movie-movie_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    movie-title = 'Schindlers Liste'.
    movie-genre = 'DRAMA'.
    movie-publishing_year = '1993'.
    movie-url = 'https://m.media-amazon.com/images/I/71gYAeGfLFL._SX342_.jpg'.
    APPEND movie TO movies.

    rating-client = sy-mandt.
    rating-movie_rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid = movie-movie_uuid.
    rating-user_name = 'Max Müller'.
    rating-rating = '4'.
    APPEND rating TO ratings.

    rating-client = sy-mandt.
    rating-movie_rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid = movie-movie_uuid.
    rating-user_name = 'Verena Schmied'.
    rating-rating = '5'.
    APPEND rating TO ratings.

    rating-client = sy-mandt.
    rating-movie_rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid = movie-movie_uuid.
    rating-user_name = 'Luisa Rodriguez'.
    rating-rating = '2'.
    APPEND rating TO ratings.

    rating-client = sy-mandt.
    rating-movie_rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid = movie-movie_uuid.
    rating-user_name = 'Franz Xaver'.
    rating-rating = '5'.
    APPEND rating TO ratings.

    " Movie
    movie-client = sy-mandt.
    movie-movie_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    movie-title = 'Fight Club'.
    movie-genre = 'THRILLER'.
    movie-publishing_year = '1999'.
    movie-url = 'https://m.media-amazon.com/images/I/91z1PACXftL._SX342_.jpg'.
    APPEND movie TO movies.

    rating-client = sy-mandt.
    rating-movie_rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid = movie-movie_uuid.
    rating-user_name = 'Bruno Braun'.
    rating-rating = '4.5'.
    APPEND rating TO ratings.

    " Movie
    movie-client = sy-mandt.
    movie-movie_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    movie-title = 'Pulp Fiction'.
    movie-genre = 'DRAMA'.
    movie-publishing_year = '1994'.
    movie-url = 'https://m.media-amazon.com/images/I/510QW0CTXKL._AC_.jpg'.
    APPEND movie TO movies.

    rating-client = sy-mandt.
    rating-movie_rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid = movie-movie_uuid.
    rating-user_name = 'Petra Müller'.
    rating-rating = '5'.
    APPEND rating TO ratings.

    rating-client = sy-mandt.
    rating-movie_rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid = movie-movie_uuid.
    rating-user_name = 'Luisa Rodriguez'.
    rating-rating = '4.5'.
    APPEND rating TO ratings.

    INSERT zdap_movie FROM TABLE @movies.
    IF sy-subrc <> 0.
      out->write( |Error: INSERT zdap_movie FROM TABLE @movies| ).
    ENDIF.
    out->write( |Inserted: { sy-dbcnt } movies| ).

    INSERT zdap_movierating FROM TABLE @ratings.
    IF sy-subrc <> 0.
      out->write( |Error: INSERT zdap_movierating FROM TABLE @ratings| ).
    ENDIF.
    out->write( |Inserted: { sy-dbcnt } ratings| ).

  ENDMETHOD.

ENDCLASS.
