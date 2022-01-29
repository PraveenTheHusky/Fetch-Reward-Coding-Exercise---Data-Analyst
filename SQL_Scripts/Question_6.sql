-- Which brand has the most spend among users who were created within the past 6 months? Question 6

SELECT r.rewardsReceiptItemList_brandCode,SUM(r.totalSpent) as summedTotalSpent 
	from receipt r 
	where rewardsReceiptItemList_brandCode is not null 
	and r.userId in 
	(	
		SELECT _id from users u 
		where u.createdDate > 
			(	
				select STRFTIME('%Y-%m-%d %H:%M:%S', max(dateScanned) ,'-6 month')  
				from receipt r 
			)
	) 
	group by r.rewardsReceiptItemList_brandCode
	order by summedTotalSpent desc
	limit 1