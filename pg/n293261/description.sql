SELECT A.ID, B.FISH_NAME, A.LENGTH
FROM (SELECT ID,
             FISH_TYPE,
             LENGTH,
             RANK() OVER (PARTITION BY FISH_TYPE ORDER BY LENGTH DESC) RNK
      FROM FISH_INFO) A
         JOIN FISH_NAME_INFO B
              ON A.FISH_TYPE = B.FISH_TYPE
WHERE A.RNK = 1
ORDER BY A.ID
