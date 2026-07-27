CLASS zcl_date_injector DEFINITION
  PUBLIC ABSTRACT FINAL
  CREATE PUBLIC
  FOR TESTING.

  PUBLIC SECTION.
    "! Inject test double into factory
    "! @parameter double | Double of the date instance
    CLASS-METHODS inject_date
      IMPORTING double TYPE REF TO zif_date OPTIONAL.
ENDCLASS.


CLASS zcl_date_injector IMPLEMENTATION.
  METHOD inject_date.
    zcl_date_factory=>double_date = double.
  ENDMETHOD.
ENDCLASS.
