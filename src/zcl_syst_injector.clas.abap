CLASS zcl_syst_injector DEFINITION
  PUBLIC ABSTRACT FINAL
  CREATE PUBLIC
  FOR TESTING.

  PUBLIC SECTION.
    "! Inject Test-Double into Factory ZCL_SYST
    "! @parameter double | Test-Double
    CLASS-METHODS inject_syst
      IMPORTING double TYPE REF TO zif_syst.
ENDCLASS.


CLASS zcl_syst_injector IMPLEMENTATION.
  METHOD inject_syst.
    zcl_syst=>incejted_syst = double.
  ENDMETHOD.
ENDCLASS.
