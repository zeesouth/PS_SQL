SELECT PRODUCT_ID, YEAR FIRST_YEAR, QUANTITY, PRICE
FROM (
    SELECT
    PRODUCT_ID,
    YEAR,
    QUANTITY,
    PRICE,
    RANK() OVER (PARTITION BY PRODUCT_ID ORDER BY YEAR) RNK
    FROM SALES
    ) TBL
WHERE RNK = 1