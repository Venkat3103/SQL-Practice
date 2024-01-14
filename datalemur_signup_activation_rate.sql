WITH confirmed_users AS 
(SELECT email_id,signup_action
FROM texts where signup_action like 'Confirmed')

SELECT 
ROUND(SUM(CASE WHEN signup_action like 'Confirmed' then 1 else 0 end)*1.0
/(SUM(CASE WHEN signup_action like 'Confirmed' then 1 else 0 end) + SUM(CASE WHEN signup_action is null then 1 else 0 end)*1.0),2) as confirm_rate

FROM emails
LEFT JOIN confirmed_users 
ON emails.email_id = confirmed_users.email_id;

-- https://datalemur.com/questions/signup-confirmation-rate
-- Tiktok - Medium