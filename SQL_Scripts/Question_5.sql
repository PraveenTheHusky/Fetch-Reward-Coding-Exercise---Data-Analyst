-- Which brand has the most transactions among users who were created within the past 6 months? Question 5

SELECT r.rewardsReceiptItemList_brandCode,count(r._id) as Most_Transaction
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
	order by Most_Transaction desc
	limit 1
	
	
	
