CLASS zcl_date DEFINITION
  PUBLIC FINAL
  CREATE PRIVATE
  GLOBAL FRIENDS zcl_date_factory.

  PUBLIC SECTION.
    INTERFACES zif_date.

    METHODS constructor
      IMPORTING reference_date TYPE zif_date=>date_format.

  PRIVATE SECTION.
    DATA reference_date TYPE zif_date=>date_format.
    DATA loaded         TYPE abap_boolean.
    DATA loaded_date    TYPE zif_date=>raw_date.

    "! Load and return reference date from DB
    "! @parameter result | Buffered or loaded date entry
    METHODS get_reference
      RETURNING VALUE(result) TYPE zif_date=>raw_date.
ENDCLASS.


CLASS zcl_date IMPLEMENTATION.
  METHOD constructor.
    me->reference_date = reference_date.
  ENDMETHOD.


  METHOD zif_date~get_calendar_day_of_the_year.
    RETURN get_reference( )-CalendarDayOfYear.
  ENDMETHOD.


  METHOD zif_date~get_first_day_of_month.
    RETURN get_reference( )-FirstDayOfMonthDate.
  ENDMETHOD.


  METHOD zif_date~get_first_day_of_week.
    RETURN get_reference( )-FirstDayOfWeekDate.
  ENDMETHOD.


  METHOD zif_date~get_last_day_of_month.
    RETURN get_reference( )-LastDayOfMonthDate.
  ENDMETHOD.


  METHOD zif_date~get_last_day_of_week.
    RETURN get_reference( )-FirstDayOfWeekDate + 6.
  ENDMETHOD.


  METHOD zif_date~get_quarter.
    RETURN get_reference( )-CalendarQuarter.
  ENDMETHOD.


  METHOD zif_date~get_raw_date.
    SELECT FROM I_CalendarDate
      FIELDS *
      WHERE CalendarDate = @reference_date
      INTO CORRESPONDING FIELDS OF @result
      UP TO 1 ROWS.
    ENDSELECT.
  ENDMETHOD.


  METHOD zif_date~get_week.
    RETURN get_reference( )-CalendarWeek.
  ENDMETHOD.


  METHOD zif_date~get_weekday.
    RETURN get_reference( )-WeekDay.
  ENDMETHOD.


  METHOD get_reference.
    IF loaded = abap_false.
      loaded_date = zif_date~get_raw_date( ).
      loaded = abap_true.
    ENDIF.

    RETURN loaded_date.
  ENDMETHOD.
ENDCLASS.
