WITH row_info AS (SELECT 
 ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) row_num,
 user_id,spend,transaction_date
 FROM transactions)

SELECT user_id, spend, transaction_date FROM row_info WHERE row_num=3


--https://datalemur.com/questions/sql-third-transaction
-- Uber - Medium