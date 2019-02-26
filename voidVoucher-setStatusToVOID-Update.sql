/*
 *  from the community site 
 *    https://community.nortridge.com/t/unable-to-reverse-a-duplicate-transaction-and-also-void-the-associated-voucher/2064  
 *      Voucher_Status:
 *      0 Pending
 *      1 Paid
 *      2 Voided
 *      3 Hold
 *      4 Queued
 */

-- Set Voucher Status to VOID 
UPDATE Voucher SET voucher_status = 2 WHERE voucher_id in (123456)
