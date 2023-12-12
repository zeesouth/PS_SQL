SELECT EMPLOYEE_ID
FROM EMPLOYEES A
WHERE MANAGER_ID NOT IN (SELECT EMPLOYEE_ID FROM EMPLOYEES)
  AND SALARY < 30000
ORDER BY EMPLOYEE_ID