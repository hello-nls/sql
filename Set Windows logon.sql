SELECT username
FROM     nlsusers
Where username = 'username'


-- Adds the domain to the username
update dbo.nlsusers set username = 'doman\' + username where username = 'username' 


/*the following tests the script, then rolls back the change to prevent data corruption*/

BEGIN TRAN

UPDATE dbo.nlsusers
   SET username =  'doman\' + username

where username = 'username'

SELECT Username 
FROM dbo.nlsusers where username = 'domain\username'
--results: mydomain.com\username
ROLLBACK

SELECT Username
 FROM dbo.nlsusers where username = 'domain\username'
--results: username


--Once the change has been committed, then there is no way to roll back. A back up of the table will need to be restored. 