@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Average Rating'
define view entity ZI_RWS1623_AverageRating
  as select from ZI_RWS1623_Rating
{
  key MovieUuid,
      @EndUserText.label: 'Average Rating'
      @EndUserText.quickInfo: 'Average Rating'
      avg(Rating as abap.dec(8,1)) as AverageRating
}
group by
  MovieUuid
