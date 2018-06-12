--locate all loans in PNDAPPROVAL between March 31th and September 9th
SELECT        loanacct_statuses.row_id, loanacct_statuses.acctrefno, loanacct_statuses.status_code_no, loanacct_statuses.effective_date, loanacct_statuses.entry_date, 
                         loan_status_codes.status_code, loan_status_codes.status_code_description, loanacct.loan_number, loanacct.closed_date, loan_status_codes.status_flags, 
                         loan_status_codes.disabled_flag, loan_status_codes.status_code_abbreviated, loanacct.current_note_amount
FROM            loanacct_statuses INNER JOIN
                         loan_status_codes ON loanacct_statuses.status_code_no = loan_status_codes.status_code_no INNER JOIN
                         loanacct ON loanacct_statuses.acctrefno = loanacct.acctrefno

--Where status_code = 'PNDAPPROVAL' AND entry_date <= '2017-09-09' and entry_date >= '2017-03-31'
Where status_code = 'Dupeloan' AND entry_date <= '2017-09-09' and entry_date >= '2017-03-31'


--update loanacct set current_note_amount = '0.00' where status_code_no ='13' and loan_number = 'IL00077880'
update loan_status_codes set disabled_flag = '1' where status_code = 'PNDAPPROVAL' entry_date <= '2017-09-09' and entry_date >= '2017-03-31'


--update loan status to dupeloan
update loanacct_statuses set status_code_no='19' where status_code_no = '13' AND entry_date <= '2017-09-09' and entry_date >= '2017-03-31' and acctrefno='88658'

SELECT        status_code_no, status_code, status_code_description
FROM            dbo.loan_status_codes
where status_code = 'dupeloan'

delete loanacct_statuses where status_code_no = '19' 

--back out dupeloan change
update loanacct_statuses set status_code_no='13' where status_code_no = '19' and status_code_no='13' AND entry_date <= '2017-09-09' and entry_date >= '2017-03-31' and dbo.loanacct.acctrefno='80575'



--Set to closed




--Change Loan Status to "DupeLoan" does not close loan

Select '<NLS>'

union all

SELECT        '<LOAN UpdateFlag="1" LoanNumber="' + loanacct.loan_number + '" >' +
                           '<LOANSTATUSES Operation="ADD" LoanStatusCode="DUPELOAN" EffectiveDate="10/03/2017" />' +
                           '</LOAN>'
FROM            dbo.loanacct_statuses INNER JOIN
                         dbo.loan_status_codes ON dbo.loanacct_statuses.status_code_no = dbo.loan_status_codes.status_code_no INNER JOIN
                         dbo.loanacct ON dbo.loanacct_statuses.acctrefno = dbo.loanacct.acctrefno

Where status_code = 'DUPELOAN' AND entry_date <= '2017-09-09' and entry_date >= '2017-03-31' and dbo.loanacct_statuses.acctrefno = '88658'

union all

Select '</NLS>'





--WriteOff principle Balance (Working)

Select '<NLS>'

union all

SELECT        '<TRANSACTIONS >' +
                           '<TRANSACTIONCODE TransactionCode="440" ' +
                                                                           'LoanNumber="' + loan_number + '" ' +
                                                                           'EffectiveDate="' + CONVERT(VARCHAR(20), open_date, 101)  + '" ' +
                                                                           'Amount="' + Cast(current_principal_balance as varchar(30)) + '"' +
																		   'UserDefined1="CLOSE LOAN" ' +
                                                                            
                                                '/>' +
                           '</TRANSACTIONS>'
FROM            dbo.loanacct_statuses INNER JOIN
                         dbo.loan_status_codes ON dbo.loanacct_statuses.status_code_no = dbo.loan_status_codes.status_code_no INNER JOIN
                         dbo.loanacct ON dbo.loanacct_statuses.acctrefno = dbo.loanacct.acctrefno

Where status_code = 'PNDAPPROVAL' AND entry_date <= '2017-09-09' and entry_date >= '2017-03-31' and dbo.loanacct_statuses.acctrefno = '88658'

union all

Select '</NLS>'

--Write off loans in PLSVoid

Select '<NLS>'

union all

SELECT        '<TRANSACTIONS >' +
                           '<TRANSACTIONCODE TransactionCode="440" ' +
                                                                           'LoanNumber="' + loan_number + '" ' +
                                                                           'EffectiveDate="' + CONVERT(VARCHAR(20), open_date, 101)  + '" ' +
                                                                           'Amount="' + Cast(current_principal_balance as varchar(30)) + '"' +
																		   'UserDefined1="CLOSE LOAN" ' +
                                                                            
                                                '/>' +
                           '</TRANSACTIONS>'
FROM            dbo.loanacct_statuses INNER JOIN
                         dbo.loan_status_codes ON dbo.loanacct_statuses.status_code_no = dbo.loan_status_codes.status_code_no INNER JOIN
                         dbo.loanacct ON dbo.loanacct_statuses.acctrefno = dbo.loanacct.acctrefno

Where status_code = 'PLSVOID' AND entry_date >='08/27/2017' and current_note_amount >'0.00'

union all

Select '</NLS>'


 
