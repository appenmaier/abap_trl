@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Average Rating'
define view entity ZI_054906_AverageRatingByMovie
  as select from z054906_movrat
{
  key movie_uuid                   as MovieUuid,
      @EndUserText: { label: 'Average Rating', quickInfo: 'Average Rating' }
      avg(rating as abap.dec(8,2)) as AverageRating
}
where
  rating is not initial
group by
  movie_uuid
