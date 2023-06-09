SELECT YEAR, MONTH, COUNT(USER_ID) PUCHASED_USERS,
    ROUND(COUNT(USER_ID)/(SELECT COUNT(USER_ID) FROM USER_INFO WHERE YEAR(JOINED) = 2021), 1) PUCHASED_RATIO FROM (
    SELECT YEAR(SALES_DATE) YEAR, MONTH(SALES_DATE) MONTH, USER_ID
    FROM ONLINE_SALE
    WHERE USER_ID IN (SELECT USER_ID FROM USER_INFO WHERE YEAR(JOINED) = 2021)
    GROUP BY YEAR(SALES_DATE), MONTH(SALES_DATE), USER_ID) A
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH;