SELECT STOCK_NAME,
       SUM(IF(OPERATION = 'BUY', -PRICE, PRICE)) CAPITAL_GAIN_LOSS
FROM STOCKS
GROUP BY STOCK_NAME