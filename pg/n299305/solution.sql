SELECT A.ID, SUM(IF(B.ID IS NULL, 0, 1)) CHILD_COUNT
FROM ECOLI_DATA A
         LEFT JOIN ECOLI_DATA B
                   ON A.ID = B.PARENT_ID
GROUP BY A.ID
ORDER BY A.ID
