*& this is how we comment in ABAP 

              *Functions call and Methods call - method calls give better error and are easier to fix


REPORT zst2date_check_function.            *This defines the ABAP report program named zst2date_check_function. A report is a standalone executable program. It uses procedural programming techniques
CONSTANTS:
*correct data type is sydatun
gc_date type sydatun VALUE '20010101'.     *This declares a constant gc_date of type sydatun, which is used for storing date values in the format YYYYMMDD.
                                            *The constant is initialized with the value '20010101' (representing January 1, 2001).
CALL FUNCTION 'DATE_CHECK_PLAUSIBILITY'
EXPORTING
date = gc_date
EXCEPTIONS
OTHERS =1.
                                            *CALL FUNCTION 'DATE_CHECK_PLAUSIBILITY': This calls the SAP function module DATE_CHECK_PLAUSIBILITY, which checks if the provided date (gc_date) is valid.
                                            *EXPORTING: The date parameter (which is gc_date) is passed to the function.
                                            *EXCEPTIONS: This handles any exceptions (errors) that might occur. If any exception other than those specifically handled is raised, OTHERS = 1 sets the return code to 1.

IF sy-subrc =0.
WRITE:
/'DATE OK'.
ELSE
write:
/'DATE INVALID'.
ENDIF
                                      *sy-subrc: This is a system variable that holds the return code of the last operation (in this case, the function call).
                                      *sy-subrc = 0: If the return code is 0, it means the function executed successfully, and the date is valid. It then outputs 'DATE OK'.
                                      *Else: If sy-subrc is not 0, it indicates an invalid date, and 'DATE INVALID' is written to the output.

                   * for method program just replace function with method in the report statement
REPORT zst2date_check_method.                *This report uses object-oriented programming (OOP) techniques in ABAP
CONSTANTS:
*correct data type is sydatun
gc_date type sydatun VALUE '20010101'.
CALL FUNCTION 'DATE_CHECK_PLAUSIBILITY'
EXPORTING
date = gc_date
EXCEPTIONS
OTHERS =1.
IF sy-subrc =0.
WRITE:
/'DATE OK'.
ELSE
write:
/'DATE INVALID'.
ENDIF

                    * Example of abap class and method creation
CLASS lhc DEFINITION.
  PUBLIC SECTION.
    METHODS: display_data.
ENDCLASS.

CLASS lhc IMPLEMENTATION.
  METHOD display_data.
    WRITE: / 'Displaying data'.
  ENDMETHOD.
ENDCLASS.
