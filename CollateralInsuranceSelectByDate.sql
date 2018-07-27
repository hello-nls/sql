SELECT l.acctrefno, CONVERT(date, policy_expiration_date), CONVERT(date, GETDATE()), ci.*
FROM collateral_insurance ci, loanacct l, loanacct_collateral_link lcl
WHERE CONVERT(date, policy_expiration_date) = CONVERT(date, GETDATE())
and l.acctrefno = lcl.acctrefno
and lcl.collateral_id = ci.collateral_id
AND status_code_no = 0
