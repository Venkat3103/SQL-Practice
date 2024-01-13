
WITH tweet_count as (
SELECT user_id, tweet_date, count(tweet_id) as tweet_num
from tweets
group by user_id, tweet_date
)

SELECT user_id, tweet_date,
ROUND(AVG(tweet_num) OVER(
PARTITION BY user_id
ORDER BY tweet_date
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) as rolling_avg_3d
FROM tweet_count

-- https://datalemur.com/questions/rolling-average-tweets
-- Twitter - Medium