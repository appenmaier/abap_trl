@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View: Booking'
define view entity Z054906_2_I_Booking
  as select from z054906_2_book
  association        to parent Z054906_2_I_Travel as _Travel     on $projection.TravelUuid = _Travel.TravelUuid
  association [1..1] to Z054906_2_I_StatusText    as _StatusText on $projection.Status = _StatusText.Status
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
      @ObjectModel.text.element: ['StatusText']
      status        as Status,

      /* Transient Data */
      case status when 'N' then 0
                  when 'B' then 3
                  when 'X' then 1
                  else 0
      end           as StatusCriticality,
      _StatusText.StatusText,

      /* Associations */
      _Travel
}
