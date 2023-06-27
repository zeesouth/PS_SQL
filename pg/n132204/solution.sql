SELECT APNT_NO, PT_NAME, C.PT_NO, MCDP_CD, DR_NAME, APNT_YMD FROM
                                                                 (SELECT APNT_NO, PT_NO, MCDP_CD, DR_NAME, APNT_YMD FROM
                                                                                                                        (SELECT APNT_NO, PT_NO, MCDP_CD, APNT_YMD, MDDR_ID FROM APPOINTMENT WHERE YEAR(APNT_YMD) = 2022 AND MONTH(APNT_YMD) = 4 AND DAY(APNT_YMD) = 13 AND APNT_CNCL_YN = 'N') A, (SELECT DR_NAME, DR_ID FROM DOCTOR) B
                                                                  WHERE A.MDDR_ID = B.DR_ID) C, (SELECT PT_NO, PT_NAME FROM PATIENT) D
WHERE C.PT_NO = D.PT_NO
ORDER BY APNT_YMD;