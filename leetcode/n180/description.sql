SELECT B ConsecutiveNums
FROM (SELECT LEAD(NUM, 1) OVER() A, NUM B,
             LAG(NUM, 1)  OVER() C
      FROM LOGS) T1
WHERE A = B
  AND B = C
GROUP BY B