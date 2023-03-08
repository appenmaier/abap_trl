@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel'
define root view entity ZI_DAP_Travel
  as select from zdap_travel
  association [1..1] to ZI_DAP_CustomerText as _CustomerText on $projection.CustomerId = _CustomerText.CustomerId
  composition [0..*] of ZI_DAP_Booking      as _Bookings
{
  key travel_uuid        as TravelUuid,
      travel_id          as TravelId,
      @ObjectModel.text.element: ['CustomerName']
      customer_id        as CustomerId,
      begin_date         as BeginDate,
      end_date           as EndDate,
      description        as Description,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price        as TotalPrice,
      currency_code      as CurrencyCode,

      /* Transient Data */
      case when dats_days_between($session.system_date, begin_date) >= 14 then 3
           when dats_days_between($session.system_date, begin_date) >= 7 then 2
           when dats_days_between($session.system_date, begin_date) >= 0 then 1
           else 0
      end                as BeginDateCriticality,
      _CustomerText.Name as CustomerName,

      /* Associations */
      _Bookings
}
