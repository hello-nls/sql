/* example: 07/28/2018 */
select CONVERT(varchar(10),getdate(),101)

/* example: 07/28/2018 */
select CONVERT(varchar(10),SYSDATETIME(),101)



-- from a UDF 
select CONVERT(varchar(10),CAST(userdef26 AS date),101)
from loanacct_detail
where acctrefno = 36280
