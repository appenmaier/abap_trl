@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View: Movie'
define root view entity ZI_054906_Movie
  as select from zdap_movie
  composition [0..*] of ZI_054906_MovieRating as _Ratings
  association to ZC_054906_AverageRating      as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUuid
{
  key movie_uuid      as MovieUuid,
      title           as Title,
      genre           as Genre,
      publishing_year as PublishingYear,
      @Semantics.imageUrl: true      
      url             as Url,

      /* Transient Data */
      _AverageRating.AverageRating,

      /* Association */
      _Ratings
}
