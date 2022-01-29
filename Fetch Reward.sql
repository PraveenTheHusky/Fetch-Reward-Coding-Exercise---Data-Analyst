

-- What are the top 5 brands by receipts scanned for most recent month? 

SELECT r.rewardsReceiptItemList_brandCode
from receipt r 
where --rewardsReceiptItemList_brandCode is not null 
STRFTIME('%Y %m', dateScanned ) in
	(	
		select STRFTIME('%Y %m', dateScanned )  
		from receipt r 
		order by dateScanned  desc
		limit 1				
	) 
group by r.rewardsReceiptItemList_brandCode
limit 5
	
	
-- We only have null values for this date range
SELECT r2.rewardsReceiptItemList_brandCode,r2.dateScanned from receipt r2 
where STRFTIME('%Y %m', dateScanned ) in 
	(	
		select STRFTIME('%Y %m', dateScanned )  
		from receipt r 
		order by dateScanned  desc
		limit 1				
	)