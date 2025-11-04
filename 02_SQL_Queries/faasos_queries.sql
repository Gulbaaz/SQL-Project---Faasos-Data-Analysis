-- 1. How many rolls are ordered?
select count(roll_id) 
from customer_orders;

-- 2. How many unique customer orders were made?
select count(distinct customer_id)
from customer_orders;

-- 3. How many successful orders were delivered by each driver?
select driver_id, count(distinct order_id)
from driver_order
where cancellation not in ('Cancellation', 'Customer Cancellation')
group by driver_id;

-- 4. How many each type of rolls was delivered?
select roll_id, count(roll_id) from customer_orders where order_id in (
select order_id 
from (select *, case when cancellation in ('Cancellation', 'Customer Cancellation') then 'c' else 'nc' end as order_cancel_details from driver_order) as a
where order_cancel_details = 'nc')
group by roll_id;

-- 5. How many veg and non-veg rolls were ordered by each customer?
select a.*, r.roll_name from (select customer_id, roll_id, count(roll_id) as count
from customer_orders
group by customer_id, roll_id) as a
join rolls as r
on a.roll_id = r.roll_id;

-- 6. What was the maximum number of rolls delivered in a single order?
select order_id, count(roll_id) from (
select * from customer_orders where order_id in (
select order_id from 
(select *, case when cancellation in ('Cancellation', 'Customer Cancellation') then 'c' else 'nc' end as order_cancel_details from driver_order) as a
where order_cancel_details = 'nc')) b
group by order_id
order by count(roll_id) desc
limit 1;

-- Data Cleaning
create table temp_customer_orders as (select * from customer_orders);
update temp_customer_orders
set not_include_items = case when not_include_items is null or not_include_items = 'NaN' then '0' else not_include_items end,
	extra_items_included = case when extra_items_included is null or extra_items_included = 'NaN' then '0' else extra_items_included end;
select * from temp_customer_orders;

create table temp_driver_order as (select * from driver_order);
update temp_driver_order
set pickup_time = case when pickup_time is null then null else pickup_time end,
    distance = case when distance is null or trim(distance) like '%NaN%' then '0' else distance end,
    duration = case when duration is null or trim(duration) like '%NaN%' then '0' else duration end,
    cancellation = case when cancellation in ('Cancellation', 'Customer Cancellation') then 0 else 1 end;
select * from temp_driver_order;

-- 7. For each customer, how many delivered rolls had at least 1 change and how many has no changes?
select customer_id, change_or_nochange, count(order_id) as required_change
from (select *, case when not_include_items = 0 and extra_items_included = 0 then 'no change' else 'change' end change_or_nochange 
from temp_customer_orders 
where order_id in (select order_id from temp_driver_order
where cancellation != 0)) as a
group by customer_id, change_or_nochange;

-- 8. How many rolls were delivered that had both exclusions and extras?
select change_or_nochange, count(change_or_nochange) from (select *, case when not_include_items != 0 and extra_items_included != 0 then 'both included and excluded' else 'either one included excluded' end change_or_nochange 
from temp_customer_orders 
where order_id in (select order_id from temp_driver_order
where cancellation != 0)) as a
group by change_or_nochange;

-- 9. What was the total number of rolls ordered for each hour of the day?
select hours_interval, count(hours_interval)
from (select *, concat(cast(hour(order_date) as char),'-' ,cast(hour(order_date)+1 as char)) as hours_interval
from customer_orders) as a
group by hours_interval;

-- 10. What was the number of orders for each day of the week?
select dayname(order_date) as dow, count(distinct order_id) as total_orders
from customer_orders
group by dow;

-- 11. What was the average time in minutes it took for each driver to arrive at the FAASOS HQ to pickup the order?
select driver_id, sum(avgtime), count(order_id) 
from (select * from (select *, row_number() over (partition by order_id order by avgtime) as rn from
(select a.order_id, a.customer_id, a.roll_id, a.not_include_items, a.extra_items_included, a.order_date, b.driver_id, b.pickup_time, b.distance, b.duration, b.cancellation
, timestampdiff(minute, a.order_date, b.pickup_time) as avgtime
from customer_orders as a
join driver_order as b
on a.order_id = b.order_id
where b.pickup_time is not null) as a) as b
where rn = 1) as c
group by driver_id;

-- 12. Is there any relationship between the number of rolls and how long the order takes to prepare?
select order_id, count(roll_id), sum(avgtime)/count(roll_id) as prep_time
from (select 
	a.order_id, 
	a.customer_id, 
    a.roll_id, 
    a.not_include_items, 
    a.extra_items_included, 
    a.order_date, 
    b.driver_id, 
    b.pickup_time, 
    b.distance, 
    b.duration, 
    b.cancellation, 
    timestampdiff(minute, a.order_date, b.pickup_time) as avgtime
from customer_orders as a
join driver_order as b
on a.order_id = b.order_id
where b.pickup_time is not null) as a
group by order_id;

-- 13. What was the average distance travelled for each customer?
select customer_id, sum(distance)/count(order_id) as avg_distance_travelled
from (select * from (select *, row_number() over (partition by order_id order by avgtime) as rn 
from (select a.order_id, a.customer_id, a.roll_id, a.not_include_items, a.extra_items_included, a.order_date, b.driver_id, b.pickup_time, b.distance, b.duration, b.cancellation
, timestampdiff(minute, a.order_date, b.pickup_time) as avgtime
from customer_orders as a
join driver_order as b
on a.order_id = b.order_id
where b.pickup_time is not null) as a) as b
where rn = 1) as c
group by customer_id;
