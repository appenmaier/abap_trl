@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Parent 2'
define root view entity ZI_DAP_P2
  as select from zdap_p2
  association [0..*] to ZI_DAP_C as _C on $projection.Uuid = _C.P2
{
  key uuid        as Uuid,
      @EndUserText.label: 'Description P2'
      description as Description,

      _C
}
