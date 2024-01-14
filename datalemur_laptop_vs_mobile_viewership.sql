SELECT
SUM(CASE WHEN device_type like 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
SUM(CASE WHEN device_type not in ('laptop') THEN 1 ELSE 0 END) AS mobile_views
FROM viewership;

-- https://datalemur.com/questions/laptop-mobile-viewership
-- NYT - Easy