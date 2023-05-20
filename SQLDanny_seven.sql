--Which item was purchased just before the customer became a member?

WITH temp AS
(
	SELECT Sales$.customer_id,Sales$.product_id,product_name,order_date,price,join_date,
	RANK() OVER (PARTITION BY Sales$.customer_id ORDER BY Sales$.order_date DESC) AS preferred_product
	FROM Sales$ 
	INNER JOIN Members$
	ON Sales$.customer_id=Members$.customer_id
	INNER JOIN Menu$
	ON Menu$.product_id=Sales$.product_id
	WHERE join_date>=order_date
)

SELECT customer_id,product_name,price,order_date,join_date
FROM temp
WHERE preferred_product=1