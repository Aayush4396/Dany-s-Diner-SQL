--What is the total items and amount spent for each member before they became a member?

SELECT customer_id,COUNT(*) AS product_count,SUM(price) AS total_spent
FROM Sales$
INNER JOIN Menu$
ON Sales$.product_id=Menu$.product_id
GROUP BY customer_id