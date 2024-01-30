SELECT A.NAME, IFNULL(TRAVELLED_DISTANCE, 0) TRAVELLED_DISTANCE
FROM USERS A
         LEFT JOIN (SELECT USER_ID, SUM(DISTANCE) TRAVELLED_DISTANCE
                    FROM RIDES
                    GROUP BY USER_ID) B
                   ON A.ID = B.USER_ID
ORDER BY TRAVELLED_DISTANCE DESC, A.NAME