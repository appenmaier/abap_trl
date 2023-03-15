@EndUserText.label: 'Rating'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_RDVT1_Rating
  as projection on ZI_RDVT1_Rating
{
  key MovieRatingUuid,
      MovieUuid,
      UserName,
      Rating,

      /* Associations */
      _Movie : redirected to parent ZC_RDVT1_Movie
}
