@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View: Booking'
define view entity Z054906_1_I_Booking
  as select from z054906_1_book
  association to parent Z054906_1_I_Travel as _Travel on $projection.TravelUuid = _Travel.TravelUuid
{
  key booking_uuid  as BookingUuid,
      travel_uuid   as TravelUuid,
      booking_id    as BookingId,
      booking_date  as BookingDate,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price  as FlightPrice,
      currency_code as CurrencyCode,
      status        as Status,

      /* Transient Data */
      case status when 'B' then 3
                  when 'N' then 0
                  when 'X' then 1
                  else 0
      end           as StatusCriticality,

      /* Associations */
      _Travel
}
