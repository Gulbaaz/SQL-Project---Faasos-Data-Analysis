create database faasos;
use faasos;

drop table if exists driver;
create table driver(driver_id int,reg_date date); 
insert into driver (driver_id, reg_date) 
values 
(1, '2021-01-01'),
(2, '2021-01-03'),
(3, '2021-01-08'),
(4, '2021-01-15');

drop table if exists ingredients;
create table ingredients(ingredients_id int,ingredients_name varchar(60)); 
insert into ingredients(ingredients_id ,ingredients_name) 
 values (1,'BBQ Chicken'),
(2,'Chilli Sauce'),
(3,'Chicken'),
(4,'Cheese'),
(5,'Kebab'),
(6,'Mushrooms'),
(7,'Onions'),
(8,'Egg'),
(9,'Peppers'),
(10,'schezwan sauce'),
(11,'Tomatoes'),
(12,'Tomato Sauce');

drop table if exists rolls;
create table rolls(roll_id int,roll_name varchar(30)); 
insert into rolls(roll_id ,roll_name) 
 values (1	,'Non Veg Roll'),
(2	,'Veg Roll');

drop table if exists rolls_recipes;
create table rolls_recipes(roll_id int,ingredients varchar(24)); 
insert into rolls_recipes(roll_id ,ingredients) 
 values (1,'1,2,3,4,5,6,8,10'),
(2,'4,6,7,9,11,12');

drop table if exists driver_order;
create table driver_order (
    order_id int,
    driver_id int,
    pickup_time datetime,
    distance varchar(10),
    duration varchar(20),
    cancellation varchar(30)
);
insert into driver_order (order_id, driver_id, pickup_time, distance, duration, cancellation)
values
(1, 1, '2021-01-01 18:15:34', '20km', '32 minutes', ''),
(2, 1, '2021-01-01 19:10:54', '20km', '27 minutes', ''),
(3, 1, '2021-01-03 00:12:37', '13.4km', '20 mins', 'NaN'),
(4, 2, '2021-01-04 13:53:03', '23.4', '40', 'NaN'),
(5, 3, '2021-01-08 21:10:57', '10', '15', 'NaN'),
(6, 3, null, null, null, 'Cancellation'),
(7, 2, '2020-01-08 21:30:45', '25km', '25mins', null),
(8, 2, '2020-01-10 00:15:02', '23.4 km', '15 minute', null),
(9, 2, null, null, null, 'Customer Cancellation'),
(10, 1, '2020-01-11 18:50:20', '10km', '10minutes', null);


drop table if exists customer_orders;
create table customer_orders (
    order_id int,
    customer_id int,
    roll_id int,
    not_include_items varchar(10),
    extra_items_included varchar(10),
    order_date datetime
);
insert into customer_orders (order_id, customer_id, roll_id, not_include_items, extra_items_included, order_date)
values
(1, 101, 1, '', '', '2021-01-01 18:05:02'),
(2, 101, 1, '', '', '2021-01-01 19:00:52'),
(3, 102, 1, '', '', '2021-01-02 23:51:23'),
(3, 102, 2, '', 'NaN', '2021-01-02 23:51:23'),
(4, 103, 1, '4', '', '2021-01-04 13:23:46'),
(4, 103, 1, '4', '', '2021-01-04 13:23:46'),
(4, 103, 2, '4', '', '2021-01-04 13:23:46'),
(5, 104, 1, null, '1', '2021-01-08 21:00:29'),
(6, 101, 2, null, null, '2021-01-08 21:03:13'),
(7, 105, 2, null, '1', '2021-01-08 21:20:29'),
(8, 102, 1, null, null, '2021-01-09 23:54:33'),
(9, 103, 1, '4', '1,5', '2021-01-10 11:22:59'),
(10, 104, 1, null, null, '2021-01-11 18:34:49'),
(10, 104, 1, '2,6', '1,4', '2021-01-11 18:34:49');

select * from customer_orders;
select * from driver_order;
select * from ingredients;
select * from driver;
select * from rolls;
select * from rolls_recipes;
