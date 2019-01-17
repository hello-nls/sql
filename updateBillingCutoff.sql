/* 
   SOURCE: https://community.nortridge.com/t/4-10-8-payments-due/999/9  
*/


--SELECT
select * from loanacct_setup S with(nolock) join loanacct L with(nolock) on L.acctrefno = S.acctrefno
where L.status_code_no = 0
and S.loan_template_no in (1,2,3)


--UPDATE
update loanacct_setup
set billing_cutoff = -26
where acctrefno in
(select L.acctrefno from loanacct_setup S with(nolock) join loanacct L with(nolock) on L.acctrefno = S.acctrefno
where L.status_code_no = 0
and S.loan_template_no in (1,2,3))
