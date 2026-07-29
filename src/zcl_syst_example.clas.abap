CLASS zcl_syst_example DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor.

    METHODS has_authority
      RETURNING VALUE(result) TYPE abap_boolean.

    METHODS is_technical_user
      RETURNING VALUE(result) TYPE abap_boolean.

    METHODS is_time_valid
      RETURNING VALUE(result) TYPE abap_boolean.

    METHODS date_functions.

  PRIVATE SECTION.
    DATA sy TYPE REF TO zif_syst.
ENDCLASS.


CLASS zcl_syst_example IMPLEMENTATION.
  METHOD constructor.
    sy = zcl_syst=>create( ).
  ENDMETHOD.


  METHOD has_authority.
    AUTHORITY-CHECK OBJECT 'S_APPL_LOG'
                    ID 'ACTVT' FIELD '02'.

    RETURN xsdbool( sy->return_code( ) = 0 ).
  ENDMETHOD.


  METHOD is_technical_user.
    IF sy->user_id( ) = 'TECHUSER'.
      RETURN abap_true.
    ELSE.
      RETURN abap_false.
    ENDIF.
  ENDMETHOD.


  METHOD is_time_valid.
    RETURN xsdbool( sy->user_time( ) = '150000' ).
  ENDMETHOD.


  METHOD date_functions.
    DATA(today) = sy->date_functions( ).
    DATA(weekday) = today->get_weekday( ).

    DATA(weekday_new) = sy->date_functions( )->get_weekday( ).

    DATA(yesterday) = zcl_date_factory=>create_date( CONV #( sy->system_date( ) - 1 ) ).
    DATA(last_day_of_week) = yesterday->get_last_day_of_week( ).
  ENDMETHOD.
ENDCLASS.
