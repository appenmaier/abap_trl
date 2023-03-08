@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View: Movie Rating'
define view entity ZI_054906_MovieRating
  as select from zdap_movierating
  association to parent ZI_054906_Movie as _Movie on $projection.MovieUuid = _Movie.MovieUuid
{
  key movie_rating_uuid as MovieRatingUuid,
      movie_uuid        as MovieUuid,
      user_name         as UserName,
      rating            as Rating,

      /* Transient Data */
      case when rating < 3.3 then 1
           when rating < 6.7 then 2
           else 3
      end               as RatingCriticality,

      /* Associations */
      _Movie
}
