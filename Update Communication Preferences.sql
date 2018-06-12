 --run script
 --save as .xml (save as, change to all files {I like notepad})
--add <NLS> to the top and </NLS> to the bottom
--import xml to NLS

select  '<LOAN UpdateFlag="1" LoanNumber="'+loan_number+'"><COMMUNICATION><EMAILADDRESSES><EMAILADDRESS Operation="Add" Address="'+email+'"></EMAILADDRESS></EMAILADDRESSES></COMMUNICATION></LOAN>' 
	From cif, loanacct where loanacct.cifno=cif.cifno and status_code_no=0 and total_past_due_balance = '0.00' and email<>''



--if being used for lower environment, use the following command to set the email address to the test address. Make sure you match the DB name to the correct environment.

/*SELECT [cifno]
      ,[portfolio_code_id]
     ,[cifnumber]
      ,[email]
  FROM [NLSAPP_01].[dbo].[cif]*/

update cif set email='emailaddress'



-- Enable the Email setting - This must be done after the import is complete
SELECT        LoanCommunicationPreferences.*
FROM            LoanCommunicationPreferences
update LoanCommunicationPreferences set StatementOptionFlags = '2'

--Set statement type

SELECT        statement_code, loannumber, cifno, statement_row_id
FROM            loanacct_statement

Update loanacct_statement set statement_code = '4'

--PUll Initial 200 customers for testing

SELECT        TOP (200) acctrefno, cifno, name, loan_number, status_code_no, total_past_due_balance, next_billing_date
FROM            dbo.loanacct
Where Status_code_no = '0' and next_billing_date > '2017-11-17 00:00:00.000' and total_past_due_balance = '0.00'