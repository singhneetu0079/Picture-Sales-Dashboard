SELECT * from pizza_sales;

Select sum(total_price) AS Total_revenue from pizza_sales;

select sum(Total_price)/count(Distinct order_id) As Avg_order_value from pizza_sales;

Select sum (quantity) As total_pizza_sold from pizza_sales;

SELECT count(Distinct order_id) As Total_orders from pizza_sales;

SELECT cast(cast(sum(Quantity) As Decimal(10,2))/cast(count(Distinct(order_id)) As Decimal(10,2)) As Decimal(10,2)) As Avg_pizzas_per_order from pizza_sales;

----DAILY TREND------------------

Select DATENAME(DW,order_date) As order_day,count(Distinct order_id) As Total_orders from pizza_sales
GROUP BY DATENAME(DW,order_date)

-----HOURLY TREND-------------------

Select DATEPART(Hour,order_time) As order_hours, count(Distinct order_id) As Total_orders
from pizza_sales
GROUP BY DATEPART(Hour,order_time)
ORDER BY DATEPART(Hour,order_time)

---PERCENTAGE SALES BY PIZZA CATEGORY

Select pizza_category,sum(total_price) as total_sales,sum(total_price)*100/(Select sum(total_price) from pizza_sales 
where MONTH(Order_date)=1) As perc_total_sales
from pizza_sales 
where MONTH(Order_date)=1
Group by pizza_category

---PERCENTAGE OF SALES BY PIZZA SIZE

Select pizza_size,cast(sum(total_price) As Decimal(10,2)) as total_sales,cast(sum(total_price)*100/(Select sum(total_price) from pizza_sales 
where DATEPART(quarter,order_date)=1) As Decimal(10,2)) As perc_total_sales
from pizza_sales 
where DATEPART(quarter,order_date)=1
Group by pizza_size
Order by perc_total_sales DESC

-----TOTAL PIZZA SOLD BY PIZZA CATEGORY--

SELECT pizza_category,sum(quantity) as Total_pizza_sold
from pizza_sales
GROUP BY pizza_category

----TOP 5 BEST SELLER BY TOTAL PIZZA SOLD--

Select Top 5 pizza_name,sum(quantity) as Total_pizzas_sold
from pizza_sales
GROUP BY pizza_name
ORDER BY sum(quantity) DESC

---Bottom 5 pizza sold

Select Top 5 pizza_name,sum(quantity) as Total_pizzas_sold
from pizza_sales
GROUP BY pizza_name
ORDER BY sum(quantity) 


