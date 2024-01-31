SELECT DATE_FORMAT(TRANS_DATE, '%Y-%m') MONTH,
       COUNTRY,
       COUNT(*)                               TRANS_COUNT,
       SUM(IF(STATE = 'approved', 1, 0))      APPROVED_COUNT,
       SUM(AMOUNT)                            TRANS_TOTAL_AMOUNT,
       SUM(IF(STATE = 'approved', AMOUNT, 0)) APPROVED_TOTAL_AMOUNT
FROM TRANSACTIONS
GROUP BY MONTH, COUNTRY
