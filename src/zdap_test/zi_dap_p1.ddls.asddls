@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Parent 1'
define root view entity ZI_DAP_P1
  as select from zdap_p1
  composition [0..*] of ZI_DAP_C as _C
{
  key uuid        as Uuid,
      @EndUserText.label: 'Description P1'
      description as Description,

      _C
}
