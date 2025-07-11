-- 국가별 재구매율(Repeat Rate)
-- 각 국가별로 전체 고객 수, 2회 이상 구매한 고객 수, 재구매율을 구하세요.
-- 결과는 재구매율 내림차순 정렬.



WITH CustomerPurchaseCounts AS (
  SELECT
    c.country,
    c.customer_id,
    COUNT(i.invoice_id) AS purchase_count
  FROM
    customers c
    JOIN invoices i ON c.customer_id = i.customer_id
  GROUP BY
    c.country,
    c.customer_id
)
SELECT
  country,
  COUNT(customer_id) AS total_customers, 
  SUM(
    CASE
      WHEN purchase_count >= 2 THEN 1
      ELSE 0
    END
  ) AS repeat_customers, 
  ROUND(
    (
      SUM(CASE WHEN purchase_count >= 2 THEN 1 ELSE 0 END)::DECIMAL / COUNT(customer_id)
    ) * 100,
    2
  ) AS repeat_rate
FROM
  CustomerPurchaseCounts
GROUP BY
  country
ORDER BY
  repeat_rate DESC; 

