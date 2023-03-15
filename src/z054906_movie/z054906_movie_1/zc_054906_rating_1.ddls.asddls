@EndUserText.label: 'Rating: Stage 1'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZC_054906_Rating_1
  as projection on ZI_054906_Rating_1
{
  key MovieRatingUuid,
      MovieUuid,
      UserName,
      Rating,

      /* Associations */
      _Movie : redirected to parent ZC_054906_Movie_1
}
