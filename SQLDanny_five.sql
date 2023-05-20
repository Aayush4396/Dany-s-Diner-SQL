-- Which item was the most popular for each customer?

WITH temp AS
(
	SELECT customer_id,product_name, COUNT(order_date) as Item,
	DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY COUNT(order_date) DESC) AS most_sold
	FROM Sales$ AS S
	JOIN Menu$ AS M
	ON S.product_id=M.product_id
	GROUP BY customer_id, product_name
)

SELECT customer_id,product_name,Item
FROM temp
WHERE most_sold=1;