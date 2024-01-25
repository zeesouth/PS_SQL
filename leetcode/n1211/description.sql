SELECT QUERY_NAME,
       ROUND(AVG(RATING / POSITION), 2)           QUALITY,
       ROUND(AVG(IF(RATING <= 2, 1, 0)) * 100, 2) POOR_QUERY_PERCENTAGE
FROM QUERIES
WHERE QUERY_NAME IS NOT NULL
GROUP BY QUERY_NAME