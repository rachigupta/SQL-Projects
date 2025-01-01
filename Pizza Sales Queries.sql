select * from pizza_sales

select sum(total_price) as Total_Revenue
from pizza_sales

select sum(total_price) / count(distinct order_id) as Average_Order_value from pizza_sales

select sum(quantity) as Total_Pizza_Sold from pizza_sales

select count(distinct order_id) as Total_Orders_Placed from pizza_sales

select cast(cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Average_Pizza_Sold_Per_Order 
from pizza_sales

select DATENAME(dw, order_date) , count(order_id) as Orders from pizza_sales
group by DATENAME(dw, order_date)

select DATENAME(MONTH, order_date) , count(order_id) as Orders from pizza_sales
group by DATENAME(MONTH, order_date)
order by Orders desc

--Percentage of sales by pizza category
select pizza_category, sum(total_price) as Total_Sales,sum(total_price)*100/ (select sum(total_price) from pizza_sales) as Total_Sales_Percentage from pizza_sales
group by pizza_category

--To check for a particular month
select pizza_category, sum(total_price) as Total_Sales,sum(total_price)*100/ (select sum(total_price) from pizza_sales where MONTH(order_date) = 1) as Total_Sales_Percentage from pizza_sales
where MONTH(order_date) = 1
group by pizza_category

--Percentage of sales by pizza size
select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_Sales, cast(sum(total_price)*100  / (select sum(total_price) from pizza_sales where datepart(quarter , order_date) = 1) as decimal(10,2)) as PCT from pizza_sales
where datepart(quarter , order_date) = 1
group by pizza_size
order by PCT desc

--Top 5 Best selling pizza by sales
select TOP 5 pizza_name, sum(total_price) as Total_sales from pizza_sales
group by pizza_name
order by Total_sales desc

--Top 5 Worst Selling Pizza  by sales
select TOP 5 pizza_name, sum(total_price) as Total_sales from pizza_sales
group by pizza_name
order by Total_sales asc

--Top 5 Best selling pizza by quantity
select TOP 5 pizza_name, sum(quantity) as Total_quantity from pizza_sales
group by pizza_name
order by Total_quantity desc

--Top 5 Worst selling pizza by quantity
select TOP 5 pizza_name, sum(quantity) as Total_quantity from pizza_sales
group by pizza_name
order by Total_quantity asc

--Top 5 Best selling pizza by order
select TOP 5 pizza_name, count(distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by Total_orders desc

--Top 5 worst selling pizza by order
select TOP 5 pizza_name, count(distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by Total_orders asc

