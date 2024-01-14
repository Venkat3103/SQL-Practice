-- If minimum posts expected is 2, the below logic will work
SELECT user_id,EXTRACT(DAYS FROM MAX(post_date) - MIN(post_date))
FROM posts
WHERE DATE_PART('year',post_date)=2021 
GROUP BY user_id
HAVING MIN(post_date)!=MAX(post_date);

-- Otherwise, modify count(post_id) here
SELECT user_id, max_date - min_date AS days_between 
FROM (SELECT user_id, MAX(post_date::DATE) AS max_date,MIN(post_date::DATE) AS min_date 
FROM posts
WHERE DATE_PART('year',post_date::DATE) = 2021
GROUP BY user_id 
HAVING count(post_id)>1) 
AS x


-- https://datalemur.com/questions/sql-average-post-hiatus-1
-- Facebook - Easy