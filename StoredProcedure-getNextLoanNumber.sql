-– =============================================
-– Description:	get next loan number
-– =============================================
CREATE PROCEDURE [dbo].[getNextLoanNumber]
@portfolioCodeId int

AS

BEGIN

declare @newLoanNumber varchar(25)

declare @numberingMask varchar(25)
declare @numberingKey numeric(10)

BEGIN TRANSACTION
			
	SELECT 
		@numberingKey = t1.numbering_key 
			FROM loan_port_codes_key t1 WITH (HOLDLOCK UPDLOCK) 
			WHERE t1.portfolio_code_id = @portfolioCodeId

	SELECT 
		@numberingMask = t1.numbering_mask
			FROM loan_port_codes t1 
			WHERE t1.portfolio_code_id = @portfolioCodeId

	set @newLoanNumber = replace(@numberingMask,'%d', cast(@numberingKey as varchar(25)))

	UPDATE loan_port_codes_key 
		SET numbering_key = @numberingKey + 1
		WHERE portfolio_code_id = @portfolioCodeId

COMMIT TRANSACTION

select @newLoanNumber

END

GO
