--If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

WITH temp AS
(
SELECT customer_id,product_name,price,
CASE 
WHEN product_name='sushi' THEN price*20
ELSE price*10
END AS points

FROM Sales$
INNER JOIN Menu$
ON Sales$.product_id=Menu$.product_id
)

SELECT customer_id,SUM(points) AS total
FROM temp
GROUP BY customer_id