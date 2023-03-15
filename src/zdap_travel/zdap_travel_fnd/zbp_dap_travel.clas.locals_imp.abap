CLASS lhc_zi_dap_booking DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZI_DAP_Booking RESULT result.

    METHODS cancel_booking FOR MODIFY
      IMPORTING keys FOR ACTION ZI_DAP_Booking~cancel_booking.

ENDCLASS.

CLASS lhc_zi_dap_booking IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD cancel_booking.

    DATA bookings TYPE TABLE FOR READ RESULT zi_dap_booking.
    DATA booking LIKE LINE OF bookings.
    DATA message TYPE REF TO zcm_dap_travel.
    DATA updated_bookings TYPE TABLE FOR UPDATE zi_dap_booking.
    DATA updated_booking LIKE LINE OF updated_bookings.

    READ ENTITY IN LOCAL MODE ZI_DAP_Booking
      FIELDS ( BookingId Status )
      WITH CORRESPONDING #( keys )
      RESULT bookings.

    LOOP AT bookings INTO booking.

      IF booking-Status = 'X'.
        message = NEW zcm_dap_travel( severity = if_abap_behv_message=>severity-error
                                       booking_id = booking-BookingId
                                       textid = zcm_dap_travel=>already_cancelled ).
        APPEND message TO reported-%other.
        APPEND CORRESPONDING #( booking ) TO failed-zi_dap_booking.
        CONTINUE.
      ENDIF.

      updated_booking = VALUE #( %tky = booking-%tky Status = 'X' ).
      APPEND updated_booking TO updated_bookings.

      MODIFY ENTITY IN LOCAL MODE ZI_DAP_Booking
        UPDATE FIELDS ( status )
        WITH updated_bookings.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZI_DAP_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZI_DAP_Travel RESULT result.

ENDCLASS.

CLASS lhc_ZI_DAP_Travel IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.
