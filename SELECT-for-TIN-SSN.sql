
/*
 * Source: https://community.nortridge.com/t/sql-select-for-tin-ssn/444  
 */


-- version 1 
SELECT dbo.NLSDecrypt(SUBSTRING(tin,9,LEN(tin)),'Your_encryption_key') 
FROM   cif 



-- version 2 
Select  
dbo.NLSDecrypt(SUBSTRING(tin,35,LEN(tin)), SUBSTRING(tin,10,33),'Your_encryption_key')  
From cif 


