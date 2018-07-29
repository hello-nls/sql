-- example: July 28, 2018 
SELECT DATENAME(MONTH, SYSDATETIME())+ ' ' 
           + RIGHT('' + DATENAME(DAY, SYSDATETIME()), 2) + ', ' 
                      + DATENAME(YEAR, SYSDATETIME()) 
