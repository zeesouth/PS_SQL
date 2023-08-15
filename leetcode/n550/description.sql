with t1 as (select player_id, min(event_date) min_date
            from Activity
            group by player_id
            order by player_id),
     t3 as (select if(sum(case
                              when datediff(t2.event_date, t1.min_date) = 1 then 1
                              else 0
         end) > 0, 1, 0) flag
            from t1,
                 activity t2
            where t1.player_id = t2.player_id
            group by t1.player_id)

select round(sum(flag) / count(*), 2) fraction
from t3;
