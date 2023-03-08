@EndUserText.label: 'Carrier Text'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_054906_CarrierText
  as select from /dmo/carrier
{
  key carrier_id            as CarrierId,
      name                  as Name,
      currency_code         as CurrencyCode,
      local_created_by      as LocalCreatedBy,
      local_created_at      as LocalCreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt
}
