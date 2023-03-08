@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Average Rating'
define view entity ZC_054906_AverageRating
  as select from zdap_movierating
{
  key movie_uuid                   as MovieUuid,
      @EndUserText.label: 'Average Rating'
      avg(rating as abap.dec(8,2)) as AverageRating
}
group by
  movie_uuid
