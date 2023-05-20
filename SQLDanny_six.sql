--Which item was purchased first by the customer after they became a member?

WITH temp AS
(
	SELECT S.customer_id,S.order_date,S.product_id,M.product_name,M.price,Members$.join_date,
	DENSE_RANK() OVER (PARTITION BY S.customer_id ORDER BY S.order_date) AS R
	FROM Sales$ AS S
	INNER JOIN Menu$ AS M
	ON S.product_id=M.product_id
	INNER JOIN Members$ 
	ON Members$.customer_id=S.customer_id
	WHERE Members$.join_date<=S.order_date
)

SELECT customer_id,product_name,price,order_date,join_date
FROM temp
WHERE R=1