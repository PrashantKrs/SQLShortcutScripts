

--Top with ties  -- the order by is a must and that is the column the top is pulled on . with Ties displays the records in the order by if they are repeated more than once.

 

SELECT top(1) with ties  * 
FROM ecsFileMaster 
order by ECSTradingPartnerId desc 