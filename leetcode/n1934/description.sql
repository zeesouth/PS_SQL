SELECT A.USER_ID, ROUND(AVG(IF(B.ACTION = 'confirmed', 1, 0)), 2) confirmation_rate
FROM SIGNUPS A
         LEFT OUTER JOIN CONFIRMATIONS B
                         ON A.USER_ID = B.USER_ID
GROUP BY A.USER_ID