SELECT IF(MARKS >= 70, NAME, NULL) NAME, FLOOR((IF(MARKS = 100, 99, MARKS) / 10)) + 1 GRADE, MARKS
FROM STUDENTS
ORDER BY GRADE DESC, NAME, MARKS