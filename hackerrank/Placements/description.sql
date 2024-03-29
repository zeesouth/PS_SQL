SELECT E.NAME
FROM (SELECT A.ID, A.NAME, B.SALARY
      FROM STUDENTS A
               JOIN PACKAGES B
                    ON A.ID = B.ID) E
         JOIN
     (SELECT C.ID, C.FRIEND_ID, D.SALARY
      FROM FRIENDS C
               JOIN PACKAGES D
                    ON C.FRIEND_ID = D.ID) F
     ON E.ID = F.ID
WHERE E.SALARY < F.SALARY
ORDER BY F.SALARY