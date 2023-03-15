@EndUserText.label: 'Rating: Stage 1'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_054906_Rating_1
  as select from z054906_movrat
  association to parent ZI_054906_Movie_1 as _Movie on $projection.MovieUuid = _Movie.MovieUuid
{
  key movie_rating_uuid as MovieRatingUuid,
      movie_uuid        as MovieUuid,
      user_name         as UserName,
      rating            as Rating,

      /* Associations */
      _Movie
}
