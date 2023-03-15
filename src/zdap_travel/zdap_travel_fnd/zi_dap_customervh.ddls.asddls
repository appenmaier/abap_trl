@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help: Customer'
define view entity ZI_DAP_CustomerVH
  as select from /dmo/customer
{
      @ObjectModel.text.element: ['Name']
  key customer_id                                 as CustomerId,
      first_name                                  as FirstName,
      last_name                                   as LastName,
      concat_with_space(first_name, last_name, 1) as Name,
      title                                       as Title,
      street                                      as Street,
      postal_code                                 as PostalCode,
      city                                        as City,
      country_code                                as CountryCode,
      phone_number                                as PhoneNumber,
      email_address                               as EmailAddress
}
