@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help: Status'
define view entity ZI_DAP_StatusVH
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: '/DMO/BOOK_STATUS' )
{
      @UI.hidden: true
  key domain_name    as DomainName,
      @UI.hidden: true
  key value_position as ValuePosition,
      @UI.hidden: true
  key language       as Language,
      @ObjectModel.text.element: ['Text']
      @EndUserText: { label: 'Status', quickInfo: 'Status' }
      value_low      as ValueLow,
      @EndUserText: { label: 'Status Text', quickInfo: 'Status Text' }
      text           as Text
}
