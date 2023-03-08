CLASS lhc_booking DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS determineCustomer FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Booking~determineCustomer.

ENDCLASS.

CLASS lhc_booking IMPLEMENTATION.
  METHOD determineCustomer.
    READ ENTITY IN LOCAL MODE ZI_054906_Booking
         BY \_Travel
         ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT DATA(travels)

         ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT DATA(bookings)

         " TODO: variable is assigned but never used (ABAP cleaner)
         REPORTED DATA(reported2).

    MODIFY ENTITY IN LOCAL MODE ZI_054906_Booking
           UPDATE FIELDS ( customerid )
           WITH VALUE #( FOR booking IN bookings ( %tky = booking-%tky customerid = travels[ 1 ]-customerid ) ).
  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZI_054906_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Travel RESULT result.
    METHODS do_something FOR MODIFY
      IMPORTING keys FOR ACTION travel~do_something.
    METHODS agency FOR VALIDATE ON SAVE
      IMPORTING keys FOR travel~agency.
    METHODS determinetravelid FOR DETERMINE ON MODIFY
      IMPORTING keys FOR travel~determinetravelid.
*    METHODS get_instance_features FOR INSTANCE FEATURES
*      IMPORTING keys REQUEST requested_features FOR travel RESULT result.

ENDCLASS.

CLASS lhc_ZI_054906_Travel IMPLEMENTATION.
  METHOD get_instance_authorizations.
    IF requested_authorizations-%update <> 'X' AND requested_authorizations-%action-do_something <> 'X'.
      RETURN.
    ENDIF.

    READ ENTITY IN LOCAL MODE ZI_054906_Travel
         FIELDS ( AgencyID )
         WITH CORRESPONDING #( keys )
         RESULT DATA(travels).

    LOOP AT travels REFERENCE INTO DATA(travel).

      AUTHORITY-CHECK OBJECT 'S_AGENCY'
                      ID 'AGENCYNUM' FIELD travel->AgencyId
                      ID 'ACTVT' FIELD '02'.
      IF sy-subrc <> 0.
        APPEND VALUE #( %tky                 = travel->%tky
                        %update              = if_abap_behv=>auth-unauthorized
                        %action-do_something = if_abap_behv=>auth-unauthorized ) TO result.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.


  METHOD do_something.
    READ ENTITY IN LOCAL MODE ZI_054906_Travel
         ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT DATA(travels)

         BY \_Bookings
         ALL FIELDS WITH CORRESPONDING #( keys )
         " TODO: variable is assigned but never used (ABAP cleaner)
         RESULT DATA(bookings)

         FAILED failed.

*   read ENTITIES OF zi_054906_travel IN LOCAL MODE
*     ENTITY ZI_054906_Travel
*     all fields
*     with CORRESPONDING #( keys )
*     result data(travels).

    LOOP AT travels REFERENCE INTO DATA(travel).

      travel->AgencyId = '989'.

      MODIFY ENTITY IN LOCAL MODE ZI_054906_Travel
             UPDATE FIELDS ( AgencyId )
             WITH VALUE #( ( %tky = travel->%tky AgencyId = travel->AgencyId ) )
             FAILED failed.

      DATA(message) = NEW zcm_054906_connection( severity = if_abap_behv_message=>severity-success ).

      APPEND message TO reported-%other.

    ENDLOOP.
  ENDMETHOD.


  METHOD agency.
    READ ENTITY IN LOCAL MODE ZI_054906_Travel
         FIELDS ( agencyid )
         WITH CORRESPONDING #( keys )
         RESULT DATA(travels).

    DATA message TYPE REF TO zcm_054906_connection.

    LOOP AT travels INTO DATA(travel).
      CLEAR message.

      IF travel-AgencyId IS INITIAL.
        message = NEW zcm_054906_connection( severity = if_abap_behv_message=>severity-error ).
      ELSE.
        SELECT SINGLE FROM /dmo/agency FIELDS @abap_true WHERE agency_id = @travel-AgencyId INTO @DATA(exists).
        IF exists <> abap_true.
          message = NEW zcm_054906_connection( severity = if_abap_behv_message=>severity-error ).
        ENDIF.
      ENDIF.

      IF message IS BOUND.
        APPEND CORRESPONDING #( travel ) TO failed-travel.
        APPEND VALUE #( %tky     = travel-%tky
                        %element = VALUE #( agencyid = if_abap_behv=>mk-on )
                        %msg     = message ) TO reported-travel.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD determineTravelId.
    READ ENTITY IN LOCAL MODE ZI_054906_Travel
         FIELDS ( agencyid )
         WITH CORRESPONDING #( keys )
         RESULT DATA(travels).

    SELECT FROM z054906_travel FIELDS MAX( travel_id ) INTO @DATA(max_travel_id).

    MODIFY ENTITY IN LOCAL MODE ZI_054906_Travel
           UPDATE FIELDS ( travelid )
           WITH VALUE #( FOR travel IN travels ( %tky = travel-%tky travelid = max_travel_id + 1 ) ).
  ENDMETHOD.


*  METHOD get_instance_features.
*    READ ENTITY IN LOCAL MODE ZI_054906_Travel
*         ALL FIELDS
*         WITH CORRESPONDING #( keys )
*         RESULT DATA(travels).
*
**    LOOP AT travels ASSIGNING FIELD-SYMBOL(<travel>).
**      IF <travel>-AgencyId < 1000.
**        APPEND VALUE #(
**          %tky = <travel>-%tky
**          %features-%field-Customerid = if_abap_behv=>fc-f-read_only ) TO result.
**      ENDIF.
**    ENDLOOP.
*
*    result = VALUE #( FOR travel IN travels
*                      ( %tky                        = travel-%tky
*                        %features-%field-Customerid = COND #(
*                          WHEN travel-agencyid < 1000
*                          THEN if_abap_behv=>fc-f-read_only
*                          ELSE if_abap_behv=>fc-f-mandatory ) ) ).
*  ENDMETHOD.

ENDCLASS.
