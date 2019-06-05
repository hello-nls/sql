/* 
 * Sample from adinh
 *  Thanks adinh :) 
 */
SELECT a.CreditRiskModelID,a.CreditProfileID,d.task_refno, 
       a.score,a.scorefactor1,a.scorefactor2,a.scorefactor3,a.scorefactor4,
       b.surname,b.firstname,b.reportdate,d.subject
from CreditRiskModel a
INNER JOIN creditprofile b ON b.CreditProfileID = a.creditprofileid
INNER JOIN tmr c ON c.child_refno = b.cifno
INNER JOIN task d ON d.task_refno = c.parent_refno
WHERE c.child_type IN (2,8)
      and d.task_refno IN (....)
