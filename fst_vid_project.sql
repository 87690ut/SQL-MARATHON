create database pizzahut;
use pizzahut;

--  creating a table for large data
create table orders(
order_id int not null,
order_date date not null,
order_time time not null,
primary key(order_id));

create table order_details(
order_details_id int not null,
order_id int not null,
pizza_id text not null,
quantity int not null,
primary key(order_details_id));


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1.------- retrive the total number of order placed.
select count(order_id) as Total_Orders from orders;

-- 2. ------calculate the total revenue from total sales.

SELECT 
    SUM(order_details.quantity * pizzas.price) AS total_sales
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id;
    
-- 3.---- identify the highest price pizza.
select pizza_types.name, pizzas.price
from pizza_types join pizzas 
on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc limit 1;

-- 4 -------------- identify the most common size pizza ordered.
SELECT 
    pizzas.size, COUNT(order_details.pizza_id) AS order_det
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_det DESC;

-- 5.------------ list the top 5 most ordered pizza type along with their quantities.

SELECT 
    pizza_types.name, SUM(order_details.quantity) AS quan
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quan DESC
LIMIT 5;

-- -----6. join the table  to find out the total quantities of each pizza ordered.
SELECT 
    pizza_types.name, SUM(order_details.quantity)
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name;

-- -----7. join the table  to find out the total quantities of each pizza category ordered.
SELECT 
    pizza_types.category, SUM(order_details.quantity)
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category;
  
  -- --8. Determine the distribution of order by hour of the day.
SELECT 
    HOUR(orders.order_time), COUNT(order_id)
FROM
    orders
GROUP BY HOUR(orders.order_time)
ORDER BY COUNT(order_id) DESC;
  
  --  9. Joinn the relevant table to find the category wise distribution of pizza.
SELECT 
    pizza_types.category, COUNT(pizza_types.name) AS total_types
FROM
    pizza_types
GROUP BY pizza_types.category;

-- 10. group the orders by date and calculate the average number of pizzas ordered per day.(use of inner query)
SELECT 
   round( AVG(quantity),0)
FROM
    (SELECT 
        orders.order_date, SUM(order_details.quantity) AS quantity
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date) AS daily_orders;

-- 11. -- determine the top 3 most ordered pizza based on revenue


SELECT 
            pizza_types.name, sum(order_details.quantity * pizzas.price) as revenue
        FROM
            pizza_types
                JOIN
            pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
                JOIN
            order_details ON order_details.pizza_id = pizzas.pizza_id
        GROUP BY pizza_types.name  order by revenue desc limit 3;
        
-- 12. -- calculate the percentage of contribution of each pizza type(category) to total revenue.

select pizza_types.category ,round( (sum(pizzas.price * order_details.quantity) / (select sum(pizzas.price*order_details.quantity) from order_details
join  pizzas
on pizzas.pizza_id = order_details.pizza_id))*100,2) as perc
from pizza_types
join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on pizzas.pizza_id = order_details.pizza_id
group by pizza_types.category;

-- 13. -- analyse the cumalative revenue generated over time.
with daily_revenue as  (select orders.order_date , sum( order_details.quantity * pizzas.price) as revenue
from orders
join order_details
on orders.order_id = order_details.order_id
join pizzas
on order_details.pizza_id = pizzas.pizza_id
group by orders.order_date)
select order_date , revenue, sum(revenue) over(order by order_date) as cumalative_revenue from daily_revenue;

-- 14. --determine the top 3 most ordered pizza based on revenue for each pizza  category.
with pizza_ranking as(select pizza_types.category , pizza_types.name , sum(order_details.quantity * pizzas.price) as revenue
from pizza_types 
join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on pizzas.pizza_id = order_details.pizza_id
group by pizza_types.category,pizza_types.name),
 ranked_table as (select category , name , revenue, rank() over (partition by category order by revenue desc) as ranking from pizza_ranking)
select * from ranked_table  where ranking <= 3