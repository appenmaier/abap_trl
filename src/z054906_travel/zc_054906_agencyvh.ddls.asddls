@EndUserText.label: 'Value Help: Agency'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZC_054906_AgencyVH
  as select from /dmo/agency
{
  key agency_id    as AgencyId,
      name         as Name,
      street       as Street,
      postal_code  as PostalCode,
      city         as City,
      country_code as CountryCode
}
