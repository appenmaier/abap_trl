@EndUserText.label: 'Text: Status'
@AccessControl.authorizationCheck: #NOT_REQUIRED
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view entity Z054906_2_I_StatusText
  as select from Z054906_2_I_StatusVH
{
  key Status,
      StatusText
}
where
  language = $session.system_language
