SELECT IF(COUNT(*) < 1, NULL, SALARY) SecondHighestSalary
FROM (SELECT RANK() OVER (ORDER BY SALARY DESC) RNK, SALARY
      FROM EMPLOYEE
      GROUP BY SALARY) A
WHERE RNK = 2