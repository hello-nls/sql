	select L.acctrefno, l.loan_number, C.Company, C.firstname1, C.lastname1, C.street_address1, C.city, C.state, C.zip 
	from cif C, loanacct L 
	where 
		L.dealer_cifno = C.cifno
		and acctrefno = 12345
