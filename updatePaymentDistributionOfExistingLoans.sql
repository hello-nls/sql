-- Source1: https://community.nortridge.com/t/add-loan-payment-rule-to-a-large-batch-of-existing-loans/1968 
-- Source2: https://community.nortridge.com/t/payment-distribution/2009/24 


-- from jojo (version 1) 
update  loanacct_setup 
set payment_distribution_order = (
	select loan_template.payment_distribution_order 
	from loan_template 
	where loan_template.loan_template_no = loanacct_setup.loan_template_no)
where loan_template_no in (1,2,3)




-- from aaron
update loanacct_setup set payment_distribution_order = (
		select payment_distribution_order 
		from loanacct_setup 
		where acctrefno = 123456
	) 
where acctrefno in (
	select acctrefno 
	from loanacct 
	where loan_group_no in (
		select loan_group_no from loan_group where loan_group = ‘DBHIL’
	)
)




-- from jojo (version 2)
update  loanacct_setup 
set payment_distribution_order = (
		select loan_template.payment_distribution_order 
		from loan_template 
		where loan_template.loan_template_no = 123456
	)
where acctrefno in (
	select acctrefno 
	from loanacct 
	where loan_group_no in (
		select loan_group_no from loan_group where loan_group = 'DBHIL'
	)
)
