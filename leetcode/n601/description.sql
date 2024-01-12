WITH T1 AS (SELECT B.ID
            FROM STADIUM A
                     JOIN STADIUM B
                     JOIN STADIUM C
                          ON A.ID + 1 = B.ID AND B.ID = C.ID - 1
            WHERE A.PEOPLE >= 100
              AND B.PEOPLE >= 100
              AND C.PEOPLE >= 100)

SELECT *
FROM STADIUM
WHERE PEOPLE >= 100
  AND (
            (ID - 1) IN (SELECT * FROM T1) OR
            ID IN (SELECT * FROM T1) OR
            (ID + 1) IN (SELECT * FROM T1)
    )
ORDER BY VISIT_DATE