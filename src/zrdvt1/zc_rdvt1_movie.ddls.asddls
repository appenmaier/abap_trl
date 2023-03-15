@EndUserText.label: 'Movie'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_RDVT1_Movie
  as projection on ZI_RDVT1_Movie
{
  key MovieUuid,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,
      Genre,
      PublishingYear,
      Url,

      /* Associations */
      _Ratings : redirected to composition child ZC_RDVT1_Rating
}
