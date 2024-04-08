WITH RECURSIVE
    CTE(ID, PARENT_ID, DEPTH) AS (SELECT ID, PARENT_ID, 1 AS DEPTH
                                  FROM ECOLI_DATA
                                  WHERE IFNULL(PARENT_ID, 0) = 0

                                  UNION ALL

                                  SELECT E.ID, E.PARENT_ID, (CTE.DEPTH + 1) AS DEPTH
                                  FROM ECOLI_DATA E
                                           INNER JOIN CTE
                                                      ON E.PARENT_ID = CTE.ID),
    T AS (SELECT *
          FROM CTE)

SELECT COUNT(*) COUNT, A.DEPTH GENERATION
FROM T A LEFT JOIN T B
ON A.ID = B.PARENT_ID
WHERE B.ID IS NULL
GROUP BY A.DEPTH
ORDER BY A.DEPTH
