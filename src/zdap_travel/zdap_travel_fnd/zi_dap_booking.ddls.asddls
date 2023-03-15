@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
define view entity ZI_DAP_Booking
  as select from zdap_booking
  association to parent ZI_DAP_Travel as _Travel on $projection.TravelUuid = _Travel.TravelUuid
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
      case status when 'N' then 0
                  when 'B' then 3
                  when 'X' then 1
                  else 5
      end           as StatusCriticality,

      /* Associations */
      _Travel
}
