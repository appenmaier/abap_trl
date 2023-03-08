@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel'
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_DAP_Travel
  provider contract transactional_query
  as projection on ZI_DAP_Travel
{
  key TravelUuid,
      TravelId,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_DAP_CustomerVH', element: 'CustomerId' } }]
      CustomerId,
      BeginDate,
      EndDate,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Description,
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH', element: 'Currency' } }]
      CurrencyCode,
      Url,

      /* Transient Data */
      BeginDateCriticality,
      CustomerName,

      /* Associations */
      _Bookings : redirected to composition child ZC_DAP_Booking
}
