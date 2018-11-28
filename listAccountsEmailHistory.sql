SELECT  l.acctrefno, l.loan_number, c.created   
FROM  loanacct_comments c, loanacct l
where l.acctrefno = c.acctrefno 
and c.comments like '%EmailHistoryID%'
and c.created > getdate()-1
