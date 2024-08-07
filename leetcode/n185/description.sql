SELECT DEPARTMENT, EMPLOYEE, SALARY
FROM (SELECT DEPARTMENT, EMPLOYEE, SALARY, DENSE_RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) RNK
      FROM (SELECT B.NAME DEPARTMENT, A.NAME EMPLOYEE, SALARY
            FROM EMPLOYEE A
                     JOIN DEPARTMENT B
                          ON A.DEPARTMENTID = B.ID) TBL_1) TBL_2
WHERE RNK <= 3
