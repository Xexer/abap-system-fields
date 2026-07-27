CLASS zcl_date_factory DEFINITION
  PUBLIC ABSTRACT FINAL
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_date_injector.

  PUBLIC SECTION.
    "! Create a new date object for all the functions for a specific date
    "! or the actual day
    "! @parameter reference_date | Date for reference
    "! @parameter result         | Date object
    CLASS-METHODS create_date
      IMPORTING reference_date TYPE zif_date=>date_format OPTIONAL
      RETURNING VALUE(result)  TYPE REF TO zif_date.

  PRIVATE SECTION.
    CLASS-DATA double_date TYPE REF TO zif_date.
ENDCLASS.


CLASS zcl_date_factory IMPLEMENTATION.
  METHOD create_date.
    IF double_date IS BOUND.
      RETURN double_date.

    ELSE.
      IF reference_date IS INITIAL.
        RETURN NEW zcl_date( zcl_syst=>create( )->system_date( ) ).
      ELSE.
        RETURN NEW zcl_date( reference_date ).
      ENDIF.

    ENDIF.
  ENDMETHOD.
ENDCLASS.
