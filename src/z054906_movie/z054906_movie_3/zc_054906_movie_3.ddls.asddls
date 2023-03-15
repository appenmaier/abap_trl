@EndUserText.label: 'Movie: Stage 2'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZC_054906_Movie_3
  provider contract transactional_query
  as projection on ZI_054906_Movie_3
{
  key MovieUuid,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_054906_GenreVH', element: 'Genre' } }]
      Genre,
      PublishingYear,
      Url,

      /* Transient Data */
      AverageRating,
      AverageRatingCriticality,

      /* Associations */
      _Ratings : redirected to composition child ZC_054906_Rating_3
}
