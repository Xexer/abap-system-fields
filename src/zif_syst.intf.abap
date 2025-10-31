INTERFACE zif_syst
  PUBLIC.

  TYPES user                TYPE c LENGTH 12.
  TYPES alias               TYPE c LENGTH 40.
  TYPES date                TYPE d.
  TYPES time                TYPE t.
  TYPES timezone            TYPE cl_abap_context_info=>ty_time_zone.
  TYPES language_sap_format TYPE sylangu.
  TYPES language_iso_format TYPE c LENGTH 2.
  TYPES system_message      TYPE symsg.
  TYPES system_index        TYPE sy-index.
  TYPES system_tabix        TYPE sy-tabix.
  TYPES system_dbcnt        TYPE sy-dbcnt.
  TYPES system_subrc        TYPE sy-subrc.
  TYPES system_abcde        TYPE c LENGTH 26.
  TYPES system_fdayw        TYPE int1.
  TYPES system_message_bapi TYPE bapiret2.
  TYPES system_message_bali TYPE REF TO if_bali_message_setter.

  TYPES: BEGIN OF system_info,
           client          TYPE sy-mandt,
           system_id       TYPE sy-sysid,
           calling_program TYPE c LENGTH 40,
           abap_release    TYPE c LENGTH 4,
         END OF system_info.

  CONSTANTS: BEGIN OF weekdays,
               monday    TYPE system_fdayw VALUE 1,
               tuesday   TYPE system_fdayw VALUE 2,
               wednesday TYPE system_fdayw VALUE 3,
               thursday  TYPE system_fdayw VALUE 4,
               friday    TYPE system_fdayw VALUE 5,
               saturday  TYPE system_fdayw VALUE 6,
               sunday    TYPE system_fdayw VALUE 0,
             END OF weekdays.

  "! Get actual logged in User (SY-UNAME)
  "! @parameter result | ID of the User
  METHODS user_id
    RETURNING VALUE(result) TYPE user.

  "! Get the alias of the actual logged in User
  "! @parameter result | Alias of the User
  METHODS user_alias
    RETURNING VALUE(result) TYPE alias.

  "! Get system date (SY-DATUM)
  "! @parameter result | System date
  METHODS system_date
    RETURNING VALUE(result) TYPE date.

  "! Get system time (SY-UZEIT)
  "! @parameter result | System time
  METHODS system_time
    RETURNING VALUE(result) TYPE time.

  "! Get the system timestamp in short format
  "! @parameter result | Timestamp (Short)
  METHODS timestamp
    RETURNING VALUE(result) TYPE timestamp.

  "! Get the system timestamp in long format
  "! @parameter result | Timestamp (Long)
  METHODS timestamp_long
    RETURNING VALUE(result) TYPE timestampl.

  "! Get the actual UTClong timestamp
  "! @parameter result | Timestamp in UTClong
  METHODS utclong
    RETURNING VALUE(result) TYPE utclong.

  "! Get system date (SY-DATLO)
  "! @parameter result | Local date
  METHODS user_date
    RETURNING VALUE(result) TYPE date.

  "! Get system time (SY-TIMLO)
  "! @parameter result | Local time
  METHODS user_time
    RETURNING VALUE(result) TYPE time.

  "! Get time zone from the logged in user (SY-ZONLO)
  "! @parameter result | Local time
  METHODS time_zone
    RETURNING VALUE(result) TYPE timezone.

  "! Get actual language (SY-LANGU)
  "! @parameter result | Language in SAP format
  METHODS language
    RETURNING VALUE(result) TYPE language_sap_format.

  "! Get actual language in ISO Format
  "! @parameter result | Language in ISO format
  METHODS language_iso
    RETURNING VALUE(result) TYPE language_iso_format.

  "! Get additional system informations
  "! @parameter result | System informations
  METHODS system_information
    RETURNING VALUE(result) TYPE system_info.

  "! Get actual index of the DO (SY-INDEX)
  "! @parameter result | Position
  METHODS index
    RETURNING VALUE(result) TYPE system_index.

  "! Get actual table index of the LOOP (SY-TABIX)
  "! @parameter result | Position
  METHODS table_index
    RETURNING VALUE(result) TYPE system_tabix.

  "! Get actual count from the database (SY-DBCNT)
  "! @parameter result | Number of changed database items
  METHODS database_count
    RETURNING VALUE(result) TYPE system_dbcnt.

  "! Get the return code of the last ABAP statement (SY-SUBRC)
  "! @parameter result | Return code
  METHODS return_code
    RETURNING VALUE(result) TYPE system_subrc.

  "! Get latin letters in upper case (SY-ABCDE)
  "! @parameter result | Return code
  METHODS letter_upper
    RETURNING VALUE(result) TYPE system_abcde.

  "! Get latin letters in lower case (SY-ABCDE)
  "! @parameter result | Return code
  METHODS letter_lower
    RETURNING VALUE(result) TYPE system_abcde.

  "! Get day of the week (SY-FDAYW)
  "! @parameter result | Return code
  METHODS weekday
    RETURNING VALUE(result) TYPE system_fdayw.

  "! Get the last system message (SY-MSGID, SY-MSGNO, SY-MSGTY, SY-MSGV1, etc.)
  "! @parameter result | Last system message
  METHODS message
    RETURNING VALUE(result) TYPE system_message.

  "! Get the last system message in BAPIRET2 format (SY-MSGID, SY-MSGNO, SY-MSGTY, SY-MSGV1, etc.)
  "! @parameter result | Last system message (BAPIRET2)
  METHODS message_bapiret2
    RETURNING VALUE(result) TYPE system_message_bapi.

  "! Get the last system message in BALI format (SY-MSGID, SY-MSGNO, SY-MSGTY, SY-MSGV1, etc.)
  "! @parameter result | Last system message (BALI instance)
  METHODS message_bali
    RETURNING VALUE(result) TYPE system_message_bali.
ENDINTERFACE.
