-- 각 고객의 최근 구매 내역
-- 각 고객별로 가장 최근 인보이스(invoice_id, invoice_date, total) 정보를 출력하세요.

SELECT
    i.invoice_id,
    i.invoice_date,
    i.total
FROM
    invoices i
JOIN
    (SELECT
         customer_id,
         MAX(invoice_date) AS max_date
     FROM
         invoices
     GROUP BY
         customer_id
    ) AS latest
ON
    i.customer_id = latest.customer_id AND i.invoice_date = latest.max_date;

