CLASS ltc_zcl_date DEFINITION FINAL
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    METHODS new_year_day   FOR TESTING RAISING cx_static_check.
    METHODS leap_day       FOR TESTING RAISING cx_static_check.
    METHODS year_end       FOR TESTING RAISING cx_static_check.
    METHODS end_of_quarter FOR TESTING RAISING cx_static_check.
    METHODS week_monday    FOR TESTING RAISING cx_static_check.
    METHODS week_sunday    FOR TESTING RAISING cx_static_check.
    METHODS calendar_week  FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltc_zcl_date IMPLEMENTATION.
  METHOD new_year_day.
    " 2024-01-01: Monday, day 1 of year, Q1, first day of week and month
    DATA(cut) = zcl_date_factory=>create_date( '20240101' ).

    cl_abap_unit_assert=>assert_equals( exp = zif_date=>weekdays-monday
                                        act = cut->get_weekday( )
                                        msg = '2024-01-01 is a Monday' ).

    cl_abap_unit_assert=>assert_equals( exp = '001'
                                        act = cut->get_calendar_day_of_the_year( )
                                        msg = '2024-01-01 is day 1 of the year' ).

    cl_abap_unit_assert=>assert_equals( exp = '1'
                                        act = cut->get_quarter( )
                                        msg = '2024-01-01 is in Q1 2024' ).

    cl_abap_unit_assert=>assert_equals( exp = CONV zif_date=>date_format( '20240101' )
                                        act = cut->get_first_day_of_month( )
                                        msg = 'First day of Jan 2024 is 2024-01-01' ).

    cl_abap_unit_assert=>assert_equals( exp = CONV zif_date=>date_format( '20240131' )
                                        act = cut->get_last_day_of_month( )
                                        msg = 'Last day of Jan 2024 is 2024-01-31' ).

    cl_abap_unit_assert=>assert_equals( exp = CONV zif_date=>date_format( '20240101' )
                                        act = cut->get_first_day_of_week( )
                                        msg = 'Monday 2024-01-01 is the first day of its own week' ).

    cl_abap_unit_assert=>assert_equals( exp = CONV zif_date=>date_format( '20240107' )
                                        act = cut->get_last_day_of_week( )
                                        msg = 'Last day of the week starting 2024-01-01 is Sunday 2024-01-07' ).
  ENDMETHOD.


  METHOD leap_day.
    " 2024-02-29: Thursday, day 60 of year, last day of Feb in a leap year
    DATA(cut) = zcl_date_factory=>create_date( '20240229' ).

    cl_abap_unit_assert=>assert_equals( exp = zif_date=>weekdays-thursday
                                        act = cut->get_weekday( )
                                        msg = '2024-02-29 is a Thursday' ).

    cl_abap_unit_assert=>assert_equals( exp = '060'
                                        act = cut->get_calendar_day_of_the_year( )
                                        msg = '2024-02-29 is day 60 of the year' ).

    cl_abap_unit_assert=>assert_equals( exp = CONV zif_date=>date_format( '20240201' )
                                        act = cut->get_first_day_of_month( )
                                        msg = 'First day of Feb 2024 is 2024-02-01' ).

    cl_abap_unit_assert=>assert_equals( exp = CONV zif_date=>date_format( '20240229' )
                                        act = cut->get_last_day_of_month( )
                                        msg = 'Last day of Feb 2024 is 2024-02-29 (leap year)' ).
  ENDMETHOD.


  METHOD year_end.
    " 2024-12-31: Tuesday, day 366 of leap year, last day of Q4
    DATA(cut) = zcl_date_factory=>create_date( '20241231' ).

    cl_abap_unit_assert=>assert_equals( exp = zif_date=>weekdays-tuesday
                                        act = cut->get_weekday( )
                                        msg = '2024-12-31 is a Tuesday' ).

    cl_abap_unit_assert=>assert_equals( exp = '366'
                                        act = cut->get_calendar_day_of_the_year( )
                                        msg = '2024-12-31 is day 366 in leap year 2024' ).

    cl_abap_unit_assert=>assert_equals( exp = '4'
                                        act = cut->get_quarter( )
                                        msg = '2024-12-31 is in Q4 2024' ).

    cl_abap_unit_assert=>assert_equals( exp = CONV zif_date=>date_format( '20241201' )
                                        act = cut->get_first_day_of_month( )
                                        msg = 'First day of Dec 2024 is 2024-12-01' ).

    cl_abap_unit_assert=>assert_equals( exp = CONV zif_date=>date_format( '20241231' )
                                        act = cut->get_last_day_of_month( )
                                        msg = 'Last day of Dec 2024 is 2024-12-31' ).
  ENDMETHOD.


  METHOD end_of_quarter.
    " 2024-03-31: Sunday, last day of Q1, last day of its week
    DATA(cut) = zcl_date_factory=>create_date( '20240331' ).

    cl_abap_unit_assert=>assert_equals( exp = zif_date=>weekdays-sunday
                                        act = cut->get_weekday( )
                                        msg = '2024-03-31 is a Sunday' ).

    cl_abap_unit_assert=>assert_equals( exp = '1'
                                        act = cut->get_quarter( )
                                        msg = '2024-03-31 is in Q1 2024' ).

    cl_abap_unit_assert=>assert_equals( exp = CONV zif_date=>date_format( '20240331' )
                                        act = cut->get_last_day_of_month( )
                                        msg = 'Last day of Mar 2024 is 2024-03-31' ).

    cl_abap_unit_assert=>assert_equals( exp = CONV zif_date=>date_format( '20240331' )
                                        act = cut->get_last_day_of_week( )
                                        msg = 'Sunday 2024-03-31 is the last day of its own week' ).

    cl_abap_unit_assert=>assert_equals( exp = CONV zif_date=>date_format( '20240325' )
                                        act = cut->get_first_day_of_week( )
                                        msg = 'First day of week for Sunday 2024-03-31 is Monday 2024-03-25' ).
  ENDMETHOD.


  METHOD week_monday.
    " 2024-06-03: Monday - first day of week, verify week boundaries
    DATA(cut) = zcl_date_factory=>create_date( '20240603' ).

    cl_abap_unit_assert=>assert_equals( exp = zif_date=>weekdays-monday
                                        act = cut->get_weekday( )
                                        msg = '2024-06-03 is a Monday' ).

    cl_abap_unit_assert=>assert_equals( exp = CONV zif_date=>date_format( '20240603' )
                                        act = cut->get_first_day_of_week( )
                                        msg = 'Monday 2024-06-03 is the first day of its own week' ).

    cl_abap_unit_assert=>assert_equals( exp = CONV zif_date=>date_format( '20240609' )
                                        act = cut->get_last_day_of_week( )
                                        msg = 'Last day of week for Monday 2024-06-03 is Sunday 2024-06-09' ).
  ENDMETHOD.


  METHOD week_sunday.
    " 2024-06-09: Sunday - last day of week, same week as 2024-06-03
    DATA(cut) = zcl_date_factory=>create_date( '20240609' ).

    cl_abap_unit_assert=>assert_equals( exp = zif_date=>weekdays-sunday
                                        act = cut->get_weekday( )
                                        msg = '2024-06-09 is a Sunday' ).

    cl_abap_unit_assert=>assert_equals( exp = CONV zif_date=>date_format( '20240603' )
                                        act = cut->get_first_day_of_week( )
                                        msg = 'First day of week for Sunday 2024-06-09 is Monday 2024-06-03' ).

    cl_abap_unit_assert=>assert_equals( exp = CONV zif_date=>date_format( '20240609' )
                                        act = cut->get_last_day_of_week( )
                                        msg = 'Sunday 2024-06-09 is the last day of its own week' ).
  ENDMETHOD.


  METHOD calendar_week.
    " 2024-01-01: week 1
    cl_abap_unit_assert=>assert_equals( exp = '01'
                                        act = zcl_date_factory=>create_date( '20240101' )->get_week( )
                                        msg = '2024-01-01 is in calendar week 01' ).

    " 2024-06-03: Monday, week 23
    cl_abap_unit_assert=>assert_equals( exp = '23'
                                        act = zcl_date_factory=>create_date( '20240603' )->get_week( )
                                        msg = '2024-06-03 is in calendar week 23' ).

    " 2024-12-23: Monday, last full ISO week of 2024 (week 52)
    cl_abap_unit_assert=>assert_equals( exp = '52'
                                        act = zcl_date_factory=>create_date( '20241223' )->get_week( )
                                        msg = '2024-12-23 is in calendar week 52' ).

    " 2024-12-30: Monday - crosses into ISO week 1 of 2025
    cl_abap_unit_assert=>assert_equals( exp = '01'
                                        act = zcl_date_factory=>create_date( '20241230' )->get_week( )
                                        msg = '2024-12-30 belongs to calendar week 01 (ISO week 1 of 2025)' ).
  ENDMETHOD.
ENDCLASS.
