-- How many days has each customer visited the restaurant?

SELECT customer_id,COUNT(DISTINCT order_date) AS No_of_Days 
FROM Sales$
GROUP BY customer_id
