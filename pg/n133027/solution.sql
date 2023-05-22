-- https://school.programmers.co.kr/learn/courses/30/lessons/133027
SELECT FLAVOR FROM
    ((SELECT * FROM JULY)
     UNION ALL
     (SELECT * FROM FIRST_HALF)) A
GROUP BY FLAVOR
ORDER BY SUM(TOTAL_ORDER) DESC
    LIMIT 3;
