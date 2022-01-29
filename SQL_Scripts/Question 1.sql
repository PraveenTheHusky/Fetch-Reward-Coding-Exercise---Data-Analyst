

-- What are the top 5 brands by receipts scanned for most recent month? Question 1

SELECT r.rewardsReceiptItemList_brandCode
from receipt r 
where --rewardsReceiptItemList_brandCode is not null 
STRFTIME('%Y %m', dateScanned ) in
	(	
		select STRFTIME('%Y %m', max(dateScanned) )  
		from receipt r 		
	) 
group by r.rewardsReceiptItemList_brandCode
limit 5
	
	
-- We only have null values for this date range
SELECT r2.rewardsReceiptItemList_brandCode,r2.dateScanned from receipt r2 
where STRFTIME('%Y %m', dateScanned ) in 
	(	
		select STRFTIME('%Y %m', max(dateScanned) )  
		from receipt r 
	)