SELECT CONCAT('/home/grep/src/', F.BOARD_ID, '/', F.FILE_ID, F.FILE_NAME, F.FILE_EXT) FILE_PATH
FROM 
USED_GOODS_FILE F, 
(SELECT BOARD_ID FROM USED_GOODS_BOARD ORDER BY VIEWS DESC LIMIT 1) B
WHERE B.BOARD_ID = F.BOARD_ID
ORDER BY F.FILE_ID DESC;
