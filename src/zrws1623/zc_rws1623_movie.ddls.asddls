@EndUserText.label: 'Movie'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_RWS1623_Movie
  provider contract transactional_query
  as projection on ZI_RWS1623_Movie
{
  key MovieUuid,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_RWS1623_GenreVH', element: 'Genre' } }]
      Genre,
      PublishingYear,
      ImageUrl,

      /* Transient Data */
      AverageRating,
      AverageRatingCriticality,

      /* Administrative Data */
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      /* Associations */
      _Ratings : redirected to composition child ZC_RWS1623_Rating
}
