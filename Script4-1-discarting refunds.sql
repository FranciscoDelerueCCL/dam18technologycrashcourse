select
date_trunc(
'month',
(user_acquisition_timestamp))
,count(user_id) as Aquisition,
count(case 
datediff(day,user_acquisition_timestamp,transaction_timestamp)
when '0' then 1 else null end) as Convert1D, 
count(case 
when datediff(day,user_acquisition_timestamp,transaction_timestamp)
<2 then 1 else null end) as Convert3D,
count(case 
when datediff(day,user_acquisition_timestamp,transaction_timestamp)
<13 then 1 else null end) as Convert14D,
count(case 
when datediff(day,user_acquisition_timestamp,transaction_timestamp)
<29 then 1 else null end) as Convert30D,
count(case 
datediff(day,user_acquisition_timestamp,transaction_timestamp)
when '0' then 1 else null end)*100/count(user_id) as Convert1Dpercentage,
count(case 
when datediff(day,user_acquisition_timestamp,transaction_timestamp)
<2 then 1 else null end)*100/count(user_id) as Convert3Dpercentage,
count(case 
when datediff(day,user_acquisition_timestamp,transaction_timestamp)
<13 then 1 else null end)*100/count(user_id) as Convert14Dpercentage,
count(case 
when datediff(day,user_acquisition_timestamp,transaction_timestamp)
<29 then 1 else null end)*100/count(user_id) as Convert30Dpercentage,
sum(case 
datediff(day,user_acquisition_timestamp,transaction_timestamp)
when '0' then transaction_total else null end) as Rev1D,
sum(case 
when datediff(day,user_acquisition_timestamp,transaction_timestamp)
<2 then transaction_total else null end) as Rev3D,
sum(case 
when datediff(day,user_acquisition_timestamp,transaction_timestamp)
<13 then transaction_total else null end) as Rev14D,
sum(case 
when datediff(day,user_acquisition_timestamp,transaction_timestamp)
<29 then transaction_total else null end) as Rev30D,
sum(case 
datediff(day,user_acquisition_timestamp,transaction_timestamp)
when '0' then transaction_total else null end)/count(case 
datediff(day,user_acquisition_timestamp,transaction_timestamp)
when '0' then 1 else null end) as ARPU1D,
sum(case 
when datediff(day,user_acquisition_timestamp,transaction_timestamp)
<2 then transaction_total else null end)/count(case 
when datediff(day,user_acquisition_timestamp,transaction_timestamp)
<2 then 1 else null end)*100/count(user_id) as ARPU3D,
sum(case 
when datediff(day,user_acquisition_timestamp,transaction_timestamp)
<13 then transaction_total else null end)/count(case 
when datediff(day,user_acquisition_timestamp,transaction_timestamp)
<13 then 1 else null end) as ARPU14D,
sum(case 
when datediff(day,user_acquisition_timestamp,transaction_timestamp)
<29 then transaction_total else null end)/count(case 
when datediff(day,user_acquisition_timestamp,transaction_timestamp)
<29 then 1 else null end) as ARPU30D
from tangarana.payment_transactions
where transaction_status='1' and transaction_amount IS NOT NULL and 
transaction_type='payment'
group by date_trunc(
'month',
(user_acquisition_timestamp))
order by date_trunc