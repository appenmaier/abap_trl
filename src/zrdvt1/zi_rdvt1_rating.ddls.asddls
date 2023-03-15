@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'
define view entity ZI_RDVT1_Rating
  as select from zdap_movierating
  association to parent ZI_RDVT1_Movie as _Movie on $projection.MovieUuid = _Movie.MovieUuid
{
  key movie_rating_uuid as MovieRatingUuid,
      movie_uuid        as MovieUuid,
      user_name         as UserName,
      rating            as Rating,
      _Movie
}
