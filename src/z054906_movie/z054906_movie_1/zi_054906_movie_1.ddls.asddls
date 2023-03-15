@EndUserText.label: 'Movie: Stage 1'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_054906_Movie_1
  as select from z054906_movie
  composition [0..*] of ZI_054906_Rating_1 as _Ratings
{
  key movie_uuid      as MovieUuid,
      title           as Title,
      genre           as Genre,
      publishing_year as PublishingYear,
      url             as Url,

      /* Associations */
      _Ratings
}
