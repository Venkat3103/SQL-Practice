

WITH user_purchases AS
(SELECT transaction_date, user_id,count(product_id) AS purchase_count,
ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date DESC) AS rownum
FROM user_transactions
GROUP BY user_id, transaction_date)

SELECT transaction_date,user_id,purchase_count
FROM user_purchases
WHERE rownum=1
ORDER BY transaction_date

-- https://datalemur.com/questions/histogram-users-purchases
-- Walmart - Medium