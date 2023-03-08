@EndUserText.label: 'Projection View: Movie'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZC_054906_Movie
  provider contract transactional_query
  as projection on ZI_054906_Movie
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

      /* Associations */
      _Ratings : redirected to composition child ZC_054906_MovieRating
}
