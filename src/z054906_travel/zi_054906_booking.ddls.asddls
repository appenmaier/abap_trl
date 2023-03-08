@EndUserText.label: 'Transactional Interface-View: Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_054906_Booking
  as select from z054906_booking
  association        to parent ZI_054906_Travel as _Travel       on $projection.TravelUuid = _Travel.TravelUuid
  //  association        to parent ZI_054906_Customer as _Customer on $projection.CustomerId = _Customer.CustomerId
  association [1..1] to ZI_054906_CarrierText   as _Carrier      on $projection.CarrierId = _Carrier.CarrierId
  association [1..1] to I_CurrencyText          as _CurrencyText on $projection.CurrencyCode = _CurrencyText.Currency
{
  key booking_uuid                                    as BookingUuid,
      travel_uuid                                     as TravelUuid,
      booking_id                                      as BookingId,
      booking_date                                    as BookingDate,
      customer_id                                     as CustomerId,
      @ObjectModel.text.element: ['Name']
      @Consumption.valueHelpDefinition:
      [{ entity:
        {
          name: 'ZI_054906_CarrierText',
          element: 'CarrierId'
        }
      }]
      carrier_id                                      as CarrierId,
      connection_id                                   as ConnectionId,
      flight_date                                     as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
//      @Aggregation.default: #SUM
      flight_price                                    as FlightPrice,
      @Consumption.valueHelpDefinition:
      [{
        entity:
        {
          name: 'I_CurrencyStdVH',
          element: 'Currency'
        }
      }]
      @ObjectModel.text.element: ['CurrencyName']
      currency_code                                   as CurrencyCode,

      /* Transient Data */
      concat_with_space(carrier_id, connection_id, 1) as Flight,
      _Carrier.Name                                   as Name,
      _CurrencyText.CurrencyShortName                 as CurrencyName,

      /* Administrative Data */
      @Semantics.user.createdBy: true
      created_by                                      as CreatedBy,
      @Semantics.user.lastChangedBy: true
      last_changed_by                                 as LastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at                           as LocalLastChangedAt,

      /* Associations */
      _Travel,
      _Carrier
}
