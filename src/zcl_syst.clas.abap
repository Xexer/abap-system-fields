CLASS zcl_syst DEFINITION
  PUBLIC ABSTRACT FINAL
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_syst_injector.

  PUBLIC SECTION.
    "! Create instance of default implementation
    "! @parameter result | System Fields instance
    CLASS-METHODS create
      RETURNING VALUE(result) TYPE REF TO zif_syst.

  PRIVATE SECTION.
    "! Injected Test-Double from ZCL_SYST_INJECTOR
    CLASS-DATA incejted_syst TYPE REF TO zif_syst.
ENDCLASS.


CLASS zcl_syst IMPLEMENTATION.
  METHOD create.
    IF incejted_syst IS BOUND.
      RETURN incejted_syst.
    ELSE.
      RETURN NEW zcl_system_default( ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
