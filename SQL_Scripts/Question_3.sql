-- When considering total number of items purchased from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater? Question 3

select A.RejSum, B.AccSum  from 
( 
	select sum(purchasedItemCount) RejSum
	from receipt r 
	where rewardsReceiptStatus == 'REJECTED'
) A
join 
(
	select sum(purchasedItemCount) AccSum
	from receipt r 
	where rewardsReceiptStatus == 'FINISHED'
) B;


  