WITH T1 AS
         (SELECT VISITED_ON
          FROM CUSTOMER
          GROUP BY VISITED_ON)

SELECT A.VISITED_ON,
       SUM(B.AMOUNT)               AMOUNT,
       ROUND(SUM(B.AMOUNT) / 7, 2) AVERAGE_AMOUNT
FROM T1 A
         INNER JOIN CUSTOMER B
                    ON DATEDIFF(A.VISITED_ON, B.VISITED_ON) BETWEEN 0 AND 6
WHERE DATEDIFF(A.VISITED_ON, (SELECT MIN(VISITED_ON) FROM CUSTOMER)) >= 6
GROUP BY A.VISITED_ON
ORDER BY A.VISITED_ON