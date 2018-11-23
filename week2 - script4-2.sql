select
date_trunc(
'month',
(user_acquisition_timestamp))
,count(user_id) as Aquisition,
count(case 
datediff(month,user_acquisition_timestamp,transaction_timestamp)
when '0' then 1 else null end) as ConvertSameMonth, 
count(case 
when datediff(month,user_acquisition_timestamp,transaction_timestamp)
=1 then 1 else null end) as ConvertMonthPlus1,
count(case 
when datediff(month,user_acquisition_timestamp,transaction_timestamp)
=2 then 1 else null end) as ConvertMonthPlus2,
count(case 
when datediff(month,user_acquisition_timestamp,transaction_timestamp)
=3 then 1 else null end) as ConvertMonthPlus3,
sum(case 
datediff(month,user_acquisition_timestamp,transaction_timestamp)
when '0' then transaction_total else null end) as RevSameMonth,
sum(case 
when datediff(month,user_acquisition_timestamp,transaction_timestamp)
=1 then transaction_total else null end) as RevMonthPlus1,
sum(case 
when datediff(month,user_acquisition_timestamp,transaction_timestamp)
=2 then transaction_total else null end) as RevMonthPlus2,
sum(case 
when datediff(month,user_acquisition_timestamp,transaction_timestamp)
=3 then transaction_total else null end) as RevMonthPlus3,
sum(case 
datediff(month,user_acquisition_timestamp,transaction_timestamp)
when '0' then transaction_total else null end)/count(case 
datediff(month,user_acquisition_timestamp,transaction_timestamp)
when '0' then 1 else null end) as ARPU_SameMonth,
sum(case 
when datediff(month,user_acquisition_timestamp,transaction_timestamp)
=1 then transaction_total else null end)/count(case 
when datediff(month,user_acquisition_timestamp,transaction_timestamp)
=1 then 1 else null end)*100/count(user_id) as ARPU_MonthPlus1,
sum(case 
when datediff(month,user_acquisition_timestamp,transaction_timestamp)
=2 then transaction_total else null end)/count(case 
when datediff(month,user_acquisition_timestamp,transaction_timestamp)
=2 then 1 else null end) as ARPU_MonthPlus2,
sum(case 
when datediff(month,user_acquisition_timestamp,transaction_timestamp)
=3 then transaction_total else null end)/count(case 
when datediff(month,user_acquisition_timestamp,transaction_timestamp)
=3 then 1 else null end) as ARPU_MonthPlus3
from tangarana.payment_transactions
where transaction_status='1' and transaction_amount IS NOT NULL and 
(transaction_type='payment' or (transaction_type='refund' and transaction_total<0))
group by date_trunc(
'month',
(user_acquisition_timestamp))
order by date_trunc