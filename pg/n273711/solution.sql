SELECT C.ITEM_ID, C.ITEM_NAME, C.RARITY
FROM ITEM_INFO C
         JOIN (SELECT A.ITEM_ID
               FROM ITEM_TREE A
                        LEFT JOIN ITEM_TREE B
                                  ON A.PARENT_ITEM_ID = B.ITEM_ID
               WHERE A.PARENT_ITEM_ID IS NOT NULL
                 AND A.PARENT_ITEM_ID IN (SELECT ITEM_ID
                                          FROM ITEM_INFO
                                          WHERE RARITY = 'RARE')) D
              ON C.ITEM_ID = D.ITEM_ID
ORDER BY C.ITEM_ID DESC
