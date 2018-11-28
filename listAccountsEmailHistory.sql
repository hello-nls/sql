/*   From the community site: 
        https://community.nortridge.com/t/find-what-account-an-email-was-sent-to-from-table-emailhistory/1898/11 
           Q by rpaul
           A by robert.buchanan
*/

-- From Robert 
SELECT        row_id, acctrefno, comments
FROM            dbo.loanacct_comments
Where loanacct_comments.comments  like '%EmailHistoryID%'


-- From Ryan
SELECT row_id, acctrefno, comments
FROM nls.dbo.loanacct_comments
Where loanacct_comments.comments like '%EmailHistoryID%'


-- From Jojo
SELECT  l.acctrefno, l.loan_number, c.created   
FROM  loanacct_comments c, loanacct l
where l.acctrefno = c.acctrefno 
and c.comments like '%EmailHistoryID%'
and c.created > getdate()-1



/*
* From Jojo (based on the new info from Greg)
    "In the EmailHistory table the column NLSType will denote if this is from a contact or loan. Contact = 1, Loan = 2. 
       If Loan == 2, the NLSKeyID is the loanacct.acctrefno. If Contact = 1, the NLSKeyID is the cif.cifno." -Greg
*/ 
select l.acctrefno, l.loan_number, e.sentdate
from EmailHistory e, loanacct l
where l.acctrefno = e.NLSKeyID 
and e.NLSType = 2
and e.SentDate > getdate()-1 
