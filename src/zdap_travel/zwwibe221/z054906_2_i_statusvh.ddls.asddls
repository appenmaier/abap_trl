@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help: Status'
define view entity Z054906_2_I_StatusVH
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: '/DMO/BOOK_STATUS' )
{
      @UI.hidden: true
  key domain_name,
      @UI.hidden: true
  key value_position,
      @UI.hidden: true
  key language,
      @EndUserText: { label: 'Status', quickInfo: 'Status'}
      @ObjectModel.text.element: ['StatusText']
      value_low as Status,
      @EndUserText: { label: 'Status Text', quickInfo: 'Status Text'}
      text      as StatusText
}
