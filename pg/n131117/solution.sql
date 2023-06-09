SELECT A.PRODUCT_ID, B.PRODUCT_NAME, B.PRICE * A.AMOUNT TOTAL_SALES
FROM
    (SELECT PRODUCT_ID, SUM(AMOUNT) AMOUNT FROM FOOD_ORDER WHERE DATE_FORMAT(PRODUCE_DATE, '%Y-%m') = '2022-05'
     GROUP BY PRODUCT_ID) A, FOOD_PRODUCT B
WHERE A.PRODUCT_ID = B.PRODUCT_ID
ORDER BY TOTAL_SALES DESC, A.PRODUCT_ID