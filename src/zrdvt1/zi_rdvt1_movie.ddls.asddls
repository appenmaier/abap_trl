@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'
define root view entity ZI_RDVT1_Movie
  as select from zdap_movie
  composition [0..*] of ZI_RDVT1_Rating as _Ratings
{
  key movie_uuid      as MovieUuid,
      title           as Title,
      genre           as Genre,
      publishing_year as PublishingYear,
      @Semantics.imageUrl: true
      url             as Url,
      _Ratings
}
