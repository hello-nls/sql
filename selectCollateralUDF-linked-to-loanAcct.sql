/*
    Source: https://community.nortridge.com/t/how-to-query-collateral-udf-info-from-the-db-via-sql-with-the-associated-loan-acctrefno/1977 
*/
    

-- from Larry
SELECT	loan_number,
loanacct.acctrefno,
userdef01,
loanacct_collateral.*
FROM loanacct_collateral
INNER JOIN loanacct_collateral_link ON loanacct_collateral_link.collateral_id = loanacct_collateral.collateral_id
AND loanacct_collateral.collateral_code = 2 – A specific collateral code from your specific NLS setup
INNER JOIN loanacct ON loanacct.acctrefno = loanacct_collateral_link.acctrefno



-- from Jojo
SELECT	C.userdef01, C.userdef11, 
loan_number, loanacct.acctrefno,
C.userdef01,
C.*
FROM loanacct_collateral C
INNER JOIN loanacct_collateral_link ON loanacct_collateral_link.collateral_id = C.collateral_id
AND C.collateral_code = 1 -- A specific collateral code from your specific NLS setup
INNER JOIN loanacct ON loanacct.acctrefno = loanacct_collateral_link.acctrefno
where C.userdef01 is not null 
order by acctrefno
