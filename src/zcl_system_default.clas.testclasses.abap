CLASS ltc_system DEFINITION FINAL
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    METHODS latin_letters         FOR TESTING RAISING cx_static_check.
    METHODS latin_letters_lower   FOR TESTING RAISING cx_static_check.
    METHODS system_id             FOR TESTING RAISING cx_static_check.
    METHODS client                FOR TESTING RAISING cx_static_check.
    METHODS calling_program       FOR TESTING RAISING cx_static_check.
    METHODS abap_release          FOR TESTING RAISING cx_static_check.
    METHODS language              FOR TESTING RAISING cx_static_check.
    METHODS language_iso          FOR TESTING RAISING cx_static_check.
    METHODS user_id               FOR TESTING RAISING cx_static_check.
    METHODS user_alias            FOR TESTING RAISING cx_static_check.
    METHODS system_date           FOR TESTING RAISING cx_static_check.
    METHODS system_time           FOR TESTING RAISING cx_static_check.
    METHODS timestamp_not_initial FOR TESTING RAISING cx_static_check.
    METHODS timestamp_long        FOR TESTING RAISING cx_static_check.
    METHODS utclong_not_initial   FOR TESTING RAISING cx_static_check.
    METHODS user_date             FOR TESTING RAISING cx_static_check.
    METHODS user_time             FOR TESTING RAISING cx_static_check.
    METHODS time_zone             FOR TESTING RAISING cx_static_check.
    METHODS index                 FOR TESTING RAISING cx_static_check.
    METHODS table_index           FOR TESTING RAISING cx_static_check.
    METHODS database_count        FOR TESTING RAISING cx_static_check.
    METHODS return_code           FOR TESTING RAISING cx_static_check.
    METHODS weekday_range         FOR TESTING RAISING cx_static_check.
    METHODS message_fields        FOR TESTING RAISING cx_static_check.
    METHODS message_bapiret2      FOR TESTING RAISING cx_static_check.
    METHODS message_bali_bound    FOR TESTING RAISING cx_static_check.
    METHODS date_functions_bound  FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltc_system IMPLEMENTATION.
  METHOD latin_letters.
    DATA(result) = zcl_syst=>create( )->letter_upper( ).

    cl_abap_unit_assert=>assert_equals( exp = sy-abcde
                                        act = result ).
  ENDMETHOD.


  METHOD latin_letters_lower.
    DATA(result) = zcl_syst=>create( )->letter_lower( ).

    cl_abap_unit_assert=>assert_equals( exp = to_lower( sy-abcde )
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


  METHOD calling_program.
    DATA(result) = zcl_syst=>create( )->system_information( )-calling_program.

    cl_abap_unit_assert=>assert_not_initial( act = result ).
  ENDMETHOD.


  METHOD abap_release.
    DATA(result) = zcl_syst=>create( )->system_information( )-abap_release.

    cl_abap_unit_assert=>assert_not_initial( act = result ).
  ENDMETHOD.


  METHOD language.
    DATA(result) = zcl_syst=>create( )->language( ).

    cl_abap_unit_assert=>assert_equals( exp = sy-langu
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


  METHOD user_id.
    DATA(result) = zcl_syst=>create( )->user_id( ).

    cl_abap_unit_assert=>assert_not_initial( act = result ).
  ENDMETHOD.


  METHOD user_alias.
    DATA(result) = zcl_syst=>create( )->user_alias( ).

    cl_abap_unit_assert=>assert_equals( exp = cl_abap_context_info=>get_user_alias( )
                                        act = result ).
  ENDMETHOD.


  METHOD system_date.
    DATA(result) = zcl_syst=>create( )->system_date( ).

    cl_abap_unit_assert=>assert_equals( exp = cl_abap_context_info=>get_system_date( )
                                        act = result ).
  ENDMETHOD.


  METHOD system_time.
    DATA(result) = zcl_syst=>create( )->system_time( ).

    cl_abap_unit_assert=>assert_not_initial( act = result ).
  ENDMETHOD.


  METHOD timestamp_not_initial.
    DATA(result) = zcl_syst=>create( )->timestamp( ).

    cl_abap_unit_assert=>assert_not_initial( act = result ).
  ENDMETHOD.


  METHOD timestamp_long.
    DATA(result) = zcl_syst=>create( )->timestamp_long( ).

    cl_abap_unit_assert=>assert_not_initial( act = result ).
  ENDMETHOD.


  METHOD utclong_not_initial.
    DATA(result) = zcl_syst=>create( )->utclong( ).

    cl_abap_unit_assert=>assert_not_initial( act = result ).
  ENDMETHOD.


  METHOD user_date.
    DATA(result) = zcl_syst=>create( )->user_date( ).

    cl_abap_unit_assert=>assert_not_initial( act = result ).
  ENDMETHOD.


  METHOD user_time.
    DATA(result) = zcl_syst=>create( )->user_time( ).

    cl_abap_unit_assert=>assert_not_initial( act = result ).
  ENDMETHOD.


  METHOD time_zone.
    DATA(result) = zcl_syst=>create( )->time_zone( ).

    cl_abap_unit_assert=>assert_not_initial( act = result ).
  ENDMETHOD.


  METHOD index.
    DATA(result) = zcl_syst=>create( )->index( ).

    cl_abap_unit_assert=>assert_equals( exp = sy-index
                                        act = result ).
  ENDMETHOD.


  METHOD table_index.
    DATA(result) = zcl_syst=>create( )->table_index( ).

    cl_abap_unit_assert=>assert_equals( exp = sy-tabix
                                        act = result ).
  ENDMETHOD.


  METHOD database_count.
    DATA(result) = zcl_syst=>create( )->database_count( ).

    cl_abap_unit_assert=>assert_equals( exp = sy-dbcnt
                                        act = result ).
  ENDMETHOD.


  METHOD return_code.
    DATA(result) = zcl_syst=>create( )->return_code( ).

    cl_abap_unit_assert=>assert_equals( exp = sy-subrc
                                        act = result ).
  ENDMETHOD.


  METHOD weekday_range.
    DATA(result) = zcl_syst=>create( )->weekday( ).

    cl_abap_unit_assert=>assert_true( act = xsdbool(     result >= zif_syst=>weekdays-sunday
                                                     AND result <= zif_syst=>weekdays-saturday ) ).
  ENDMETHOD.


  METHOD message_fields.
    DATA(result) = zcl_syst=>create( )->message( ).

    cl_abap_unit_assert=>assert_equals( exp = sy-msgid
                                        act = result-msgid ).
    cl_abap_unit_assert=>assert_equals( exp = sy-msgno
                                        act = result-msgno ).
    cl_abap_unit_assert=>assert_equals( exp = sy-msgty
                                        act = result-msgty ).
  ENDMETHOD.


  METHOD message_bapiret2.
    DATA(expected_id)   = sy-msgid.
    DATA(expected_no)   = sy-msgno.
    DATA(expected_type) = sy-msgty.

    DATA(result) = zcl_syst=>create( )->message_bapiret2( ).

    cl_abap_unit_assert=>assert_equals( exp = expected_id
                                        act = result-id ).
    cl_abap_unit_assert=>assert_equals( exp = expected_no
                                        act = result-number ).
    cl_abap_unit_assert=>assert_equals( exp = expected_type
                                        act = result-type ).
  ENDMETHOD.


  METHOD message_bali_bound.
    DATA(result) = zcl_syst=>create( )->message_bali( ).

    cl_abap_unit_assert=>assert_bound( act = result ).
  ENDMETHOD.


  METHOD date_functions_bound.
    DATA(result) = zcl_syst=>create( )->date_functions( ).

    cl_abap_unit_assert=>assert_bound( act = result ).
  ENDMETHOD.
ENDCLASS.
