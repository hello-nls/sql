/*
   Source: https://community.nortridge.com/t/communication-preferences-automation/2032  
*/

-- get COMMID
select LoanCommunicationPreferencesID 
from loancommunicationpreferences  
where acctrefno = REFNO

-- set the email option
update loancommunicationpreferences 
set StatementOptionFlags = 10 
where LoanCommunicationPreferencesID = COMMID

-- set the email address
insert into LoanCommunicationAddress (LoanCommunicationPreferencesID, Address, AddressType) 
values (COMMID, BUYEREMAILADDRESS, 0)
