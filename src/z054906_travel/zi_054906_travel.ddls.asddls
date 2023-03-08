@EndUserText.label: 'Transactional Interface-View: Travel'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_054906_Travel
  as select from z054906_travel
  composition [0..*] of ZI_054906_Booking as _Bookings
{
  key travel_uuid     as TravelUuid,
      travel_id       as TravelId,
      agency_id       as AgencyId,
      customer_id     as CustomerId,
      begin_date      as BeginDate,
      end_date        as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee     as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price     as TotalPrice,
      currency_code   as CurrencyCode,
      description     as Description,

      /* Transient Data */
      case when booking_fee > 75 then 3
           when booking_fee > 50 then 2
           else 1
      end             as BookingFeeCriticality,

      /* Administrative Data */
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,

      /* Associations */
      _Bookings
}
