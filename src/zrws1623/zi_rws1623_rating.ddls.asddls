@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'
define view entity ZI_RWS1623_Rating
  as select from zrws1623_rating
  association to parent ZI_RWS1623_Movie as _Movie on $projection.MovieUuid = _Movie.MovieUuid
{
      @EndUserText.label: 'Rating UUID'
      @EndUserText.quickInfo: 'Rating UUID'
  key rating_uuid     as RatingUuid,
      @EndUserText.label: 'Movie UUID'
      @EndUserText.quickInfo: 'Movie UUID'
      movie_uuid      as MovieUuid,
      user_name       as UserName,
      rating          as Rating,

      /* Administrative Data */
      @EndUserText.label: 'Created By'
      @EndUserText.quickInfo: 'Created By'
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @EndUserText.label: 'Created At'
      @EndUserText.quickInfo: 'Created At'
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @EndUserText.label: 'Last Changed By'
      @EndUserText.quickInfo: 'Last Changed By'
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @EndUserText.label: 'Last Changed At'
      @EndUserText.quickInfo: 'Last Changed At'
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,

      /* Associations */
      _Movie
}
