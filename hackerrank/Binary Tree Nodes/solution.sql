SELECT ID,
       CASE
           WHEN P = 0 THEN 'Root'
           WHEN C = 0 THEN 'Leaf'
           ELSE 'Inner'
           END T
FROM (SELECT A.N                 ID,
             SUM(IFNULL(A.P, 0)) P,
             SUM(IFNULL(B.N, 0)) C
      FROM BST A
               LEFT JOIN BST B
                         ON A.N = B.P
      GROUP BY A.N) TBL
ORDER BY ID