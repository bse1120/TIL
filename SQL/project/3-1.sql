-- 월별 매출 및 전월 대비 증감률
-- 각 연월(YYYY-MM)별 총 매출과, 전월 대비 매출 증감률을 구하세요.
-- 결과는 연월 오름차순 정렬하세요.

WITH monthly_sales AS (
    SELECT
        TO_CHAR(invoice_date, 'YYYY-MM') AS sale_month,
        SUM(total) AS total_sales
    FROM
        invoices
    GROUP BY
        sale_month
)
SELECT
    sale_month,
    total_sales,
    -- 아래 계산식을 ROUND 함수로 감싸고, 소수점 자릿수를 2로 지정했습니다.
    ROUND(
        ( (total_sales - LAG(total_sales, 1) OVER (ORDER BY sale_month)) / LAG(total_sales, 1) OVER (ORDER BY sale_month) ) * 100,
        2
    ) AS growth_rate
FROM
    monthly_sales
ORDER BY
    sale_month ASC;