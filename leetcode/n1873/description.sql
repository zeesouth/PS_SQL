SELECT EMPLOYEE_ID,
       IF(NAME NOT LIKE 'M%' AND EMPLOYEE_ID % 2 = 1, SALARY, 0) BONUS
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID