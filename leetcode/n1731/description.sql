SELECT A.employee_id,
       A.NAME,
       COUNT(*)          REPORTS_COUNT,
       ROUND(AVG(B.AGE)) AVERAGE_AGE
FROM Employees A
         JOIN Employees B
              ON A.employee_id = B.REPORTS_TO
GROUP BY A.EMPLOYEE_ID
ORDER BY A.employee_id
