WITH RECURSIVE NUM(HOUR) AS (
    SELECT 0
    UNION ALL
    SELECT HOUR+1 FROM num WHERE HOUR<23
    )

SELECT A.HOUR,
       CASE WHEN B.COUNT IS NULL THEN 0
            ELSE B.COUNT END AS COUNT
FROM NUM A
    LEFT JOIN (SELECT HOUR(DATETIME) AS HOUR, COUNT(ANIMAL_ID) AS COUNT
    FROM ANIMAL_OUTS
    GROUP BY 1) AS B ON A.HOUR = B.HOUR