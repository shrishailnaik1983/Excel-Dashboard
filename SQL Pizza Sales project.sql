select*from pizza_data

---Total Revenue
select SUM(total_price) as Totalsales from pizza_data

---Total Orders

Select Count(Distinct order_id) as Total_orders from pizza_data

---Average Order Value

select SUM(total_price)/count(Distinct order_id) as Average_order_Value from pizza_data

---Total Pizzas Sold

select SUM(quantity) as Total_Pizza_sold from Pizza_data

---Average Pizzas per Order

Select Cast(Cast (SUM(quantity) as Decimal (10,2)) / Cast(count(distinct Order_ID) as decimal (10,2)) as Decimal(10,2)) as Avg_Pizzas_per_Order from Pizza_data

-----Dashboard--Deriving Charts Through SQL queries
-----Daily Trend

Select DATENAME(DW,order_date) as Order_day,COUNT(Distinct Order_ID) as Total_Orders from Pizza_Data
Group by DATENAME(DW,order_date)


----Hourly Trend for total orders

select DATEPART(Hour,order_time) as Order_Hours,Count(distinct Order_id) as Total_sales from Pizza_data
Group by DATEPART(hour,order_time)
Order By DATEPART (hour,order_time)

----Percentage of sales by pizza Category

select pizza_category,Sum(total_Price) as Total_sales,SUM(Total_price)*100/ (Select SUM(total_price) from pizza_data where MONTH(order_date)=1) as Percentage_sales from pizza_data
where MONTH(order_date)=1
Group by pizza_category

-----Percentage of sales by pizza Size

select pizza_Size,cast(Sum(total_Price) as decimal(10,2)) as Total_sales,cast(SUM(Total_price)*100/ (Select SUM(total_price) from pizza_data where MONTH(order_date)=1) 
as decimal(10,2)) as Percentage_sales from pizza_data
where MONTH(order_date)=1
Group by pizza_Size order by Percentage_sales desc


----Total Pizzas sold by pizza Category

select pizza_category,SUM(quantity) as total_pizzas_sold from pizza_data
Group by pizza_category
order by total_pizzas_sold desc


select pizza_category,SUM(quantity) as total_pizzas_sold from pizza_data
where MONTH(order_date)=2
Group by pizza_category
order by total_pizzas_sold desc


----Top 5 Pizza Names by sales

Select Top 5 pizza_name,SUM(quantity) as total_pizzas_sold from Pizza_data
Group by Pizza_name
order by total_pizzas_sold desc

---Bottom 5 Pizza Names by sales
Select Top 5 pizza_name,SUM(quantity) as total_pizzas_sold from Pizza_data
Group by Pizza_name
order by total_pizzas_sold 