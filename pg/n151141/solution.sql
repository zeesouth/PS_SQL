(SELECT A.HISTORY_ID, A.DAY * B.DAILY_FEE FEE FROM
                                                  (SELECT HISTORY_ID, CAR_ID, DATEDIFF(END_DATE,START_DATE)+1 DAY FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY WHERE CAR_ID IN (
                                                      SELECT CAR_ID FROM CAR_RENTAL_COMPANY_CAR WHERE CAR_TYPE = '트럭')) A,
                                                  CAR_RENTAL_COMPANY_CAR B
 WHERE A.CAR_ID = B.CAR_ID AND A.DAY < 7)
UNION ALL
(SELECT C.HISTORY_ID, ROUND(C.DAILY_FEE * C.DAY * ((100-D.DISCOUNT_RATE)/100)) FEE FROM
                                                                                       (SELECT A.HISTORY_ID,
                                                                                               (CASE WHEN A.DAY >= 90 THEN '90일 이상'
                                                                                                     WHEN A.DAY >= 30 THEN '30일 이상'
                                                                                                     WHEN A.DAY >= 7 THEN '7일 이상'
                                                                                                   END) DURATION_TYPE, A.DAY,
                                                                                               B.CAR_TYPE, B.DAILY_FEE FROM
                                                                                                                           (SELECT HISTORY_ID, CAR_ID, DATEDIFF(END_DATE,START_DATE)+1 DAY FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY WHERE CAR_ID IN (
                                                                                                                               SELECT CAR_ID FROM CAR_RENTAL_COMPANY_CAR WHERE CAR_TYPE = '트럭')) A,
                                                                                                                           CAR_RENTAL_COMPANY_CAR B
                                                                                        WHERE A.CAR_ID = B.CAR_ID AND A.DAY >= 7) C, CAR_RENTAL_COMPANY_DISCOUNT_PLAN D
 WHERE D.CAR_TYPE = C.CAR_TYPE AND D.DURATION_TYPE = C.DURATION_TYPE)
ORDER BY FEE DESC, HISTORY_ID DESC
;