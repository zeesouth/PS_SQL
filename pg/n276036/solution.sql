WITH TBL AS (SELECT *
             FROM (SELECT B.ID,
                          B.EMAIL,
                          CASE
                              WHEN A.NAME = 'Python' = 1 THEN 1
                              WHEN A.CATEGORY = 'Front End' THEN 2
                              WHEN A.NAME = 'C#' THEN 3
                              ELSE 4
                              END FLAG
                   FROM (SELECT NAME, CATEGORY, CONV(CODE, 10, 2) CONV
                         FROM SKILLCODES) A
                            JOIN (SELECT ID, EMAIL, CONV(SKILL_CODE, 10, 2) CONV
                                  FROM DEVELOPERS) B
                                 ON ROUND(B.CONV / A.CONV) LIKE '%1') C
             WHERE FLAG <= 3)

SELECT *
FROM (SELECT CASE
                 WHEN (ID, EMAIL, 1) IN (SELECT * FROM TBL) AND (ID, EMAIL, 2) IN (SELECT * FROM TBL) THEN 'A'
                 WHEN (ID, EMAIL, 3) IN (SELECT * FROM TBL) THEN 'B'
                 WHEN (ID, EMAIL, 2) IN (SELECT * FROM TBL) THEN 'C'
                 ELSE 'D'
                 END GRADE,
             ID,
             EMAIL
      FROM DEVELOPERS) D
WHERE GRADE != 'D'
ORDER BY GRADE, ID
