@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View: Travel'
define root view entity Z054906_2_I_Travel
  as select from z054906_2_travel
  composition [0..*] of Z054906_2_I_Booking      as _Bookings
  association [1..1] to Z054906_2_I_CustomerText as _CustomerText on $projection.CustomerId = _CustomerText.CustomerId
  association [1..1] to Z054906_2_I_TotalPrice   as _TotalPrice   on $projection.TravelUuid = _TotalPrice.TravelUuid
{
  key travel_uuid            as TravelUuid,
      travel_id              as TravelId,
      @ObjectModel.text.element: ['CustomerName']
      customer_id            as CustomerId,
      begin_date             as BeginDate,
      end_date               as EndDate,
      description            as Description,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price            as TotalPrice,
      currency_code          as CurrencyCode,
      @Semantics.imageUrl: true
      @EndUserText.label : 'Image URL'
      url                    as Url,

      /* Transient Data */
      @EndUserText:{ label: 'Begin Date Criticality', quickInfo: 'Begin Date Criticality' }
      case when dats_days_between($session.user_date, begin_date) >= 14 then 3
           when dats_days_between($session.user_date, begin_date) >= 7 then 2
           when dats_days_between($session.user_date, begin_date) >= 0 then 1
           else 0
      end                    as BeginDateCriticality,
      _CustomerText.Name     as CustomerName,
      _TotalPrice.TotalPrice as TotalPriceCalculated,

      /* Associations */
      _Bookings
}
