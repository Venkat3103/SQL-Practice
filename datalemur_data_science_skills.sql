SELECT candidate_id 
FROM (SELECT candidate_id, count(*) FROM candidates 
        WHERE skill IN ('Python','Tableau','PostgreSQL') 
        GROUP by candidate_id) as x 
WHERE count=3 ORDER BY candidate_id;

--https://datalemur.com/questions/matching-skills
--LinkedIn - Easy