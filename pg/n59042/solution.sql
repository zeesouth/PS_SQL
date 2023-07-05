SELECT B_ID ANIMAL_ID, NAME FROM (
                                     SELECT A.ANIMAL_ID A_ID, B.ANIMAL_ID B_ID, B.NAME FROM ANIMAL_INS A
                                                                                                RIGHT OUTER JOIN ANIMAL_OUTS B
                                                                                                                 ON A.ANIMAL_ID = B.ANIMAL_ID ) C
WHERE A_ID IS NULL
ORDER BY B_ID;