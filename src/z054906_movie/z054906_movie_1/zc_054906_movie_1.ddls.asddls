@EndUserText.label: 'Movie: Stage 1'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZC_054906_Movie_1
  as projection on ZI_054906_Movie_1
{
  key MovieUuid,
      Title,
      Genre,
      PublishingYear,
      Url,

      /* Associations */
      _Ratings : redirected to composition child ZC_054906_Rating_1
}
