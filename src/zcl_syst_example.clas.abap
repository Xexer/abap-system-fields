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
ENDCLASS.
