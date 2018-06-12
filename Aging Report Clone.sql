SELECT      

			  dbo.loanacct_detail.userdef01 AS OrderID, 
			  dbo.loanacct.acctrefno, 
			  dbo.loanacct.name, 
		      dbo.loanacct.loan_number, 
	Case dbo.loanacct.status_code_no 
					When '0' then 'Active'
					When '2' then 'Restructured'	 
	End AS Status,
			  dbo.loan_status_codes.status_code AS 'Status Code',
			  dbo.loanacct.days_past_due,  
              dbo.loanacct_payment.last_payment_date,
			  dbo.loanacct.principal_paid_thru_date, 
			  dbo.loanacct.open_date, 
			  dbo.loanacct.original_note_amount,
              dbo.loanacct.current_principal_balance - dbo.loanacct.original_note_amount AS 'Principal Paid',
			  dbo.loanacct.total_past_due_balance, 
              dbo.loanacct.current_principal_balance AS 'Total Loan Balance'


FROM            dbo.loanacct_detail WITH (Nolock) INNER JOIN
                         dbo.loanacct WITH (Nolock) ON dbo.loanacct_detail.acctrefno = dbo.loanacct.acctrefno INNER JOIN
                         dbo.loanacct_payment WITH (Nolock) ON dbo.loanacct.acctrefno = dbo.loanacct_payment.acctrefno INNER JOIN
                         dbo.loanacct_statuses WITH (Nolock) ON dbo.loanacct.acctrefno = dbo.loanacct_statuses.acctrefno INNER JOIN
                         dbo.loan_status_codes ON dbo.loanacct_statuses.status_code_no = dbo.loan_status_codes.status_code_no

WHERE        (dbo.loanacct.status_code_no IN ('0', '2')) AND (dbo.loanacct_statuses.status_code_no IN ('12', '14', '16', '17'))