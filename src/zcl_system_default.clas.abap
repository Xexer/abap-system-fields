CLASS zcl_system_default DEFINITION
  PUBLIC FINAL
  CREATE PRIVATE
  GLOBAL FRIENDS zcl_syst.

  PUBLIC SECTION.
    INTERFACES zif_syst.

  PRIVATE SECTION.
    CONSTANTS latin_letter TYPE zif_syst=>system_abcde VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
ENDCLASS.


CLASS zcl_system_default IMPLEMENTATION.
  METHOD zif_syst~user_id.
    RETURN xco_cp=>sy->user( )->name.
  ENDMETHOD.


  METHOD zif_syst~user_alias.
    RETURN cl_abap_context_info=>get_user_alias( ).
  ENDMETHOD.


  METHOD zif_syst~system_date.
    RETURN xco_cp=>sy->date( xco_cp_time=>time_zone->utc )->as( xco_cp_time=>format->abap )->value.
  ENDMETHOD.


  METHOD zif_syst~system_time.
    RETURN xco_cp=>sy->time( xco_cp_time=>time_zone->utc )->as( xco_cp_time=>format->abap )->value.
  ENDMETHOD.


  METHOD zif_syst~timestamp.
    GET TIME STAMP FIELD result.
  ENDMETHOD.


  METHOD zif_syst~timestamp_long.
    GET TIME STAMP FIELD result.
  ENDMETHOD.


  METHOD zif_syst~utclong.
    RETURN utclong_current( ).
  ENDMETHOD.


  METHOD zif_syst~user_date.
    RETURN xco_cp=>sy->date( xco_cp_time=>time_zone->user )->as( xco_cp_time=>format->abap )->value.
  ENDMETHOD.


  METHOD zif_syst~user_time.
    RETURN xco_cp=>sy->time( xco_cp_time=>time_zone->user )->as( xco_cp_time=>format->abap )->value.
  ENDMETHOD.


  METHOD zif_syst~time_zone.
    RETURN xco_cp_time=>time_zone->user->value.
  ENDMETHOD.


  METHOD zif_syst~language.
    RETURN xco_cp=>sy->language( )->value.
  ENDMETHOD.


  METHOD zif_syst~language_iso.
    RETURN xco_cp=>sy->language( )->as( xco_cp_language=>format->iso_639 ).
  ENDMETHOD.


  METHOD zif_syst~system_information.
    RETURN VALUE #( client          = sy-mandt
                    system_id       = sy-sysid
                    calling_program = sy-cprog
                    abap_release    = sy-saprl ).
  ENDMETHOD.


  METHOD zif_syst~index.
    RETURN sy-index.
  ENDMETHOD.


  METHOD zif_syst~table_index.
    RETURN sy-tabix.
  ENDMETHOD.


  METHOD zif_syst~database_count.
    RETURN sy-dbcnt.
  ENDMETHOD.


  METHOD zif_syst~return_code.
    RETURN sy-subrc.
  ENDMETHOD.


  METHOD zif_syst~letter_upper.
    RETURN to_upper( latin_letter ).
  ENDMETHOD.


  METHOD zif_syst~letter_lower.
    RETURN to_lower( latin_letter ).
  ENDMETHOD.


  METHOD zif_syst~weekday.
    RETURN sy-fdayw.
  ENDMETHOD.


  METHOD zif_syst~message.
    RETURN xco_cp=>sy->message( )->value.
  ENDMETHOD.


  METHOD zif_syst~message_bali.
    RETURN cl_bali_message_setter=>create_from_sy( ).
  ENDMETHOD.


  METHOD zif_syst~message_bapiret2.
    DATA(message) = xco_cp=>sy->message( ).

    RETURN VALUE #( type       = message->value-msgty
                    id         = message->value-msgid
                    number     = message->value-msgno
                    message_v1 = message->value-msgv1
                    message_v2 = message->value-msgv2
                    message_v3 = message->value-msgv3
                    message_v4 = message->value-msgv4
                    message    = message->get_text( ) ).
  ENDMETHOD.
ENDCLASS.
