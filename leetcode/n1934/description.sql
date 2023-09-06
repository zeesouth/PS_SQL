SELECT A.USER_ID,
       ROUND(SUM(IF(ACTION = 'confirmed', 1, 0)) / COUNT(*), 2) confirmation_rate
FROM SIGNUPS A
         LEFT JOIN CONFIRMATIONS B
                   ON A.USER_ID = B.USER_ID
GROUP BY A.USER_ID