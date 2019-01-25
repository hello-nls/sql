
select portfolio_description 
from loanacct L join loan_port_codes P on L.portfolio_code_id=P.portfolio_code_id
where acctrefno = 123456


select portfolio_description 
from loanacct L inner join loan_port_codes P on L.portfolio_code_id=P.portfolio_code_id
where acctrefno = 123456 
