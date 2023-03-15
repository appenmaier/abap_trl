@EndUserText.label: 'Rating'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_RDVT2_Rating
  as select from z054906_movrat
  association to parent ZI_RDVT2_Movie as _Movie on $projection.MovieUuid = _Movie.MovieUuid
{
  key movie_rating_uuid as MovieRatingUuid,
      movie_uuid        as MovieUuid,
      user_name         as UserName,
      rating            as Rating,

      /* Associations */
      _Movie
}
