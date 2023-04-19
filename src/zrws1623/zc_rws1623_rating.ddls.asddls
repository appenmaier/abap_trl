@EndUserText.label: 'Rating'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_RWS1623_Rating
  as projection on ZI_RWS1623_Rating
{
  key RatingUuid,
      MovieUuid,
      UserName,
      Rating,

      /* Administrative Data */
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      /* Associations */
      _Movie : redirected to parent ZC_RWS1623_Movie
}
