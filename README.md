# ABAP System Fields

## Introduction

ABAP Cloud enabled system fields.
- Decoupled from coding
- ABAP Cloud best practices
- Testable (Injector Pattern)

## Fields and Functions

Via this article you can get more informations to the actual structure and functions.

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
