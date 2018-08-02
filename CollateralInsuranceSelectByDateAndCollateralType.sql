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


/*
 * hilltx 
 * Here is my take on the collateral insurance select... it is one that I use
 * for one of my clients.  The big difference here is that my joins are
 * ANSI-SQL joins.
 */
select loan_number, t4.userdef01,t4.userdef02,t4.userdef03,t4.userdef04,
t4.userdef05,t4.userdef06,t4.userdef07,t4.userdef08,t4.userdef09,t4.userdef10,t4.userdef11,t4.userdef12,
t4.userdef13,t4.userdef14,t4.userdef15,t5.insurance_description,policy_expiration_date
 from loanacct t1
  inner join loanacct_collateral_link t2 on t1.acctrefno = t2.acctrefno
  inner join collateral_vehicle t3 on t2.collateral_id = t3.collateral_id
  inner join loanacct_collateral t4 on t2.collateral_id  = t4.collateral_id
  inner join collateral_insurance t5 on t2.collateral_id = t5.collateral_id
