/*   from the community site
        https://community.nortridge.com/t/find-what-account-an-email-was-sent-to-from-table-emailhistory/1898/11 
*/

SELECT  l.acctrefno, l.loan_number, c.created   
FROM  loanacct_comments c, loanacct l
where l.acctrefno = c.acctrefno 
and c.comments like '%EmailHistoryID%'
and c.created > getdate()-1
