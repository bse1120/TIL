-- 23-one-to-many.sql
USE lecture;

SELECT 
  c.customer_id,
  c.customer_name,
  COUNT(s.id) AS 주문횟수,
  GROUP_CONCAT(s.product_name) AS 주문제품들   -- Concatanate 글자끼리 이어붙이는것
FROM customers c
LEFT JOIN sales s on c.customer_id=s.customer_id
GROUP BY c.customer_id, c.customer_name;
