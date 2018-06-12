/* Blank Status Codes*/
SELECT        dbo.loanacct.shortname,
			  dbo.loanacct.loan_number, 
			  dbo.loan_status_codes.status_code, 
		 CASE dbo.loanacct.status_code_no
							When '0' Then 'Active'
							When '1' then 'Closed'
							When '2' then 'Restructured'
		 End AS 'Loan Status',
			  dbo.loanacct_detail.userdef01 AS 'OrderID', 
         CASE loanacct_detail.userdef10 
							 WHEN '0' THEN 'No' 
							 WHEN '1' THEN 'Yes' 
		 END AS 'Sumbitted to CRM', 
			  dbo.loanacct.current_principal_balance, 
              dbo.loanacct_ach.Token, 
			  dbo.loanacct_ach.LastFourDigits AS 'CCLastFourDigits', 
			  dbo.loanacct.current_payoff_balance,
			  dbo.loanacct.input_date, 
         CASE loanacct_ach.amount_type 
							WHEN '0' THEN 'Fixed Amount' 
							WHEN '1' THEN ' Percentage of Principle' 
							WHEN '2' THEN 'Amount of Billing' 
		 END AS 'Amount Type',
         CASE loanacct_ach.billing_type 
							WHEN '0' THEN 'Billing' 
							WHEN '1' THEN 'One-Time' 
							WHEN '2' THEN 'Recurring' 
		 END AS 'Frequency Type', 
         CASE dbo.loanacct_ach.status 
							WHEN '0' THEN 'Active' 
							WHEN '1' THEN 'Disabled' 
							WHEN '2' THEN 'Expired' 
		 END AS 'ACH Status'
								

FROM            dbo.loanacct WITH (NOLOCK) LEFT OUTER JOIN
                         dbo.loanacct_statuses ON dbo.loanacct.acctrefno = dbo.loanacct_statuses.acctrefno LEFT OUTER JOIN
                         dbo.loan_status_codes WITH (NOLOCK) ON dbo.loanacct_statuses.status_code_no = dbo.loan_status_codes.status_code_no LEFT OUTER JOIN
                         dbo.loanacct_detail WITH (NOLOCK) ON dbo.loanacct.acctrefno = dbo.loanacct_detail.acctrefno LEFT OUTER JOIN
                         dbo.loanacct_ach WITH (NOLOCK) ON dbo.loanacct.acctrefno = dbo.loanacct_ach.acctrefno
                     
Where dbo.loan_status_codes.status_code is Null and dbo.loanacct.status_code_no = '0'

