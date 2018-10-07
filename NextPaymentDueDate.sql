-- NOTE:  this could be just some of the many ways to reliably implement this particular requirement  
--                https://community.nortridge.com/t/next-payment-due-date/1751 
--

-- -----------------------------------------------------------------------------------------


-- from Alan 
begin
declare 

	@countpaymentdue numeric(9,0),
	@duedate datetime,
	@loannumber varchar(25),
	@termdays numeric(9,0)
	
	set @loannumber = '<insert loan number>'
	set @termdays = 30 --needs to come from the loan setup?

		select @countpaymentdue = count(1) from loanacct_payments_due where acctrefno = (select acctrefno from loanacct where loan_number = @loannumber)
		PRINT @countpaymentdue
		if @countpaymentdue >0
		begin
			PRINT 'Greater than 0'
			select @duedate=max(date_due) from loanacct_payments_due where acctrefno = (select acctrefno from loanacct where loan_number = @loannumber)
			PRINT @duedate
		end
		if @countpaymentdue=0
		begin
			select @duedate = max(date_due) from loanacct_TRANS_history where transaction_code = 124 and acctrefno = (select acctrefno from loanacct where loan_number = @loannumber)
			PRINT 'DUE DATE IS:'
			PRINT   DateAdd(day,@termdays,@duedate)
		end
end


-- -----------------------------------------------------------------------------------------


-- from Jojo (version 1)
select
   case when (select min(date_due) from loanacct_payments_due where acctrefno = 1) is null  
   then 
	(select next_principal_payment_date from loanacct_payment P where P.acctrefno = 1) 
   else 
	(select min(date_due) from loanacct_payments_due where acctrefno = 1)
   end


-- from Jojo (version 2) 
--  (based from Larry's version)
select L.loan_number, L.acctrefno, 
   isnull(
	  (select min(date_due) from loanacct_payments_due D1 where D1.acctrefno = L.acctrefno),    
		 next_principal_payment_date
   )
from loanacct L join loanacct_payment P on L.acctrefno = P.acctrefno


-- -----------------------------------------------------------------------------------------


-- from Larry 
SELECT	loan_number,
ISNULL((SELECT MIN(date_due)
FROM loanacct_payments_due (NOLOCK)
WHERE loanacct_payments_due.acctrefno = loanacct.acctrefno
AND payment_remaining > 0
AND payment_type LIKE 'Z%'),
CASE WHEN next_interest_payment_date < next_principal_payment_date THEN next_interest_payment_date
ELSE next_principal_payment_date
END) AS NextPaymentDueDate
FROM	loanacct
INNER JOIN loanacct_payment ON loanacct_payment.acctrefno = loanacct.acctrefno


-- -----------------------------------------------------------------------------------------
