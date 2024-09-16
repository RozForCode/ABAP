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

