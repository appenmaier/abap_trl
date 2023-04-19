CLASS zcl_rws1623_movie_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rws1623_movie_generator IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA movie   TYPE zrws1623_movie.
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA movies  TYPE TABLE OF zrws1623_movie.
    DATA rating  TYPE zrws1623_rating.
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA ratings TYPE TABLE OF zrws1623_rating.

    DELETE FROM zrws1623_movie.
    out->write( |Deleted from Movie: { sy-dbcnt }| ).
    DELETE FROM zrws1623_rating.
    out->write( |Deleted from Rating: { sy-dbcnt }| ).

    movie-client          = sy-mandt.
    movie-movie_uuid      = cl_system_uuid=>create_uuid_x16_static( ).
    movie-title           = 'John Wick 4'.
    movie-genre           = 'ACTION'.
    movie-publishing_year = '2023'.
    movie-created_by      = sy-uname.
    GET TIME STAMP FIELD movie-created_at.
    GET TIME STAMP FIELD movie-last_changed_at.
    movie-last_changed_by = sy-uname.
    APPEND movie TO movies.

    rating-client      = sy-mandt.
    rating-rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid  = movie-movie_uuid.
    rating-user_name   = sy-uname.
    rating-rating      = 8.
    rating-created_by  = sy-uname.
    GET TIME STAMP FIELD rating-created_at.
    GET TIME STAMP FIELD rating-last_changed_at.
    rating-last_changed_by = sy-uname.
    APPEND rating TO ratings.

    movie-client          = sy-mandt.
    movie-movie_uuid      = cl_system_uuid=>create_uuid_x16_static( ).
    movie-title           = 'Disaster Movie'.
    movie-genre           = 'COMEDY'.
    movie-publishing_year = '2008'.
    movie-created_by      = sy-uname.
    GET TIME STAMP FIELD movie-created_at.
    GET TIME STAMP FIELD movie-last_changed_at.
    movie-last_changed_by = sy-uname.
    APPEND movie TO movies.

    rating-client      = sy-mandt.
    rating-rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid  = movie-movie_uuid.
    rating-user_name   = sy-uname.
    rating-rating      = 1.
    rating-created_by  = sy-uname.
    GET TIME STAMP FIELD rating-created_at.
    GET TIME STAMP FIELD rating-last_changed_at.
    rating-last_changed_by = sy-uname.
    APPEND rating TO ratings.

    movie-client          = sy-mandt.
    movie-movie_uuid      = cl_system_uuid=>create_uuid_x16_static( ).
    movie-title           = 'Der Pate'.
    movie-genre           = 'DRAMA'.
    movie-publishing_year = '1972'.
    movie-created_by      = sy-uname.
    GET TIME STAMP FIELD movie-created_at.
    GET TIME STAMP FIELD movie-last_changed_at.
    movie-last_changed_by = sy-uname.
    APPEND movie TO movies.

    rating-client      = sy-mandt.
    rating-rating_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    rating-movie_uuid  = movie-movie_uuid.
    rating-user_name   = sy-uname.
    rating-rating      = 10.
    rating-created_by  = sy-uname.
    GET TIME STAMP FIELD rating-created_at.
    GET TIME STAMP FIELD rating-last_changed_at.
    rating-last_changed_by = sy-uname.
    APPEND rating TO ratings.

    INSERT zrws1623_movie FROM TABLE @movies.
    out->write( |Inserted into Movie: { sy-dbcnt }| ).
    INSERT zrws1623_rating FROM TABLE @ratings.
    out->write( |Inserted into Rating: { sy-dbcnt }| ).
  ENDMETHOD.

ENDCLASS.
