SELECT ID, LENGTH
FROM FISH_INFO
WHERE ID > 5
   OR ID < 4
ORDER BY LENGTH DESC, ID LIMIT 10
