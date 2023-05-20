-- What was the first item from the menu purchased by each customer?

With Firstdish
As
(
	Select customer_id,product_name,
	DENSE_RANK() OVER(PARTITION BY sales$.customer_id ORDER BY Sales$.order_date) AS RANK
	FROM Sales$ 
	JOIN Menu$
	ON Sales$.product_id=Menu$.product_id
	
)

SELECT DISTINCT customer_id,product_name
FROM Firstdish
WHERE RANK=1;
