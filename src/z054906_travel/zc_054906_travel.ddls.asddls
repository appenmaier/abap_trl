@EndUserText.label: 'Projection View: Travel'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZC_054906_Travel
  provider contract transactional_query
  as projection on ZI_054906_Travel
{
  key TravelUuid,
      TravelId,
      @Consumption.valueHelpDefinition:
      [{ entity:
        {
          name: 'ZC_054906_AgencyVH',
          element: 'AgencyId'
        }
      }]
      AgencyId,
      @Consumption.valueHelpDefinition:
      [{ entity:
        {
      //          name: 'ZC_054906_CustomerVH',
      //          element: 'CustomerId'
          name: 'ZC_StatusVH',
          element: 'value_low'
        }
      }]
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Description,

      BookingFeeCriticality,

      /* Administrative Data */
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      /* Associations */
      _Bookings : redirected to composition child ZC_054906_Booking
}
