WITH count_per_user as 
(SELECT COUNT(tweet_id) as tweet_count,user_id FROM tweets WHERE tweet_date BETWEEN '2022-01-01' 
  AND '2022-12-31'  group by user_id order by tweet_count)


SELECT tweet_count as tweet_bucket,COUNT(tweet_count) as users_num from count_per_user group by tweet_count;

--https://datalemur.com/questions/sql-histogram-tweets
--Twitter - Easy