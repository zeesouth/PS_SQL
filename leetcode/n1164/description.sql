WITH T1 AS (SELECT PRODUCT_ID, CHANGE_DATE, PRICE
            FROM (SELECT PRODUCT_ID,
                         CHANGE_DATE,
                         NEW_PRICE    PRICE,
                         ROW_NUMBER() OVER (PARTITION BY PRODUCT_ID ORDER BY CHANGE_DATE DESC) RNUM
                  FROM PRODUCTS
                  WHERE CHANGE_DATE <= '2019-08-16') A
            WHERE A.RNUM = 1)

SELECT T2.PRODUCT_ID,
       IFNULL(T1.PRICE, 10) PRICE
FROM T1
         RIGHT JOIN
         (SELECT DISTINCT PRODUCT_ID FROM PRODUCTS) T2
         ON T1.PRODUCT_ID = T2.PRODUCT_ID