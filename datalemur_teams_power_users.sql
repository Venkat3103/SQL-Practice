SELECT sender_id, count(message_id) AS message_count FROM messages 
WHERE DATE_PART('month',sent_date::DATE) = 08 AND DATE_PART('year',sent_date::DATE) = 2022
GROUP BY sender_id
ORDER BY message_count desc
LIMIT 2

-- https://datalemur.com/questions/teams-power-users
-- Micorsoft - Easy