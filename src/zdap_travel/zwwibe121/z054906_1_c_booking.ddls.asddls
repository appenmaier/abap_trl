@EndUserText.label: 'Projection View: Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity Z054906_1_C_Booking
  as projection on Z054906_1_I_Booking
{
  key BookingUuid,
      TravelUuid,
      BookingId,
      BookingDate,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH', element: 'Currency' } }]
      CurrencyCode,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'Z054906_1_I_StatusVH', element: 'Status' } }]
      Status,

      /* Transient Data */
      StatusCriticality,

      /* Associations */
      _Travel : redirected to parent Z054906_1_C_Travel
}
