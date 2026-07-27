INTERFACE zif_date
  PUBLIC.

  TYPES raw_date    TYPE I_CalendarDate.
  TYPES date_format TYPE d.

  CONSTANTS:
    BEGIN OF weekdays,
      monday    TYPE raw_date-WeekDay VALUE 1,
      tuesday   TYPE raw_date-WeekDay VALUE 2,
      wednesday TYPE raw_date-WeekDay VALUE 3,
      thursday  TYPE raw_date-WeekDay VALUE 4,
      friday    TYPE raw_date-WeekDay VALUE 5,
      saturday  TYPE raw_date-WeekDay VALUE 6,
      sunday    TYPE raw_date-WeekDay VALUE 7,
    END OF weekdays.

  "! Get Raw data set from DB
  "! @parameter result | Read data set from DB
  METHODS get_raw_date
    RETURNING VALUE(result) TYPE raw_date.

  "! Get Quarter for the date
  "! @parameter result | Quarter
  METHODS get_quarter
    RETURNING VALUE(result) TYPE raw_date-CalendarQuarter.

  "! Get week number for the date
  "! @parameter result | Week number
  METHODS get_week
    RETURNING VALUE(result) TYPE raw_date-CalendarWeek.

  "! Get week day for the date
  "! @parameter result | Day of the week (Constant weekdays)
  METHODS get_weekday
    RETURNING VALUE(result) TYPE raw_date-WeekDay.

  "! Get the first day of the week
  "! @parameter result | Day as date
  METHODS get_first_day_of_week
    RETURNING VALUE(result) TYPE date_format.

  "! Get the first day of the month
  "! @parameter result | Day as date
  METHODS get_first_day_of_month
    RETURNING VALUE(result) TYPE date_format.

  "! Get the last day of the week
  "! @parameter result | Day as date
  METHODS get_last_day_of_week
    RETURNING VALUE(result) TYPE date_format.

  "! Get the last day of the month
  "! @parameter result | Day as date
  METHODS get_last_day_of_month
    RETURNING VALUE(result) TYPE date_format.

  "! Get the number of the day in the year
  "! @parameter result | Number of the day for this year
  METHODS get_calendar_day_of_the_year
    RETURNING VALUE(result) TYPE raw_date-CalendarDayOfYear.
ENDINTERFACE.
