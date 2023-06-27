SELECT C.AUTHOR_ID, D.AUTHOR_NAME, C.CATEGORY, C.TOTAL_SALES FROM
                                                                 (SELECT A.AUTHOR_ID, A.CATEGORY, SUM(A.PRICE * B.SALES) TOTAL_SALES FROM
                                                                                                                                         (SELECT BOOK_ID, AUTHOR_ID, CATEGORY, PRICE FROM BOOK) A,
                                                                                                                                         (SELECT BOOK_ID, SUM(SALES) SALES FROM BOOK_SALES WHERE SALES_DATE >= '2022-01-01' AND SALES_DATE < '2022-02-01' GROUP BY BOOK_ID) B
                                                                  WHERE A.BOOK_ID = B.BOOK_ID GROUP BY A.AUTHOR_ID, A.CATEGORY) C, AUTHOR D
WHERE C.AUTHOR_ID = D.AUTHOR_ID
ORDER BY AUTHOR_ID, CATEGORY DESC