@EndUserText.label: 'Projection View: Travel'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity Z054906_1_C_Travel
  provider contract transactional_query
  as projection on Z054906_1_I_Travel
{
  key TravelUuid,
      TravelId,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'Z054906_1_I_CustomerVH', element: 'CustomerId' } }]
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
      _Bookings : redirected to composition child Z054906_1_C_Booking
}
