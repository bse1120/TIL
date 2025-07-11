-- 최근 1년간 월별 신규 고객 및 잔존 고객
-- 최근 1년(마지막 인보이스 기준 12개월) 동안,
-- 각 월별 신규 고객 수와 해당 월에 구매한 기존 고객 수를 구하세요.

WITH CustomerFirstPurchase AS (
  SELECT
    customer_id,
    TO_CHAR(MIN(invoice_date), 'YYYY-MM') AS first_purchase_month
  FROM
    invoices
  GROUP BY
    customer_id
),
LastYearMonthlyActivity AS (
  SELECT DISTINCT
    TO_CHAR(invoice_date, 'YYYY-MM') AS purchase_month,
    customer_id
  FROM
    invoices
  WHERE
    invoice_date >= date_trunc('month', (SELECT MAX(invoice_date) FROM invoices)) - INTERVAL '11 months'
)
SELECT
    lya.purchase_month,
    SUM(
        CASE
            WHEN lya.purchase_month = cfp.first_purchase_month THEN 1 -- 구매월 = 첫 구매월 -> 신규 고객
            ELSE 0
        END
    ) AS new_customers,
    SUM(
        CASE
            WHEN lya.purchase_month > cfp.first_purchase_month THEN 1 
            ELSE 0
        END
    ) AS retained_customers
FROM
    LastYearMonthlyActivity lya
    JOIN CustomerFirstPurchase cfp ON lya.customer_id = cfp.customer_id
GROUP BY
    lya.purchase_month
ORDER BY
    lya.purchase_month ASC;