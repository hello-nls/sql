/*
 * CollateralInsuranceSelectByDate
 */
SELECT l.acctrefno, CONVERT(date, policy_expiration_date), CONVERT(date, GETDATE()), ci.*
FROM collateral_insurance ci, loanacct l, loanacct_collateral_link lcl
WHERE CONVERT(date, policy_expiration_date) = CONVERT(date, GETDATE())
and l.acctrefno = lcl.acctrefno
and lcl.collateral_id = ci.collateral_id
AND status_code_no = 0


/*
 * SelectByDateAndCollateralType
 */
SELECT l.acctrefno, CONVERT(date, policy_expiration_date), CONVERT(date, GETDATE()), ci.*
FROM collateral_insurance ci, loanacct l, loanacct_collateral_link lcl, loanacct_collateral lc
WHERE CONVERT(date, policy_expiration_date) <= CONVERT(date, GETDATE())
and l.acctrefno = lcl.acctrefno
and lcl.collateral_id = ci.collateral_id
and lcl.collateral_id = lc.collateral_id
AND status_code_no = 0
AND (collateral_code = 4
OR collateral_code = 5)
