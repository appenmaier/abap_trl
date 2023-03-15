CLASS lhc_z054906_2_i_booking DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Booking RESULT result.

    METHODS cancel_booking FOR MODIFY
      IMPORTING keys FOR ACTION Booking~cancel_booking.

ENDCLASS.

CLASS lhc_z054906_2_i_booking IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD cancel_booking.

    " Lesen der Daten
    READ ENTITY IN LOCAL MODE Z054906_2_I_Booking "SELECT FROM z054906_2_book
      BY \_Travel
      FIELDS ( TotalPrice )
      WITH CORRESPONDING #( keys )
      RESULT DATA(travels)

      FIELDS ( FlightPrice BookingId Status )     "  FIELDS booking_id, status
*      ALL FIELDS                                 "  FIELDS *
      WITH CORRESPONDING #( keys )                "  WHERE booking_uuid = keys-booking_uuid
      RESULT DATA(bookings).                      "  INTO TABLE @DATA(bookings).

    " Sequentielle Verarbeitung der Daten
    " Bei Validierungen: Fehlerfälle abfangen und Fehlermeldungen erzeugen
    " Bei Ermittlungen: Daten ermitteln und Daten zurückschreiben
    " Bei Actions: sowohl als auch
    LOOP AT bookings INTO DATA(booking).

      IF booking-Status = 'X'.
        DATA(message) = NEW zcm_054906_2_travel(
          severity = if_abap_behv_message=>severity-error
          textid   = zcm_054906_2_travel=>booking_already_cancelled
          booking_id = booking-BookingId ).

        APPEND message TO reported-%other.
        APPEND CORRESPONDING #( booking ) TO failed-booking.
        CONTINUE.
      ENDIF.

      booking-Status = 'X'.

      MODIFY ENTITY IN LOCAL MODE Z054906_2_I_Booking
        UPDATE FIELDS ( Status )
        WITH VALUE #( ( %tky = booking-%tky Status = booking-Status ) ).

      message = NEW zcm_054906_2_travel(
        severity = if_abap_behv_message=>severity-success
        textid   = zcm_054906_2_travel=>booking_cancelled_successfully
        booking_id = booking-BookingId ).

      APPEND message TO reported-%other.

      DATA(travel) = travels[ 1 ] .

      travel-TotalPrice -= booking-FlightPrice.

      MODIFY ENTITY IN LOCAL MODE Z054906_2_I_Travel
       UPDATE FIELDS ( TotalPrice )
       WITH VALUE #( ( %tky = travel-%tky TotalPrice = travel-TotalPrice ) ).

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_Z054906_2_I_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Travel RESULT result.
    METHODS validateenddate FOR VALIDATE ON SAVE
      IMPORTING keys FOR travel~validateenddate.
    METHODS determinetravelid FOR DETERMINE ON SAVE
      IMPORTING keys FOR travel~determinetravelid.

ENDCLASS.

CLASS lhc_Z054906_2_I_Travel IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD validateEndDate.

    "Lesen der Daten
    READ ENTITY IN LOCAL MODE Z054906_2_I_Travel
      FIELDS ( BeginDate EndDate )
      WITH CORRESPONDING #( keys )
      RESULT DATA(travels).

    "Sequentielle Verarbeitung der Daten
    LOOP AT travels INTO DATA(travel).
      IF travel-EndDate < travel-BeginDate.
        DATA(message) = NEW zcm_054906_2_travel(
                             severity = if_abap_behv_message=>severity-error
                             textid   = zcm_054906_2_travel=>invalid_end_date ).

        APPEND message TO reported-%other.
        APPEND CORRESPONDING #( travel ) TO failed-travel.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD determineTravelId.

    "Lesen der Daten
    READ ENTITY IN LOCAL MODE Z054906_2_I_Travel
      FIELDS ( TravelId )
      WITH CORRESPONDING #( keys )
      RESULT DATA(travels).

    "Sequentielle Verarbeitung der Daten
    LOOP AT travels INTO DATA(travel).

      SELECT SINGLE FROM z054906_2_travel
       FIELDS MAX( travel_id ) AS max_travel_id
       INTO @DATA(max_travel_id).

      travel-TravelId = max_travel_id + 1.

      MODIFY ENTITY IN LOCAL MODE Z054906_2_I_Travel
        UPDATE FIELDS ( TravelId )
        WITH VALUE #( ( %tky = travel-%tky TravelId = travel-TravelId ) ).

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
