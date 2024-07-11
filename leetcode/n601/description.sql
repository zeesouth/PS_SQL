WITH TBL AS (SELECT ID
             FROM (SELECT ID,
                          PEOPLE,
                          LEAD(PEOPLE, 1) OVER() AF, LAG(PEOPLE, 1) OVER() BF
                   FROM STADIUM) A
             WHERE AF >= 100
               AND BF >= 100
               AND PEOPLE >= 100)


SELECT *
FROM STADIUM
WHERE (((SELECT COUNT(*) FROM TBL) >= 1) AND
       (
                   (ID - 1) IN (SELECT * FROM TBL) OR
                   (ID) IN (SELECT * FROM TBL) OR
                   (ID + 1) IN (SELECT * FROM TBL)
           )) = 1
ORDER BY VISIT_DATE
