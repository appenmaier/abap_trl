@EndUserText.label: 'Movie: Stage 2'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_054906_Movie_2
  as select from z054906_movie
  composition [0..*] of ZI_054906_Rating_2             as _Ratings
  association [1..1] to ZI_054906_AverageRatingByMovie as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUuid
{
      @EndUserText: { label: 'Movie UUID', quickInfo: 'Movie UUID' }
  key movie_uuid                   as MovieUuid,
      title                        as Title,
      genre                        as Genre,
      publishing_year              as PublishingYear,
      @Semantics.imageUrl: true
      url                          as Url,

      /* Transient Data */
      _AverageRating.AverageRating as AverageRating,
      case when _AverageRating.AverageRating is null then 0
           when _AverageRating.AverageRating < 1.67 then 1
           when _AverageRating.AverageRating < 3.33 then 2
           else 3
      end                          as AverageRatingCriticality,

      /* Associations */
      _Ratings
}
