--In the first week after a customer joins the program (including their join date) they 
--earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

SELECT Sales$.customer_id,SUM(20*price) AS points
FROM Sales$
INNER JOIN Members$
ON Sales$.customer_id=Members$.customer_id
INNER JOIN Menu$
ON Sales$.product_id=Menu$.product_id
WHERE join_date<=order_date AND MONTH(order_date)=1
GROUP BY Sales$.customer_id;