CLASS zcl_054906_1_travel_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_054906_1_TRAVEL_GENERATOR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "Datenobjekte deklarieren
    DATA travel TYPE z054906_1_travel.
    DATA travels TYPE TABLE OF z054906_1_travel.

    DATA booking TYPE z054906_1_book.
    DATA bookings TYPE TABLE OF z054906_1_book.

    "Alle Daten der Datenbanktabellen löschen
    DELETE FROM z054906_1_travel.
    out->write( |deleteted travels: {  sy-dbcnt }| ).
    DELETE FROM z054906_1_book.
    out->write( |deleteted bookings: {  sy-dbcnt }| ).

    "Interne Tabellen befüllen
    "Struktur befüllen (1)
    travel-client = sy-mandt.
    travel-travel_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    travel-travel_id = '00000001'.
    travel-customer_id = '000001'.
    travel-begin_date = '20230712'.
    travel-end_date = '20230730'.
    travel-description = 'New York 2023'.
    travel-total_price = 500.
    travel-currency_code = 'EUR'.
    APPEND travel TO travels.

    "Unterstruktur befüllen (1-1)
    booking-client = sy-mandt.
    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    booking-travel_uuid = travel-travel_uuid.
    booking-booking_id = '0001'.
    booking-booking_date = '20230518'.
    booking-carrier_id = 'LH'.
    booking-connection_id = '0400'.
    booking-flight_date = '20230712'.
    booking-flight_price = '666.00'.
    booking-currency_code = 'EUR'.
    booking-status = 'B'.
    APPEND booking TO bookings.

    "Unterstruktur befüllen (1-2)
    booking-client = sy-mandt.
    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    booking-client = sy-mandt.
    booking-travel_uuid = travel-travel_uuid.
    booking-booking_id = '0002'.
    booking-booking_date = '20230518'.
    booking-carrier_id = 'LH'.
    booking-connection_id = '0401'.
    booking-flight_date = '20230730'.
    booking-flight_price = '749.00'.
    booking-currency_code = 'USD'.
    booking-status = 'N'.
    APPEND booking TO bookings.

    "Struktur befüllen (2)
    travel-client = sy-mandt.
    travel-travel_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    travel-travel_id = '00000002'.
    travel-customer_id = '000001'.
    travel-begin_date = '20181008'.
    travel-end_date = '20181015'.
    travel-description = 'Hamburg 2018'.
    APPEND travel TO travels.

    "Unterstruktur befüllen (2-1)
    booking-client = sy-mandt.
    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    booking-travel_uuid = travel-travel_uuid.
    booking-booking_id = '0003'.
    booking-booking_date = '20180107'.
    booking-carrier_id = 'LH'.
    booking-connection_id = '0238'.
    booking-flight_date = '20181008'.
    booking-flight_price = '379.00'.
    booking-currency_code = 'EUR'.
    booking-status = 'B'.
    APPEND booking TO bookings.

    "Struktur befüllen (3)
    travel-client = sy-mandt.
    travel-travel_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    travel-travel_id = '00000003'.
    travel-customer_id = '000002'.
    travel-begin_date = '20190301'.
    travel-end_date = '20190307'.
    travel-description = 'Berlin 2019'.
    APPEND travel TO travels.

    "Unterstruktur befüllen (3-1)
    booking-client = sy-mandt.
    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    booking-travel_uuid = travel-travel_uuid.
    booking-booking_id = '0004'.
    booking-booking_date = '20181118'.
    booking-carrier_id = 'AZ'.
    booking-connection_id = '7321'.
    booking-flight_date = '20190301'.
    booking-flight_price = '788.00'.
    booking-currency_code = 'EUR'.
    booking-status = 'B'.
    APPEND booking TO bookings.

    "Unterstruktur befüllen (3-2)
    booking-client = sy-mandt.
    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    booking-travel_uuid = travel-travel_uuid.
    booking-booking_id = '0005'.
    booking-booking_date = '20181118'.
    booking-carrier_id = 'AZ'.
    booking-connection_id = '3743'.
    booking-flight_date = '20190102'.
    booking-flight_price = '456.00'.
    booking-currency_code = 'EUR'.
    booking-status = 'X'.
    APPEND booking TO bookings.

    "Unterstruktur befüllen (3-3)
    booking-client = sy-mandt.
    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    booking-travel_uuid = travel-travel_uuid.
    booking-booking_id = '0006'.
    booking-booking_date = '20190102'.
    booking-carrier_id = 'AZ'.
    booking-connection_id = '3743'.
    booking-flight_date = '20190103'.
    booking-flight_price = '650.00'.
    booking-currency_code = 'EUR'.
    booking-status = 'X'.
    APPEND booking TO bookings.

    "Interne Tabellen in die Datenbanktabellen einfügen
    INSERT z054906_1_travel FROM TABLE @travels.
    out->write( |inserted travels: {  sy-dbcnt }| ).
    INSERT z054906_1_book FROM TABLE @bookings.
    out->write( |inserted bookings: {  sy-dbcnt }| ).

  ENDMETHOD.
ENDCLASS.
