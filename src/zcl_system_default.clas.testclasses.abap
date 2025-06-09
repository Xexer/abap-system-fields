CLASS ltc_system DEFINITION FINAL
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    METHODS latin_letters FOR TESTING RAISING cx_static_check.
    METHODS system_id     FOR TESTING RAISING cx_static_check.
    METHODS client        FOR TESTING RAISING cx_static_check.
    METHODS language_iso  FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltc_system IMPLEMENTATION.
  METHOD latin_letters.
    DATA(result) = zcl_syst=>create( )->letter_upper( ).

    cl_abap_unit_assert=>assert_equals( exp = sy-abcde
                                        act = result ).
  ENDMETHOD.


  METHOD system_id.
    DATA(result) = zcl_syst=>create( )->system_information( )-system_id.

    cl_abap_unit_assert=>assert_equals( exp = sy-sysid
                                        act = result ).
  ENDMETHOD.


  METHOD client.
    DATA(result) = zcl_syst=>create( )->system_information( )-client.

    cl_abap_unit_assert=>assert_equals( exp = sy-mandt
                                        act = result ).
  ENDMETHOD.


  METHOD language_iso.
    SELECT SINGLE FROM I_Language
      FIELDS LanguageISOCode
      WHERE Language = @sy-langu
      INTO @DATA(syst_iso).

    DATA(result) = zcl_syst=>create( )->language_iso( ).

    cl_abap_unit_assert=>assert_equals( exp = syst_iso
                                        act = result ).
  ENDMETHOD.
ENDCLASS.
