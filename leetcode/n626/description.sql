SELECT IF(ID % 2 = 1,
          IF(ID = (SELECT MAX(ID) FROM SEAT), ID, ID + 1),
          ID - 1) ID,
       STUDENT
FROM SEAT
ORDER BY ID