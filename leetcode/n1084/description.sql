SELECT B.PRODUCT_ID, A.PRODUCT_NAME
FROM PRODUCT A
         NATURAL JOIN SALES B
GROUP BY B.PRODUCT_ID
HAVING MAX(B.SALE_DATE) < '2019-04-01'
   AND MIN(B.SALE_DATE) >= '2019-01-01'
