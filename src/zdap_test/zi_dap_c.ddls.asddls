@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Child'
define view entity ZI_DAP_C
  as select from zdap_c
  association        to parent ZI_DAP_P1 as _P1 on $projection.P1 = _P1.Uuid
  association [0..1] to ZI_DAP_P2        as _P2 on $projection.P2 = _P2.Uuid
{
  key uuid        as Uuid,
      p1          as P1,
      p2          as P2,
      @EndUserText.label: 'Description Child'
      description as Description,

      _P1,
      _P2
}
