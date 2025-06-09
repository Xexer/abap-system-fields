CLASS zcl_syst_example DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS has_authority
      RETURNING VALUE(result) TYPE abap_boolean.

    METHODS is_technical_user
      RETURNING VALUE(result) TYPE abap_boolean.
ENDCLASS.


CLASS zcl_syst_example IMPLEMENTATION.
  METHOD has_authority.
    AUTHORITY-CHECK OBJECT 'S_APPL_LOG'
                    ID 'ACTVT' FIELD '02'.

    RETURN xsdbool( zcl_syst=>create( )->return_code( ) = 0 ).
  ENDMETHOD.


  METHOD is_technical_user.
    IF zcl_syst=>create( )->user_id( ) = 'TECHUSER'.
      RETURN abap_true.
    ELSE.
      RETURN abap_false.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
