SELECT IFNULL((SELECT SALARY
               FROM EMPLOYEE
               GROUP BY SALARY
               ORDER BY SALARY DESC
                  LIMIT 1, 1), null)
           AS SecondHighestSalary
FROM EMPLOYEE LIMIT 1
