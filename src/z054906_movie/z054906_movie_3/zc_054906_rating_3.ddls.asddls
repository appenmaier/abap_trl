@EndUserText.label: 'Rating: Stage 2'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_054906_Rating_3
  as projection on ZI_054906_Rating_3
{
  key MovieRatingUuid,
      MovieUuid,
      UserName,
      Rating,

      /* Associations */
      _Movie : redirected to parent ZC_054906_Movie_3
}
