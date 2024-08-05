SELECT ID,
       CASE
           WHEN P_ID IS NULL THEN 'Root'
           WHEN ID IN (SELECT DISTINCT P_ID FROM TREE) THEN 'Inner'
           ELSE 'Leaf'
           END TYPE
FROM TREE