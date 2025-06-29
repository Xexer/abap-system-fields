CLASS ltd_system DEFINITION FOR TESTING.
  PUBLIC SECTION.
    INTERFACES zif_syst PARTIALLY IMPLEMENTED.
ENDCLASS.


CLASS ltd_system IMPLEMENTATION.
  METHOD zif_syst~user_id.
    RETURN 'TECHUSER'.
  ENDMETHOD.
ENDCLASS.


CLASS ltc_system DEFINITION FINAL
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_syst_example.

    METHODS authority_ok     FOR TESTING RAISING cx_static_check.
    METHODS authority_not_ok FOR TESTING RAISING cx_static_check.
    METHODS user_ok          FOR TESTING RAISING cx_static_check.
    METHODS user_not_ok      FOR TESTING RAISING cx_static_check.

    METHODS setup.
ENDCLASS.


CLASS ltc_system IMPLEMENTATION.
  METHOD setup.
    cut = NEW zcl_syst_example( ).
  ENDMETHOD.


  METHOD authority_ok.
    DATA(double) = CAST zif_syst( cl_abap_testdouble=>create( 'ZIF_SYST' ) ).
    cl_abap_testdouble=>configure_call( double )->ignore_all_parameters( )->returning( 0 ).
    double->return_code( ).
    zcl_syst_injector=>inject_syst( double ).

    DATA(result) = cut->has_authority( ).

    cl_abap_unit_assert=>assert_true( result ).
  ENDMETHOD.


  METHOD authority_not_ok.
    DATA(double) = CAST zif_syst( cl_abap_testdouble=>create( 'ZIF_SYST' ) ).
    cl_abap_testdouble=>configure_call( double )->ignore_all_parameters( )->returning( 8 ).
    double->return_code( ).
    zcl_syst_injector=>inject_syst( double ).

    DATA(result) = cut->has_authority( ).

    cl_abap_unit_assert=>assert_false( result ).
  ENDMETHOD.


  METHOD user_ok.
    zcl_syst_injector=>inject_syst( NEW ltd_system( ) ).

    DATA(result) = cut->is_technical_user( ).

    cl_abap_unit_assert=>assert_true( result ).
  ENDMETHOD.


  METHOD user_not_ok.
    DATA(result) = cut->is_technical_user( ).

    cl_abap_unit_assert=>assert_false( result ).
  ENDMETHOD.
ENDCLASS.
