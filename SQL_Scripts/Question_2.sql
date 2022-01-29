-- How does the ranking of the top 5 brands by receipts scanned for the recent month compare to the ranking for the previous month? Question 2

SELECT dateMonth, brndCode, ReceiptScanned, myRank
from 
(
	select  rank() over(PARTITION by dateMonth  order by ReceiptScanned desc) myRank, dateMonth, brndCode, ReceiptScanned  
from 
(
	select r.rewardsReceiptItemList_brandCode brndCode,count(dateScanned) ReceiptScanned, STRFTIME('%Y %m', dateScanned ) dateMonth
	from receipt r
	group by r.rewardsReceiptItemList_brandCode, dateMonth
) A
) B
Where dateMonth > (select STRFTIME('%Y %m', max(dateScanned), '-2 month' ) 
		from receipt) 
order by dateMonth desc





