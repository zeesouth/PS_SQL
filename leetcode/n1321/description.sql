WITH T1 AS (select visited_on,
                   sum(amount) as day_amount
            from customer
            group by visited_on),
     T2 AS (select min(visited_on)
            from customer)

select a.visited_on                    as visited_on,
       sum(b.day_amount)               as amount,
       round(sum(b.day_amount) / 7, 2) as average_amount
from T1 a,
     T1 b
where datediff(a.visited_on, b.visited_on) between 0 and 6
  and a.visited_on - 6 >= (SELECT * FROM T2)
group by a.visited_on
order by a.visited_on
