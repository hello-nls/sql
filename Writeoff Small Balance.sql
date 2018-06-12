SELECT        loanacct_payments_due.row_id, loanacct_payments_due.acctrefno, loanacct_payments_due.payment_number, loanacct_payments_due.payment_amount, 
                         loanacct_payments_due.payment_remaining, loanacct.loan_number, loanacct.current_principal_balance, loanacct.status_code_no
FROM            loanacct_payments_due INNER JOIN
                         loanacct ON loanacct_payments_due.acctrefno = loanacct.acctrefno
where current_principal_balance < '10.01' and current_principal_balance >='0.01'-- and status_code_no ='0'


Select '<NLS>'

union all

SELECT                     '<TRANSACTIONS >' +
                           '<TRANSACTIONCODE TransactionCode="440" ' +
                                                                           'LoanNumber="' + loan_number + '" ' +
                                                                           'EffectiveDate="' + CONVERT(VARCHAR(20), open_date, 101)  + '" ' +
                                                                           'Amount="' + Cast(loanacct.current_principal_balance as varchar(30)) + '"' +
																		   'UserDefined1="CLOSE LOAN" ' +
                                                                           
                                                '/>' +
                           '</TRANSACTIONS>'
						    
FROM            loanacct_payments_due INNER JOIN
                         loanacct ON loanacct_payments_due.acctrefno = loanacct.acctrefno
where current_principal_balance < '10.01' and >= '0.00' and status_code_no ='0' and loan_number = 'LoanNumber'
union all

Select '</NLS>'