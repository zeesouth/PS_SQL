SELECT A.ANIMAL_ID, A.ANIMAL_TYPE, B.NAME
FROM ANIMAL_INS A, ANIMAL_OUTS B
WHERE A.ANIMAL_ID = B.ANIMAL_ID AND A.SEX_UPON_INTAKE LIKE 'Intact%' AND B.SEX_UPON_OUTCOME NOT LIKE 'Intact%'
ORDER BY A.ANIMAL_ID;