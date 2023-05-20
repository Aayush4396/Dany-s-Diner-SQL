--  What is the total amount each customer spent at the restaurant?

SELECT S.customer_id, SUM(M.price) AS spends 
FROM dbo.Sales$ AS S
INNER JOIN dbo.Menu$ AS M
on S.product_id=M.product_id
GROUP BY S.customer_id


