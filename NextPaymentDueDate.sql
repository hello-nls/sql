-- 
-- https://community.nortridge.com/t/next-payment-due-date/1751 
--
	select
		case when (select min(date_due) from loanacct_payments_due where acctrefno = 1) is null  
		then 
			(select next_principal_payment_date from loanacct_payment P where P.acctrefno = 1) 
		else 
			(select min(date_due) from loanacct_payments_due where acctrefno = 1)
		end
