@EndUserText.label: 'Projection View: Movie Rating'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_054906_MovieRating
  as projection on ZI_054906_MovieRating
{
  key MovieRatingUuid,
      MovieUuid,
      UserName,
      Rating,

      /* Transient Data */
      RatingCriticality,

      /* Associations */
      _Movie : redirected to parent ZC_054906_Movie
}
