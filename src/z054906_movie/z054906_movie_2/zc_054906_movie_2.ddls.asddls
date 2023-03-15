@EndUserText.label: 'Movie: Stage 2'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZC_054906_Movie_2
  as projection on ZI_054906_Movie_2
{
  key MovieUuid,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,
      Genre,
      PublishingYear,
      Url,

      /* Transient Data */
      AverageRating,
      AverageRatingCriticality,

      /* Associations */
      _Ratings : redirected to composition child ZC_054906_Rating_2
}
