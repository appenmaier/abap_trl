@EndUserText.label: 'Parent 2'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZC_DAP_P2
  provider contract transactional_query
  as projection on ZI_DAP_P2
  association [0..*] to ZC_DAP_C as _C on $projection.Uuid = _C.P2
{
      @UI.facet:
      [
        { position: 10, type: #IDENTIFICATION_REFERENCE, label: 'Details' },
        { position: 20, type: #LINEITEM_REFERENCE, targetElement: '_C', label: 'Child' }
      ]
  key Uuid,
      @UI.lineItem: [{ position: 10 }]
      @UI.identification: [{ position: 10 }]
      Description,

      /* Associations */
      _C
}
