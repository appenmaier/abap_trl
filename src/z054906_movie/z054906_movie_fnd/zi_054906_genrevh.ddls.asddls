@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help: Genre'
define view entity ZI_054906_GenreVH
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'Z054906_MOVIE_GENRE' )
{
      @UI.hidden: true
  key domain_name,
      @UI.hidden: true
  key value_position,
      @UI.hidden: true
  key language,
      @EndUserText: { label: 'Genre', quickInfo: 'Genre' }
      value_low as Genre,
      @EndUserText: { label: 'Genre Text', quickInfo: 'Genre Text' }
      text      as GenreText
}
