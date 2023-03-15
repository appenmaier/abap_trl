@EndUserText.label: 'Movie'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_RDVT2_Movie
  as projection on ZI_RDVT2_Movie
{
  key MovieUuid,
      Title,
      Genre,
      PublishingYear,
      Url,

      /* Associations */
      _Ratings : redirected to composition child ZC_RDVT2_Rating
}
