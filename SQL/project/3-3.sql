-- 고객별 누적 구매액 및 등급 산출
-- 각 고객의 누적 구매액을 구하고,
-- 상위 20%는 'VIP', 하위 20%는 'Low', 나머지는 'Normal' 등급을 부여하세요.

WITH CustomerTotalSpending AS (
  SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(i.total) AS total_spent
  FROM
    customers c
    JOIN invoices i ON c.customer_id = i.customer_id
  GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
),
CustomerGrades AS (
  SELECT
    customer_id,
    first_name,
    last_name,
    total_spent,
    NTILE(5) OVER (
      ORDER BY
        total_spent DESC
    ) AS spending_group
  FROM
    CustomerTotalSpending
)
SELECT
  customer_id,
  first_name,
  last_name,
  total_spent,
  CASE
    WHEN spending_group = 1 THEN 'VIP'    -- 상위 20%
    WHEN spending_group = 5 THEN 'Low'    -- 하위 20%
    ELSE 'Normal'                          -- 나머지
  END AS customer_grade
FROM
  CustomerGrades
ORDER BY
  total_spent DESC;