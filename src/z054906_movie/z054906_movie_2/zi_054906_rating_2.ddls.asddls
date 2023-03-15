@EndUserText.label: 'Rating: Stage 2'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_054906_Rating_2
  as select from z054906_movrat
  association to parent ZI_054906_Movie_2 as _Movie on $projection.MovieUuid = _Movie.MovieUuid
{
      @EndUserText: { label: 'Movie Rating UUID', quickInfo: 'Movie Rating UUID' }
  key movie_rating_uuid as MovieRatingUuid,
      @EndUserText: { label: 'Movie UUID', quickInfo: 'Movie UUID' }
      movie_uuid        as MovieUuid,
      user_name         as UserName,
      rating            as Rating,

      /* Associations */
      _Movie
}
