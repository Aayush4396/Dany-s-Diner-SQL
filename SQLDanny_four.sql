-- What is the most purchased item on the menu and how many times was it purchased by all customers?

SELECT TOP 1 product_name,COUNT(*) AS product_count
FROM dbo.Sales$ AS Sales
JOIN dbo.Menu$ AS Menu
ON Menu.product_id=Sales.product_id
GROUP BY product_name
ORDER BY product_count DESC;
