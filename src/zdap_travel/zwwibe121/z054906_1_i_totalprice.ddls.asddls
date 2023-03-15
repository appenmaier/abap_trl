@EndUserText.label: 'Interface View: Total Price'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity Z054906_1_I_TotalPrice
  as select from z054906_1_book
{
  key travel_uuid       as TravelUuid,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(flight_price) as TotalFlightPrice,
      currency_code     as CurrencyCode
}
group by
  currency_code,
  travel_uuid
