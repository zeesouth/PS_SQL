#
Write your MySQL query statement below
/*
LEAD(행, 숫자): 선택한 행 기준 숫자 만큼의 이전 행을 가져오는 함수
LAG(행, 숫자): 선택한 행 기준 숫자 만큼의 다음 행을 가져오는 함수
*/

with cte as (
    select num,
    lead(num,1) over() num1,
    lead(num,2) over() num2
    from logs

)

select distinct num ConsecutiveNums
from cte
where (num = num1)
  and (num = num2)
