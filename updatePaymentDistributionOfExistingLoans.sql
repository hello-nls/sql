-- Source: https://community.nortridge.com/t/add-loan-payment-rule-to-a-large-batch-of-existing-loans/1968

update  loanacct_setup 
set payment_distribution_order = (
	select loan_template.payment_distribution_order 
	from loan_template 
	where loan_template.loan_template_no = loanacct_setup.loan_template_no)
where loan_template_no in (1,2,3)