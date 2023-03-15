@EndUserText.label: 'Movie'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_RDVT2_Movie
  as select from z054906_movie
  composition [0..*] of ZI_RDVT2_Rating as _Ratings
{
  key movie_uuid      as MovieUuid,
      title           as Title,
      genre           as Genre,
      publishing_year as PublishingYear,
      @Semantics.imageUrl: true
      url             as Url,

      /* Associations */
      _Ratings
}
