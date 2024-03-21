SELECT A.EMP_NO,
       B.EMP_NAME,
       A.GRADE,
       B.SAL * (
           CASE
               WHEN A.GRADE = 'S' THEN 0.2
               WHEN A.GRADE = 'A' THEN 0.15
               WHEN A.GRADE = 'B' THEN 0.1
               ELSE 0
               END
           ) BONUS
FROM (SELECT EMP_NO,
             CASE
                 WHEN AVG(SCORE) >= 96 THEN 'S'
                 WHEN AVG(SCORE) >= 90 THEN 'A'
                 WHEN AVG(SCORE) >= 80 THEN 'B'
                 ELSE 'C'
                 END GRADE
      FROM HR_GRADE
      GROUP BY EMP_NO) A
         JOIN HR_EMPLOYEES B
              ON A.EMP_NO = B.EMP_NO
ORDER BY A.EMP_NO
