* naming conversions and best practices
* 1  customer objects prefixed with "Y" or "Z" 

* 2  Literal values should never be used
* eg of this select * from VBAK where sk in ('ZSp0','ZSp1') - bad if doc changes EXCEPTIONS


*  alternatives - constants as members of main class, or text elements when lang dependant values are used
* eg class LCL_MAIN.
*PRIVATE SECTION.
*CONSTANTS:
*MC_DOCTYP_CONTRACT TYPE AUART VALUE 'ZS01'
*
*
*
*
* An ideal way to ensure that best practices are adhered to in all development
* objects is to use a template or framework that provides a starting point for all development. The framework consists of an initial
* report object with or without selection screen fields.
* framework code - ZST2FRAMEWORK
*
*BENEFITS - no global variables, fresh enviroment on each iteration, robust error handling with exception class, easy to re-use code
*
*

* creating a small program that uses local class for its processing 

REPORT z_add_two_numbers.

* DEFINITION
CLASS lcl_addition DEFINITION.
 PUBLIC SECTION.
  METHODS: add_two_numbers 
    IMPORTING number1 TYPE i  " the IMPORTING keyword is used in method or function module definitions to define input parameters. 
            number2 TYPE i 
    RETURNING VALUE(sum) TYPE i 
ENDCLASS.

* IMPLEMENTATION
CLASS lcl_addition IMPLEMENTATION.
    METHOD add_two_numbers.
        sum = number1+number2.
    ENDMETHOD

* start the main program logic
START-OF-SELECTION.
    DATA: obj TYPE REF TO lcl_addition,"all variables must be defined using the DATA keyword (or other related keywords like CONSTANTS, TYPES, etc.) before they can be used.
         result TYPE i.
    CREATE OBJECT obj.
    * Parameters for user input
    PARAMETERS: number1 TYPE i,
                number2 TYPE i.
    result = obj->add_two_numbers(number1=10 number2=20)
    WRITE: / 'sum of 10 and 20 is:',result.

* Here's the same code but with contructors where values to be added are members of the local class
* review - execution starts with run , the contructor call executes rest of the program



*Glocal class - using form-based interface, source-code based interface, configure visibility of components
* 
*review - executions started by run, all of the code is executed by run