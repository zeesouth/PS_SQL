SELECT ID,
       CASE
           WHEN (RNUM / MAX(RNUM) OVER()) <= 0.25 THEN 'CRITICAL'
           WHEN (RNUM / MAX(RNUM) OVER()) <= 0.5 THEN 'HIGH'
           WHEN (RNUM / MAX(RNUM) OVER()) <= 0.75 THEN 'MEDIUM'
           ELSE 'LOW'
           END COLONY_NAME
FROM (SELECT ID,
             ROW_NUMBER() OVER (ORDER BY SIZE_OF_COLONY DESC) RNUM
      FROM ECOLI_DATA) A
ORDER BY ID