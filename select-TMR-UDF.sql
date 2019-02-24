
select userdef01 from tmr_udf 
where tmr_id in (select tmr_id from tmr where parent_refno = 123456 and tmr_code_id = 123)


--

select userdef01 
from tmr_udf 
where tmr_id in (
      select tmr_id 
      from tmr 
      where parent_refno = 123456 
               and tmr_code_id = 11
   ) 
   

--


-- used at a document template 
select userdef01 
from tmr_udf 
where tmr_id in (
      select tmr_id 
      from tmr 
      where parent_refno = NLS_ACTIVE_REFNO 
               and tmr_code_id = 123
   ) 

