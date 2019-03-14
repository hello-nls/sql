
/* 
 * For the Advanced section of the "Loan RULES setup" 
 *   WHERE SQL Statement return at least 1 row 
 *
 *   select-1-if-Acct-does-NOT-have-any-secondary-status.sql
 *
 */




SELECT 1 WHERE (
   0 =  (select COUNT(acctrefno) From loanacct_statuses   
    	     where acctrefno=NLS_ACTIVE_ACCTREFNO 
		         ) 
) 




SELECT 1 WHERE (

   0 =  (select COUNT(acctrefno) From loanacct_statuses   
	       where acctrefno=NLS_ACTIVE_ACCTREFNO 
	      	) 

OR  

   0 <  (select COUNT(acctrefno) From loanacct_statuses  
		      where acctrefno=NLS_ACTIVE_ACCTREFNO 
        		AND status_code_no in (123, 456, 789) 
	          	)

) 
