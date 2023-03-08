@EndUserText.label: 'Status VH'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZC_StatusVH
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: '/DMO/STATUS' )
{
      @UI.hidden: true
  key domain_name,
      @UI.hidden: true
  key value_position,
      @Semantics.language: true
      @UI.hidden: true
  key language,
      value_low,
      @Semantics.text: true
      text
}
