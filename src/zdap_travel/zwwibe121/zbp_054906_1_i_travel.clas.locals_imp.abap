CLASS lhc_z054906_1_i_booking DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Booking RESULT result.

    METHODS cancel_booking FOR MODIFY
      IMPORTING keys FOR ACTION Booking~cancel_booking.

ENDCLASS.

CLASS lhc_z054906_1_i_booking IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD cancel_booking.

    "Lesen der Daten
    READ ENTITY IN LOCAL MODE Z054906_1_I_Booking
      BY \_Travel
      FIELDS ( TotalPrice )
      WITH CORRESPONDING #( keys )
      RESULT DATA(travels)

      FIELDS ( FlightPrice BookingId Status )
      WITH CORRESPONDING #( keys )
      RESULT DATA(bookings).

    "Sequentielle Verarbeitung der Buchungsdaten
    "Bei Validierungen: Fehlerfälle abfangen und Fehlermeldungen erzeugen
    "Bei Ermittlungen: Daten ermitteln und Daten zurückschreiben
    "Bei Actions: sowohl als auch
    LOOP AT bookings INTO DATA(booking).

      "Fehlerfall abfangen und Fehlermeldung erzeugen
      IF booking-status = 'X'.
        DATA(message) = NEW zcm_054906_1_travel(
          severity = if_abap_behv_message=>severity-error
          textid   = zcm_054906_1_travel=>booking_already_cancelled
          booking_id = booking-BookingId ).

        APPEND message TO reported-%other.
        APPEND CORRESPONDING #( booking ) TO failed-booking.
        CONTINUE.
      ENDIF.

      "Daten ermitteln und Daten zurückschreiben
      booking-Status = 'X'.

      MODIFY ENTITY IN LOCAL MODE Z054906_1_I_Booking
        UPDATE FIELDS ( Status )
        WITH VALUE #( ( %tky = booking-%tky Status = booking-Status ) ).

      message = NEW zcm_054906_1_travel(
        severity = if_abap_behv_message=>severity-success
        textid   = zcm_054906_1_travel=>booking_cancelled_successfully
        booking_id = booking-BookingId ).

      APPEND message TO reported-%other.

      "Daten ermitteln und zurückschreiben
      DATA(travel) = travels[ 1 ].

      MODIFY ENTITY IN LOCAL MODE Z054906_1_I_Travel
        UPDATE FIELDS ( TotalPrice )
        WITH VALUE #( ( %tky = travel-%tky TotalPrice = travel-TotalPrice - booking-FlightPrice ) ).

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_Z054906_1_I_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Travel RESULT result.
    METHODS determinetravelid FOR DETERMINE ON SAVE
      IMPORTING keys FOR travel~determinetravelid.
    METHODS validateenddate FOR VALIDATE ON SAVE
      IMPORTING keys FOR travel~validateenddate.

ENDCLASS.

CLASS lhc_Z054906_1_I_Travel IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD determineTravelId.

    READ ENTITY IN LOCAL MODE Z054906_1_I_Travel
     FIELDS ( TravelId )
     WITH CORRESPONDING #( keys )
     RESULT DATA(travels).

    LOOP AT travels INTO DATA(travel).

      SELECT SINGLE FROM z054906_1_travel
        FIELDS MAX( travel_id ) AS max_travel_id
        INTO @DATA(max_travel_id).

      MODIFY ENTITY IN LOCAL MODE Z054906_1_I_Travel
        UPDATE FIELDS ( TravelId )
        WITH VALUE #( ( %tky = travel-%tky TravelId = max_travel_id + 1 ) ).

    ENDLOOP.

  ENDMETHOD.

  METHOD validateEndDate.

    "Lesen der Daten
    READ ENTITY IN LOCAL MODE Z054906_1_I_Travel
      FIELDS ( BeginDate EndDate )
      WITH CORRESPONDING #( keys )
      RESULT DATA(travels).

    "Sequentielle Verarbeitung der Daten
    LOOP AT travels INTO DATA(travel).

      "Fehlerfall abfangen und Fehlermedlung erzeugen
      IF travel-EndDate < travel-BeginDate.
        DATA(message) = NEW zcm_054906_1_travel(
          severity = if_abap_behv_message=>severity-error
          textid   = zcm_054906_1_travel=>invalid_end_date ).

        APPEND message TO reported-%other.
        APPEND CORRESPONDING #( travel ) TO failed-travel.
        CONTINUE.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
