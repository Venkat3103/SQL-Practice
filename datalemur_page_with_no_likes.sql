SELECT DISTINCT pages.page_id 
FROM pages LEFT OUTER JOIN page_likes 
ON pages.page_id = page_likes.page_id 
WHERE user_id IS NULL 
ORDER BY pages.page_id

--https://datalemur.com/questions/sql-page-with-no-likes
-- Facebook - Easy