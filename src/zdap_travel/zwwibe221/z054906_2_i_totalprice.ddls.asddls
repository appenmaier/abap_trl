@EndUserText.label: 'Interface View: Total Price'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity Z054906_2_I_TotalPrice
  as select from z054906_2_book
{
  key travel_uuid              as TravelUuid,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(
        currency_conversion(
          amount => flight_price,
          source_currency => currency_code,
          target_currency => cast('EUR' as abap.cuky),
          exchange_rate_date => booking_date,
          error_handling => 'SET_TO_NULL')
      )                        as TotalPrice,
      cast('EUR' as abap.cuky) as CurrencyCode
}
where
  status <> 'X'
group by
  currency_code,
  travel_uuid
