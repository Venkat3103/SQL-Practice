
WITH cust_prod as 
(SELECT customer_id, count(distinct product_category) as cat_count
FROM customer_contracts cc 
LEFT JOIN products p
ON cc.product_id = p.product_id
group by customer_id)

SELECT customer_id 
FROM cust_prod 
WHERE cat_count = (
  SELECT COUNT(DISTINCT(product_category)) 
  FROM products);

  -- https://datalemur.com/questions/supercloud-customer
  -- Microsoft - Medium