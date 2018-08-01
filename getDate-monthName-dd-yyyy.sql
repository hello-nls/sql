/* example: July 28, 2018 */
SELECT DATENAME(MONTH, SYSDATETIME())+ ' ' 
           + RIGHT('' + DATENAME(DAY, SYSDATETIME()), 2) + ', ' 
                      + DATENAME(YEAR, SYSDATETIME()) 


/* example: July 28, 2018 */
SELECT DATENAME(MONTH, GETDATE())+ ' ' 
           + RIGHT('' + DATENAME(DAY, GETDATE()), 2) + ', ' + 
                        DATENAME(YEAR, GETDATE()) 
