@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Movie'
define root view entity ZI_RWS1623_Movie
  as select from zrws1623_movie
  composition [0..*] of ZI_RWS1623_Rating        as _Ratings
  association [0..1] to ZI_RWS1623_AverageRating as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUuid
{
      @EndUserText.label: 'Movie UUID'
      @EndUserText.quickInfo: 'Movie UUID'
  key movie_uuid                   as MovieUuid,
      title                        as Title,
      genre                        as Genre,
      publishing_year              as PublishingYear,
      @Semantics.imageUrl: true
      image_url                    as ImageUrl,

      /* Transient Data */
      _AverageRating.AverageRating as AverageRating,
      case when _AverageRating.AverageRating > 6.7 then 3
           when _AverageRating.AverageRating > 3.3  then 2
           when _AverageRating.AverageRating > 0 then 1
           else 0
      end                          as AverageRatingCriticality,

      /* Administrative Data */
      @EndUserText.label: 'Created By'
      @EndUserText.quickInfo: 'Created By'
      @Semantics.user.createdBy: true
      created_by                   as CreatedBy,
      @EndUserText.label: 'Created At'
      @EndUserText.quickInfo: 'Created At'
      @Semantics.systemDateTime.createdAt: true
      created_at                   as CreatedAt,
      @EndUserText.label: 'Last Changed By'
      @EndUserText.quickInfo: 'Last Changed By'
      @Semantics.user.lastChangedBy: true
      last_changed_by              as LastChangedBy,
      @EndUserText.label: 'Last Changed At'
      @EndUserText.quickInfo: 'Last Changed At'
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at              as LastChangedAt,

      /* Associations */
      _Ratings
}
