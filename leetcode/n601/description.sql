WITH temp AS (select *, id - ROW_NUMBER() OVER(ORDER BY id) AS gap
              FROM Stadium
              WHERE people >= 100)

SELECT id, visit_date, people
FROM temp
WHERE gap IN (SELECT gap FROM temp GROUP BY gap HAVING COUNT(*) >= 3)
