SELECT CUSTOMER_NUMBER
FROM ORDERS
GROUP BY CUSTOMER_NUMBER
ORDER BY COUNT(*) DESC LIMIT 1