# ABAP System Fields

## Introduction

ABAP Cloud enabled system fields.
- Decoupled from coding
- ABAP Cloud best practices
- Testable (Injector Pattern)

## Fields and Functions

Via this [article](https://software-heroes.com/en/blog/abap-cloud-system-fields-solution) you can get more informations to the actual structure and functions.

|       Method       |                   Function                  |
|:------------------:|:-------------------------------------------:|
|       user_id      |                   sy-uname                  |
|     user_alias     |     cl_abap_context_info=>get_user_alias    |
|     system_date    |                   sy-datum                  |
|     system_time    |                   sy-uzeit                  |
|      timestamp     |                GET TIME STAMP               |
|   timestamp_long   |                GET TIME STAMP               |
|       utclong      |              utclong_current( )             |
|      user_date     |                   sy-datlo                  |
|      user_time     |                   sy-timlo                  |
|      time_zone     |                   sy-zonlo                  |
|      language      |                   sy-langu                  |
|    language_iso    |                      -                      |
| system_information |    sy-mandt, sy-sysid, sy-cprog, sy-saprl   |
|        index       |                   sy-index                  |
|     table_index    |                   sy-tabix                  |
|   database_count   |                   sy-dbcnt                  |
|     return_code    |                   sy-subrc                  |
|    letter_upper    |                   sy-abcde                  |
|    letter_lower    |                      -                      |
|       weekday      |                   sy-fdayw                  |
|       message      | sy-msgid, sy-msgno, sy-msgty, sy-msgv1, ... |
|  message_bapiret2  | sy-msgid, sy-msgno, sy-msgty, sy-msgv1, ... |
|    message_bali    | sy-msgid, sy-msgno, sy-msgty, sy-msgv1, ... |

## Example

Start in the constructor to create the instance and assign it to an attribute of the class, so your Unit Test should stay stable. We can override the "SY" with this method.

```ABAP
sy = zcl_syst=>create( ).
```

Using as SY-SUBRC in a function:

```ABAP
AUTHORITY-CHECK OBJECT 'S_APPL_LOG'
                ID 'ACTVT' FIELD '02'.

RETURN xsdbool( sy->return_code( ) = 0 ).
```

Using as SY-UNAME in a IF statement:

```ABAP
IF sy->user_id( ) = 'TECHUSER'.
  RETURN abap_true.
ELSE.
  RETURN abap_false.
ENDIF.
```

Creating a timestamp inline:

```ABAP
DATA(actual_time) = sy->timestamp_long( ).
```
