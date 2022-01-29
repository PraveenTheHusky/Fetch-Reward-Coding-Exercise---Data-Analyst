-- When considering average spend from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater? Question 4

select round(A.RejTotalSpentAvg,2) RejtdSpent, round(B.AccTotalSpentAvg,2) AccptSpent  from 
( 
	select avg(totalSpent) RejTotalSpentAvg
	from receipt r 
	where rewardsReceiptStatus == 'REJECTED'
) A
join 
(
	select avg(totalSpent) AccTotalSpentAvg
	from receipt r 
	where rewardsReceiptStatus == 'FINISHED'
) B;


