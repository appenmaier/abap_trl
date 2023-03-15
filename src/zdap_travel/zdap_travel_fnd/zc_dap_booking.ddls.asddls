@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
@Metadata.allowExtensions: true
define view entity ZC_DAP_Booking
  as projection on ZI_DAP_Booking
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
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_DAP_StatusVH', element: 'ValueLow' } }]
      Status,

      /* Transient Data */
      StatusCriticality,

      /* Associations */
      _Travel : redirected to parent ZC_DAP_Travel
}
