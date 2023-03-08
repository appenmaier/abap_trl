@EndUserText.label: 'Projection View: Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_054906_Booking
  as projection on ZI_054906_Booking
{
  key BookingUuid,
      TravelUuid,
      BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,

      /* Transient Data */
      Flight,
      Name,

      /* Administrative Data */
      CreatedBy,
      LastChangedBy,
      LocalLastChangedAt,

      /* Associations */
      _Travel : redirected to parent ZC_054906_Travel,
      _Carrier
}
