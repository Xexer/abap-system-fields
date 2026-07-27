CLASS zcl_syst_injector DEFINITION
  PUBLIC ABSTRACT FINAL
  CREATE PUBLIC
  FOR TESTING.

  PUBLIC SECTION.
    "! Inject Test-Double into Factory ZCL_SYST
    "! @parameter double | Test-Double
    CLASS-METHODS inject_syst
      IMPORTING double TYPE REF TO zif_syst OPTIONAL.
protected section.
private section.
ENDCLASS.



CLASS ZCL_SYST_INJECTOR IMPLEMENTATION.


  METHOD inject_syst.
    zcl_syst=>incejted_syst = double.
  ENDMETHOD.
ENDCLASS.
