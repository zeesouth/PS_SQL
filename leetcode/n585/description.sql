SELECT ROUND(SUM(TIV_2016), 2) TIV_2016
FROM INSURANCE
WHERE (LAT, LON) IN (SELECT LAT, LON
                     FROM INSURANCE
                     GROUP BY LAT, LON
                     HAVING COUNT(*) = 1)
  AND TIV_2015 IN (SELECT TIV_2015
                   FROM INSURANCE
                   GROUP BY TIV_2015
                   HAVING COUNT(*) > 1)
