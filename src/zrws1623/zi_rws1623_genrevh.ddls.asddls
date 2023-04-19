@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Genre'
define view entity ZI_RWS1623_GenreVH
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE( p_domain_name: 'Z054906_MOVIE_GENRE' )
{
      @UI.hidden: true
  key domain_name,
      @UI.hidden: true
  key value_position,
      @EndUserText: { label: 'Genre', quickInfo: 'Genre' }
      value_low as Genre
}
