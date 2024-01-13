WITH snaps as (
SELECT ab.age_bucket,
SUM(CASE WHEN a.activity_type like 'send' then a.time_spent ELSE 0 END) AS send_timespent,
SUM(CASE WHEN a.activity_type like 'open' then a.time_spent ELSE 0 END) AS open_timespent,
SUM(a.time_spent) as total_timespent
FROM activities a 
  JOIN age_breakdown ab 
  ON a.user_id = ab.user_id
  WHERE a.activity_type in ('send','open')
GROUP BY ab.age_bucket
)

SELECT age_bucket, 
ROUND(send_timespent*100.0/total_timespent,2) as send_perc,
ROUND(open_timespent*100.0/total_timespent,2) as open_perc
FROM snaps

-- https://datalemur.com/questions/time-spent-snaps
-- Snapchat - Medium
