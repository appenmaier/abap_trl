@EndUserText.label: 'Child'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZC_DAP_C
  provider contract transactional_query
  as projection on ZI_DAP_C
  association [0..1] to ZC_DAP_P2 as _P2 on $projection.P2 = _P2.Uuid
{
      @UI.facet: [{ position: 10, type: #IDENTIFICATION_REFERENCE, label: 'Details' }]
  key Uuid,
      @UI.lineItem: [{ position: 10 }]
      @UI.identification: [{ position: 10 }]
      P1,
      @UI.lineItem: [{ position: 20 }]
      @UI.identification: [{ position: 20 }]
      P2,
      @UI.lineItem: [{ position: 30 }]
      @UI.identification: [{ position: 30 }]
      Description,

      /* Associations */
      _P1,
      _P2
}
